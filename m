Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2f74597a-de90-884e-6878-cbe60c48af24@cogentembedded.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com> <2f74597a-de90-884e-6878-cbe60c48af24@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 20:41:37 +0200
Message-ID: <CAMuHMdU5BhqOfGhpn2K7B0imTVxYrnewDWzC3sk2wZ-rFysLLA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 29, 2016 at 8:39 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> +               np = of_find_node_by_name(NULL, "usb_x1");
>
>
>    "usb_x1" looks like a board specific name too much. Previously on R-Car
> we had the USB_EXTAL pin, maybe that one would be better?

See Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
