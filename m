Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7D1E764A
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286111; cv=none; b=Z+qBn5BGSQksuwvqO+lxx3BQXw6KZ4xsKFFx96fCgZSHPtUEuxLqXGayrRdBAj2sNVRUUMNzVz2B2JkxuRLa/XHTd7f/+fKTBIlujFcK4NbS42tjo8pO04M0EIxr8PJs6eWlDZxtUjognEpgq+SynJfsHUMciyUYytsKwAbsCnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286111; c=relaxed/simple;
	bh=mfKKujpI4Yk4mdg6+t15nnjqJVfhNqwOoY0zzp8KwTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hS/4sE2vCgweLD0LXu0scAaXAvrcOCbo5IsNAxqayX2+9taPOcEmuklAuBQFoPfrcH7yvwDHquo9OgiK1TwCV+DInA9X+yJivrlmoXj5FRvLPNMmlF/sEn2epvbBvJHxcmuSX76vSuNbCoon+s3BaHD/9UMIkN6eiARmVx5YdOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qYc+697a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qYc+697a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315eac969aso4810985e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286107; x=1730890907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=;
        b=qYc+697aqOs1n3Ry1sQjcjtuzVrBO0fwko+3ya1ZTf32gqlMMbdIYGpPx8q4MNBQTi
         T4sQ4K/u9LcOZjHmRK1QRfXUwLOlH891Mym6eJZzCHF0I0Zh7mehb6ij68qy7Tet14Ba
         XbiH4a77az5USUUixHcVYQfvrdX3DCvq3IvJh7e+xjo90F/31Ohu4hlZrPbLSQVZnPvk
         bBWN1QYjPNY395lu8z8Gbhh14mINhK9BVMwYFlCU9ckwpb/tJh1DIFlIT6PLx+tvzDL4
         A7bfzggXlr071yHn5/tezLVM8TS3j8wsEDOjx9blle2DEmlj+cg6sDL7lMzvOwqlAkW8
         M+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286107; x=1730890907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=;
        b=SUCv5RSHAPeub4Hu36Ux4upCEdRDOkzwqZIFhgRZResaLLNIac80YOt7ngehbJRKI5
         AqEYk5ux2VnuH6LGT+C7d6acL+npn0CKbw11v8yM4ZJ/1rXsYbbA2qLYoYfaQSWwk/lH
         kK9w5XCU7RRIvO1P7x0BvdAewIsvG1lyD7byPkZypxkfLD7JAke6aNJbOdtIDPmYDadm
         7zpZQ37X1IlMq6SLfk398HhC1j6/1s/vjlPo/uxxLLLDcunv5TNNLt2WXxGWCyn5UCNJ
         wvjDzP+byddBgZEuByrZRgP1ZsCWGqdtGmQNPqHYEFXUFjH7kSOuAqaabHUNHypTwSjD
         rTrg==
X-Forwarded-Encrypted: i=1; AJvYcCV3JZQ8O2Zpr2Gp1fICOyS7V8NbD8FLRF9pxbG9ZKjCzzjsEaHRidXgwIv1EKHbeFu70XPgmWfY+0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtxJnSzqRC4k0hpBxvrSvLAYuSYrLQgoCaOfOD+PxjvfNCOVf
	EFfe8WrIvKKthYGqQSVnYoej70QNb5ddYdCowJg/KPSXRFrOoz6yRBEfhtD+AJc+VHyQ7V9RQrf
	H
X-Google-Smtp-Source: AGHT+IE5VulypisySsncZjnqUpvTj2AV1Yc80jON0brb1Iv05v/0FIWD5VcuOaypPQ/AlZFz+rbyng==
X-Received: by 2002:a05:600c:5253:b0:431:55f3:d34e with SMTP id 5b1f17b1804b1-431b5739d3amr42501345e9.15.1730286107092;
        Wed, 30 Oct 2024 04:01:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 06/10] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Wed, 30 Oct 2024 13:01:16 +0200
Message-Id: <20241030110120.332802-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- dropped the status = "disabled"; for the vbattb-xtal node

Changes in v4:
- used clock-controller for the vbattb node name
- move the node near scif0 for ordering
- set the vbattb_xtal status as disabled to avoid having it exported
  in linux with frequency = 0 in boards that don't use it
- collected tags

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..a1d5084b074a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: clock-controller@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@10090000 {
 			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
 			reg = <0 0x10090000 0 0x400>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2

