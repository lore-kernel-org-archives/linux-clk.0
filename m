Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v6 01/05] clk: shmobile: Rework CONFIG_ARCH_SHMOBILE_MULTI
To: Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org
References: <20150902071657.10870.37652.sendpatchset@little-apple>
 <20150902071708.10870.37170.sendpatchset@little-apple>
Cc: kuninori.morimoto.gx@renesas.com, linux-sh@vger.kernel.org,
 mturquette@baylibre.com, gaku.inami.xw@bp.renesas.com, sboyd@codeaurora.org,
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <55E6DA68.5070809@cogentembedded.com>
Date: Wed, 2 Sep 2015 14:15:52 +0300
MIME-Version: 1.0
In-Reply-To: <20150902071708.10870.37170.sendpatchset@little-apple>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello.

On 9/2/2015 10:17 AM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
>
> Shmobile is all multiplatform these days, so in get rid of the

    Grammar nit: "in" not needed.

> reference to CONFIG_ARCH_SHMOBILE_MULTI in drivers/clk/shmobile/.

> Also instead of always enabling DIV6 and MSTP adjust the Makefile
> to enable DIV6 and MSTP depending on if they are included in the
> SoC or not.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[...]

MBR, Sergei
