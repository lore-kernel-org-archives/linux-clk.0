Return-Path: <SRS0=QoRM=3G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD38AC33CB1
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jan 2020 15:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83FBA2072E
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jan 2020 15:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LY8W5jr6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbgAQPrK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jan 2020 10:47:10 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53488 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgAQPrK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jan 2020 10:47:10 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00HFl6J7052056;
        Fri, 17 Jan 2020 09:47:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579276026;
        bh=jjGw/ClHk77r7sY2T5/6sqsmol6P7vQEvxcBNUjaGRc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LY8W5jr6fWv4WeUmWOx9p8yc5PsBJNO0txLen98WrAxeJCflmSmNyBLHVv3z9Xoqi
         mC3P3DNJYobEpiK09C3kMNbZDTHSuAi26HxUphd6EJvWAU2GB1uUNL/6C3SPMN/8p5
         sS0Fkz+jfZpmixJ8rapWEArCfkifeEYtHmoVRmPM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00HFl5dB016685
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Jan 2020 09:47:06 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Jan 2020 09:47:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Jan 2020 09:47:04 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00HFl2x6099452;
        Fri, 17 Jan 2020 09:47:02 -0600
Subject: Re: [PATCH v2] clk: ti: dra7: fix parent for gmac_clkctrl
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20191221110004.9951-1-grygorii.strashko@ti.com>
 <e1782af7-098e-4550-8c9c-9f90187df8f3@ti.com>
 <b448c468-5216-f599-7add-cefaf4f557db@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <6777c22e-51b6-582c-54ca-364e9094bed9@ti.com>
Date:   Fri, 17 Jan 2020 17:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b448c468-5216-f599-7add-cefaf4f557db@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/01/2020 16:49, Grygorii Strashko wrote:
> 
> 
> On 17/01/2020 16:05, Tero Kristo wrote:
>> On 21/12/2019 13:00, Grygorii Strashko wrote:
>>> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) 
>>> instead
>>> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
>>> Hence, fix it.
>>>
>>> Fixes: dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>> ---
>>>   drivers/clk/ti/clk-7xx.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>>> index 9dd6185a4b4e..66e4b2b9ec60 100644
>>> --- a/drivers/clk/ti/clk-7xx.c
>>> +++ b/drivers/clk/ti/clk-7xx.c
>>> @@ -405,7 +405,7 @@ static const struct omap_clkctrl_bit_data 
>>> dra7_gmac_bit_data[] __initconst = {
>>>   };
>>>   static const struct omap_clkctrl_reg_data dra7_gmac_clkctrl_regs[] 
>>> __initconst = {
>>> -    { DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, 
>>> "dpll_gmac_ck" },
>>> +    { DRA7_GMAC_GMAC_CLKCTRL, dra7_gmac_bit_data, CLKF_SW_SUP, 
>>> "gmac_main_clk" },
>>
>> I think the gmac clk path is still somehow wrong after this change. 
>> This only fixes it partially imo.
>>
>> Looking at TRM, gmac_main_clk is fed from dpll_gmac_x2_h12, 
> 
> No, it seems not.
> DPLL_GMAC.CLKOUT_M2 -> GMAC_250M_CLK -> 1/2 -> GMAC_MAIN_CLK

Hmm ok, yeah looking at the GMAC IP details shows how it actually goes, 
I got confused with the clkdm mapping in 3.6.3.12.1. So no DT changes 
needed after all and this patch alone is fine.

-Tero

> 
> http://www.ti.com/lit/ug/sprui30f/sprui30f.pdf
> 3.6.3.12.1 DPLL_GMAC Overview
> Figure 3-41. CM_CORE_AON Overview (b)
> Figure 24-185. GMAC_SW Integration
> 
> but looking at the existing clock data, gmac_main_clk comes out from 
> dpll_gmac_m2_ck. This potentially applies one extra divider to the path 
> which appears wrong. Can you take a look at fixing the DTS side for this 
> also?
>>
>> -Tero
>> -- 
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
