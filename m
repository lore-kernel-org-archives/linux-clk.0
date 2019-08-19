Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5FDC3A5A0
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 21:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18230214DA
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 21:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KmOZKYYg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbfHSVOi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 17:14:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43870 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfHSVOi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 17:14:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JLEY3E099256;
        Mon, 19 Aug 2019 16:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566249274;
        bh=ZEDCStj9+mCpbTi2YVPkhsk4seVcZNfE0oAtQBPCcjA=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=KmOZKYYghfk184CWPMEqY1K+2p/57RDK//vcIT1izUQTg/NgBNzlPlChDM1frwksS
         jsVMItQF5QI13+Z2i7CaGFOE+qzg6cK5pR3jCofI5eEuUhC3AmIz2kaBJECgWG6grO
         RpNjotbdNFLDXewy/sZMGlxfLu/s75l5hvzaT1aw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JLEYFO036943
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 16:14:34 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 16:14:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 16:14:34 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JLEYaH011844;
        Mon, 19 Aug 2019 16:14:34 -0500
Subject: Re: [PATCH 3/3] clk: ti: dra7xx: add timer_sys_ck clock alias
From:   Suman Anna <s-anna@ti.com>
To:     "Kristo, Tero" <t-kristo@ti.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
 <1565183079-27798-4-git-send-email-t-kristo@ti.com>
 <9d0edab4-cae2-50d5-2df9-42c879f2623f@ti.com>
Message-ID: <b1005a98-e098-f651-d70e-c519fd740540@ti.com>
Date:   Mon, 19 Aug 2019 16:14:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9d0edab4-cae2-50d5-2df9-42c879f2623f@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Tero,

On 8/7/19 5:56 PM, Anna, Suman wrote:
> Hi Tero,
> 
> On 8/7/19 8:04 AM, Tero Kristo wrote:
>> This is needed by the TI DM timer driver.
> 
> Again can do with some better patch descriptions. Similar to the
> previous patch, missing the equivalent patches for OMAP4 and OMAP5.
> You can use my downstream patches for these - [1][2][3] that has all the
> needed Fixes by details. Only difference is that you used a single line
> change on DRA7, and this should suffice since all the sources are same,
> but OMAP4 and OMAP5 needed different ones.
> 
> [1] OMAP4:
> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=9d45dc42fbed8395d733366dbf6c0fd5ec171e2f
> [2] OMAP5:
> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=34f4682a91173386307b310d7f4955d46dcaaea2
> [3] DRA7:
> http://git.ti.com/gitweb/?p=rpmsg/remoteproc.git;a=commit;h=2a662694437ae7192b5ef759ec40abe796d2a058
> 
> Technically, this data need to be added back for all OMAP2+ SoCs which
> support dmtimer with any other drivers wanting to use the timers.

So, I checked and these aliases already are defined on OMAP2, OMAP3,
AM33xx, AM43xx, DM814x and DM816x SoCs. So, just include the OMAP4 and
OMAP5 ones along with the DRA7x one.

regards
Suman

> 
> regards
> Suman
> 
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>  drivers/clk/ti/clk-7xx.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
>> index 5208eb8..64507b8 100644
>> --- a/drivers/clk/ti/clk-7xx.c
>> +++ b/drivers/clk/ti/clk-7xx.c
>> @@ -792,6 +792,7 @@
>>  static struct ti_dt_clk dra7xx_clks[] = {
>>  	DT_CLK(NULL, "timer_32k_ck", "sys_32k_ck"),
>>  	DT_CLK(NULL, "sys_clkin_ck", "timer_sys_clk_div"),
>> +	DT_CLK(NULL, "timer_sys_ck", "timer_sys_clk_div"),
>>  	DT_CLK(NULL, "sys_clkin", "sys_clkin1"),
>>  	DT_CLK(NULL, "atl_dpll_clk_mux", "atl-clkctrl:0000:24"),
>>  	DT_CLK(NULL, "atl_gfclk_mux", "atl-clkctrl:0000:26"),
>>
> 

