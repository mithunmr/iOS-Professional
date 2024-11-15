//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Mithun M R on 15/11/24.
//

import UIKit

class OnboardingContainerViewController: UIViewController {

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController {
        didSet {
        }
    }

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
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
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
    func setupPageControl(){
        UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingContainerViewController.self]).currentPageIndicatorTintColor = .green
        UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingContainerViewController.self]).pageIndicatorTintColor = .lightGray
    }
}
