Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F53BC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE5FF20449
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 03:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="hlUfiwDT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfADDHU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jan 2019 22:07:20 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12299 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfADDHU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Jan 2019 22:07:20 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c2ecdd20001>; Thu, 03 Jan 2019 19:06:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 03 Jan 2019 19:07:19 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 03 Jan 2019 19:07:19 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 4 Jan
 2019 03:07:19 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 4 Jan 2019 03:07:18 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c2ecde50001>; Thu, 03 Jan 2019 19:07:18 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>, <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V4 04/20] dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required properties
Date:   Fri, 4 Jan 2019 11:06:46 +0800
Message-ID: <20190104030702.8684-5-josephl@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546571218; bh=SvIHVbaogXBgdHGJvd7NksiOw6nrXhn7eNnuGEHoU90=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=hlUfiwDT9F2o6Yep7Q55KLkE+gqB08qpwqE7RmoLEUsfMSVxXmdeN+gis/fryaRVL
         UVry5J3d5M9ULV0Hijqxdqws6mTgayBdnow9hlq6zikQ4qaMTxW2UfPvgNYwRapiP0
         wmQPigZpSiOwqBYOdrPKZPlxZWn7Nn/tTHp6JHeeKtpjc86Rem5MlOQ2hOkDtFaApY
         N/LbcpjBqUC9Rgz+w3YUwRHcpI1YX1L9/Io+MJuggdiweWFADOf5m3BVIiWSbTh+wK
         KnLJLYxYRrANZRjE5zJuFwrkp4rcJdeOqqUMTalSX9/x8MtMckEoBt18hgdsUn3arQ
         z794DpIaF3JQw==
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
*V4:
 - add RB tag
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

