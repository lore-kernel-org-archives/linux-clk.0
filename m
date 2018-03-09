Return-Path: <mine260309@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1520542640-9185-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520542640-9185-1-git-send-email-eajames@linux.vnet.ibm.com> <1520542640-9185-3-git-send-email-eajames@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 9 Mar 2018 11:19:47 +0800
Message-ID: <CAARXrtktSUMBuHUUjqTgrWNZaHVkOC9DUQEr4WKeGNz2z6WVdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Prevent reset if clock is enabled
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: multipart/alternative; boundary="001a1140c096b9b8b00566f24305"
List-ID: <linux-clk.vger.kernel.org>

--001a1140c096b9b8b00566f24305
Content-Type: text/plain; charset="UTF-8"

>  static int aspeed_clk_enable(struct clk_hw *hw)
>  {
>         struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
> @@ -215,6 +227,11 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>
>         spin_lock_irqsave(gate->lock, flags);
>
> +       if (aspeed_clk_is_enabled(hw)) {
> +               spin_unlock_irqrestore(gate->lock, flags);
> +               return 0;
> +       }
> +

I think this piece of code can be run before spin_lock_irqsave(), so it is
able to just return without spin_unlock_irqrestore()?

--001a1140c096b9b8b00566f24305
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace, monospace"><br><br><br>&gt; =C2=
=A0static int aspeed_clk_enable(struct clk_hw *hw)<br>&gt; =C2=A0{<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct aspeed_clk_gate *gate =3D to_aspeed_clk_=
gate(hw);<br>&gt; @@ -215,6 +227,11 @@ static int aspeed_clk_enable(struct =
clk_hw *hw)<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(g=
ate-&gt;lock, flags);<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (aspeed_clk=
_is_enabled(hw)) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spin_unlock_irqrestore(gate-&gt;lock, flags);<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 }<br>&gt; +<br><br></font><div><font face=3D"monospace, monospace">I think=
 this piece of code can be run before spin_lock_irqsave(), so it is</font><=
div><font face=3D"monospace, monospace">able to just return without=C2=A0<s=
pan style=3D"color:rgb(34,34,34);font-family:monospace;font-size:small;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">spin_unlock_irqrestore()?</span></font></div><div><br></di=
v></div></div>

--001a1140c096b9b8b00566f24305--
