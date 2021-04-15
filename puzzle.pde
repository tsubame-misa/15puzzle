class Card  {
  int x;
  int y;
  int len = 100;
  String s;
  Card(int x0, int y0, String s0) {
    x = x0;
    y = y0;
    s = s0;
  }

  void display() {
    fill(255);
    rect(x, y, len, len);
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(s, x+len/2, y+len/2);
  }

  boolean inCard() {
    if (mousePressed) {
      if (mouseX > x && mouseX < x+len && mouseY > y && mouseY < y+len) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

///////////////////////////////////////////////////

int n = 16;
int l = 100;
Card[] cards = new Card[n];
int p = int(random(n-1));
int selected = p;

void setup() {
  size(400, 400);

  int[] numbers = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  int count = 0;
  while (count < n-1) {
    int a = int(random(n));
    boolean find = false;
    for (int i = 0; i < n-1; i++) {
      if (numbers[i]==a) {
        find = true;
        break;
      }
    }
    if (!find) {
      numbers[count] = a;
      count++;
    }
  }



  int c = 0;
  for (int i = 0; i < n/4; i++) {
    for (int j = 0; j < n/4; j++) {
      if (p!=i*4+j) {
        cards[i*4+j] = new Card(l*j, l*i, str(numbers[c]));
        c++;
      } else {
        cards[i*4+j] = new Card(l*j, l*i, "");
      }
    }
  }
  
}


void draw() {
  background(255);
  for (int i = 0; i < n; i++) {
    cards[i].display();
    if (cards[i].inCard()==true) {
      selected = i;
      p = swapCheack(p, selected);
    };
  }
}


int swapCheack(int p, int selected) {
  if ((p-4 == selected && p-4 >= 0 )|| (p+4 == selected && p+4 < n )) {
    swap(p, selected);
    return selected;
  } else if (p%4==0 && p+1==selected) {
    swap(p, selected);
    return selected;
  } else if (p%4==3 && p-1==selected) {
    swap(p, selected);
    return selected;
  } else if (p-1==selected || p+1==selected) {
    swap(p, selected);
    return selected;
  } else {
    return p;
  }
}


void swap(int p, int selected){
  cards[p].s = cards[selected].s;
  cards[selected].s = "";
}
