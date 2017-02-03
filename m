Return-Path: <Chris.Brandt@renesas.com>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>
CC: Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi
	<jacopo+renesas@jmondi.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: mstp: ensure register writes complete
 before returning
Date: Fri, 3 Feb 2017 19:52:10 +0000
Message-ID: <SG2PR06MB11653D0AAAAD194AD2FB9BAC8A4F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170127181950.22165-1-chris.brandt@renesas.com>
In-Reply-To: <20170127181950.22165-1-chris.brandt@renesas.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Friday, January 27, 2017, Chris Brandt wrote:
> When there is no status bit, it is possible for the clock enable/disable
> operation to have not completed by the time the driver code resumes
> execution. This is due to the fact that write operations are sometimes
> queued and delayed internally. Doing a read ensures the write operations
> has completed.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/clk/renesas/clk-mstp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-
> mstp.c
> index 3ce819c..69cfdb9 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -91,6 +91,12 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw,
> bool enable)
>  		value |=3D bitmask;
>  	cpg_mstp_write(group, value, group->smstpcr);
>=20
> +	if (!group->mstpsr) {
> +		/* dummy read to ensure write has completed */
> +		clk_readl(group->smstpcr);
> +		barrier_data(group->smstpcr);
> +	}
> +
>  	spin_unlock_irqrestore(&group->lock, flags);
>=20
>  	if (!enable || !group->mstpsr)


Just to show why I think this helps, here's my testing.


I first discovered this with the RSPI driver where it would stop working. T=
he reason is that after the clock is turned back on, it would do a read/mod=
ify/write on a register. But, sometimes the register value would come back =
as 0x00...to it would go from Master mode to Slave mode.

So to demonstration this, I ran the following code below on boot up.
WITHOUT this patch I'm proposing, you will get the following message printe=
d out many times (every time SPCR is read as 0x00 instead of its correct va=
lue of 0x40)

=3D=3D=3D=3D=3DSPCR=3D00 SPSR=3D60 SPCMD=3D078B
=3D=3D=3D=3D=3DSPCR=3D00 SPSR=3D60 SPCMD=3D078B
=3D=3D=3D=3D=3DSPCR=3D00 SPSR=3D60 SPCMD=3D078B
=3D=3D=3D=3D=3DSPCR=3D00 SPSR=3D60 SPCMD=3D078B
=3D=3D=3D=3D=3DSPCR=3D00 SPSR=3D60 SPCMD=3D078B
etc...


However, WITH this patch applied, you will never get this message (meaning =
this patch fixes this issue).


Unfortunately, I think some peripherals like RIIC (I2C) still need more tim=
e to become fully working...but that's a different topic.


For reference, here was the test code I was running to show this effect.

	/* MSTP testing */
	{
		struct clk *rspi4_clk;
		void *rspi4_base =3D ioremap_nocache(0xE800E800, 0x30);
		u8 spcr =3D 0xFF;
		u8 spsr =3D 0xFF;
		u16 spcmd =3D 0xFFFF;
		int i;

		/* set SPCR to 0x40 (reset: SPCR =3D 0x00) */
		rspi4_clk =3D clk_get_sys(NULL,"spi4");
		clk_prepare_enable(rspi4_clk);
		udelay(1000);
		*(u8 *)rspi4_base =3D 0x40;
		udelay(1000);
		clk_disable_unprepare(rspi4_clk);
		msleep(100);

		for (i=3D0;i<1000;i++)
		{
			/* Enable Clock */
			clk_prepare_enable(rspi4_clk);

			/* read registers */
			spcr =3D *(u8 *)(rspi4_base);	/* 0x40 =3D OK */
			spsr =3D *(u8 *)(rspi4_base + 3); /* 0x60 =3D OK */
			spcmd =3D *(u16 *)(rspi4_base + 0x10);/* 0x070D =3D OK */

			/* value=3D0 is BAD data */
			if (!spcr || !spsr || !spcmd)
				printk("=3D=3D=3D=3D=3DSPCR=3D%02X SPSR=3D%02X SPCMD=3D%04X\n", spcr,sp=
sr,spcmd);

			/* Disable Clock */
			clk_disable_unprepare(rspi4_clk);
		}
	}



Chris
