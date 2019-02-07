Return-Path: <SRS0=APof=QO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F21C282C2
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 09:00:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B15DA218B0
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 09:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E2SZTPx/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfBGJAV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Feb 2019 04:00:21 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37406 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfBGJAU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Feb 2019 04:00:20 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x17909N7064509;
        Thu, 7 Feb 2019 03:00:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1549530009;
        bh=kbe4CEQgtDkF7N6OJLnSI5lU9ue/nEXutdaEd7XiHWk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=E2SZTPx/o+cU5q0LVcj9Bc4IBDI3VNDUYTxD75JLRR3AHsvTjNt/KestehB3Ye3Q2
         tAq2tj9sAsfpPXDYhEBj7qjzN1Kk/kTs2TArVFjfBo2JFA5nUV05AEYy7UZETXg1mZ
         LreKiwPMwHEAKgfMPpV+hm8yHYBysTSM4kEVxTtM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x17909el106679
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Feb 2019 03:00:09 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Thu, 7
 Feb 2019 03:00:07 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Thu, 7 Feb 2019 03:00:07 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x17902FY003375;
        Thu, 7 Feb 2019 03:00:03 -0600
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for
 parsing clock info from DT
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-2-git-send-email-t-kristo@ti.com>
 <20190121210449.GB7851@bogus> <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com>
 <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
 <154947523891.74891.8214442349263473281@swboyd.mtv.corp.google.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <2a22b7f4-8ac4-184e-6c69-f324488614ee@ti.com>
Date:   Thu, 7 Feb 2019 10:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <154947523891.74891.8214442349263473281@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/02/2019 19:47, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-02-05 00:25:40)
>> On 22/01/2019 09:33, Tero Kristo wrote:
>>> On 21/01/2019 23:04, Rob Herring wrote:
>>>> At first, I thought this was an either/or thing. Use firmware or use DT,
>>>> but it is really only get the clocks used in the DT from firmware.
>>>>
>>>> Why wouldn't you just always do that? I can think of 3 cases:
>>>> reparenting, debug and overlays. This breaks reparenting and overlays,
>>>> right? Debug could be handled with some userspace trigger to get all the
>>>> clocks.
>>>
>>> Re-parenting this does not break, as the scan still checks every
>>> possible parent of a clock scanned. Overlays are broken for sure, as we
>>> don't know which overlays we would be applying, and what clocks would be
>>> in them. Debug is kind of broken as we only scan a small portion of the
>>> clocks.
>>>
>>>>
>>>> Why scan any of the clocks up front? Why not just create the clocks on
>>>> demand? If an unknown clock id is requested, then create the clock and
>>>> query the firmware at that point. That would avoid the DT scan too.
>>>> Maybe there's some issues in the clk framework preventing that, but
>>>> that's not really a DT problem.
>>>
>>> The very initial version I did a couple of years back, did scan the
>>> clocks based on need, and registered them dynamically. Stephen shot down
>>> this based on the assessment that there might be locking issues with the
>>> common clock framework with this approach leading into potential
>>> deadlock situations.
> 
> It's an interesting idea to limit the scope of clks that are registered
> to only the leaf and whatever up to the root of the tree is involved in
> the working set of the kernel.
> 
>>
>> So Rob, what is the final call on this binding? Ack/NAK? If NAK, shall I
>> implement a kernel cmdline param to select the parsing method or what is
>> preferred? Doing it build time with a simple Kconfig seems too limiting.
>>
> 
> Is the problem a performance problem where probing the firmware for all
> the clks is costly and time intensive?

Yes this is pretty expensive, as there can be quite a large amount of 
clocks on a SoC, and each clock must be probed separately.

> So instead of doing that we're
> describing some of the details in DT? Why can't we describe the clk tree
> in C code with some data structure that indicates parent child linkages?
> This is how every other SoC is doing this so far.

We can obviously do that also, however it is "neat" that we can probe 
the available clocks from the device, and don't need to hardcode 
anything kernel side... and neither maintain the clock data. If we want 
to go the hardcoded way, I can create tools to autogenerate the kernel 
side clock data from the clock dump of a running system though, and use 
the built-in clock data if it is available, retaining the existing probe 
method basically for new devices.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
