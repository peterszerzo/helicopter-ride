uses crt,graph;
procedure intro;
var i,j:longint;
  begin
   settextjustify(centertext,centertext);
   settextstyle(gothicfont,horizdir,5);
   setcolor(2);
   outtextxy(320,240,'P presents...');
   delay(1000);
   setcolor(0);
   outtextxy(320,240,'P presents...');
   setcolor(4);
   settextstyle(gothicfont,horizdir,2);
   outtextxy(320,180,'A SOUTH PARK GAME PRODUCTION');
   delay(600);
   setcolor(0);
   outtextxy(320,180,'A SOUTH PARK GAME PRODUCTION');
   settextstyle(triplexfont,horizdir,6);
   setcolor(1);
   outtextxy(320,240,'P           ');
   delay(40);
   setcolor(2);
   outtextxy(320,240,' H          ');
   delay(40);
   setcolor(3);
   outtextxy(320,240,'  I         ');
   delay(40);
   setcolor(4);
   outtextxy(320,240,'   L        ');
   delay(40);
   setcolor(5);
   outtextxy(320,240,'     C      ');
   delay(40);
   setcolor(6);
   outtextxy(320,240,'      O     ');
   delay(40);
   setcolor(7);
   outtextxy(320,240,'       L    ');
   delay(40);
   setcolor(8);
   outtextxy(320,240,'        L   ');
   delay(40);
   setcolor(9);
   outtextxy(320,240,'         I  ');
   delay(40);
   setcolor(10);
   outtextxy(320,240,'          N ');
   delay(40);
   setcolor(11);
   outtextxy(320,240,'           S');
   delay(200);
   settextstyle(triplexfont,horizdir,6);
   outtextxy(320,300,'helicopter ride');
   settextstyle(defaultfont,horizdir,1);
   outtextxy(320,420,'version 1.1');
   settextstyle(triplexfont,horizdir,3);
   for  i:=1 to 15 do
     begin
       setcolor(15);
       outtextxy(320,400,'LOADING...');
       delay(50);
       setcolor(0);
       outtextxy(320,400,'LOADING...');
       delay(30);

     end;
   setcolor(15);
   outtextxy(320,400,'PRESS ANY KEY...');

   readkey;

  end;
function heli_(a,b:longint):longint;
  begin
    setcolor(15);
    line(a-20,b-20,a+20,b-20);
    line(a,b-13,a,b-20);
    setfillstyle(1,3);
    setcolor(3);
    bar(a+18,b+5,a-18,b-13);
    setfillstyle(1,2);
    fillellipse(a-18,b-2,12,10);
    setfillstyle(1,0);
    fillellipse(a-18,b-2,5,3);
    setfillstyle(1,4);
    bar(a+40,b-5,a+16,b-3);
    bar(a+40,b-5,a+38,b-14);
    setcolor(15);
    line(a+45,b-14,a+35,b-14);
  end;
function heli_0(a,b:longint):longint;
  begin
    setcolor(0);
    line(a-20,b-20,a+20,b-20);
    line(a,b-13,a,b-20);
    setfillstyle(1,0);
    setcolor(0);
    bar(a+18,b+5,a-18,b-13);
    setfillstyle(1,0);
    fillellipse(a-18,b-2,12,10);
    setfillstyle(1,0);
    fillellipse(a-18,b-2,5,3);
    setfillstyle(1,0);
    bar(a+40,b-5,a+16,b-3);
    bar(a+40,b-5,a+38,b-14);
    setcolor(0);
    line(a+45,b-14,a+35,b-14);
  end;
procedure fej(a,b,c:longint);
  begin
    setfillstyle(1,c);
    fillellipse(a,b,8,10);
    setcolor(6);
    circle(a-2,b-3,1);
    circle(a+2,b-3,1);
    line(a-2,b+4,a+2,b+4);
    setcolor(0);
  end;
function phil(a,b:longint):longint;
  begin

    setfillstyle(1,14);
    bar(a-2,b+7,a+2,b+14);
    fillellipse(a-14,b+42,2,5);
    fillellipse(a+14,b+42,2,5);

    setfillstyle(1,15);
    bar(a-10,b+14,a+10,b+45);

    bar(a-12,b+15,a-16,b+42);
    bar(a+12,b+15,a+16,b+42);

    setcolor(0);
    line(a-16,b+38,a-12,b+38);
    line(a-16,b+35,a-12,b+35);
    line(a+16,b+38,a+12,b+38);
    line(a+16,b+35,a+12,b+35);

    line(a-1,b+14,a-4,b+17);
    line(a+1,b+14,a+4,b+17);

    line(a-4,b+17,a,b+22);
    line(a+4,b+17,a,b+22);
    line(a,b+22,a,b+45);

    setfillstyle(1,1);
    bar(a-9,b+47,a-2,b+81);
    bar(a+9,b+47,a+2,b+81);
    bar(a-9,b+47,a+9,b+53);
  end;
