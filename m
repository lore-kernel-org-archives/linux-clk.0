Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528973829-25493-3-git-send-email-michel.pollet@bp.renesas.com> <20180620154344.GA32205@rob-hp-laptop>
In-Reply-To: <20180620154344.GA32205@rob-hp-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Jun 2018 15:27:27 +0200
Message-ID: <CAMuHMdW5bfhPeHxdCeJEJrkWAXvxU4wSVvDErF2DhCQfvF1rUw@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] dt-bindings: clock: renesas,r9a06g032-sysctrl: documentation
To: Rob Herring <robh@kernel.org>
Cc: Michel Pollet <michel.pollet@bp.renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
	Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 20, 2018 at 5:43 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Jun 14, 2018 at 11:56:31AM +0100, Michel Pollet wrote:
> > The Renesas R9A06G032 SYSCTRL node description.
> >
> > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> > ---
> >  .../bindings/clock/renesas,r9a06g032-sysctrl.txt   | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
>
> One nit, otherwise:
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt

> > +Examples
> > +--------
> > +
> > +  - SYSCTRL node:
> > +
> > +     sysctrl: system-controller@4000c000 {
> > +             compatible = "renesas,r9a06g032-sysctrl";
> > +             reg = <0x4000c000 0x1000>;
> > +             status = "okay";
>
> Don't show status in examples.

Thanks, queuing in clk-renesas-for-v4.19 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
