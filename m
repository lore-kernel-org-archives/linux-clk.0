Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB62AC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 11:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 711A120811
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 11:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="TJycQ+PC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 711A120811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbeLKLwL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 06:52:11 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6930 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbeLKLwK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 06:52:10 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0fa4e50000>; Tue, 11 Dec 2018 03:52:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Dec 2018 03:52:08 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Dec 2018 03:52:08 -0800
Received: from [10.26.11.184] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 11:52:06 +0000
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
 <20181211091514.GA29064@pdeschrijver-desktop.Nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7c5f6f34-43ba-e696-5cbc-2bd4d5303d91@nvidia.com>
Date:   Tue, 11 Dec 2018 11:52:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181211091514.GA29064@pdeschrijver-desktop.Nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544529125; bh=J4GFTOZ3T85OBTR5CzXIBWmKPJ88FmMUMo6SPIrDWpI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=TJycQ+PCQ4n+fPrQAQ3R7WN41K/X3jDSbi+Vu/jaMbRUxyU50IedOUt7s1sWp+KT2
         K8++fYV9ZEC6J2afmad0vlKDzWC7iCgnqdPDsnAxR5CKtsrhC6jH+gsf9HH+xOpEo2
         C2A3ynkxZf48iq3HPQ9lFHDL+AmKpkTepdt2WMEiHknsPX2Z9OiYwNgkWRzzDCHP8k
         0gSG/x3UWRoU+qAUtmqhX0C6wE2oZi5xjbFQpkRTtD844a6WTVYiHXhpI0gJUtl5nE
         DZQ1tE0WzEjVX4BgoXt/aGoGb/HSQJaroJTtLLeFadmAi0cAocbSWJ5m7XLSKpJXDE
         SfSa7qnxWEYcQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 11/12/2018 09:15, Peter De Schrijver wrote:
> On Fri, Dec 07, 2018 at 01:41:57PM +0000, Jon Hunter wrote:
>>
>> On 04/12/2018 09:25, Joseph Lo wrote:
>>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>>
>>> Add new properties to configure the DFLL PWM regulator support. Also
>>> add an example and make the I2C clock only required when I2C support is
>>> used.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 73 ++++++++++++++++++-
>>>  1 file changed, 71 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> index dff236f524a7..8c97600d2bad 100644
>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>>>  oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>>>  control module that will automatically adjust the VDD_CPU voltage by
>>>  communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
>>> -Currently only the I2C mode is supported by these bindings.
>>>  
>>>  Required properties:
>>>  - compatible : should be "nvidia,tegra124-dfll"
>>> @@ -45,10 +44,28 @@ Required properties for the control loop parameters:
>>>  Optional properties for the control loop parameters:
>>>  - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>>>  
>>> +Optional properties for mode selection:
>>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>>> +
>>>  Required properties for I2C mode:
>>>  - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>>>  
>>> -Example:
>>> +Required properties for PWM mode:
>>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
>>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control is disabled.
>>
>> Maybe consider 'pwm-inactive-voltage-microvolt'.
>>
> 
> Inactive is not very accurate. The OVR regulator will output
> nvidia,align-offset-uv when the PWM input is driven low but will output
> nvidia,init-uv when the PWM input is in tristate mode.

Maybe but I really don't find 'nvidia,align-offset-uv' and
'nvidia,init-uv' very descriptive either. We need to make sure that the
names and description make it clear what these are and where they come
from to anyone reading that documentation that has never laid eyes on
this before.

Sounds like the align-offset-uv is the minimum voltage when PWM is
active/enabled and init-uv is the default voltage the regulator outputs
when PWM control is disabled. Would the following be any better ...

- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when
  PWM control is disabled and the PWM output is tristated. Note that
  this voltage is configured in hardware, typically via a resistor
  divider.
- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM
  control is enabled and PWM output is low. Hence, this is the minimum
  output voltage that the regulator supports when PWM control is
  enabled.

Jon

-- 
nvpublic
