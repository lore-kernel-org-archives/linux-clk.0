Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBA3C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2431217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="WkYoorHB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbeLRJNX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:13:23 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13129 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbeLRJNX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:13:23 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba2a0000>; Tue, 18 Dec 2018 01:13:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:13:22 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Dec 2018 01:13:22 -0800
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:22 +0000
Received: from HQMAIL103.nvidia.com (172.20.187.11) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:13:21 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:13:21 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba300000>; Tue, 18 Dec 2018 01:13:21 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V3 16/20] arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
Date:   Tue, 18 Dec 2018 17:12:28 +0800
Message-ID: <20181218091232.23532-17-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124394; bh=szLdxrv4BLINqeEVR7DXGll16Bew+UCxZyKAvX8uqq4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=WkYoorHBjZicJHd1isYVolC+aWWWuaF6wJTWrBOhMRQGvjcVm/S+F1hAywRMSqoZM
         NurB6rHBDgWYUtU0TRP0DQzTHAahr8j9/FmsyfK2Qs6/B5sHUFuUCMxwoWWENw+K3/
         ul+B4ebMpsAQYjn5i8lRA4jnktBm4bRaruSTR+uTl+KCq3v1veCyOriFG+F8SrAeky
         jDgYUkikoqjgjABHxWk1OggJRj9bmWMahbvc4HAvCvzw+XWOwCaMWkTdJXt/lWED62
         tvygLam1yuelu+0gCtEnHm7DC2O6LkAMW2pkf8+XQP8HW8TmnRyz35bNKVrhOVlacu
         qMrsDxrdQLfSQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add pinmux for PWM-based DFLL support.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - no change
*V2:
 - add ack tag
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210-p2597.dtsi
index a96e6ee70c21..0ee25a5188f8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1278,6 +1278,20 @@
 				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
 			};
 		};
+
+		dvfs_pwm_active_state: dvfs_pwm_active {
+			dvfs_pwm_pbb1 {
+				nvidia,pins =3D "dvfs_pwm_pbb1";
+				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
+			};
+		};
+
+		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
+			dvfs_pwm_pbb1 {
+				nvidia,pins =3D "dvfs_pwm_pbb1";
+				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
+			};
+		};
 	};
=20
 	pwm@7000a000 {
--=20
2.20.1

