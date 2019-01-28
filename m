Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CD2C282CA
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 01:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10D1D2147A
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 01:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="gLws/KV6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfA1BnG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jan 2019 20:43:06 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1075 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbfA1BnG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Jan 2019 20:43:06 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c4e5e280000>; Sun, 27 Jan 2019 17:43:04 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 27 Jan 2019 17:43:04 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 27 Jan 2019 17:43:04 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 28 Jan
 2019 01:43:02 +0000
Subject: Re: [PATCH V4 00/20] Tegra210 DFLL support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190125134617.GE22565@ulmo>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <0a7abeee-1b78-4f90-e94f-43c19eddb9b1@nvidia.com>
Date:   Mon, 28 Jan 2019 09:43:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125134617.GE22565@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1548639784; bh=MER8L4bZO1ryLhucayYQC3o/I6GV3uJl+zR6C1sOjOM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=gLws/KV6bRFXuU9y+DlfoytP3bZMC0pSlha4DN3uxMjKFgGxrcASDSNGraMoRpQNj
         FWB8eJdp35wv35UepVKPnZ8inqXskGhrHL6h9Pw/3iyhozKmxfMO46nj5Mpi6t+vsb
         p10WfM4hMeNzLRxnECqckTYLtaDAmJV0DTojijNP/NHTLxj7oKy5KRexKOJu2Ldj0N
         Ews+92yWMx0+nVSFCcpu6ygw2Jyl6u7VbUAadkDWLQtub5b4afLq2of9aGikL583cE
         +uRybYJjVc0dxg2bC9GNhR5IKOGH34RZ/w+KE5HS/Is1nwmgomwAjZXrMOfKClH3e7
         SHzk9qJwitAag==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/25/19 9:46 PM, Thierry Reding wrote:
> On Fri, Jan 04, 2019 at 11:06:42AM +0800, Joseph Lo wrote:
>> This series introduces support for the DFLL as a CPU clock source
>> on Tegra210. As Jetson TX1 uses a PWM controlled regulator IC which
>> is driven directly by the DFLLs PWM output, we also introduce support
>> for PWM regulators next to I2C controlled regulators. The DFLL output
>> frequency is directly controlled by the regulator voltage. The registers
>> for controlling the PWM are part of the DFLL IP block, so there's no
>> separate linux regulator object involved because the regulator IC only
>> supplies the rail powering the CPUs. It doesn't have any other controls.
>>
>> The patch 1~4 are the patches of DT bindings update for DFLL clock and
>> Tegra124 cpufreq, which add PWM and Tegra210 support for DFLL clock and
>> remove deprecate properties for Tegra124 cpufreq bindings.
>>
>> The patch 5~10 are the patches for DFLL clock driver update for PWM-mode
>> DFLL support.
>>
>> The patch 11~13 are the Tegra124 cpufreq driver update to make it
>> work with Tegra210.
>>
>> The patch 14~19 are the devicetree files update for Tegra210 SoC and
>> platforms. Two platforms are updated here for different DFLL mode usage.
>> The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
>> Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
>> are verified with this series.
>>
>> The patch 20 is the patch for enabling the CPU regulator for Smaug
>> board.
>>
>> * Update in V4:
>>   - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/ in patch 1 for
>>   DFLL DT bindings update.
>>   - remove parenthesis in Kconfig of DFLL driver
>>   - add more ack and RB tags
>>
>> * Update in V3:
>>   - Squash patch 9 in previous series into patch 7 (ref. [0])
>>   - minor fixes in patch 6 for geting alignment data
>>   - more variable type fixes in patch 7
>>   - fix the error handling in patch 8
>>   - collect more ack tags
>>
>> * Update in V2:
>>   - Add two patches that suggested from comments in V1. See patch 9 and
>>   14.
>>   - Update DT binding for DFLL-PWM mode in patch 1.
>>   - Update the code for how to get regulator data from DT or regulator
>>   API in patch 6.
>>   - Update to use lut_uv table for LUT lookup in patch 7. That makes the
>>   generic lut table to work with both I2C and PWM mode.
>>   - not allow Tegra124 cpufreq driver to be built as a module and remove
>>   the removal function in patch 12.
>>
>> [0]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=81595
>>
>> Joseph Lo (17):
>>    dt-bindings: clock: tegra124-dfll: add Tegra210 support
>>    dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required
>>      properties
>>    dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required
>>      properties
>>    clk: tegra: dfll: CVB calculation alignment with the regulator
>>    clk: tegra: dfll: support PWM regulator control
>>    clk: tegra: dfll: round down voltages based on alignment
>>    clk: tegra: dfll: add CVB tables for Tegra210
>>    cpufreq: tegra124: do not handle the CPU rail
>>    cpufreq: tegra124: extend to support Tegra210
>>    cpufreq: dt-platdev: add Tegra210 to blacklist
>>    arm64: dts: tegra210: add DFLL clock
>>    arm64: dts: tegra210: add CPU clocks
>>    arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
>>    arm64: dts: tegra210-p2371-2180: enable DFLL clock
>>    arm64: dts: tegra210-smaug: add CPU power rail regulator
>>    arm64: dts: tegra210-smaug: enable DFLL clock
>>    arm64: defconfig: Enable MAX8973 regulator
>>
>> Peter De Schrijver (3):
>>    dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM
>>      regulator
>>    clk: tegra: dfll: registration for multiple SoCs
>>    clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
> 
> Joseph,
> 
> can you detail the dependencies between the various patches. From a
> brief look the CPU frequency driver changes are completely separate
> bits and it should be possible to apply them to the cpufreq tree.
> 
> The clock changes also seem independent of the rest.
> 
> Are there any dependencies at all that we need to be mindful about?
> Or can individual maintainers just pick up the subseries directly?
> 

Yes, no dependence with each other. We can apply them separately.
Please let me know if I need to inform cpufreq or clk maintainer to pick 
them up.

Thanks,
Joseph
