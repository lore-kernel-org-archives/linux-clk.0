Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8625DC43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 07:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57BC22085A
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 07:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ZAkcJyRh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbfCYHpt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 03:45:49 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9009 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbfCYHpt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 03:45:49 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c9887280000>; Mon, 25 Mar 2019 00:45:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 25 Mar 2019 00:45:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 25 Mar 2019 00:45:48 -0700
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Mar
 2019 07:45:48 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Mar 2019 07:45:48 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c9887290000>; Mon, 25 Mar 2019 00:45:47 -0700
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 6/8] arm64: tegra: Add external memory controller node for Tegra210
Date:   Mon, 25 Mar 2019 15:45:21 +0800
Message-ID: <20190325074523.26456-7-josephl@nvidia.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1553499944; bh=o0pvGJcXGTHfYZxtTQ8xjq1nY2BEd0cHhCJR+j/R800=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ZAkcJyRhM2BgV7aYZpn3UHk7HAXlFM1jvR7P1ERdpy1bCYhMowFrbWNHp5huc1OOp
         BZpVNgSCw+xC2uHAge3QbgRWQhMkfUW1c/k2USKOBX/f/ECqyZ+t+It+YwBNy251fq
         9w2iZ7oT9aKzinwN73vcyrrHQpahPNPm1FbZ0ofpVIC6yumPVAnqt+f4uiq/I5VtxO
         6zhoYz+Rme83kHgL/tqEZtw+z1Tn90Dv65OGNitOWSXKsLDfCNg5qbMWkGdxHMWxwW
         8voxBLbGdqaX1lRPzNbOlVgY8biuS/gqUJdRIteOArulq3sJQhnP8i6sNBC9MMUlXy
         /MlOlr1B3ABrw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add external memory controller (EMC) node for Tegra210

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index bc71ef8f9a09..f9c01de2843e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -872,6 +872,29 @@
 		#iommu-cells =3D <1>;
 	};
=20
+	external-memory-controller@7001b000 {
+		compatible =3D "nvidia,tegra21-emc", "nvidia,tegra210-emc";
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
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		nvidia,memory-controller =3D <&mc>;
+		nvidia,use-ram-code;
+	};
+
 	sata@70020000 {
 		compatible =3D "nvidia,tegra210-ahci";
 		reg =3D <0x0 0x70027000 0x0 0x2000>, /* AHCI */
--=20
2.21.0

