Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E858C67839
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 01:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E916A2084E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 01:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="HwS82+Ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E916A2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbeLLBwr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:52:47 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3444 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbeLLBwr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 20:52:47 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1069ea0000>; Tue, 11 Dec 2018 17:52:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Dec 2018 17:52:46 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Dec 2018 17:52:46 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 12 Dec
 2018 01:52:44 +0000
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
To:     Jon Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
 <20181211091514.GA29064@pdeschrijver-desktop.Nvidia.com>
 <7c5f6f34-43ba-e696-5cbc-2bd4d5303d91@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <21664614-c7e6-c17d-21a7-ef445a6de1eb@nvidia.com>
Date:   Wed, 12 Dec 2018 09:52:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <7c5f6f34-43ba-e696-5cbc-2bd4d5303d91@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544579562; bh=QuVz1frbh7xffbuYJ3YRdp6V5gs7sUZi/bLwxCgUdEs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=HwS82+Ii09RlrOKHPjQtsG5NndkL7DO5fqhEzeaJVPFa6ujLWeg4C6rp3c2vFo2P8
         JaTeL7AzdD7BPl0rsHvEDpYDLJclBIF9vTQKKmzjEDjEvFIJAgHCQlGPeNLQjh49HD
         YrD5wcqyLEARCr2HVR7jxaLcgtRtXHxTvbtTbctu2mlUYeD2NHAMU0ubg1SaNeyC+p
         e9I8FTn50V6cPPmrFD7pNddSQqsLKyEQsK5J4eDHLIZiFHS8SZoKyEAKjBnYMfDQeR
         StvQFjRNSU55em34UPlPFY6aAEK/lEsDzp4w2/5qRRWDecwLwj0yhQ/TTalfvzphwV
         kb3qU7Foowmrw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/11/18 7:52 PM, Jon Hunter wrote:
> 
> On 11/12/2018 09:15, Peter De Schrijver wrote:
>> On Fri, Dec 07, 2018 at 01:41:57PM +0000, Jon Hunter wrote:
>>>
>>> On 04/12/2018 09:25, Joseph Lo wrote:
>>>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>>>
>>>> Add new properties to configure the DFLL PWM regulator support. Also
>>>> add an example and make the I2C clock only required when I2C support is
>>>> used.
>>>>
>>>> Cc: devicetree@vger.kernel.org
>>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> ---
>>>>   .../bindings/clock/nvidia,tegra124-dfll.txt   | 73 ++++++++++++++++++-
>>>>   1 file changed, 71 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>>> index dff236f524a7..8c97600d2bad 100644
>>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>>>>   oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>>>>   control module that will automatically adjust the VDD_CPU voltage by
>>>>   communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
>>>> -Currently only the I2C mode is supported by these bindings.
>>>>   
>>>>   Required properties:
>>>>   - compatible : should be "nvidia,tegra124-dfll"
>>>> @@ -45,10 +44,28 @@ Required properties for the control loop parameters:
>>>>   Optional properties for the control loop parameters:
>>>>   - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>>>>   
>>>> +Optional properties for mode selection:
>>>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>>>> +
>>>>   Required properties for I2C mode:
>>>>   - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>>>>   
>>>> -Example:
>>>> +Required properties for PWM mode:
>>>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
>>>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control is disabled.
>>>
>>> Maybe consider 'pwm-inactive-voltage-microvolt'.
>>>
>>
>> Inactive is not very accurate. The OVR regulator will output
>> nvidia,align-offset-uv when the PWM input is driven low but will output
>> nvidia,init-uv when the PWM input is in tristate mode.
> 
> Maybe but I really don't find 'nvidia,align-offset-uv' and
> 'nvidia,init-uv' very descriptive either. We need to make sure that the
> names and description make it clear what these are and where they come
> from to anyone reading that documentation that has never laid eyes on
> this before.
> 
> Sounds like the align-offset-uv is the minimum voltage when PWM is
> active/enabled and init-uv is the default voltage the regulator outputs
> when PWM control is disabled. Would the following be any better ...
> 
> - nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when
>    PWM control is disabled and the PWM output is tristated. Note that
>    this voltage is configured in hardware, typically via a resistor
>    divider.
> - nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM
>    control is enabled and PWM output is low. Hence, this is the minimum
>    output voltage that the regulator supports when PWM control is
>    enabled.

Thanks, Jon and Peter.

That's more clear indeed. In the discussion, that also comes up with one 
more reason that we shouldn't handle vdd-cpu rail with regulator API in 
cpufreq driver that showed in other patches in this patchset. With 
PWM-based vdd-cpu regulator, we are not able to control the output in 
software.
