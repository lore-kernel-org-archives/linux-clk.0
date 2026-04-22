Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171233B6E3;
	Wed, 22 Apr 2026 23:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901081; cv=none; b=czdsTVk872wiu9F/004D19Uws2dpDaUEBIBOQLyeIHC8HwuJjFBNCFLNGcktkE43hX5uPVgjzVUWCm66h3uC31leLtUTGt2GDqiYYxeOmLp+DOzXEbhD8BF1JrKwTl4icsFVE/zH5C8IFyYnWDOXKhHI3z9kf+A9SMSd0677zdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901081; c=relaxed/simple;
	bh=PDCzZApDvKNTqbT/Gt9TpVWpxIDYrlmgfe7196TqER8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC2sMv4jH00P9dYXS4EH8hVcM3mCQhJXIaLqGBvGYXqwLqNE3H8r+9f1tpMfpHc7ZMDlRWtDCewmx5gyCK4o5LXPmin+CeoBHQP4jc5E3GxTc5qUQ591r7zCnp5cfb8PvAyNp9EAUamjP4G0WKb59MA1QzPvIgnRXSifS0YnE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CKdi3uC1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Di4XIANh; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CKdi3uC1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Di4XIANh"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g1FyZ06hcz9tkP;
	Thu, 23 Apr 2026 01:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykaQTPs4MXLdq+pisWbjv6fySKC2/pHPThbtMrxU8mE=;
	b=CKdi3uC1Fj2C9Ssp4xfQ1d28Q3kiHkpD9EfPAD3ffrEKzgKhWWLRhiy4uS7Y3lIw84SvfS
	rVZ8O2KhGnwdGWB3bCUMRsgseGUcqoBEWypXaLD3kXMXLMZDbRUn+5ElrmQDIAwpInR0gL
	1LBoS89GG0tjEXM2iJVzyo/G24bl60P/P03NcMUx8t2PPOcHe66w/sBp+g0i092Yrnh4dT
	+JknqI/+UzwQj5gRTyJOsrPc5sD1iCd9wf5ek0ninrOHgbURRbGDl66EGkYKhp6CrAITbq
	rmr02zgHNTIq8ManspkXOl1X/movswbg2wq1Im1U+6jdyFrUMUKhaGz0cqTrpA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Di4XIANh;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykaQTPs4MXLdq+pisWbjv6fySKC2/pHPThbtMrxU8mE=;
	b=Di4XIANhb1AqW3UIVoAjXxs2ezfA9squD5OhcjH/QpY4VZWLILfcZ0N4EGm8jWN/grQILy
	WLcohpI5eKnBuB7RgZxifoV3i1SfcUUYoNDqodWQM5Yx4lpvjfd3CHr/bFB0+YlGqPsi1K
	zEYVAaafAm+8i3EfiLrgkKHFS11Qx4mBT2mGHjChLDz04gkGhV5Od7Ugx5GMlGpM6f6cNb
	2RscH1mIsyfwc14EnAlZ06ilg76tP/Mx/W4ccSiNm0w+6Bbmzb2/1OLmG00CfdKrU0UKNu
	eucOoLoDW7mkhLJo3ehiIoscXo4YI6yjEydi7vPxdqE3UPPzYcMPjf6sECZBkw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:27 +0200
Message-ID: <20260422233744.149872-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ikoizzgqzufbf7z5zr6yzuubsxrzpzpy
X-MBO-RS-ID: 53fa9743ed3e2c3b3ba
X-Rspamd-Queue-Id: 4g1FyZ06hcz9tkP

Document ZT trace bus and ZTR trace clock on the R-Mobile A1.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated. While this does change the ABI, it does so
by extending the existing clock-output-names, therefore if an
old software is used with new DT, the coresight tracing parts
will likely fail to probe, otherwise if new software is used
with an old DT, there is no impact.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Reorder new clock at the end to match bindings
V3: - Clarify why this change has to be done and its impact
    - Include include/dt-bindings/clock/r8a7740-clock.h change here
    - Add RB from Krzysztof
---
 .../devicetree/bindings/clock/renesas,cpg-clocks.yaml       | 6 ++++--
 include/dt-bindings/clock/r8a7740-clock.h                   | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index a0e09b7002f07..925ed35d6658a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -41,7 +41,7 @@ properties:
 
   clock-output-names:
     minItems: 3
-    maxItems: 17
+    maxItems: 19
 
   renesas,mode:
     description: Board-specific settings of the MD_CK* bits on R-Mobile A1
@@ -123,6 +123,8 @@ allOf:
             - const: zb
             - const: m3
             - const: cp
+            - const: ztr
+            - const: zt
 
       required:
         - renesas,mode
@@ -240,6 +242,6 @@ examples:
             #clock-cells = <1>;
             clock-output-names = "system", "pllc0", "pllc1", "pllc2", "r",
                                  "usb24s", "i", "zg", "b", "m1", "hp", "hpp",
-                                 "usbp", "s", "zb", "m3", "cp";
+                                 "usbp", "s", "zb", "m3", "cp", "ztr", "zt";
             renesas,mode = <0x05>;
     };
diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
index 1b3fdb39cc426..8a8816b2ff6ac 100644
--- a/include/dt-bindings/clock/r8a7740-clock.h
+++ b/include/dt-bindings/clock/r8a7740-clock.h
@@ -24,6 +24,8 @@
 #define R8A7740_CLK_ZB		14
 #define R8A7740_CLK_M3		15
 #define R8A7740_CLK_CP		16
+#define R8A7740_CLK_ZTR		17
+#define R8A7740_CLK_ZT		18
 
 /* MSTP1 */
 #define R8A7740_CLK_CEU21	28
-- 
2.53.0

