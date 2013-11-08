APAvatarImageView
===============

## APAvatarImageView

Subclass of UIImageView to create a circle avatar image view with configurable border width and border color

<img height=480 src="http://www.xn--bdk.co/images/AvatarImageView.png"/>

## Usage

Usage is easy:

Add the dependency to your `Podfile`:

```ruby
platform :ios
pod 'APAvatarImageView'
...
```

Run `pod install` to install the dependencies.

Next, import the header file wherever you want to use the avatar image view:

```objc
#import <APAvatarImageView/APAvatarImageView.h>
```

Finally, add the Custom class of APAvatarImageView to UIImageView in Interface Builder or you can create it programatically using the following code:

```objc
APAvatarImageView *avatarImageView = [[APAvatarImageView alloc] initWithImage:[UIImage imageNamed:@"profile"] borderColor:[UIColor blackColor] borderWidth:1.0];
```

You can change the color or width of the border by setting borderColor or borderWidth value

```objc
avatarImageView.borderColor = [UIColor redColor];
avatarImageView.borderWidth = 3.0;
```

## Demo

There is a Demo XCode project in the Demo folder. Just clone the repository and run `pod install` and finally run the project by opening the Avatar.xcworkspace

## License

Usage is provided under the [MIT License](http://opensource.org/licenses/MIT).  See LICENSE for the full details.