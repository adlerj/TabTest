import UIKit

import MaterialComponents
import SnapKit

class ViewController: UIViewController {

  lazy var cameraButton: UIButton = {
    let button = UIButton()
    button.setTitle("Camera", for: .normal)
    button.backgroundColor = .blue
    button.addTarget(
      self,
      action: #selector(cameraButtonTapped(_:)),
      for: .touchUpInside
    )
    return button
  }()

  lazy var tabBar: MDCTabBar = {
    let tabBar = MDCTabBar()
    tabBar.items = ["First", "Second"].map {
      UITabBarItem(title: $0, image: nil, selectedImage: nil)
    }
    tabBar.itemAppearance = .titles
    tabBar.alignment = .justified
    tabBar.setTitleColor(.black, for: .normal)
    tabBar.setTitleColor(.black, for: .selected)
    return tabBar
  }()

  lazy var line: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(cameraButton)
    view.addSubview(tabBar)
    view.addSubview(line)
    setupConstraints()
  }

  func setupConstraints() {
    tabBar.snp.makeConstraints { make in
      make.leading.trailing.top.equalTo(view.safeAreaInsets)
      make.height.equalTo(48)
    }

    cameraButton.snp.makeConstraints { make in
      make.height.equalTo(30)
      make.width.equalTo(70)
      make.centerX.equalTo(view)
      make.bottom.equalTo(view).offset(-100)
    }

    line.snp.makeConstraints { make in
      make.top.bottom.centerX.equalTo(view)
      make.width.equalTo(2)
    }
  }

  @objc func cameraButtonTapped(_ sender: UIButton) {
    let picker = UIImagePickerController()
    picker.sourceType = .camera
    picker.delegate = self
    present(picker, animated: true)
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [String : Any]
  ) {
    picker.dismiss(animated: true)
  }
}

