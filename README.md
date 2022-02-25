# ✏️ Drawing Paths and Shapes

SwiftUI gives us a dedicated Path type for drawing custom shapes. It’s very low level, by which I mean you will usually want to wrap it in something else in order for it to be more useful, but as it’s the building block that underlies other work we’ll do we’re going to start there.

Just like colors, gradients, and shapes, paths are views in their own right. This means we can use them just like text views and images, although as you’ll see it’s a bit clumsy.

Let’s start with a simple shape: drawing a triangle. There are a few ways of creating paths, including one that accepts a closure of drawing instructions. This closure must accept a single parameter, which is the path to draw into. I realize this can be a bit brain-bending at first, because we’re creating a path and inside the initializer for the path we’re getting passed the path to draw into, but think of it like this: SwiftUI is creating an empty path for us, then giving us the chance to add to it as much as we want.

In this example I have used some techniques to draw the well-known safari browser logo.