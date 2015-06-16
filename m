Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34370 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753610AbbFPPCi (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 16 Jun 2015 11:02:38 -0400
Received: by pacgb13 with SMTP id gb13so14497565pac.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2015 08:02:37 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Tawfik Bayouk <tawfik@marvell.com>,
	Lior Amsalem <alior@marvell.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Eran Ben-Avi <benavi@marvell.com>,
	linux-arm-kernel@lists.infradead.org, <stable@vger.kernel.org>
Subject: Re: [PATCH] clk: mvebu: flag the crypto clk as CLK_IGNORE_UNUSED
References: <1434453721-24070-1-git-send-email-boris.brezillon@free-electrons.com>
Date: Tue, 16 Jun 2015 08:02:34 -0700
In-Reply-To: <1434453721-24070-1-git-send-email-boris.brezillon@free-electrons.com>
	(Boris Brezillon's message of "Tue, 16 Jun 2015 13:22:01 +0200")
Message-ID: <7h381r1yt1.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Fixes: 29e623475c50267ee3aaa49ebb6cbe107bce8d2a ("clk: mvebu: add
> missing CESA gate clk").

Which was:

Reported-by: Kevin Hilman <khilman@linaro.org>

> The crypto SRAM, used by the armada 370 cpuidle code to workaround a bug
> in the BootROM code, requires the crypto clk to be up and running.
> Flag the the crypto clk as IGNORE_UNUSED until we add the proper
> infrastructure to define the crypto SRAM in the DT and reference the crypto
> clk in this SRAM node.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: <stable@vger.kernel.org> #4.1

> ---
>  drivers/clk/mvebu/armada-370.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mvebu/armada-370.c b/drivers/clk/mvebu/armada-370.c
> index c19fd77..7c2a58c 100644
> --- a/drivers/clk/mvebu/armada-370.c
> +++ b/drivers/clk/mvebu/armada-370.c
> @@ -163,7 +163,7 @@ static const struct clk_gating_soc_desc a370_gating_desc[] __initconst = {
>  	{ "pex1", "pex1_en", 9, 0 },
>  	{ "sata0", NULL, 15, 0 },
>  	{ "sdio", NULL, 17, 0 },
> -	{ "crypto", NULL, 23, 0 },
> +	{ "crypto", NULL, 23, CLK_IGNORE_UNUSED }

Doesn't compile.  Needs trailing ','

>  	{ "tdm", NULL, 25, 0 },
>  	{ "ddr", NULL, 28, CLK_IGNORE_UNUSED },
>  	{ "sata1", NULL, 30, 0 },

With that fixed, I tested this on top of next-20150615 where mirabox was
previously broken and I confirm it's now working.

Tested-by: Kevin Hilman <khilman@linaro.org>

Kevin
