Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22885C47088
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 00:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234590AbiLCAXz convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 19:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiLCAXy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 19:23:54 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B01787CA0;
        Fri,  2 Dec 2022 16:23:53 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A96323A;
        Fri,  2 Dec 2022 16:24:00 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 817DF3F73B;
        Fri,  2 Dec 2022 16:23:51 -0800 (PST)
Date:   Sat, 3 Dec 2022 00:22:05 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        =?UTF-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: d1: Mark cpux clock as critical
Message-ID: <20221203002205.0f97d3bf@slackpad.lan>
In-Reply-To: <20221126191319.6404-5-samuel@sholland.org>
References: <20221126191319.6404-1-samuel@sholland.org>
        <20221126191319.6404-5-samuel@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 26 Nov 2022 13:13:18 -0600
Samuel Holland <samuel@sholland.org> wrote:

> From: András Szemző <szemzo.andras@gmail.com>
> 
> Some SoCs in the D1 family feature ARM CPUs instead of a RISC-V CPU.
> In that case, the CPUs are driven from the 'cpux' clock, so it needs
> to be marked as critical.

Yes, my board hangs without that patch somewhere into the boot, and
this patch fixes it.

Can you also explain in the commit message why this is needed? IIRC
the CPU node itself does not "consume" the clock, this would only be
done by DVFS code?
And it might be worth noting that we do this for every other
Allwinner SoC as well.

> Signed-off-by: András Szemző <szemzo.andras@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> 
>  drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
> index 8ef3cdeb7962..c5a7df93602c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
> @@ -240,7 +240,7 @@ static const struct clk_parent_data cpux_parents[] = {
>  	{ .hw = &pll_periph0_800M_clk.common.hw },
>  };
>  static SUNXI_CCU_MUX_DATA(cpux_clk, "cpux", cpux_parents,
> -			  0x500, 24, 3, CLK_SET_RATE_PARENT);
> +			  0x500, 24, 3, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
>  
>  static const struct clk_hw *cpux_hws[] = { &cpux_clk.common.hw };
>  static SUNXI_CCU_M_HWS(cpux_axi_clk, "cpux-axi",

