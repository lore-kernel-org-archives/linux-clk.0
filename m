Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6DDC04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A20E1214C1
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="E3eOWFJZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A20E1214C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbeLDJ1L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:27:11 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4082 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbeLDJ1L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:27:11 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0648700000>; Tue, 04 Dec 2018 01:27:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:27:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Dec 2018 01:27:10 -0800
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:27:10 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:27:09 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:27:09 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c06486c0006>; Tue, 04 Dec 2018 01:27:09 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 15/19] arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
Date:   Tue, 4 Dec 2018 17:25:44 +0800
Message-ID: <20181204092548.3038-16-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915632; bh=KepNCfBPnU5ZiDktGsOR/RVGKY4GGdZXvAy6lpDbQD8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=E3eOWFJZmHZdp7ey5fZUjE1Nan/iEBxbslX8eJOjM0ApjRc9BbGNSwSfeRUMaNH1q
         NAzlAWiOq7zlGVxhq2QeZ2p3Wo3+ngASL5B0kxmws53LgHUfhu4c7NKxucRJyddcS7
         cYOOZl2L3/iDle5fCbTfxPSod/aAeZxvIACHp8K3arMecnl5v6JrxU8/ltBe0+8Lhw
         339iAnTnc9vconf4G3AxHLNpvEzasR4pLfZDqz/UDdkBQwzI3GPZ9fTrxM/VytSCr6
         Oyu16fnvdn7uIX6U/fxdF/5VEeDTichieLudBXWVlVHOfKpKwBywTQu7h7W0kTsy0L
         u9Beqk4dMzP2g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add pinmux for PWM-based DFLL support.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210-p2597.dtsi
index 365726ddd418..db5dc0ad466d 100644
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
2.19.2

