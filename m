Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CD9C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 294E820851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="L/M/Sj8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294E820851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbeLDJ1N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:27:13 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3734 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbeLDJ1M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:27:12 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c06486f0000>; Tue, 04 Dec 2018 01:27:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:27:12 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 01:27:12 -0800
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:27:11 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:27:11 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c06486e0004>; Tue, 04 Dec 2018 01:27:11 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 16/19] arm64: dts: tegra210-p2371-2180: enable DFLL clock
Date:   Tue, 4 Dec 2018 17:25:45 +0800
Message-ID: <20181204092548.3038-17-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915631; bh=kpTaO/fqNYDNOAC7geVVmnzlQpoAANJs9ytAihdlyS8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=L/M/Sj8ynTEjWxtRYYC+DvSLPLqJIwVBR/+z2+5YgHvDfCie3hWgOP5s9hG9bSAKF
         DMsO1Z/OlMGKiFT0KmdaIyXdDeQd5Oef0UgfT/UVn13djqTfIvgKXRIUbrPEFV4U9o
         YMULr8dWNgvVpj6WP8m5emlQn6mCyg7KTySmVmmfj3XxFWdPMAJob3dBrz4jqI27j8
         L8cTyLoFwwaSgyeSuMpOIi/b1dxJfACPjl/CRwfCFG/iAfUYpJlExn4Xnrtr3TqeLz
         5FT+QafRII6Mfg4Cne34+oc2wldACI4JTZvh5WddXmfnbt4n6nXdZLejOulqGw7tia
         pYnJoak+8bVVA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DFLL clock for Jetson TX1 platform.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2371-2180.dts
index 37e3c46e753f..53f497c2b3ff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -78,4 +78,24 @@
 			};
 		};
 	};
+
+	clock@70110000 {
+		status =3D "okay";
+		nvidia,pwm-to-pmic;
+		nvidia,init-uv =3D <1000000>;
+		nvidia,align-offset-uv =3D <708000>;
+		nvidia,align-step-uv =3D <19200>;
+		nvidia,sample-rate =3D <25000>;
+		nvidia,droop-ctrl =3D <0x00000f00>;
+		nvidia,force-mode =3D <1>;
+		nvidia,cf =3D <6>;
+		nvidia,ci =3D <0>;
+		nvidia,cg =3D <2>;
+		nvidia,idle-override;
+		nvidia,one-shot-calibrate;
+		nvidia,pwm-period =3D <2500>; /* 2.5us */
+		pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";
+		pinctrl-0 =3D <&dvfs_pwm_active_state>;
+		pinctrl-1 =3D <&dvfs_pwm_inactive_state>;
+	};
 };
--=20
2.19.2

