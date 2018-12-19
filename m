Return-Path: <SRS0=x0k0=O4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD09C43387
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 07:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBCA821852
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 07:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="EYcH0TY0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbeLSHEy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Dec 2018 02:04:54 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16653 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbeLSHEy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Dec 2018 02:04:54 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c19ed8f0001>; Tue, 18 Dec 2018 23:04:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 23:04:53 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Dec 2018 23:04:53 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 19 Dec
 2018 07:04:51 +0000
Subject: Re: [PATCH V3 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
To:     Rob Herring <robh@kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-2-josephl@nvidia.com> <20181218151934.GA10127@bogus>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <4e0cc6a8-02cf-0590-ec5c-d11412168219@nvidia.com>
Date:   Wed, 19 Dec 2018 15:04:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181218151934.GA10127@bogus>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545203087; bh=cWoDzzVYbK7Bxzk9vTyXbNk9Kw09tJ2FboKToDJwv2Y=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=EYcH0TY0nqrEqFCI43aKPVB+juslqE7r9k+8Z5oJ6LhJKh+xcIfO+Erl2hBXF3ywS
         lnltS3q6/qFXl4+UXAik8WjHyd36jpVXjpiDcP6aN9xCxGRbHZ8LOZ1mf1BLuDxDo4
         ME63+VJGhzNcCXQJ8CCiYVEVAEqqHvOTrfk8BR4EY4htRr8yYKFbOEtTYxlCnuaBN3
         OxP/Ju5A9sXLSHcfd/SEkKyTVLZH/POo+eXKQHqBKGS3tN1uXq8tFq8UiSOCDzVEQp
         ARbEBj9X4LcnRKvvj0EkaWMTmf2OBUbVfmo5AqeND+FcmEwA789KcoI6HFeWJCbAbb
         KMAEcg/zOKKiw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/18/18 11:19 PM, Rob Herring wrote:
> On Tue, Dec 18, 2018 at 05:12:13PM +0800, Joseph Lo wrote:
>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>
>> Add new properties to configure the DFLL PWM regulator support.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> *V3:
>>   - no change
>> *V2:
>>   - update the binding strings and descriptions for
>>   nvidia,pwm-tristate-microvolts
>>   nvidia,pwm-min-microvolts
>>   nvidia,pwm-voltage-step-microvolts
>> ---
>>   .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
>>   1 file changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>> index dff236f524a7..38e8cc8c70a8 100644
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
>> @@ -45,10 +44,31 @@ Required properties for the control loop parameters:
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
> 
> Needs unit suffix.
> 

Hi Rob,

Thanks for reviewing these DT binding patches, will fix it.

Joseph
