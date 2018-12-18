Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428ACC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7C98217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:12:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="M89lcEes"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbeLRJMu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:12:50 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5621 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbeLRJMu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:12:50 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba0a0000>; Tue, 18 Dec 2018 01:12:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:12:48 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Dec 2018 01:12:48 -0800
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:12:47 +0000
Received: from HQMAIL106.nvidia.com (172.18.146.12) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:12:47 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:12:47 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba0d0003>; Tue, 18 Dec 2018 01:12:46 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 00/20] Tegra210 DFLL support
Date:   Tue, 18 Dec 2018 17:12:12 +0800
Message-ID: <20181218091232.23532-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124362; bh=F+i39sUE4r/DvaTzwWKUAgL8b25Tjo6JUT7EZbhyeiA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=M89lcEesTguBIADEHzhF1XszkoFwtoPZuQZJew8gT9CqhEgYIOEF/Ha34mQlfuQ18
         tuCDSm4m0jjTVfBo0zXmHUJdDgRrpe6u7B5LE7rBFxsXyLX/LZm7UcxN2SBf44XQJj
         MQ6tXeeCLO2G57QA6BPgwhjGdsPB/3857zWDsd5RWLFRabxSYM+0B71hch7e3tDxj7
         CVhUMr9Q7NJGXVXPzIDYPxwuynxsXeqNPVnlv/JlsFG1qerZWsU3Q7dFb1A8yLo/e2
         A82P421eXqohNtxbnO8OnLluRBtHfLgB9jB+fb3zzj4IRXlhqu29/IEovJSMswyssC
         hubObYfYtaK1w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series introduces support for the DFLL as a CPU clock source
on Tegra210. As Jetson TX1 uses a PWM controlled regulator IC which
is driven directly by the DFLLs PWM output, we also introduce support
for PWM regulators next to I2C controlled regulators. The DFLL output
frequency is directly controlled by the regulator voltage. The registers
for controlling the PWM are part of the DFLL IP block, so there's no
separate linux regulator object involved because the regulator IC only
supplies the rail powering the CPUs. It doesn't have any other controls.

The patch 1~4 are the patches of DT bindings update for DFLL clock and
Tegra124 cpufreq, which add PWM and Tegra210 support for DFLL clock and
remove deprecate properties for Tegra124 cpufreq bindings.

The patch 5~10 are the patches for DFLL clock driver update for PWM-mode
DFLL support.

The patch 11~13 are the Tegra124 cpufreq driver update to make it
work with Tegra210.

The patch 14~19 are the devicetree files update for Tegra210 SoC and
platforms. Two platforms are updated here for different DFLL mode usage.
The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
are verified with this series.

The patch 20 is the patch for enabling the CPU regulator for Smaug
board.

* Update in V3:
 - Squash patch 9 in previous series into patch 7 (ref. [0])
 - minor fixes in patch 6 for geting alignment data
 - more variable type fixes in patch 7
 - fix the error handling in patch 8
 - collect more ack tags

* Update in V2:
 - Add two patches that suggested from comments in V1. See patch 9 and
 14.
 - Update DT binding for DFLL-PWM mode in patch 1.
 - Update the code for how to get regulator data from DT or regulator
 API in patch 6.
 - Update to use lut_uv table for LUT lookup in patch 7. That makes the
 generic lut table to work with both I2C and PWM mode.
 - not allow Tegra124 cpufreq driver to be built as a module and remove
 the removal function in patch 12.

[0]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D81595

Joseph Lo (17):
  dt-bindings: clock: tegra124-dfll: add Tegra210 support
  dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required
    properties
  dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required
    properties
  clk: tegra: dfll: CVB calculation alignment with the regulator
  clk: tegra: dfll: support PWM regulator control
  clk: tegra: dfll: round down voltages based on alignment
  clk: tegra: dfll: add CVB tables for Tegra210
  cpufreq: tegra124: do not handle the CPU rail
  cpufreq: tegra124: extend to support Tegra210
  cpufreq: dt-platdev: add Tegra210 to blacklist
  arm64: dts: tegra210: add DFLL clock
  arm64: dts: tegra210: add CPU clocks
  arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
  arm64: dts: tegra210-p2371-2180: enable DFLL clock
  arm64: dts: tegra210-smaug: add CPU power rail regulator
  arm64: dts: tegra210-smaug: enable DFLL clock
  arm64: defconfig: Enable MAX8973 regulator

Peter De Schrijver (3):
  dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM
    regulator
  clk: tegra: dfll: registration for multiple SoCs
  clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210

 .../bindings/clock/nvidia,tegra124-dfll.txt   |  83 ++-
 .../cpufreq/nvidia,tegra124-cpufreq.txt       |   6 +-
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  21 +
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  14 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  31 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  25 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/tegra/Kconfig                     |   5 +
 drivers/clk/tegra/Makefile                    |   2 +-
 drivers/clk/tegra/clk-dfll.c                  | 459 +++++++++++++---
 drivers/clk/tegra/clk-dfll.h                  |   6 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 520 +++++++++++++++++-
 drivers/clk/tegra/cvb.c                       |  12 +-
 drivers/clk/tegra/cvb.h                       |   7 +-
 drivers/cpufreq/Kconfig.arm                   |   4 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |   1 +
 drivers/cpufreq/tegra124-cpufreq.c            |  44 +-
 17 files changed, 1093 insertions(+), 148 deletions(-)

--=20
2.20.1

