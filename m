Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBEDC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3763C20449
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="n2ugFpa3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfADDHt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:49 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13622 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfADDHs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:48 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecdf60000>; Thu, 03 Jan 2019 19:07:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:48 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 03 Jan 2019 19:07:48 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:48 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:48 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ece020004>; Thu, 03 Jan 2019 19:07:47 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V4 17/20] arm64: dts: tegra210-p2371-2180: enable DFLL clock
Date:   Fri, 4 Jan 2019 11:06:59 +0800
Message-ID: <20190104030702.8684-18-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571254; bh=SS+1JBbNmA6V5QvHg8vj/XbQReQA1PoZH5b8FqQRsnM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=n2ugFpa3P/EK8eJKSBh6jJ8Jhsshxt9ecG3Cq1KnPXWMcWwC+hzJwP/cL7AGctNdl
         mHXo7PVCRcSSn00B/jpFIrS3EDjBIc84677A5dX1uqs6vO9Ygs9OJL3QOibPlsgGSt
         wKlx0kzZflTFG3EN4MFjJX0zPDZPIsoE6PvwoVz5rN+RxL+DaYX0OriXSTutw0wjeq
         QD3ygSuMjDWi1jJ0GuD50aZF6SysDhTBVDIbp4M9GQc8VkNCtIU5M21rdalgH4h864
         s9aMXzISX/ZMzBh+eegXtXW4AXvjn7MSpRjxO95GblygHTAy2TjImLrXsNAwv0CaAc
         mtQ3e4Ol5aLoQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DFLL clock for Jetson TX1 platform.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V4:
 - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/
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
index 37e3c46e753f..9fad0d27278e 100644
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
+		nvidia,pwm-period-nanoseconds =3D <2500>; /* 2.5us */
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

