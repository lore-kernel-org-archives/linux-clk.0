Return-Path: <SRS0=JHcd=TK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DD9C04AB4
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 08:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D82F208C3
	for <linux-clk@archiver.kernel.org>; Fri, 10 May 2019 08:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fbamIRI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfEJIrt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 May 2019 04:47:49 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15346 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfEJIrs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 May 2019 04:47:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd53abb0000>; Fri, 10 May 2019 01:47:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 10 May 2019 01:47:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 10 May 2019 01:47:47 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 08:47:47 +0000
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 08:47:46 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 10 May 2019 08:47:45 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd53ab10000>; Fri, 10 May 2019 01:47:46 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rob Herring" <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 8/8] arm64: tegra: Add external memory controller node for Tegra210
Date:   Fri, 10 May 2019 16:47:19 +0800
Message-ID: <20190510084719.18902-9-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510084719.18902-1-josephl@nvidia.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557478075; bh=eocGPlqW+n1IdvKSZMOFfDJJu3SXC+PU2zMU4nhYUVg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=fbamIRI/C594aLZxXFlIXqZwxfP2Xs7FkoUHrb06TIumF8oZN/F71D+Ph8w3xlYmO
         zWI87h8fzqsFxLLbnJsKujjzYkayOIEK6BurFy43vlM9TofjCrXkkY042XgPFu7e8n
         PJ/6A9UvePAhG7OEnE2qSwG7f031Ul+alPjbRyjuUwG51Nw5Yn/z/GQyCbh9oYhbtZ
         qmSjqtWO35r7k+sOXK+ASKB5GEk5BN747gwmujASQdqpyZp3GSGT22WItjAi7gdnUU
         maTuDTiF1u1zHO39g4R4GlITllvhh/zK53XMQJTC/RYGUSHnETDyFPiDWg5kf/h9AE
         zPluINnpkiaKg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add external memory controller (EMC) node for Tegra210

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index bc71ef8f9a09..b9ccfee39ed2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -872,6 +872,27 @@
 		#iommu-cells =3D <1>;
 	};
=20
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
+
 	sata@70020000 {
 		compatible =3D "nvidia,tegra210-ahci";
 		reg =3D <0x0 0x70027000 0x0 0x2000>, /* AHCI */
@@ -1431,6 +1452,18 @@
 		};
 	};
=20
+	reserved-memory {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		emc_table: emc-table@8be00000 {
+			compatible =3D "nvidia,tegra210-emc-table";
+			reg =3D <0x0 0x8be00000 0x0 0x10000>;
+			status =3D "disabled";
+		};
+	};
+
 	timer {
 		compatible =3D "arm,armv8-timer";
 		interrupts =3D <GIC_PPI 13
--=20
2.21.0

