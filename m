Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62F2C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D896217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="e4UHor/X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbeLRJNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:13:25 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14293 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbeLRJNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:13:25 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba2f0000>; Tue, 18 Dec 2018 01:13:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:13:24 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Dec 2018 01:13:24 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:24 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:24 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:13:24 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba320003>; Tue, 18 Dec 2018 01:13:23 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 17/20] arm64: dts: tegra210-p2371-2180: enable DFLL clock
Date:   Tue, 18 Dec 2018 17:12:29 +0800
Message-ID: <20181218091232.23532-18-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124399; bh=TRrB/5yDjmFkodAr3jKXV8G6KUGVr/8Xkgu7egYULn8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=e4UHor/XALzLPaPQ+45JJ+Xjt0Q58lLKmL2m9kI2YjRoGvmC+5XpPRGU1k5DpLgyk
         ispo3vkCVFVJXKtjwxBsp8P62VfYxPqskftXZT889CctGN3bUMHdLVHCqVxuCxP5sF
         iQdnYXI5D7LwEAiR09fwmBXVgnZo+0WLff/VhPfx3clLpOx2itspN/PTVBVmra3NbK
         xL/3f7saVjCSqMOfkW/IDIPvfVWV7iveU99p4PsmmAMq/hmB8fxgA4puPV/zsnbPHH
         jSjn+vodCMJVqIlRc+Woyv+r3g5yaUD4F9RzDDBxk+9Umm6WqpGN1ZCAhNjQSPJGYc
         dOs51/8voEuZQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DFLL clock for Jetson TX1 platform.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - add ack tag
*V2:
 - remove non exist DT bindings
 - update the PWM DT bindings accordingly
---
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2371-2180.dts
index 37e3c46e753f..99c016bfc601 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -78,4 +78,25 @@
 			};
 		};
 	};
+
+	clock@70110000 {
+		status =3D "okay";
+
+		nvidia,cf =3D <6>;
+		nvidia,ci =3D <0>;
+		nvidia,cg =3D <2>;
+		nvidia,droop-ctrl =3D <0x00000f00>;
+		nvidia,force-mode =3D <1>;
+		nvidia,sample-rate =3D <25000>;
+
+		nvidia,pwm-min-microvolts =3D <708000>;
+		nvidia,pwm-period =3D <2500>; /* 2.5us */
+		nvidia,pwm-to-pmic;
+		nvidia,pwm-tristate-microvolts =3D <1000000>;
+		nvidia,pwm-voltage-step-microvolts =3D <19200>;
+
+		pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";
+		pinctrl-0 =3D <&dvfs_pwm_active_state>;
+		pinctrl-1 =3D <&dvfs_pwm_inactive_state>;
+	};
 };
--=20
2.20.1

