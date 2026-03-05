Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352231B824;
	Thu,  5 Mar 2026 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696633; cv=none; b=CZJgbgQoKAWDIgCG9I8iuvGgRFeyq+KKpWkFgJeqpEdfzUKoe2RoLra8br2wJKXAz0UJrl1Alr/YVbwP4bcZiR0HAjYa513+U941/QgxoZJYl9V6JEZqWILDWAKJ3MdJvVfNVtCZ1fTtY6SM4rl+fD2+j/4e+mJWTQCrrr5n5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696633; c=relaxed/simple;
	bh=wOgxUXQjc7ZmGfTuejriaWv0Ftyuun/O/CuTeqMJiMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ext3QaZhoGj7GFdbsZadY9CJXK71ffORlrPXrpNReR13VAx0SX7ZHaLSVNZJNQmjvO4v2YrFAyZSbIkSku7EtoNtJP4cqNEz8Nk4fgwmmmaShH1SpqeBF8JkJyf3k5EqWRN1hcJ8K/DKVPmirqawRYaCvTFfis9e+9OGgIfc+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 4 Mar
 2026 23:42:54 -0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>
Subject: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
Date: Thu, 5 Mar 2026 15:43:26 +0800
Message-ID: <20260305074328.639993-3-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260305074328.639993-1-jian.hu@amlogic.com>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
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

The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
Add it to enable proper clock parent configuration for these peripherals.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
index 55bb73707d58..27cc1f331587 100644
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
@@ -98,6 +100,7 @@ examples:
                      <&gp1 1>,
                      <&mpll 4>,
                      <&mpll 6>;
+                     <&mpll 8>;
             clock-names = "xtal",
                           "sys",
                           "fix",
@@ -112,5 +115,6 @@ examples:
                           "gp1",
                           "mpll1",
                           "mpll2";
+                          "mpll3";
         };
     };
-- 
2.47.1

