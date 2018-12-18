Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E6EC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DC10217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="WjPwubY0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbeLRJNT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:13:19 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13125 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbeLRJNT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:13:19 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba250001>; Tue, 18 Dec 2018 01:13:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:13:18 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Dec 2018 01:13:18 -0800
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:17 +0000
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:17 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:13:17 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba2c0000>; Tue, 18 Dec 2018 01:13:17 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 14/20] arm64: dts: tegra210: add DFLL clock
Date:   Tue, 18 Dec 2018 17:12:26 +0800
Message-ID: <20181218091232.23532-15-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124390; bh=X8IM1AVwmLXhNc7N634JKKLIfqcOTCbNoUW3iESapF4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=WjPwubY0wproleXZZgbDpIvASlErvicm7OgW+7oAXW0gh8CflXU7/Jc0PuULSXDOV
         tRMsypNaGpFjE1Gygn3zyTGia9maeA4hsQnAqjAvq50eXZErW52drRjffMwQbT2921
         QW/9SGUikqMjceRqJrxcVa2SOxCv1OA2GKRE1e8fwbSbrcZx847h9EwFB1WoFcrgK/
         HDDa+MzHKHV6gXaR3axORHigaWdoKANz7cpuqii2BCwhdY+HICeZoZ/iikFhDSKisI
         opnOXqQ38qWgZEgqmac7GJk5Lgm8+mnI/MCtkG9S7wDWJmAvw+uMJrZAGLsrsIALnl
         j0pbsTnXCQ93A==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add essential DFLL clock properties for Tegra210.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - no change
*V2:
 - add ack tag
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index 2205d66b0443..a6db62157442 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/memory/tegra210-mc.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+#include <dt-bindings/reset/tegra210-car.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/tegra124-soctherm.h>
=20
@@ -1131,6 +1132,24 @@
 		#nvidia,mipi-calibrate-cells =3D <1>;
 	};
=20
+	dfll: clock@70110000 {
+		compatible =3D "nvidia,tegra210-dfll";
+		reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
+		      <0 0x70110000 0 0x100>, /* I2C output control */
+		      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
+		      <0 0x70110200 0 0x100>; /* Look-up table RAM */
+		interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks =3D <&tegra_car TEGRA210_CLK_DFLL_SOC>,
+			 <&tegra_car TEGRA210_CLK_DFLL_REF>,
+			 <&tegra_car TEGRA210_CLK_I2C5>;
+		clock-names =3D "soc", "ref", "i2c";
+		resets =3D <&tegra_car TEGRA210_RST_DFLL_DVCO>;
+		reset-names =3D "dvco";
+		#clock-cells =3D <0>;
+		clock-output-names =3D "dfllCPU_out";
+		status =3D "disabled";
+	};
+
 	aconnect@702c0000 {
 		compatible =3D "nvidia,tegra210-aconnect";
 		clocks =3D <&tegra_car TEGRA210_CLK_APE>,
--=20
2.20.1

