Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BD2C433B4
	for <linux-clk@archiver.kernel.org>; Thu, 22 Apr 2021 05:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D436140F
	for <linux-clk@archiver.kernel.org>; Thu, 22 Apr 2021 05:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhDVFt2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 01:49:28 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:52222 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhDVFt2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Apr 2021 01:49:28 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 13M5mOm8030458; Thu, 22 Apr 2021 14:48:24 +0900
X-Iguazu-Qid: 2wHHssSnbtZqBQQ742
X-Iguazu-QSIG: v=2; s=0; t=1619070503; q=2wHHssSnbtZqBQQ742; m=rx+BxJ6k7af4P5UpUKDCwEMfa8HZ5u9ma8Dnr+6Zn0I=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1110) id 13M5mKPu025052
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 22 Apr 2021 14:48:21 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id BAFB2100117;
        Thu, 22 Apr 2021 14:48:20 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 13M5mKj2019193;
        Thu, 22 Apr 2021 14:48:20 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Quanyang Wang <quanyang.wang@windriver.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: zynqmp: fix compile testing without ZYNQMP_FIRMWARE
References: <20210421134844.3297838-1-arnd@kernel.org>
Date:   Thu, 22 Apr 2021 14:48:18 +0900
In-Reply-To: <20210421134844.3297838-1-arnd@kernel.org> (Arnd Bergmann's
        message of "Wed, 21 Apr 2021 15:48:36 +0200")
X-TSB-HOP: ON
Message-ID: <871rb2swd9.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Arnd,

Thanks for the fix.

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When the firmware code is disabled, the incomplete error handling
> in the clk driver causes compile-time warnings:
>
> drivers/clk/zynqmp/pll.c: In function 'zynqmp_pll_recalc_rate':
> drivers/clk/zynqmp/pll.c:147:29: error: 'fbdiv' is used uninitialized [-Werror=uninitialized]
>   147 |         rate =  parent_rate * fbdiv;
>       |                 ~~~~~~~~~~~~^~~~~~~
> In function 'zynqmp_pll_get_mode',
>     inlined from 'zynqmp_pll_recalc_rate' at drivers/clk/zynqmp/pll.c:148:6:
> drivers/clk/zynqmp/pll.c:61:27: error: 'ret_payload' is used uninitialized [-Werror=uninitialized]
>    61 |         return ret_payload[1];
>       |                ~~~~~~~~~~~^~~
> drivers/clk/zynqmp/pll.c: In function 'zynqmp_pll_recalc_rate':
> drivers/clk/zynqmp/pll.c:53:13: note: 'ret_payload' declared here
>    53 |         u32 ret_payload[PAYLOAD_ARG_CNT];
>       |             ^~~~~~~~~~~
> drivers/clk/zynqmp/clk-mux-zynqmp.c: In function 'zynqmp_clk_mux_get_parent':
> drivers/clk/zynqmp/clk-mux-zynqmp.c:57:16: error: 'val' is used uninitialized [-Werror=uninitialized]
>    57 |         return val;
>       |                ^~~


Not sure what I am missing but I couldn't reproduce these warnings. I
tried a few different ways to toggle CONFIG_ZYNQMP_FIRMWARE.

Regardless...

> As it was apparently intentional to support this for compile testing
> purposes, change the code to have just enough error handling for the
> compiler to not notice the remaining bugs.
>
> Fixes: 21f237534661 ("clk: zynqmp: Drop dependency on ARCH_ZYNQMP")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/zynqmp/clk-mux-zynqmp.c | 4 +++-
>  drivers/clk/zynqmp/pll.c            | 8 ++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
> index 06194149be83..2afded3c7c11 100644
> --- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
> +++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
> @@ -50,9 +50,11 @@ static u8 zynqmp_clk_mux_get_parent(struct clk_hw *hw)
>  
>  	ret = zynqmp_pm_clock_getparent(clk_id, &val);
>  
> -	if (ret)
> +	if (ret) {
>  		pr_warn_once("%s() getparent failed for clock: %s, ret = %d\n",
>  			     __func__, clk_name, ret);
> +		return ret;
> +	}
>  
>  	return val;
>  }
> diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
> index abe6afbf3407..67d2a2d260c1 100644
> --- a/drivers/clk/zynqmp/pll.c
> +++ b/drivers/clk/zynqmp/pll.c
> @@ -54,9 +54,11 @@ static inline enum pll_mode zynqmp_pll_get_mode(struct clk_hw *hw)
>  	int ret;
>  
>  	ret = zynqmp_pm_get_pll_frac_mode(clk_id, ret_payload);
> -	if (ret)
> +	if (ret) {
>  		pr_warn_once("%s() PLL get frac mode failed for %s, ret = %d\n",
>  			     __func__, clk_name, ret);
> +		return ret;
> +	}
>  
>  	return ret_payload[1];
>  }
> @@ -140,9 +142,11 @@ static unsigned long zynqmp_pll_recalc_rate(struct clk_hw *hw,
>  	int ret;
>  
>  	ret = zynqmp_pm_clock_getdivider(clk_id, &fbdiv);
> -	if (ret)
> +	if (ret) {
>  		pr_warn_once("%s() get divider failed for %s, ret = %d\n",
>  			     __func__, clk_name, ret);
> +		return -1ul;
> +	}
>  
>  	rate =  parent_rate * fbdiv;
>  	if (zynqmp_pll_get_mode(hw) == PLL_MODE_FRAC) {

The changes make sense in that the functions error out sensibly when the
zynqmp firmware driver is not enabled.

Acked-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Punit
