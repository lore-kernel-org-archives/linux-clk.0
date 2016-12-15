Return-Path: <Chris.Brandt@renesas.com>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman
	<horms+renesas@verge.net.au>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: mstp: Support 8-bit registers for r7s72100
Date: Thu, 15 Dec 2016 02:58:45 +0000
Message-ID: <SG2PR06MB116595E38DF9C7E4CE0083CD8A9D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20161215021134.14902-1-chris.brandt@renesas.com>
 <87bmwdoreh.wl%kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bmwdoreh.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Morimoto-san,

On Dec 14, 2016, Kuninori Morimoto wrote:
> I don't think using global variable is a good idea.
> For example, how about add reg_width_8bit into mstp_clock_group, and
> cpg_mstp_read/write requests it, or something like that ?

If I make a separate CLK_OF_DECLARE like this:

static void __init cpg_mstp_clocks_init8(struct device_node *np) {
	reg_width_8bit =3D true;
	cpg_mstp_clocks_init(np);
}
CLK_OF_DECLARE(cpg_mstp_clks8, "renesas,r7s72100-mstp-clocks",
	       cpg_mstp_clocks_init8);


The only way I can pass the 8-bit/32-bit choice into cpg_mstp_clocks_init()
is using a global variable.


Unless, I change the API to cpg_mstp_clocks_init(np, reg_width_8bit)

But, that means adding another function:

CLK_OF_DECLARE(cpg_mstp_clks32, "renesas,cpg-mstp-clocks",
               cpg_mstp_clocks_init32);

CLK_OF_DECLARE(cpg_mstp_clks8, "renesas,r7s72100-mstp-clocks",
               cpg_mstp_clocks_init8);

static void __init cpg_mstp_clocks_init32(struct device_node *np)
{
	cpg_mstp_clocks_init(np, false);
}
static void __init cpg_mstp_clocks_init8(struct device_node *np)
{
	cpg_mstp_clocks_init(np, true);
}


A global variable is much easier, but if no one likes it, I can change to
mstp_clock_group.reg_width_8bit instead.


Chris
