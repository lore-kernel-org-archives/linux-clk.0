Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:34511 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517AbbFSQ2b convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jun 2015 12:28:31 -0400
Received: by pdbki1 with SMTP id ki1so93985566pdb.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2015 09:28:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	"Mike Turquette" <mturquette@baylibre.org>,
	"Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <20150619155246.18af1068@bbrezillon>
Cc: "Alexandre Belloni" <alexandre.belloni@free-electrons.com>,
	"Jean-Christophe Plagniol-Villard" <plagnioj@jcrosoft.com>,
	"Nicolas Ferre" <nicolas.ferre@atmel.com>,
	linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
References: <20150619155246.18af1068@bbrezillon>
Message-ID: <20150619162819.9112.53363@quantum>
Subject: Re: [PULL] clk: at91: fixes for 4.1
Date: Fri, 19 Jun 2015 09:28:19 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2015-06-19 06:52:46)
> Hi Mike,
> 
> As you suggested, here is a PR including several fixes for the at91 clk
> drivers. BTW, thanks for accepting to take this PR so late in the release
> cycle.
> 
> Best Regards,
> 
> Boris
> 
> The following changes since commit 03bc10ab5b0f9b8f81bffbe6e40c944f9d3dbcc5:
> 
>   clk: check ->determine/round_rate() return value in clk_calc_new_rates (2015-04-12 21:09:49 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/bbrezillon/linux-at91.git ccf/atmel-fixes-for-4.1
> 
> for you to fetch changes up to 28df9c2fb6f896179fcffd5a3f5a86e2d1dff0a5:
> 
>   clk: at91: fix h32mx prototype inclusion in pmc header (2015-06-19 15:48:34 +0200)

Pulled.

Thanks,
Mike

> 
> ----------------------------------------------------------------
> Boris Brezillon (2):
>       clk: at91: pll: fix input range validity check
>       clk: at91: fix PERIPHERAL_MAX_SHIFT definition
> 
> Nicolas Ferre (2):
>       clk: at91: trivial: typo in peripheral clock description
>       clk: at91: fix h32mx prototype inclusion in pmc header
> 
>  Documentation/devicetree/bindings/clock/at91-clock.txt |  2 +-
>  drivers/clk/at91/clk-peripheral.c                      |  8 ++++----
>  drivers/clk/at91/clk-pll.c                             | 12 ++++++++++--
>  drivers/clk/at91/pmc.h                                 |  2 +-
>  4 files changed, 16 insertions(+), 8 deletions(-)
> 
> 
> 
> -- 
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe linux-clk" in
