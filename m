Return-Path: <SRS0=uxtc=SM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF157C10F0E
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 02:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E1C6206B7
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 02:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="MpD60NwV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfDJCla (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Apr 2019 22:41:30 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13127 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfDJCla (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Apr 2019 22:41:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cad57dd0000>; Tue, 09 Apr 2019 19:41:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Apr 2019 19:41:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Apr 2019 19:41:29 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Apr
 2019 02:41:26 +0000
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Rob Herring <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <5ca06133.1c69fb81.11ebf.91ce@mx.google.com>
 <7d680700-d2f2-7b6c-a8bf-dca6d54dbf2c@nvidia.com>
 <CAL_JsqLL5g7vGNmwcNQw5KBXFP4tE69zGyWd0msP3sexve_sNQ@mail.gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <eec6680d-4d85-ac29-afea-dc64c99c637c@nvidia.com>
Date:   Wed, 10 Apr 2019 10:41:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLL5g7vGNmwcNQw5KBXFP4tE69zGyWd0msP3sexve_sNQ@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554864094; bh=k88UGopJw4/bZvRV7iGLn3ImQi0U9f4cG5kiDw7b2MA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=MpD60NwVgWVGtUhwDKKrScOpoT6Qs6tQ/IFlYf4HZMzLSiLD0HtBd8aEmbokuB5lo
         La3RxCpd7uLrpCiCt/6KkHwHyyLEi0My6ERhCLh74m7wco9SZ+ycnhr5WVFRMnyQBc
         ofTtfzLauXM0/s+uKEbJeUXrJy4dw1gialnpQ8yfjgc+NZSqwPESyYanlu2IafGDxW
         LwYnUYEaLc/kgygHyG61rlKAEWpF7nJJdMiIpkVAm2+nZt3J0xKPCWjb3Sq3aI7UEb
         rQzJ7a6nPrjuQrGbHZncJuTJzOLLcq01xVaZKKX6qIqnpmey1ZhEJD5SRMNpav2NuO
         hmlAOUJGgNxfg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/3/19 12:26 PM, Rob Herring wrote:
> On Mon, Apr 1, 2019 at 2:58 AM Joseph Lo <josephl@nvidia.com> wrote:
>>
>> On 3/31/19 2:41 PM, Rob Herring wrote:
>>> On Mon, Mar 25, 2019 at 03:45:16PM +0800, Joseph Lo wrote:
>>>> Add the binding document for the external memory controller (EMC) which
>>>> communicates with external LPDDR4 devices. It includes the bindings of
>>>> the EMC node and the EMC table of different rates.
>>>>
>>>> To support high rates for LPDDR4, the EMC table must be trained before
>>>> it can be used for runtime clock switching. It has been done by firmware
>>>> and merged to the table that Linux kernel uses. For backward
>>>> compatibility with the devices that had been launched on the market, like
>>>> Shield and Jetson platforms, the bindings in the EMC table should remain
>>>> the same. So the firmware can recognize them and merge the trained EMC
>>>> table for the kernel.
>>
>> Hi Rob,
>>
>> Thanks for reviewing.
>>
>>>
>>> Overall seems pretty bloated. How much of this really varies by board
>>> vs. just being a dump of all the register values to stuff?
>>
>> Most of them are register values. And by different SDRAM devices that
>> could be used on the same platform (use ram code to identify them), the
>> value could be different.
>>
>>>
>>> Primarily, I'm leary of getting a similar binding for every vendor's DDR
>>> setup.
>>>
>>> Some mostly trivial comments follow.
>>
>> Really sorry about that. I understand these basic rules for DT bindings,
>> but the case here is that these un-reviewed bindings have been used in
>> the firmware on the shipped products. To support the same with the
>> upstream kernel and consider the firmware blob may not be updated, we
>> have no choice to just use the same bindings in the upstream kernel.
>>
>> How can we deal with this case?
> 
> Simply, we do not accept bindings as-is. If we did, then there would
> be no point in documenting and reviewing bindings. NVidia chose this
> path and now gets to live with it.

Hi Rob,

Thanks for letting us know the criterion. We will follow up and continue 
the reviewing process of the binding. Please help us to review.

And we will fix the driver and firmware to use the reviewed bindings 
later. Need to settle the binding first.

Thanks,
Joseph

