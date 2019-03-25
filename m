Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C26C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 07:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8E5A2085A
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 07:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="kI3EjYrw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbfCYHpe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 03:45:34 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8980 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729720AbfCYHpe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 03:45:34 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c9887180000>; Mon, 25 Mar 2019 00:45:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 25 Mar 2019 00:45:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 25 Mar 2019 00:45:32 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Mar
 2019 07:45:32 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Mar
 2019 07:45:31 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Mar 2019 07:45:31 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c9887190000>; Mon, 25 Mar 2019 00:45:30 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rob Herring" <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 0/8] Add EMC scaling support for Tegra210
Date:   Mon, 25 Mar 2019 15:45:15 +0800
Message-ID: <20190325074523.26456-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1553499928; bh=eDKfvymPODbXseh5PJR3dt/y5H+YJ7LevxZ5PwjWeIw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=kI3EjYrwZ7Snry7XdeuSTEHoNlcIm7rAvqoaJYJj+s52WHB4cUH8XZ6mshqiX+VZO
         GtroCJxj/1VWFfa9oA0txI1B8EOqCOTi+qKKd+oa+cpYeyty5Ltyu6a0CS7cu9yZVh
         oB9NP/Sf4CrlfEnNuCsmo+Pq3g4tSDS3O1LcRE2c26L0XqmVUuLVrtdsxoR8muEPbq
         h7+hFUDG4lSO5fdw6T6TGQqx9r/W5Jutg376bUrhzFYdELWa5GeIpMEZbfH+3464ti
         YD+rWMnTpOpu9NC0HU+A0dZAyGcrLeiWj7yy9FiQlgkg2qWf86yB+ucQ/cQekPT0Xb
         enPy8gUNyV7sQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series introduces the EMC clock scaling support for Tegra210. There
are three parts of this series.

i. The DT bindings of the EMC table and how to deal with them.
To support LPDDR4 DRAM devices, the EMC table with timing data must be
trained before it can be used. The bootloader firmware will help to do
that at the early boot stage. And help to merge the trained timing data
into the DTB that EMC driver in the kernel will use later for EMC clock
scaling.

And for backward compatibility to support the upstreaming devices, like
Jetson TX1 and Shield, the bindings should remain the same. Which means
we may not able to change the bindings currently.

ii. The EMC driver will use the trained EMC table with the ram code that
the platform used to update the EMC registers for clock scaling. And to
support higher rates (above 800MHz), periodic training is needed. This
will be done by a timer. And two EMC sources will be used (PLL_M and
		PLL_MB) for the rate switching above or equal to 665MHz.
It will check the current source and switch to another one dynamically.

iii. The detail sequence for EMC scaling support, this includes how we
update the table to EMC registers and the periodic training support.

Here are the details and dependency of these patches.
Patch 1 is the binding document of the EMC node and table.
Patch 2 is the clock driver update for EMC scaling support. Need to note
that with the update of the MC clock, the patch 3 (EMC clock driver) and
patch 6 (EMC node in DT) will be needed to make MC clock to work
normally.
Patch 3 is the EMC clock driver. It can get the trained table from the
firmware and know the current EMC status, like the rate and source
clock.
Patch 4 adds more APIs and support code. Tha will be needed for the EMC
scaling sequence.
Patch 5 adds the EMC scaling sequence code. With this, we can support
EMC clock scaling now.
Patch 6 introduces the EMC node in DT.
Patch 7 adds EMC table of ram code 0.
Patch 8 adds EMC table of ram code 1.

Joseph Lo (8):
  dt-bindings: memory: tegra: Add Tegra210 EMC bindings
  clk: tegra: clock changes for emc scaling support on Tegra210
  memory: tegra: Add Tegra210 EMC clock driver
  memory: tegra: add EMC scaling support code for Tegra210
  memory: tegra: Add EMC scaling sequence code for Tegra210
  arm64: tegra: Add external memory controller node for Tegra210
  arm64: tegra: Add EMC table of ram code 0 for Tegra210 Shield platform
  arm64: tegra: Add EMC table of ram code 1 for Tegra210 Shield platform

 .../nvidia,tegra210-emc.txt                   |   605 +
 .../boot/dts/nvidia/tegra210-p2894-emc.dtsi   | 24851 ++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |     1 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    23 +
 drivers/clk/tegra/clk-tegra210.c              |   112 +-
 drivers/memory/tegra/Kconfig                  |    10 +
 drivers/memory/tegra/Makefile                 |     1 +
 drivers/memory/tegra/tegra210-dt-parse.c      |   340 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c |  1962 ++
 drivers/memory/tegra/tegra210-emc-reg.h       |  1482 +
 drivers/memory/tegra/tegra210-emc.c           |  1814 ++
 include/dt-bindings/clock/tegra210-car.h      |     4 +-
 include/linux/clk/tegra.h                     |     5 +
 13 files changed, 31192 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.txt
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p2894-emc.dtsi
 create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
 create mode 100644 drivers/memory/tegra/tegra210-emc.c

--=20
2.21.0

