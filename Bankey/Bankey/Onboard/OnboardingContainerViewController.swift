//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Mithun M R on 15/11/24.
//

import UIKit
protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func onBoardingCompleted()
}

class OnboardingContainerViewController: UIViewController {
    @objc let closeButton = UIButton()
    let prevButton = UIButton()
    let nextButton = UIButton()
    let doneButton = UIButton()
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController

    weak var delegate: OnboardingContainerViewControllerDelegate?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        let page1 = OnboardingViewController(imageName: "skull1", description: "The skull is a rigid structure made of 22 bones that form the head of a vertebrate. It protects the brain and supports the structures of the face. The skull consists of the cranium, which encases the brain, and the facial bones, including the jaw and cheekbones.")
        let page2 = OnboardingViewController(imageName: "skull2", description: "A skull is a haunting yet captivating symbol often depicted with hollow eye sockets, a sharp nasal cavity, and a toothy grin. Its stark, bony form embodies themes of mortality and resilience, frequently featured in art, tattoos, and gothic designs")
        let page3 = OnboardingViewController(imageName: "skull3", description: "The skull represents both the fragility of life and the inevitability of death. It is a universal emblem in many cultures, symbolizing transformation, strength, and the transient nature of existence.")

        pages.append(page1)
        pages.append(page2)
        pages.append(page3)

        currentVC = pages.first!

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }

    private func setup() {
        self.setupPageControl()
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])

        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        currentVC = pages.first!


    }
    private func style() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.configuration = .plain()
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeAction), for: .primaryActionTriggered)

        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Previous", for: .normal)
        prevButton.configuration = .plain()
        prevButton.addTarget(self, action: #selector(previousAction), for: .primaryActionTriggered)
        prevButton.isHidden = true

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.configuration = .plain()
        nextButton.addTarget(self, action: #selector(nextAction), for: .primaryActionTriggered)

        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        doneButton.configuration = .plain()
        doneButton.addTarget(self, action: #selector(nextAction), for: .primaryActionTriggered)
        doneButton.isHidden = true

    }


    private func layout() {
        view.addSubview(closeButton)
        view.addSubview(prevButton)
        view.addSubview(nextButton)
        view.addSubview(doneButton)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1)
        ])

        //prev button
        NSLayoutConstraint.activate([
            prevButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: prevButton.bottomAnchor, multiplier: 4)

        ])

        //Next button
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2)

        ])

        //Done button
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2)

        ])

    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    func setupPageControl() {
        UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingContainerViewController.self]).currentPageIndicatorTintColor = .green
        UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingContainerViewController.self]).pageIndicatorTintColor = .lightGray
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        updateSwipeButton()
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        updateSwipeButton()
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }

    @objc func previousAction(sender: UIButton) {
        guard let previousViewController = getPreviousViewController(from: currentVC) else { return}
        pageViewController.setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
        updateSwipeButton()
    }

    @objc func nextAction(sender: UIButton) {
        if let index = self.pages.firstIndex(of: self.currentVC), index != pages.count-1{
            guard let nextViewController = getNextViewController(from: currentVC) else { return }
            pageViewController.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
            updateSwipeButton()
        } else {
            closeViewController()
        }

    }

    @objc func closeAction(sender: UIButton) {
        closeViewController()
    }

   private func updateSwipeButton(){
        DispatchQueue.main.async {
            guard let index = self.pages.firstIndex(of: self.currentVC) else { return }
            self.prevButton.isHidden = index < 1
            self.nextButton.isHidden = index == self.pages.count - 1
            self.doneButton.isHidden = index < self.pages.count - 1
        }
    }

    private func closeViewController() {
        delegate?.onBoardingCompleted()
    }

}


