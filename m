Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD8322C73;
	Thu, 26 Mar 2026 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517229; cv=none; b=iNxZJrOVAkcI5Y/pSKHCKGWsl5Z1Y8B8czNPW1lV0xcRGvfQzFl9FJ0UoVpoC/eMNCslnLtWDAIXUzBtAP9nnXJ3T5b8Xt9BBZS+3pxnB6gKT9/qJm9KuqqGod2MLgcri9yZrDPpaKggw2TvLqfIQgmds/6fYVR9VPD+I69oGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517229; c=relaxed/simple;
	bh=YiOpBYpC7zIceCNPlIOnkQdJViqvTrsjnZpf6ZBADj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1LxZ7wc0Vrc9kA8vSHG6XYevMoQLnw6MNMW0dazmIK7cXJsEheFJiXpnlu8c5mQoiVYK63uDA+Jizv1c0ghBXTJeDA4a0xndQtbMrTYx0gGXrGET95KP7PAQhjN1+imdC+O3JpAHnCmhE4ltNNO/JPVFXKy1U17DPE5/NEJL34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 26 Mar
 2026 02:26:07 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, devicetree
	<devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>, Ferass El Hafidi <funderscore@postmarketos.org>
Subject: [PATCH v3 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
Date: Thu, 26 Mar 2026 17:26:44 +0800
Message-ID: <20260326092645.1053261-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)

The mpll3 clock is one parent clock of the sd_emmc and mipi_isp clocks
on the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml
bindings. Add the mpll3 clock source to the T7 peripherals clock
controller input clock list, so that sd_emmc and mipi_isp can use it.

For logical consistency, place the required mpll3 entry before the
optional entry.

This change breaks the ABI, but while the amlogic,t7-peripherals-clkc
bindings have been merged upstream, the corresponding DT has not been
merged yet. Thus, no real users or systems are affected.

Fixes: b4156204e0f5 ("dt-bindings: clock: add Amlogic T7 peripherals clock controller")
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/amlogic,t7-peripherals-clkc.yaml  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
index 55bb73707d58..a4b214a941ea 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
@@ -24,7 +24,7 @@ properties:
     const: 1
 
   clocks:
-    minItems: 14
+    minItems: 15
     items:
       - description: input oscillator
       - description: input sys clk
@@ -40,12 +40,13 @@ properties:
       - description: input gp1 pll
       - description: input mpll1
       - description: input mpll2
+      - description: input mpll3
       - description: external input rmii oscillator (optional)
       - description: input video pll0 (optional)
       - description: external pad input for rtc (optional)
 
   clock-names:
-    minItems: 14
+    minItems: 15
     items:
       - const: xtal
       - const: sys
@@ -61,6 +62,7 @@ properties:
       - const: gp1
       - const: mpll1
       - const: mpll2
+      - const: mpll3
       - const: ext_rmii
       - const: vid_pll0
       - const: ext_rtc
@@ -97,7 +99,8 @@ examples:
                      <&gp0 1>,
                      <&gp1 1>,
                      <&mpll 4>,
-                     <&mpll 6>;
+                     <&mpll 6>,
+                     <&mpll 8>;
             clock-names = "xtal",
                           "sys",
                           "fix",
@@ -111,6 +114,7 @@ examples:
                           "gp0",
                           "gp1",
                           "mpll1",
-                          "mpll2";
+                          "mpll2",
+                          "mpll3";
         };
     };
-- 
2.47.1

