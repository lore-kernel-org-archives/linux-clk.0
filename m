Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CC8C04EBF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 03:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE1FE20661
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 03:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="pbImOOjm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1FE20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbeLEDGD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 22:06:03 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5460 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbeLEDGD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 22:06:03 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0740960002>; Tue, 04 Dec 2018 19:05:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 19:06:02 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 19:06:02 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 5 Dec
 2018 03:06:00 +0000
Subject: Re: [PATCH 03/19] dt-bindings: cpufreq: tegra124: remove
 vdd-cpu-supply from required properties
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-4-josephl@nvidia.com>
 <20181204153600.GA26056@pdeschrijver-desktop.Nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <3a6f4512-db3f-4cba-21da-572edf14c5dc@nvidia.com>
Date:   Wed, 5 Dec 2018 11:05:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204153600.GA26056@pdeschrijver-desktop.Nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543979158; bh=u7qvTh5hLw/pcLQZUU8RdA9Io6oupy5SV9sK1rGzzbU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=pbImOOjmcu/J+mYWbfBjfNjQLWF1acKu79fqFAdigfRyHQ/KgZGCdNlBas6rPfMhy
         lZPXe+FuW7hGZdQtW6CUpizBYJ5mCFyGhrhk923xOMSDWaEO/1IOKBfUVDqHYxIKZC
         P7fiMCEN+N/RWpRn3YSylw2A00t04LCUrybaHIVjKgu9i17CTqhrz/o5atXt9weWIh
         4KprPr9ATJZSUAc+730ImC91EaNyCeGCOmSVJ0lEy8KsuyWAtcg4a7iD6gIAfPqk63
         9SjGuryFTcLHlIr+fDH8zJOEJOM3vHKUx/Ne4wUd1tvRKJB3jqw2sumF2CECFFJ03V
         5kUlJWCI0xZqA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/4/18 11:36 PM, Peter De Schrijver wrote:
> On Tue, Dec 04, 2018 at 05:25:32PM +0800, Joseph Lo wrote:
>> The Tegra124 cpufreq driver works only with DFLL clock, which is a
>> hardware-based frequency/voltage controller. The driver doesn't need to
>> control the regulator itself. Hence remove that.
>>
> 
> I think this is required for DFLL controlled I2C regulators because the
> regulator is queried for voltage selectors and I2C slave ID?
> 

Hi Peter,

Yes, it's required for DFLL-I2C mode and defined in DFLL node. It's not 
needed here in the CPU node for CPU freq driver to handle that. Hence 
remove that.

Thanks,
Joseph


> 
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> index b1669fbfb740..031545a29caf 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> +++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
>> @@ -13,7 +13,6 @@ Required properties:
>>     - pll_x: Fast PLL clocksource.
>>     - pll_p: Auxiliary PLL used during fast PLL rate changes.
>>     - dfll: Fast DFLL clocksource that also automatically scales CPU voltage.
>> -- vdd-cpu-supply: Regulator for CPU voltage
>>   
>>   Optional properties:
>>   - clock-latency: Specify the possible maximum transition latency for clock,
>> @@ -37,7 +36,6 @@ cpus {
>>   			 <&dfll>;
>>   		clock-names = "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
>>   		clock-latency = <300000>;
>> -		vdd-cpu-supply: <&vdd_cpu>;
>>   	};
>>   
>>   	<...>
>> -- 
>> 2.19.2
>>
