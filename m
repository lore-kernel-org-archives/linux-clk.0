Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E43C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 14:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFE612183F
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 14:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="rD7zS+T4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbfC2OlY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 10:41:24 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15944 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbfC2OlY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 10:41:24 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c9e2e900001>; Fri, 29 Mar 2019 07:41:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 29 Mar 2019 07:41:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 29 Mar 2019 07:41:22 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Fri, 29 Mar 2019 14:41:21 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id B7C0B4293E; Fri, 29 Mar 2019 16:41:19 +0200 (EET)
Date:   Fri, 29 Mar 2019 16:41:19 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Joseph Lo <josephl@nvidia.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/8] Add EMC scaling support for Tegra210
Message-ID: <20190329144119.GB12975@pdeschrijver-desktop.Nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1553870480; bh=VEG825j4ZwqJUhT+L/nbIVf2fJoJHBLpK+x7awJOdiQ=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=rD7zS+T4SF5SAPD3y42h5Oc+c0IQx6FTB4p8rUtU5Xo8FvLAE3QUxYhQeqhIUBiti
         e9UePanvGknGesoR26Bp0HElME6wOH0LnrhwSK4BDGj5v4aj8ajgXq5NRY+LWtzQ0m
         ncqMK3c0tAdXUpJ4Mcv9TJJeIiQMGda0zlGBycSuoKNmmuHPcpj8zERbo2BaFf5MTK
         pwU4wo33c+eQR4BnDzXE22Cbxepqt9Q+mLT7C0kWWqz3f8vC0Sx4WvW/VrPaDMK3mu
         CdZoX40kkRpa9wNCb3y0uBUvcfPpZNeI/+w2whduoAcXQSve1lxvP2/SfLzlmnfdVS
         CbhveBUiqDHRA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Looks ok to me.

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

On Mon, Mar 25, 2019 at 03:45:15PM +0800, Joseph Lo wrote:
> This series introduces the EMC clock scaling support for Tegra210. There
> are three parts of this series.
> 
> i. The DT bindings of the EMC table and how to deal with them.
> To support LPDDR4 DRAM devices, the EMC table with timing data must be
> trained before it can be used. The bootloader firmware will help to do
> that at the early boot stage. And help to merge the trained timing data
> into the DTB that EMC driver in the kernel will use later for EMC clock
> scaling.
> 
> And for backward compatibility to support the upstreaming devices, like
> Jetson TX1 and Shield, the bindings should remain the same. Which means
> we may not able to change the bindings currently.
> 
> ii. The EMC driver will use the trained EMC table with the ram code that
> the platform used to update the EMC registers for clock scaling. And to
> support higher rates (above 800MHz), periodic training is needed. This
> will be done by a timer. And two EMC sources will be used (PLL_M and
> 		PLL_MB) for the rate switching above or equal to 665MHz.
> It will check the current source and switch to another one dynamically.
> 
> iii. The detail sequence for EMC scaling support, this includes how we
> update the table to EMC registers and the periodic training support.
> 
> Here are the details and dependency of these patches.
> Patch 1 is the binding document of the EMC node and table.
> Patch 2 is the clock driver update for EMC scaling support. Need to note
> that with the update of the MC clock, the patch 3 (EMC clock driver) and
> patch 6 (EMC node in DT) will be needed to make MC clock to work
> normally.
> Patch 3 is the EMC clock driver. It can get the trained table from the
> firmware and know the current EMC status, like the rate and source
> clock.
> Patch 4 adds more APIs and support code. Tha will be needed for the EMC
> scaling sequence.
> Patch 5 adds the EMC scaling sequence code. With this, we can support
> EMC clock scaling now.
> Patch 6 introduces the EMC node in DT.
> Patch 7 adds EMC table of ram code 0.
> Patch 8 adds EMC table of ram code 1.
> 
> Joseph Lo (8):
>   dt-bindings: memory: tegra: Add Tegra210 EMC bindings
>   clk: tegra: clock changes for emc scaling support on Tegra210
>   memory: tegra: Add Tegra210 EMC clock driver
>   memory: tegra: add EMC scaling support code for Tegra210
>   memory: tegra: Add EMC scaling sequence code for Tegra210
>   arm64: tegra: Add external memory controller node for Tegra210
>   arm64: tegra: Add EMC table of ram code 0 for Tegra210 Shield platform
>   arm64: tegra: Add EMC table of ram code 1 for Tegra210 Shield platform
> 
>  .../nvidia,tegra210-emc.txt                   |   605 +
>  .../boot/dts/nvidia/tegra210-p2894-emc.dtsi   | 24851 ++++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |     1 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    23 +
>  drivers/clk/tegra/clk-tegra210.c              |   112 +-
>  drivers/memory/tegra/Kconfig                  |    10 +
>  drivers/memory/tegra/Makefile                 |     1 +
>  drivers/memory/tegra/tegra210-dt-parse.c      |   340 +
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c |  1962 ++
>  drivers/memory/tegra/tegra210-emc-reg.h       |  1482 +
>  drivers/memory/tegra/tegra210-emc.c           |  1814 ++
>  include/dt-bindings/clock/tegra210-car.h      |     4 +-
>  include/linux/clk/tegra.h                     |     5 +
>  13 files changed, 31192 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p2894-emc.dtsi
>  create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
>  create mode 100644 drivers/memory/tegra/tegra210-emc.c
> 
> -- 
> 2.21.0
> 
