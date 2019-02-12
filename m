Return-Path: <SRS0=E6RW=QT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F2FC282C4
	for <linux-clk@archiver.kernel.org>; Tue, 12 Feb 2019 11:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57A25217FA
	for <linux-clk@archiver.kernel.org>; Tue, 12 Feb 2019 11:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N4V+RUEQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfBLLH2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Feb 2019 06:07:28 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43414 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbfBLLH2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Feb 2019 06:07:28 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1CB7OWd067618;
        Tue, 12 Feb 2019 05:07:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1549969644;
        bh=ViiqxLAB6FJOvbtViVZPVybcZMLswF8mqmYgOPA+eOk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=N4V+RUEQRB3+h0UsKQXA4CO+f/wxW2MPOae+1eJCZESaNZvgjdyaG9EScoPnrZrjn
         1BBaFst92FtlrYKGstu0qxsZ8Hp3SxWYXaKPPLjP0uR09uXri0VhHRvxJ07JJcm+A8
         Dewhjzn/4a6ygQy8BhdAIrD06UI/owY44IBpw8aY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1CB7NlP002045
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Feb 2019 05:07:23 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 12
 Feb 2019 05:07:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 12 Feb 2019 05:07:22 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1CB7Ko4007828;
        Tue, 12 Feb 2019 05:07:21 -0600
Subject: Re: [PATCH] clk: clk-twl6040: Fix imprecise external abort for pdmclk
To:     Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Misael Lopez Cruz <misael.lopez@ti.com>
References: <20190211225907.38511-1-tony@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <7a6a0c59-ae47-a046-efd4-356dc1b0c9f9@ti.com>
Date:   Tue, 12 Feb 2019 13:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190211225907.38511-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12/02/2019 0.59, Tony Lindgren wrote:
> I noticed that modprobe clk-twl6040 can fail after a cold boot with:
> abe_cm:clk:0010:0: failed to enable
> ...
> Unhandled fault: imprecise external abort (0x1406) at 0xbe896b20
> 
> WARNING: CPU: 1 PID: 29 at drivers/clk/clk.c:828 clk_core_disable_lock+0x18/0x24
> ...
> (clk_core_disable_lock) from [<c0123534>] (_disable_clocks+0x18/0x90)
> (_disable_clocks) from [<c0124040>] (_idle+0x17c/0x244)
> (_idle) from [<c0125ad4>] (omap_hwmod_idle+0x24/0x44)
> (omap_hwmod_idle) from [<c053a038>] (sysc_runtime_suspend+0x48/0x108)
> (sysc_runtime_suspend) from [<c06084c4>] (__rpm_callback+0x144/0x1d8)
> (__rpm_callback) from [<c0608578>] (rpm_callback+0x20/0x80)
> (rpm_callback) from [<c0607034>] (rpm_suspend+0x120/0x694)
> (rpm_suspend) from [<c0607a78>] (__pm_runtime_idle+0x60/0x84)
> (__pm_runtime_idle) from [<c053aaf0>] (sysc_probe+0x874/0xf2c)
> (sysc_probe) from [<c05fecd4>] (platform_drv_probe+0x48/0x98)
> 
> After searching around for a similar issue, I came across an earlier fix
> that never got merged upstream in the Android tree for glass-omap-xrr02.
> There is patch "MFD: twl6040-codec: Implement PDMCLK cold temp errata"
> by Misael Lopez Cruz <misael.lopez@ti.com>.
> 
> Based on my observations, this fix is also needed when cold booting
> devices, and not just for deeper idle modes. Since we now have a clock
> driver for pdmclk, let's fix the issue in twl6040_pdmclk_prepare().

Thanks for figuring it out! I came across this patch a while ago and not
sure why I did not ported it.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Cc: Misael Lopez Cruz <misael.lopez@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/clk-twl6040.c | 53 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-twl6040.c b/drivers/clk/clk-twl6040.c
> --- a/drivers/clk/clk-twl6040.c
> +++ b/drivers/clk/clk-twl6040.c
> @@ -41,6 +41,43 @@ static int twl6040_pdmclk_is_prepared(struct clk_hw *hw)
>  	return pdmclk->enabled;
>  }
>  
> +static int twl6040_pdmclk_reset_one_clock(struct twl6040_pdmclk *pdmclk,
> +					  unsigned int reg)
> +{
> +	const u8 reset_mask = TWL6040_HPLLRST;	/* Same for HPPLL and LPPLL */
> +	int ret;
> +
> +	ret = twl6040_set_bits(pdmclk->twl6040, reg, reset_mask);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = twl6040_clear_bits(pdmclk->twl6040, reg, reset_mask);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/*
> + * TWL6040A2 Phoenix Audio IC erratum #6: "PDM Clock Generation Issue At
> + * Cold Temperature". This affects cold boot and deeper idle states it
> + * seems. The workaround consists of resetting HPPLL and LPPLL.
> + */
> +static int twl6040_pdmclk_quirk_reset_clocks(struct twl6040_pdmclk *pdmclk)
> +{
> +	int ret;
> +
> +	ret = twl6040_pdmclk_reset_one_clock(pdmclk, TWL6040_REG_HPPLLCTL);
> +	if (ret)
> +		return ret;
> +
> +	ret = twl6040_pdmclk_reset_one_clock(pdmclk, TWL6040_REG_LPPLLCTL);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int twl6040_pdmclk_prepare(struct clk_hw *hw)
>  {
>  	struct twl6040_pdmclk *pdmclk = container_of(hw, struct twl6040_pdmclk,
> @@ -48,8 +85,20 @@ static int twl6040_pdmclk_prepare(struct clk_hw *hw)
>  	int ret;
>  
>  	ret = twl6040_power(pdmclk->twl6040, 1);
> -	if (!ret)
> -		pdmclk->enabled = 1;
> +	if (ret)
> +		return ret;
> +
> +	ret = twl6040_pdmclk_quirk_reset_clocks(pdmclk);
> +	if (ret)
> +		goto out_err;
> +
> +	pdmclk->enabled = 1;
> +
> +	return 0;
> +
> +out_err:
> +	dev_err(pdmclk->dev, "%s: error %i\n", __func__, ret);
> +	twl6040_power(pdmclk->twl6040, 0);
>  
>  	return ret;
>  }
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
