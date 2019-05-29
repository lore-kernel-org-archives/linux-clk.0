Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849F3C04AB3
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5578521019
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="JaEUta0h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfE2IVu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 04:21:50 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11368 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2IVt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 04:21:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cee411c0000>; Wed, 29 May 2019 01:21:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 01:21:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 01:21:48 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:21:48 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 May 2019 08:21:48 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cee411a0000>; Wed, 29 May 2019 01:21:47 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 0/8] Add EMC scaling support for Tegra210
Date:   Wed, 29 May 2019 16:21:31 +0800
Message-ID: <20190529082139.5581-1-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559118108; bh=XuNQ9UxKIn9U28BU9jOdmmgvQosuL6obR6fs0OHQgc8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=JaEUta0hBxrysDVALtbxkUDF7PypdzoO4E65UJm7VcEk1h4OGOm4dGxvxJQzLjSYs
         6JpcIBTw6fF5GxdB18KLUlO8T4S1Oa5prIXCa6/wcDNE8wT2gzpPyVRw0ri42VSIHr
         8dWPJZjR7qbORlnZw61CnWHHjpri4iI478XlhfseroebGaI8h0sG3JAjeXINwPcg/4
         F/VB9aQIEsnh34a6BP7z1o2BmIJUsiWDAK+PR4pT3YGRBBBSrXo8ejx3xf/LEPd8th
         aihAplo88iuIrbYap9C5cMTwR37imXUyh8wQelM41RebWBNroY2iVLk34j7HQjLYmv
         bOyHTux0bbMOg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series introduces the EMC clock scaling support for Tegra210. The
new version has a significant change, which drops the EMC table bindings
and replaces by memory region node of EMC table.

And most of the comments in V1 have been addressed.
Thanks.

v4:
* make sure the behavior is compatible with the case if the kernel uses
  the older DTB which doesn't have EMC node.
* remove the EMC clock statistic data in EMC debug fs.

Joseph Lo (8):
  dt-bindings: memory: tegra: Add external memory controller binding for
    Tegra210
  clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
  clk: tegra: Export functions for EMC clock scaling
  memory: tegra: Add Tegra210 EMC clock driver
  memory: tegra: Add EMC scaling support code for Tegra210
  memory: tegra: Add EMC scaling sequence code for Tegra210
  clk: tegra: Remove the old emc_mux clock for Tegra210
  arm64: tegra: Add external memory controller node for Tegra210

 .../nvidia,tegra210-emc.txt                   |   55 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   33 +
 drivers/clk/tegra/clk-tegra210.c              |   89 +-
 drivers/memory/tegra/Kconfig                  |   10 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1953 ++++++++++++++++
 drivers/memory/tegra/tegra210-emc.c           | 2041 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc.h           | 1031 +++++++++
 include/dt-bindings/clock/tegra210-car.h      |    4 +-
 include/linux/clk/tegra.h                     |    5 +
 include/soc/tegra/emc.h                       |    2 +
 11 files changed, 5207 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.txt
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h

--=20
2.21.0

