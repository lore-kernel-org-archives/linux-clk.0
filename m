Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04309C282CE
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 05:46:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCBD52083E
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 05:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Is1ekP4r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfDHFqM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 01:46:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53480 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfDHFqM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 01:46:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x385k8Bq030954;
        Mon, 8 Apr 2019 00:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554702368;
        bh=2GORcQmLJM/l/RHWZrRv0RxYsofogdymm4iAPh4dk9Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Is1ekP4rAbkezlnYE+FDQ3z5+1tnCLfmY3OxCnUKjJswqMRPy2j1I7JLg/APaUEBI
         E2wk7pjoxzHmd5k8imjzi3h+EiizdB/EVBNlCEc5UVTM+Uok2qtFyz30WF2lWddlwn
         5E/+X0omvmZbZL4ZaBIvw72u+1wYI0LgYllXbdRE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x385k7k1003470
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Apr 2019 00:46:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Apr
 2019 00:46:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Apr 2019 00:46:07 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x385k57j075170;
        Mon, 8 Apr 2019 00:46:05 -0500
Subject: Re: [PATCH 5/6] clk: ti: am33xx: drop idlest polling from gfx clkctrl
 clock
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        Eric Ruei <e-ruei1@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
 <1554365467-1325-6-git-send-email-t-kristo@ti.com>
 <20190404140635.GA49658@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <0b729373-baa1-5258-064e-499b2f9ca807@ti.com>
Date:   Mon, 8 Apr 2019 08:45:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190404140635.GA49658@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/04/2019 17:06, Tony Lindgren wrote:
> Hi,
> 
> * Tero Kristo <t-kristo@ti.com> [190404 08:12]:
>> From: Eric Ruei <e-ruei1@ti.com>
>>
>> The GFX modules on AM33xx SoCs have a hardreset line and are controlled
>> by a GFX reset line. Any clkctrl enable/disable operations cannot be
>> checked for module enabled/disabled status independent of the reset
>> operation, and this causes some unwanted timeouts in the kernel and
>> unbalanced states for the GFX clocks. These details should be handled
>> by the driver integration code itself.
> 
> These last two patches should no longer be needed with ti-sysc.
> Well, at least based on testing with the earlier reset-simple driver
> patch and a test for sgx register access on am335x.
> 
> On init we deassert rstctrl if configured and in reset, then enable
> clocks, and read the module revision. And the module is ready for child
> device driver(s) to probe, and do what they want with the rstctrl via a
> reset driver. If no child device driver(s) are configured, ti-sysc will
> just put the module rstctrl back to reset using reset driver.

Ok good to know, lets drop these patches for now and re-consider once we 
can try out graphics with latest kernel... unfortunately it is not 
available upstream.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
