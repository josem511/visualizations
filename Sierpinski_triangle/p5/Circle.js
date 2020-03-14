class Circle {
    constructor(x,y,radius){
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.virusx = -1;
        this.virusx = -1;
    }

    show(){
        ellipse(this.x,this.y,this.radius);
        this.radius = this.radius + Math.floor(Math.random() * (2) ) - .5;
        this.x = this.x + Math.floor(Math.random() * (2) ) - .5;
        this.y = this.y + Math.floor(Math.random() * (2) ) - .5;
    }
}