procedure fejhull(a,b,vx,vy:longint);
var dx,dy:longint;
    t:real;
  begin
    dx:=0;
    dy:=0;
    t:=0;
    if(vx<>0) then
      begin
    while(dy<80) do
      begin
        setcolor(0);
        if(vx>0)then dx:=dx+1 else dx:=dx-1;
        t:=dx/vx;
        dy:=round(vy*t+5*t*t);
        fej(a+dx,b+dy,14);
        delay(20);
        setfillstyle(1,0);
        bar(a+dx-10,b+dy-10,a+dx+10,b+dy+10);
        phil(a,b);
      end;
      end;
    fej(a+dx,b+dy,14);
  end;
function heli(a,b:longint):longint;
  begin
    setcolor(15);
    line(a-20,b-20,a+20,b-20);
    line(a,b-20,a,b-13);
    setfillstyle(1,3);
    setcolor(3);
    bar(a-18,b-13,a+18,b+5);
    setfillstyle(1,2);
    fillellipse(a+18,b-2,12,10);
    setfillstyle(1,0);
    fillellipse(a+18,b-2,5,3);
    setfillstyle(1,4);
    bar(a-40,b-5,a-16,b-3);
    bar(a-40,b-5,a-38,b-14);
    setcolor(15);
    line(a-45,b-14,a-35,b-14);
  end;
function heli0(a,b:longint):longint;
  begin
    setcolor(0);
    line(a-20,b-20,a+20,b-20);
    line(a,b-20,a,b-13);
    setfillstyle(1,0);
    setcolor(0);
    bar(a-18,b-13,a+18,b+5);
    setfillstyle(1,0);
    fillellipse(a+18,b-2,12,10);
    setfillstyle(1,0);
    fillellipse(a+18,b-2,5,3);
    setfillstyle(1,0);
    bar(a-40,b-5,a-16,b-3);
    bar(a-40,b-5,a-38,b-14);
    setcolor(0);
    line(a-45,b-14,a-35,b-14);
  end;
var gr,gm:integer;
    i,j,x,y:longint;
    vx,vy:real;
    ss:array[1..100,1..100] of longint;
    en:real;
    c:char;
    l,g:boolean;
    d:boolean;
    s:string;
begin
  clrscr;

  d:=true;
  gr:=DETECT;
  initgraph(gr,gm,' ');
  intro;
  setfillstyle(1,0);

  bar(1,1,640,480);
  randomize;
  x:=320;
  y:=240;
  vx:=0;
  vy:=0;
  l:=true;
  g:=true;
  for i:=1 to 15 do
    begin
      ss[i][1]:=random(640);
      ss[i][2]:=random(440);
    end;

  while(d) do
    begin

      while(not keypressed) do
        begin
       for i:=1 to 15 do
        if(ss[i][1]<0) then phil(-ss[i][1],-ss[i][2])
          else
            begin
              phil(ss[i][1],ss[i][2]);
              fej(ss[i][1],ss[i][2],14);
            end;
          if(l) then begin vx:=vx-(vx/50); vy:=vy-(vy/50); end;
          if(g) then vy:=vy-0.2;
          x:=x+round(vx);
          y:=round(y-vy);
          if(vx>=0) then heli(x,y) else heli_(x,y);

          delay(20);
          if(vx>=0) then heli0(x,y) else heli_0(x,y);
          if((x<-640) or (x>1280) or (y<-480) or (y>960)) then d:=false;
          for i:=1 to 15 do
            if((x<ss[i][1]+20) and (x>ss[i][1]-20) and (y<ss[i][2]+20) and (y>ss[i][2]-20)) then
              begin
                fejhull(ss[i][1],ss[i][2],round(vx),round(vy));
                ss[i][1]:=-ss[i][1];
                ss[i][2]:=-ss[i][2];
              end;
          for i:=1 to 15 do
            if((ss[i][1]<0) and (ss[i][2]<0)) then j:=j+1;

          if(j=15) then d:=false;
          j:=0;
        end;
      c:=readkey;
      case c of
        '4': begin vx:=vx-1; en:=en+0.5; end;
        '8': begin vy:=vy+1; en:=en+1; end;
        '6': begin vx:=vx+1; en:=en+1; end;
        '2': begin vy:=vy-1; en:=en+0.5; end;
        'x': begin d:=false; end;
        'l':l:=false;
        'g':g:=false;
        end;
   end;
   str(en/10:3:1,s);
   setcolor(15);
   settextjustify(centertext,centertext);
   outtextxy(320,240,s+' liter Åzemanyag fogyott');
   readkey;
end.