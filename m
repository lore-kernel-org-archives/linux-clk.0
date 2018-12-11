Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5F8C07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 08:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 898DD20849
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 08:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Y42FYLST"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 898DD20849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbeLKIwK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 03:52:10 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17695 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbeLKIwJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 03:52:09 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0f7ab50001>; Tue, 11 Dec 2018 00:52:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Dec 2018 00:52:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Dec 2018 00:52:09 -0800
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 08:52:07 +0000
Subject: Re: [PATCH 16/19] arm64: dts: tegra210-p2371-2180: enable DFLL clock
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-17-josephl@nvidia.com>
 <827e05c8-13b9-fb5e-7bca-1a34b81763b1@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <0f424403-50b7-983b-069b-1a7b757bf26a@nvidia.com>
Date:   Tue, 11 Dec 2018 16:52:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <827e05c8-13b9-fb5e-7bca-1a34b81763b1@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544518326; bh=UiRMSJ0A5NA13xkV3lqV0J5+ypmaiKdB3d6d1NsY1Vw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Y42FYLSTAznJ54BX1OhUZq7Nlg+WmRHhoTfww7FLy2CZ4dfPXSDFEW2resqQqXUCW
         fRjkf9Nnm+wDOCYkoVG9/1gMASZiJuco+QpQPXV66xSegKjTmAp+9t2l4m/KtULi51
         AzKj7Gb6M3j6aGzlxfgoe7MeQ2ku0nKQ3011uYmsAhm3bYk0aBG2z1lVOq1YXUNfLc
         gU06gvwNiG3fLFLWH9a2KE6Eie5ctMfCKUNJPt/PsDBC6wVMLXYloZc9pknI0RYjyU
         NgR471t1A7hsiF7Sf6GP6jDJEGy8TfaBDS4f9kfZZe2qYcNsJUZOklQTne4qhAvr7g
         Z/aDBlKqZxOHQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/7/18 10:57 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
>> Enable DFLL clock for Jetson TX1 platform.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../boot/dts/nvidia/tegra210-p2371-2180.dts   | 20 +++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
>> index 37e3c46e753f..53f497c2b3ff 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
>> @@ -78,4 +78,24 @@
>>   			};
>>   		};
>>   	};
>> +
>> +	clock@70110000 {
>> +		status = "okay";
>> +		nvidia,pwm-to-pmic;
>> +		nvidia,init-uv = <1000000>;
>> +		nvidia,align-offset-uv = <708000>;
>> +		nvidia,align-step-uv = <19200>;
>> +		nvidia,sample-rate = <25000>;
>> +		nvidia,droop-ctrl = <0x00000f00>;
>> +		nvidia,force-mode = <1>;
>> +		nvidia,cf = <6>;
>> +		nvidia,ci = <0>;
>> +		nvidia,cg = <2>;
>> +		nvidia,idle-override;
>> +		nvidia,one-shot-calibrate;
> 
> I don't see any Documentation for or usage of the above two properties.

Oops. Good catch. Will remove that.

Thanks.
