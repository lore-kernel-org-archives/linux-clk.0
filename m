Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61758C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30F64217D8
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="NJXbBHeh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbeLRJM6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:12:58 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5640 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbeLRJM5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:12:57 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c18ba130000>; Tue, 18 Dec 2018 01:12:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 01:12:56 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Dec 2018 01:12:56 -0800
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:12:56 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 18 Dec
 2018 09:12:56 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Dec 2018 09:12:56 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c18ba160004>; Tue, 18 Dec 2018 01:12:55 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>, <devicetree@vger.kernel.org>
Subject: [PATCH V3 04/20] dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required properties
Date:   Tue, 18 Dec 2018 17:12:16 +0800
Message-ID: <20181218091232.23532-5-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218091232.23532-1-josephl@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545124371; bh=MGogn6gmC82VxzW8tN2AiGeyYrbzuQHtjEPnjCPReRs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=NJXbBHehspJAW+XoECtVLw/H5J/vHpaq1ytDkB9hRpeI8yL0ZgweqOiFvjG71m7eF
         vNxQLO2BotlrZZadBg4+FvGnZYpyDIVKElfK8CT1qoB17DlNOJ5iOCFx03g+2RoWKr
         lFGjMK7LCvyKmY8sO5mcWEw8WczhFcQKLZmFafed2ZP05qj3VVzzGKIRrtT2OpLaCz
         eGZcOBG6zTxaBCFjNcWmFoCpeovmjr9HVM950uYg9TQp4Nvpoe8T+GgEdGAXsIu4CA
         iaBk/An/yRMsWPD/LnJXtWlMQwQOQTjB/xi/vRrvzxJZzQ8XCQU37nljvUUSVsO8s7
         0GbKL5iXSm42A==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cpu_lp clock property is only needed when the CPUfreq driver
supports CPU cluster switching. But it was not a design for this driver
and it didn't handle that as well. So removing this property.

Cc: devicetree@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V3:
 - no change
*V2:
 - add ack tag
---
 .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpuf=
req.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq=
.txt
index 031545a29caf..03196d5ea515 100644
--- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
+++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
@@ -9,7 +9,6 @@ Required properties:
   See ../clocks/clock-bindings.txt for details.
 - clock-names: Must include the following entries:
   - cpu_g: Clock mux for the fast CPU cluster.
-  - cpu_lp: Clock mux for the low-power CPU cluster.
   - pll_x: Fast PLL clocksource.
   - pll_p: Auxiliary PLL used during fast PLL rate changes.
   - dfll: Fast DFLL clocksource that also automatically scales CPU voltage=
.
@@ -30,11 +29,10 @@ cpus {
 		reg =3D <0>;
=20
 		clocks =3D <&tegra_car TEGRA124_CLK_CCLK_G>,
-			 <&tegra_car TEGRA124_CLK_CCLK_LP>,
 			 <&tegra_car TEGRA124_CLK_PLL_X>,
 			 <&tegra_car TEGRA124_CLK_PLL_P>,
 			 <&dfll>;
-		clock-names =3D "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
+		clock-names =3D "cpu_g", "pll_x", "pll_p", "dfll";
 		clock-latency =3D <300000>;
 	};
=20
--=20
2.20.1

