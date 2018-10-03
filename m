Return-Path: <SRS0=W+YX=MP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D72C00449
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 13:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 622952098A
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 13:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N7fGrO2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622952098A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbeJCUGN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Oct 2018 16:06:13 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52652 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbeJCUGN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Oct 2018 16:06:13 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93DHjgl062745;
        Wed, 3 Oct 2018 08:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1538572665;
        bh=OgUx1blo2blSiytzTwGbjymNF3ldeUvQikuWxzGGVT8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=N7fGrO2iaRZefUBwwCt8J8PETJblxSBpfv/UKxNcI5+WLgv/k0CcFi/q67eodL0oC
         IgsaLYTlAuSLi7NCiGLwSqUjcgptFtfZUKMZQUHrMI/WYTuh1Z0qx22EKWvI6PmJS0
         eq1qMRHCVTYwXBAqH0W3xGphX5JlMDFLgc4gEX3I=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93DHjBP018792;
        Wed, 3 Oct 2018 08:17:45 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 3 Oct
 2018 08:17:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 3 Oct 2018 08:17:41 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93DHd3S014316;
        Wed, 3 Oct 2018 08:17:40 -0500
Subject: Re: [PATCH 00/11] clk: ti: clkctrl data split based on clkdm
 boundaries
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <linux-omap@vger.kernel.org>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <20180904153657.GB5662@atomide.com> <20180926191301.GX5662@atomide.com>
 <e4e90740-393f-edaf-947c-aa1010ab79a3@ti.com>
 <20180927144949.GZ5662@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <f56fe50b-e5e4-a59d-b0d5-73dcd171dc1e@ti.com>
Date:   Wed, 3 Oct 2018 16:17:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180927144949.GZ5662@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/09/18 17:49, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [180927 06:35]:
>> On 26/09/18 22:13, Tony Lindgren wrote:
>>> Hi,
>>>
>>> * Tony Lindgren <tony@atomide.com> [180904 15:41]:
>>>> * Tero Kristo <t-kristo@ti.com> [180831 15:11]:
>>>>> Hi,
>>>>>
>>>>> This series splits up the clkctrl data for TI SoCs based on clockdomain
>>>>> boundaries, instead of the current CM boundaries. For rest of the SoCs,
>>>>> the CM boundaries are actually the same as clockdomains, only am3/am4/dra7
>>>>> are mutants.
>>>>>
>>>>> This is done in preparation for better supporting Tony's upcoming
>>>>> interconnect driver data introduction for these SoCs.
>>>>>
>>>>> One thing to note is that we maintain backwards compatibility with this
>>>>> series, the compat data is introduced temporarily for this purpose. The
>>>>> compat data can be ditched after couple of release cycles when nobody
>>>>> needs it anymore.
>>>>>
>>>>> The series can be applied independently, as the compat data support
>>>>> makes care that the switch is only done once DT changes are in place.
>>>>
>>>> When this is ready for merging, can you guys please set up an
>>>> immutable branch against v4.19-rc1 with the drivers/clk changes
>>>> for me to merge in too?
>>>>
>>>> I've tested this on am335x and am437x so far and it works fine
>>>> for me, so for the whole series:
>>>>
>>>> Tested-by: Tony Lindgren <tony@atomide.com>
>>>
>>> Any news on getting this into Linux next and merged? The
>>> immutable is still needed too for the dts changes.
>>>
>>
>> This is currently blocked from my side, as the patch [1] from Johan got in
>> clk-next is conflicting with my series. Asked Stephen for either dropping
>> that patch and letting me pick it up but no response so far.
>>
>> [1] https://lkml.org/lkml/2018/8/22/160
> 
> Hmm well the idea is to not redo branches. So how about
> send Stephen a pull request against Johan's patch commit
> 00a461cc32ec ("clk: ti: fix OF child-node lookup")?
> 
> That is assuming 00a461cc32ec is considered immutable and
> OK to use as a base by Stephen? :)
> 
> And assuming that your pull request gets merged, and we
> all consider that branch immutable too, then I can merge it
> in too for the dts changes. It will bring also Rob's
> clean-up patch 00a461cc32ec ("clk: ti: fix OF child-node
> lookup") too but that's just fine.
> 
> Regards,
> 
> Tony
> 

So, finally queued this up towards 4.20, assuming Stephen accepts it.

The immutable branch I have pushed is available here:

https://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux.git/log/?h=clk-ti-clkctrl-sr

It is also tagged in the pull-req I just sent out.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
