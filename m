Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE08C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 08:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C2B520818
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 08:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kqQNlbtD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfBEIZy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 03:25:54 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34176 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbfBEIZx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 03:25:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x158PktV054017;
        Tue, 5 Feb 2019 02:25:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1549355146;
        bh=apsimjGOulbG5cd0suNZuc2Hq0fT7VdOYLfT/vjrt5I=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=kqQNlbtDQ8PDzAvccPmevPAHdm5zP9DTZuXq/lG5V2fIZoPoYprpeVHrhMthUSeHX
         zN35Q/rCCXB0BTsPUnR3ZfdxD+eN0WZd7FDEh0+tl9TRyuJ3J0zO24G3xzIdbiUf+8
         r2/PKT3ppC0Fw5HE83U6nK5v0Oyafx4+DKMBgIfY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x158PkuE126744
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Feb 2019 02:25:46 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 5
 Feb 2019 02:25:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 5 Feb 2019 02:25:44 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x158Pf8Z015976;
        Tue, 5 Feb 2019 02:25:42 -0600
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,sci-clk: Add support for
 parsing clock info from DT
From:   Tero Kristo <t-kristo@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-2-git-send-email-t-kristo@ti.com>
 <20190121210449.GB7851@bogus> <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com>
Message-ID: <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
Date:   Tue, 5 Feb 2019 10:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/01/2019 09:33, Tero Kristo wrote:
> On 21/01/2019 23:04, Rob Herring wrote:
>> On Tue, Jan 08, 2019 at 03:30:21PM +0200, Tero Kristo wrote:
>>> By default, the available clock info is queried from firmware, which can
>>> be quite a lengthy operation if there is a very large amount of clocks
>>> available. Add option for parsing the used clocks from DT instead, and
>>> only register these which can improve the boot time of the device quite
>>> a lot.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   Documentation/devicetree/bindings/clock/ti,sci-clk.txt | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt 
>>> b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>>> index 4e59dc6..c757ae1 100644
>>> --- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>>> +++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>>> @@ -18,6 +18,13 @@ Required properties:
>>>     and clocks IDs for 66AK2G SoC are documented at
>>>     http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
>>> +Optional properties:
>>> +-------------------
>>> +- ti,scan-clocks-from-dt: Scan clock tree info from DT. By default,
>>> +  clocks are queried from firmware, which can be rather slow operation,
>>> +  especially if there is a really large number of clocks available out
>>> +  of which only a handful are ever used by kernel.
>>
>> At first, I thought this was an either/or thing. Use firmware or use DT,
>> but it is really only get the clocks used in the DT from firmware.
>>
>> Why wouldn't you just always do that? I can think of 3 cases:
>> reparenting, debug and overlays. This breaks reparenting and overlays,
>> right? Debug could be handled with some userspace trigger to get all the
>> clocks.
> 
> Re-parenting this does not break, as the scan still checks every 
> possible parent of a clock scanned. Overlays are broken for sure, as we 
> don't know which overlays we would be applying, and what clocks would be 
> in them. Debug is kind of broken as we only scan a small portion of the 
> clocks.
> 
>>
>> Why scan any of the clocks up front? Why not just create the clocks on
>> demand? If an unknown clock id is requested, then create the clock and
>> query the firmware at that point. That would avoid the DT scan too.
>> Maybe there's some issues in the clk framework preventing that, but
>> that's not really a DT problem.
> 
> The very initial version I did a couple of years back, did scan the 
> clocks based on need, and registered them dynamically. Stephen shot down 
> this based on the assessment that there might be locking issues with the 
> common clock framework with this approach leading into potential 
> deadlock situations.

So Rob, what is the final call on this binding? Ack/NAK? If NAK, shall I 
implement a kernel cmdline param to select the parsing method or what is 
preferred? Doing it build time with a simple Kconfig seems too limiting.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
