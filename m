Return-Path: <SRS0=Iazp=YY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B3CCA9ECB
	for <linux-clk@archiver.kernel.org>; Thu, 31 Oct 2019 13:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C6E42080F
	for <linux-clk@archiver.kernel.org>; Thu, 31 Oct 2019 13:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pv5LdDD4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfJaNvU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Oct 2019 09:51:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53800 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbfJaNvU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Oct 2019 09:51:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VDpFw5106464;
        Thu, 31 Oct 2019 08:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572529875;
        bh=6aEe/wymX73PzcP7yQG1AORm30FRvewlwVASZRgDXfo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Pv5LdDD4bOz4dWilnHSIOFSYRl1CUZUlUdPbGXa9TDSj1VGEm2/j8xWLyruSOhng3
         TxLlFhjbCLJdNVyKz0lVxP6DHJa3RAdEM//PXTJK6NQ8L1Gix6dpgtMIHdVmEoTQfv
         EaZ/6rLT8IQ33RaqTr96HPvJHka6EtjCbL+K1GbQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VDpFDd007022
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 08:51:15 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 08:51:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 08:51:01 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VDpBcF023327;
        Thu, 31 Oct 2019 08:51:12 -0500
Subject: Re: [PATCHv3 03/10] clk: ti: clkctrl: add new exported API for
 checking standby info
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
 <20190912132613.28093-4-t-kristo@ti.com>
 <20191028144100.16AB321783@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <2c9c664e-27f5-5b90-70a2-8968bac07410@ti.com>
Date:   Thu, 31 Oct 2019 15:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028144100.16AB321783@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/10/2019 16:40, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-09-12 06:26:06)
>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>> index d904a9a7626a..e3e0a66a6ce2 100644
>> --- a/drivers/clk/ti/clkctrl.c
>> +++ b/drivers/clk/ti/clkctrl.c
>> @@ -647,3 +650,33 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>>   }
>>   CLK_OF_DECLARE(ti_omap4_clkctrl_clock, "ti,clkctrl",
>>                 _ti_omap4_clkctrl_setup);
>> +
>> +/**
>> + * ti_clk_is_in_standby - Check if clkctrl clock is in standby or not
>> + * @clk: clock to check standby status for
>> + *
>> + * Finds whether the provided clock is in standby mode or not. Returns
>> + * true if the provided clock is a clkctrl type clock and it is in standby,
>> + * false otherwise.
>> + */
>> +u32 ti_clk_is_in_standby(struct clk *clk)
>> +{
>> +       struct clk_hw *hw;
>> +       struct clk_hw_omap *hwclk;
>> +       u32 val;
>> +
>> +       hw = __clk_get_hw(clk);
>> +
>> +       if (!omap2_clk_is_hw_omap(hw))
>> +               return false;
>> +
>> +       hwclk = to_clk_hw_omap(hw);
>> +
>> +       val = ti_clk_ll_ops->clk_readl(&hwclk->enable_reg);
>> +
>> +       if (val & OMAP4_STBYST_MASK)
>> +               return true;
>> +
>> +       return false;
> 
> This is returning true and false for a function that is returning u32...
> Why? Maybe just
> 
> 	return val & OMAP4_STBYST_MASK;
> 
> and then it will be a u32 for the bit if it's set or 0 if it's not set?
> Otherwise, change the return type to bool instead of u32?
> 
>> +}
>> +EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);

Right, let me fix that by converting the return type to bool.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
