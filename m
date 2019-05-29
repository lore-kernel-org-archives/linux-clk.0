Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87080C04AB3
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 604BC21019
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 08:21:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="GRsZ+TMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfE2IV5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 04:21:57 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2635 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfE2IV4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 04:21:56 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cee41220000>; Wed, 29 May 2019 01:21:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 01:21:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 May 2019 01:21:54 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:21:54 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 May
 2019 08:21:51 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 May 2019 08:21:51 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cee411d0001>; Wed, 29 May 2019 01:21:51 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rob Herring" <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 1/8] dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
Date:   Wed, 29 May 2019 16:21:32 +0800
Message-ID: <20190529082139.5581-2-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529082139.5581-1-josephl@nvidia.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559118114; bh=M6XClSAqRcTCzWoRxr+WNOjVjPa8z/F09Ee0LVJBj0U=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=GRsZ+TMB5XWOYDxwrOS4SFU/6fswClB8p/pGizRrOhyQ/QoaNT9UJ+FJy93WGNtDC
         bTQrc7h0J9sjvmtc5JjTRuI8G18uITVwOe/WLsLqB0pqIY07RcYj7IQPBbiqmVgnYZ
         hB9o+noyPcWj2tZwvQTGQ07VK1Uu19AtrkkBrV146+1JVTiAmRSOTqumnH8hmO6tdO
         b+mgwUShl11pPbh93+W9tUhB0dqeAvHiq9KZV3stDnuIPdtYP19DsRIS+CCdvEfmPj
         P2iRlmLwomRPhvQ8CidQ6+o3eAMikfYdGbH/ME3WOGkegAbVWWDXcPyT9t8+QvM2NQ
         MnWPECuzvDQdA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the binding document for the external memory controller (EMC) which
communicates with external LPDDR4 devices. It includes the bindings of
the EMC node and a sub-node of EMC table which under the reserved memory
node. The EMC table contains the data of the rates that EMC supported.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v4:
- no change
v3:
- drop the bindings of EMC table
- add memory-region and reserved-memory node for EMC table
---
 .../nvidia,tegra210-emc.txt                   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,te=
gra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra210-emc.txt
new file mode 100644
index 000000000000..d65aeef2329c
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-=
emc.txt
@@ -0,0 +1,55 @@
+NVIDIA Tegra210 SoC EMC (external memory controller)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+Device node
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Required properties :
+- compatible : should be "nvidia,tegra210-emc".
+- reg : physical base address and length of the controller's registers.
+- clocks : phandles of the possible source clocks.
+- clock-names : names of the possible source clocks.
+- interrupts : Should contain the EMC general interrupt.
+- memory-region : phandle to the reserved memory (see
+  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt) w=
hich
+  contains a sub-node of EMC table.
+- nvidia,memory-controller : phandle of the memory controller.
+
+Reserved memory node
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Should contain a sub-node of EMC table with required properties:
+- compatible : should be "nvidia,tegra210-emc-table".
+- reg : physical address and length of the location of EMC table.
+
+Example:
+	reserved-memory {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		emc_table: emc-table@8be00000 {
+			compatible =3D "nvidia,tegra210-emc-table";
+			reg =3D <0x0 0x8be00000 0x0 0x10000>;
+			status =3D "okay";
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		compatible =3D "nvidia,tegra210-emc";
+		reg =3D <0x0 0x7001b000 0x0 0x1000>,
+		      <0x0 0x7001e000 0x0 0x1000>,
+		      <0x0 0x7001f000 0x0 0x1000>;
+		clocks =3D <&tegra_car TEGRA210_CLK_EMC>,
+			 <&tegra_car TEGRA210_CLK_PLL_M>,
+			 <&tegra_car TEGRA210_CLK_PLL_C>,
+			 <&tegra_car TEGRA210_CLK_PLL_P>,
+			 <&tegra_car TEGRA210_CLK_CLK_M>,
+			 <&tegra_car TEGRA210_CLK_PLL_M_UD>,
+			 <&tegra_car TEGRA210_CLK_PLL_MB_UD>,
+			 <&tegra_car TEGRA210_CLK_PLL_MB>,
+			 <&tegra_car TEGRA210_CLK_PLL_P_UD>;
+		clock-names =3D "emc", "pll_m", "pll_c", "pll_p", "clk_m",
+			      "pll_m_ud", "pll_mb_ud", "pll_mb", "pll_p_ud";
+		interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		memory-region =3D <&emc_table>;
+		nvidia,memory-controller =3D <&mc>;
+	};
--=20
2.21.0

