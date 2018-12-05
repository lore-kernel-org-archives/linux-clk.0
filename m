Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2366AC04EBF
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 06:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D36A420851
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 06:11:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ctQX4J+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36A420851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbeLEGLz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 01:11:55 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3204 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbeLEGLy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Dec 2018 01:11:54 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c076c290000>; Tue, 04 Dec 2018 22:11:53 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 22:11:54 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 22:11:54 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 5 Dec
 2018 06:11:52 +0000
Subject: Re: [PATCH 00/19] Tegra210 DFLL support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204151059.GA23827@ulmo>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <43c59781-3548-b643-3c5e-9d2dcab422f2@nvidia.com>
Date:   Wed, 5 Dec 2018 14:11:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204151059.GA23827@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543990313; bh=cI5viBqZsrU7zAbr6DtN9LDds4rlapK6lKPQaQLP3Iw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ctQX4J+4Lu2o3wEpmTVqvPRES8JSTcr1UOG0mV/wajtSiQuHvykaDnfs05HccUfu/
         Nfe7uvLwMJYcRO3OGI19oyHFdsSfx75kHitl8sbjH4IFsm2wSj9nibvzNgubtr8JoL
         /bZufxCJA6O64mkYIKf5f6DDs1hnZz2U/G+uTMnuuctAzg/gTiox8h4HtNz0adoVhp
         +vmby2zr3kh0vnqqm6DwXXS+bwQlL9mLHpr54sKQ/99x+X9t0wQud/fflWBg5PINwB
         3buGHEGIuBQH6qSekMxAwcrWDIUegkgYt7A4H3GMGh0usc7lnDJqCAu0owLLo7xgnF
         dB6VWqbuawb2A==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 12/4/18 11:10 PM, Thierry Reding wrote:
> On Tue, Dec 04, 2018 at 05:25:29PM +0800, Joseph Lo wrote:
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
>> The patch 11 and 12 are the Tegra124 cpufreq driver update to make it
>> work with Tegra210.
>>
>> The patch 13~18 are the devicetree files update for Tegra210 SoC and
>> platforms. Two platforms are updated here for different DFLL mode usage.
>> The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
>> Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
>> are verified with this series.
>>
>> The patch 19 is the patch for enabling the CPU regulator for Smaug
>> board.
>>
>> Joseph Lo (16):
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
>>
>>   .../bindings/clock/nvidia,tegra124-dfll.txt   |  77 ++-
>>   .../cpufreq/nvidia,tegra124-cpufreq.txt       |   6 +-
>>   .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  20 +
>>   .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  14 +
>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  31 +
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  25 +
>>   arch/arm64/configs/defconfig                  |   1 +
>>   drivers/clk/tegra/Kconfig                     |   5 +
>>   drivers/clk/tegra/Makefile                    |   2 +-
>>   drivers/clk/tegra/clk-dfll.c                  | 455 ++++++++++++---
>>   drivers/clk/tegra/clk-dfll.h                  |   6 +-
>>   drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 536 +++++++++++++++++-
>>   drivers/clk/tegra/cvb.c                       |  12 +-
>>   drivers/clk/tegra/cvb.h                       |   7 +-
>>   drivers/cpufreq/Kconfig.arm                   |   2 +-
>>   drivers/cpufreq/tegra124-cpufreq.c            |  29 +-
>>   16 files changed, 1095 insertions(+), 133 deletions(-)
> 
> Hi Joseph,
> 
> can you highlight the build and runtime dependencies between the various
> patches? For example, can I pick up all the arch/arm64 patches into the
> Tegra tree without breaking anything?
> 

Hi Thierry,

The patches for DFLL clock and dts have build dependency, which means we 
need to follow the patch sequence to apply these patches (They can be 
applied separately.). The runtime dependency depends on two sub-series, 
"DFLL clock + cpufreq" patches and the dts series. We can just apply the 
changes for "arch/arm64" but the functionality needs to wait for another 
sub-series.

Thanks,
Joseph
