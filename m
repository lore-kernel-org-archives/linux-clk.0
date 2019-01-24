Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772D5C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 487FE217D4
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aqQVY80A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732196AbfAXTux (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:50:53 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56572 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728243AbfAXTuw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 14:50:52 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0OJomKh064817;
        Thu, 24 Jan 2019 13:50:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1548359448;
        bh=rBNVR6HZYSsfAmqsDI6FSxfgBSk/4QtqmQlIv4klR8o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aqQVY80AQ8SMiJZdTCnyg0VZidhd4T8BueDoB5674u8vvnbeTLTl2GSBADCtI3SWW
         4DS/YCPaJ3eP+6rJyKxSmMxXdQbmEGIUp8Zo3TsGdwpngHq0AjMvv5n5VObkUIuSqX
         kcYD5zgcgORCMobDikjQxqnmPNfI/oT6Y6JBhOBU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0OJomtF028107
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jan 2019 13:50:48 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Thu, 24
 Jan 2019 13:50:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Thu, 24 Jan 2019 13:50:48 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0OJojRS022054;
        Thu, 24 Jan 2019 13:50:46 -0600
Subject: Re: [PATCH v2] clk: ti: Fix error handling in
 ti_clk_parse_divider_data()
To:     Stephen Boyd <sboyd@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20190115194625.GA1074@kadam>
 <154835786296.136743.12154336975596919287@swboyd.mtv.corp.google.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <2d7a3290-44b3-94ad-076e-fda869480edf@ti.com>
Date:   Thu, 24 Jan 2019 21:50:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <154835786296.136743.12154336975596919287@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/01/2019 21:24, Stephen Boyd wrote:
> Quoting Dan Carpenter (2019-01-15 11:46:25)
>> The ti_clk_parse_divider_data() function is only called from
>> _get_div_table_from_setup().  That function doesn't look at the return
>> value but instead looks at the "*table" pointer.  In this case, if the
>> kcalloc() fails then *table is NULL (which means success).  It should
>> instead be an error pointer.
>>
>> The ti_clk_parse_divider_data() function has two callers.  One checks
>> for errors and the other doesn't.  I have fixed it so now both handle
>> errors.
>>
>> Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsing divider data")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
> 
> Applied to clk-fixes
> 
> I'm going to add Tero's ack to this because it isn't really that
> different.
> 

Yeah, thats ok. Thanks Stephen.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
