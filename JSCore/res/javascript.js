var factorial = function(n) {
    if (n < 0 )
        return;
    if (n  == 0)
        return 1;
    
    return n*factorial(n - 1);
}

var euclideanDistance = function(p1, p2) {
    var xDelta = p2.x - p1.x;
    var yDelta = p2.y - p1.y;
    
    return Math.sqrt(xDelta*xDelta + yDelta * yDelta);
}

var midPoint = function(p1, p2) {
    var xDelta = p2.x - p1.x;
    var yDelta = p2.y - p1.y;
    
    return MyPoint.makePointWithXY(p1.x + xDelta, p1.y + yDelta);
}

var createView = function(x, y, width, height) {
    var view = UIViewRN.makeUIViewRNWithXYWidthHeight(x, y, width, height);
    view.addToParentView();
    return view;
}
