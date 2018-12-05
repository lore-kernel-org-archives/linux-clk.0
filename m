Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7F3C04EB8
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 03:10:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89BD120661
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 03:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hQPY5Sl+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89BD120661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbeLEDKN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 22:10:13 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5643 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbeLEDKM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 22:10:12 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0741900001>; Tue, 04 Dec 2018 19:10:08 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 19:10:12 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 19:10:12 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 5 Dec
 2018 03:10:10 +0000
Subject: Re: [PATCH 04/19] dt-bindings: cpufreq: tegra124: remove cpu_lp clock
 from required properties
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-5-josephl@nvidia.com>
 <20181204153707.GB26056@pdeschrijver-desktop.Nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <d74b8cf3-a072-a53c-2408-9f479998f5d3@nvidia.com>
Date:   Wed, 5 Dec 2018 11:10:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204153707.GB26056@pdeschrijver-desktop.Nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543979408; bh=wmtGHoWEdfoMfDZp8ejQI+UBVlWOEUBPh9MSn+2yzas=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=hQPY5Sl+O3sBYL+m8UKCcnjXF34mKNFkG48CBmzHInOiA3EBslsHcJp1rInMdCV3p
         md6HFBXPTf50qohxIm4vE/53nTLAwl56ZMg1bpuyxiDM66PpOPPqYXwBAvxLmUOLmt
         vKd43N8mJzXzvqOWGERfBsguezTbCwnE43wtqBpUeQHO1wF6z6NE9p8q+BEUKJP61E
         bnYnUx19FTswuP/QksVpfgLPh8ARq7lpGDHz01GnvuJbmyr3E047sf2/eUCpPEIZS0
         +YuRT1DfdEfueyuqgi5DwbImUp4Z7gPDXjWq6XhWX3Ev5ps2yn9KNDZVK1uZWE+K3U
         DB/TlqIHLO22w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/4/18 11:37 PM, Peter De Schrijver wrote:
> On Tue, Dec 04, 2018 at 05:25:33PM +0800, Joseph Lo wrote:
>> The cpu_lp clock property is only needed when the CPUfreq driver
>> supports CPU cluster switching. But it was not a design for this driver
>> and it didn't handle that as well. So removing this property.
>>
> 
> I would mark it optional. This means current DTs will still be
> technically compatible with this binding doc.

Hi Peter,

There is no compatible issue of this property. Because the driver 
doesn't use this clock at all. Removing this won't cause any 
backward-compatible issue.

Same as previous patch for removing vdd-cpu-supply property once we fix 
that in the driver. The old dt binding still works with the new driver.

> 
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt   | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> index 031545a29caf..03196d5ea515 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> @@ -9,7 +9,6 @@ Required properties:
>>     See ../clocks/clock-bindings.txt for details.
>>   - clock-names: Must include the following entries:
>>     - cpu_g: Clock mux for the fast CPU cluster.
>> -  - cpu_lp: Clock mux for the low-power CPU cluster.
>>     - pll_x: Fast PLL clocksource.
>>     - pll_p: Auxiliary PLL used during fast PLL rate changes.
>>     - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
>> @@ -30,11 +29,10 @@ cpus {
>>   		reg = <0>;
>>   
>>   		clocks = <&tegra_car TEGRA124_CLK_CCLK_G>,
>> -			 <&tegra_car TEGRA124_CLK_CCLK_LP>,
>>   			 <&tegra_car TEGRA124_CLK_PLL_X>,
>>   			 <&tegra_car TEGRA124_CLK_PLL_P>,
>>   			 <&dfll>;
>> -		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
>> +		clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
>>   		clock-latency = <300000>;
>>   	};
>>   
>> -- 
>> 2.19.2
>>
