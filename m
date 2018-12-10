Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCA1C65BAF
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 08:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5E9120855
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 08:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="C8S23qU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E9120855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbeLJItk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 03:49:40 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11245 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbeLJItk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 03:49:40 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0e28a00000>; Mon, 10 Dec 2018 00:49:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Dec 2018 00:49:38 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Dec 2018 00:49:38 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 10 Dec
 2018 08:49:36 +0000
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <46b5eafa-00a0-1d91-1f4d-97ab119fcf21@nvidia.com>
Date:   Mon, 10 Dec 2018 16:49:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544431776; bh=/8es+HqIGumkG4qa5ZQx6dp7cZ/iDs5ea8Yz0Ds/OyY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=C8S23qU2WkmtVSbQohBS/bgTh56uzBbm6TgptIyVMMTTtZpOtF1NRCAW7faojhQKB
         lhRxZtYFo0c1B5ZaNgZXNa/HqE47Jjq2GALYbg0uJ39kHaGsJRYwd9EI1UeM7rmwTN
         xHJhRf5yS7yfAGfOeDtOe048pJVCY2zT8XcqL1mPXtwdgvO7eWBYotmfkfwOfFEprW
         zL8hMaGaejPgj/6Mdkw+MUmIiUV4MxQmE0E5LwXmaYFSTf6ZviizqGqVzTMpGON2Z1
         hRopSxQ+aoTNp1jbL6f+nsOURmnYQNM9opMYNINv8TxsO43HeTnJtTUoOJd0N/SOKP
         37HmNrRrtPI8w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jon,

Thanks for reviewing this series.

On 12/7/18 9:41 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>
>> Add new properties to configure the DFLL PWM regulator support. Also
>> add an example and make the I2C clock only required when I2C support is
>> used.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../bindings/clock/nvidia,tegra124-dfll.txt   | 73 ++++++++++++++++++-
>>   1 file changed, 71 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> index dff236f524a7..8c97600d2bad 100644
>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>>   oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>>   control module that will automatically adjust the VDD_CPU voltage by
>>   communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
>> -Currently only the I2C mode is supported by these bindings.
>>   
>>   Required properties:
>>   - compatible : should be "nvidia,tegra124-dfll"
>> @@ -45,10 +44,28 @@ Required properties for the control loop parameters:
>>   Optional properties for the control loop parameters:
>>   - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>>   
>> +Optional properties for mode selection:
>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>> +
>>   Required properties for I2C mode:
>>   - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>>   
>> -Example:
>> +Required properties for PWM mode:
>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control is disabled.
> 
> Maybe consider 'pwm-inactive-voltage-microvolt'.
Ah, I think I need to refine the description here. It should be 
something like below.
  - nvidia,pwm-init-microvolt : Regulator voltage in micro volts when 
PWM control is initialized

This is the initial voltage that when we just initialize the DFLL 
hardware for PWM output. And before we switch the CPU clock from PLLX to 
DFLL, we will enable DFLL hardware in closed loop mode which will aplly 
the DVFS table that was calculated from CVB table.

The original description maybe make you think that it's the working 
voltage when it's under open-loop mode. But it's not. Sorry.

When we working on open-loop mode which will switch to low voltage range 
which also follows the DVFS table. Not this one.

> 
>> +- nvidia,align-offset-uv: Regulator voltage in micro volts when PWM control is
>> +			  enabled and PWM output is low.
> 
> Would this be considered the minimum pwm active voltage?
This would be used for minimum voltage for LUT table, which is the table 
that PMIC can output. The real minimum voltage in PWM mode still depends 
on the CVB table.

So maybe change this one to 'nvidia,pwm-offset-uv'.

> 
>> +- nvidia,align-step-uv: Voltage increase in micro volts corresponding to a
>> +			1/33th increase in duty cycle. Eg the voltage for 2/33th
>> +			duty cycle would be:
> 
> Maybe consider 'pwm-voltage-step-microvolt'.
Okay.

> 
>> +			nvidia,align-offset-uv + nvidia,align-step-uv * 2.
>> +- pinctrl-0: I/O pad configuration when PWM control is enabled.
>> +- pinctrl-1: I/O pad configuration when PWM control is disabled.
>> +- pinctrl-names: must include the following entries:
>> +  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
>> +  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
> 
> Please see Rob's feedback on the above [0].
Yes, I did refer that comments in this patch. And fixed that in 
description but missed for bindings ...

Thanks,
Joseph

> 
> Cheers
> Jon
> 
> [0] https://lore.kernel.org/patchwork/patch/885328/
> 
