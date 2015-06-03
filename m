Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dinh Nguyen <dinguyen@opensource.altera.com>,
 "Dan Carpenter" <dan.carpenter@oracle.com>
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <5565C4F4.7090805@opensource.altera.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20150527082627.GD19423@mwanda> <5565C4F4.7090805@opensource.altera.com>
Message-ID: <20150603232141.6017.18339@quantum>
Subject: Re: [patch] clk: socfpga: remove a stray tab
Date: Wed, 03 Jun 2015 16:21:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dinh Nguyen (2015-05-27 06:21:56)
> =

> =

> On 5/27/15 3:26 AM, Dan Carpenter wrote:
> > This line was indented too far.
> > =

> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/c=
lk-gate-a10.c
> > index be3e998..83c6780 100644
> > --- a/drivers/clk/socfpga/clk-gate-a10.c
> > +++ b/drivers/clk/socfpga/clk-gate-a10.c
> > @@ -39,7 +39,7 @@ static unsigned long socfpga_gate_clk_recalc_rate(str=
uct clk_hw *hwclk,
> >       else if (socfpgaclk->div_reg) {
> >               val =3D readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
> >               val &=3D div_mask(socfpgaclk->width);
> > -                     div =3D (1 << val);
> > +             div =3D (1 << val);
> >       }
> >  =

> >       return parent_rate / div;
> > =

> =

> Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Applied.

Regards,
Mike
