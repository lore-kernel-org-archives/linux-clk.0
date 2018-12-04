Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC94AC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7342820851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eZpX26gT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7342820851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbeLDJ0V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:26:21 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4036 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbeLDJ0V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:26:21 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c06483d0000>; Tue, 04 Dec 2018 01:26:21 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:26:19 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Dec 2018 01:26:19 -0800
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:18 +0000
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:17 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:26:17 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c0648380002>; Tue, 04 Dec 2018 01:26:17 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 00/19] Tegra210 DFLL support
Date:   Tue, 4 Dec 2018 17:25:29 +0800
Message-ID: <20181204092548.3038-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915581; bh=iw7o6R2QsC9Vv5L6HskcadQ5q4EzfWpHiVqjAnwAs34=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=eZpX26gTXSOnFG+wXaAvrrvdb05pwz+IrBjb9Bhx6uR4+APQR+blWKeHNh8EInMJF
         hhl4YbbXsQq0dWQFmKkAt8nFfELoJj2/B/R0D7Lpc40mjfmE+BAk4Fx+0ZfyrQHwn0
         9mWyC4zGh7Qqw+SjmdL6kWESfkkZrLnFenJ8ZrxKMFfUNlcp4BxXnxK5kRiRW2VGTk
         pMcEcxtvax6zrqgBdpNP6pq6SFJiwpjG3ewjCKfw9oGhxubQcq/eds3igetIW6XSgz
         PH5lTuzlDh1MTlwCLLHcz/T50FwKWrfB7orXaE7cBuO7zFPRAO3pVd65X4jRHlzr+0
         uBUy32o7DpXLg==
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

The patch 11 and 12 are the Tegra124 cpufreq driver update to make it
work with Tegra210.

The patch 13~18 are the devicetree files update for Tegra210 SoC and
platforms. Two platforms are updated here for different DFLL mode usage.
The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
are verified with this series.

The patch 19 is the patch for enabling the CPU regulator for Smaug
board.

Joseph Lo (16):
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

 .../bindings/clock/nvidia,tegra124-dfll.txt   |  77 ++-
 .../cpufreq/nvidia,tegra124-cpufreq.txt       |   6 +-
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  20 +
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  14 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  31 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  25 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/tegra/Kconfig                     |   5 +
 drivers/clk/tegra/Makefile                    |   2 +-
 drivers/clk/tegra/clk-dfll.c                  | 455 ++++++++++++---
 drivers/clk/tegra/clk-dfll.h                  |   6 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 536 +++++++++++++++++-
 drivers/clk/tegra/cvb.c                       |  12 +-
 drivers/clk/tegra/cvb.h                       |   7 +-
 drivers/cpufreq/Kconfig.arm                   |   2 +-
 drivers/cpufreq/tegra124-cpufreq.c            |  29 +-
 16 files changed, 1095 insertions(+), 133 deletions(-)

--=20
2.19.2

