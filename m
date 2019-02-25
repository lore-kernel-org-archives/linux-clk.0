Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E86C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 07:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C4A12087C
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 07:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VplI2sWd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbfBYHT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 02:19:28 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34642 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbfBYHT1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Feb 2019 02:19:27 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1P7JNp4009630;
        Mon, 25 Feb 2019 01:19:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1551079163;
        bh=YeFsCO426or8+x2EllW2osdCO6ty4hV05P4JmsAooZE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VplI2sWdWp3G7Om6f/cRjEKdPyH5NUefikpxxiBaPd9udPj7FSaMn4mxk5CJ9Qozh
         9lP7Ymj/HYy/x25EZc/L+UPYn77+nLc1TGqLxTWFRxNL7zfgxaU3pTRc6wNMBH5OS6
         Xr40va5incStbRtboS22XhMAheDnfitZg1QA005M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1P7JNl1068473
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Feb 2019 01:19:23 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Mon, 25
 Feb 2019 01:19:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Mon, 25 Feb 2019 01:19:21 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1P7JG1w018792;
        Mon, 25 Feb 2019 01:19:19 -0600
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
 <155086505454.77512.10530464362384162696@swboyd.mtv.corp.google.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <5e6295e2-6916-5ffb-e9e9-c0fa4ed29aa5@ti.com>
Date:   Mon, 25 Feb 2019 09:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <155086505454.77512.10530464362384162696@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/02/2019 21:50, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-01-15 01:15:11)
>> Hi Stephen,
>>
>> As requested, this series gets rid of CLK_IS_BASIC flag usage from
>> TI clock drivers.
>>
>> Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a quick
>> suspend/resume test on omap3/omap4/am5.
>>
> 
> I'm looking at clk-next now that this is all merged in and I still see
> one usage of CLK_IS_BASIC in the omap2 hwmod code.
> 
> arch/arm/mach-omap2/omap_hwmod.c:               if (__clk_get_flags(oh->_clk) & CLK_IS_BASIC)
> 
> Can that also be removed? If not, what clk types are on this platform?
> Maybe I can remove CLK_IS_BASIC from every clk type except for the ones
> that this code is checking for.
> 

Hmm, I missed this in my update, only looked at the drivers/clk/ti 
portion of code. However, this can be fixed with the following patch, I 
would need to export the omap2_clk_is_hw_omap() func from the driver and 
call it from the omap2 platform code. What do you think? Shall I post 
this as an official change? This one still has the issue that I am 
calling __clk_get_hw() though.

---


diff --git a/arch/arm/mach-omap2/omap_hwmod.c 
b/arch/arm/mach-omap2/omap_hwmod.c
index 3a04c73..baadddf 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -648,10 +648,10 @@ static struct clockdomain *_get_clkdm(struct 
omap_hwmod *oh)
  	if (oh->clkdm) {
  		return oh->clkdm;
  	} else if (oh->_clk) {
-		if (__clk_get_flags(oh->_clk) & CLK_IS_BASIC)
+		if (!omap2_clk_is_hw_omap(__clk_get_hw(oh->_clk)))
  			return NULL;
  		clk = to_clk_hw_omap(__clk_get_hw(oh->_clk));
-		return  clk->clkdm;
+		return clk->clkdm;
  	}
  	return NULL;
  }
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 1c0fac5..4223a39 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -303,7 +303,6 @@ long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
  int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
  				       struct clk_rate_request *req);
  int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw));
-bool omap2_clk_is_hw_omap(struct clk_hw *hw);

  extern struct ti_clk_ll_ops *ti_clk_ll_ops;

diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 78872ef..2821f7c 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -243,6 +243,7 @@ struct ti_clk_ll_ops {

  #define to_clk_hw_omap(_hw) container_of(_hw, struct clk_hw_omap, hw)

+bool omap2_clk_is_hw_omap(struct clk_hw *hw);
  int omap2_clk_disable_autoidle_all(void);
  int omap2_clk_enable_autoidle_all(void);
  int omap2_clk_allow_idle(struct clk *clk);
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
