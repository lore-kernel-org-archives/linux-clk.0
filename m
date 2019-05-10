Return-Path: <SRS0=JHcd=TK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07480C04AB3
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 08:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCB52208C3
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 08:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="dOjgA1gN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfEJIrd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 May 2019 04:47:33 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17186 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfEJIrd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 May 2019 04:47:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd53a9f0000>; Fri, 10 May 2019 01:47:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 10 May 2019 01:47:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 10 May 2019 01:47:31 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 08:47:30 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 08:47:28 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 10 May 2019 08:47:28 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd53a9f0001>; Fri, 10 May 2019 01:47:28 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rob Herring" <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 1/8] dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
Date:   Fri, 10 May 2019 16:47:12 +0800
Message-ID: <20190510084719.18902-2-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510084719.18902-1-josephl@nvidia.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557478047; bh=9iUG/igFj5qceBujh09ZJGyixgGlnXxryGM5ehdd2d8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=dOjgA1gNSdtnCfLjfgKSUFvA6+kLkNQRDmpCPBcjt1rX53WsAr9qrowntpaDW7Qpy
         2hgciQsU6ksXKDl1El2WmXMSVMrxs/pCsleHGMplW3FrGGz/8D/FUgjM7ejWz3yhAl
         SzfR2gXHgExrF4jl0yglqnVm1aT5fF59MuKNFhrAoaAdiNnSKe+vRPaYBiUOLrcT1o
         QcqBQ88IBSTY/COqLlaZy27Bs9UP0+pgAbg7/Xu5YMzBzo7pKccXvLbFbFpBau0Uln
         +VUIQy45lKr9Gg58jRw1yJAi2pHzhGq/sibIlI1I+4Fj+t6niacapsPmsRhfM5tb2T
         WwQ5fDCV9cpiw==
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

