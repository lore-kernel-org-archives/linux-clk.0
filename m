Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB2BC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C88BA20851
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 09:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="MWmWUeLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88BA20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbeLDJ0i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 04:26:38 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19013 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbeLDJ0i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 04:26:38 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c06484d0000>; Tue, 04 Dec 2018 01:26:37 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Dec 2018 01:26:37 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Dec 2018 01:26:37 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:37 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 4 Dec
 2018 09:26:37 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Dec 2018 09:26:37 +0000
Received: from josephl-linux.nvidia.com (Not Verified[10.19.108.132]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5c06484b0003>; Tue, 04 Dec 2018 01:26:37 -0800
From:   Joseph Lo <josephl@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Joseph Lo <josephl@nvidia.com>, <devicetree@vger.kernel.org>
Subject: [PATCH 03/19] dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required properties
Date:   Tue, 4 Dec 2018 17:25:32 +0800
Message-ID: <20181204092548.3038-4-josephl@nvidia.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1543915597; bh=oFIUZWNHCCdRz1ARKQmaqsrWbGyaFWNHECgg1sdJOzw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=MWmWUeLMSozARm1Uh/eFiwrEKCMONzIJLK4HVQPoWo8ObYJR4js9otJVfrUz34MWk
         gXggvN8v17DrI+OerRoh1grI8vEoRAPsId5TFJz5m/lyIxa8vTLRGqX4PeNsdduojZ
         oRMvc8u8/JG/vKxP6iasl7g+A8YWm91+Z2ubMqyY4GEHQh9X38FbhHEPuYkAiE/l6M
         d5bKVHxBhMXMfV8lp9q7l43hAzQzjU1FF//jNy44b5xxcSrf2khjHIEfKtPapBNbh5
         sj4K+5lMFWqcsH9fk2ZjhQOg7N2mXVQseNGpOLlYa1zT07gJnvAQv0pPnsOiyEndMz
         +QgEk0QN+gAOQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Tegra124 cpufreq driver works only with DFLL clock, which is a
hardware-based frequency/voltage controller. The driver doesn't need to
control the regulator itself. Hence remove that.

Cc: devicetree@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpuf=
req.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq=
.txt
index b1669fbfb740..031545a29caf 100644
--- a/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
+++ b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
@@ -13,7 +13,6 @@ Required properties:
   - pll_x: Fast PLL clocksource.
   - pll_p: Auxiliary PLL used during fast PLL rate changes.
   - dfll: Fast DFLL clocksource that also automatically scales CPU voltage=
.
-- vdd-cpu-supply: Regulator for CPU voltage
=20
 Optional properties:
 - clock-latency: Specify the possible maximum transition latency for clock=
,
@@ -37,7 +36,6 @@ cpus {
 			 <&dfll>;
 		clock-names =3D "cpu_g", "cpu_lp", "pll_x", "pll_p", "dfll";
 		clock-latency =3D <300000>;
-		vdd-cpu-supply: <&vdd_cpu>;
 	};
=20
 	<...>
--=20
2.19.2

