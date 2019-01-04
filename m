Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A412FC43444
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 718DE2070B
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ARFjZD73"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfADDHv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:51 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9133 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfADDHv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:51 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecdfb0000>; Thu, 03 Jan 2019 19:07:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Jan 2019 19:07:50 -0800
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:50 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:50 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ece040005>; Thu, 03 Jan 2019 19:07:49 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 18/20] arm64: dts: tegra210-smaug: add CPU power rail regulator
Date:   Fri, 4 Jan 2019 11:07:00 +0800
Message-ID: <20190104030702.8684-19-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571259; bh=ZV0a7NNaucYPbruJwhxQSiG84s0auIj57IjUVum4l8Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ARFjZD73s+CpSWBBaKbobmZ3tpGt7jvDCkYROowSqEqkQ7Iw1lGv55CzXUj9W5d/D
         Z8NRdNn4iJkzb8f04Ix2gLyOYt3h2xCQSJbdl5X13OYy3xOE2TUIJJeYpgKqiQp6Cf
         vFL3NcLBy90dH/tEoUjPSjpRTGl+f2CaQS5/5e1DTycaUOFi8Hs8pFz8jECLhBP2i2
         9KGSDDj0+cMW2nr+5h7ee9Dlt8pWcPZDV5/V8UYXFpjsqWHLMc/qCGjm9jexFZLWsd
         uZv5IqZdni1b8361vLLu+hNuS4SAlCRMatrqX52jDSOakOwSNj4s/4SndSxCO24DhV
         TWM56K+BZPWLQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add CPU power rail regulator for Smaug board.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V4:
 - no change
*V3:
 - no change
*V2:
 - add ack tag
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boo=
t/dts/nvidia/tegra210-smaug.dts
index 43cae4798870..79cfcd5b7e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1340,6 +1340,25 @@
 		status =3D "okay";
 		clock-frequency =3D <1000000>;
=20
+		max77621_cpu: max77621@1b {
+			compatible =3D "maxim,max77621";
+			reg =3D <0x1b>;
+			interrupt-parent =3D <&gpio>;
+			interrupts =3D <TEGRA_GPIO(Y, 1) IRQ_TYPE_LEVEL_LOW>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-min-microvolt =3D <800000>;
+			regulator-max-microvolt =3D <1231250>;
+			regulator-name =3D "PPVAR_CPU";
+			regulator-ramp-delay =3D <12500>;
+			maxim,dvs-default-state =3D <1>;
+			maxim,enable-active-discharge;
+			maxim,enable-bias-control;
+			maxim,enable-etr;
+			maxim,enable-gpio =3D <&max77620 5 0>;
+			maxim,externally-enable;
+		};
+
 		max77620: max77620@3c {
 			compatible =3D "maxim,max77620";
 			reg =3D <0x3c>;
--=20
2.20.1

