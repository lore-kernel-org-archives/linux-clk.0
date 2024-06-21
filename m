Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BF717B409
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969022; cv=none; b=baplt2HyZ7AMt3QBkKsKg7uVTkK1WLkb25hmoHFnkKHT8PZ63MYA7yQwL1C1TOXmzjm27tP1HZ+Wfivhb1djCxBytyXa4zb2HPyyO7simgp1OB8vOB1tJnuhjwmnhA+ZJbHh0yjrKWHvo7k2nm+SYvH2JpRMRa7tRZQ5KlW6n88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969022; c=relaxed/simple;
	bh=JYgANfGK0OX8coSzjyoca5b835OY0thvAp8k5tv/WVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jwDd6PKOQ0A4PoCGGsExw+woEeYTEuigc12b0VKYHH0+JvgwX17PuClX5gv/zT4l5cMgfZRRaYSfmS/+1oOruO0neA/Vq5e4fZgovjvsg6Heg04eoxIoAahMFvcn85EqLxA9Cj51SK235E0HYsU/2UqcM4jzaJTdqwUC+UvkzZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JAa7eP8N; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JAa7eP8N"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6f13dddf7eso233567966b.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969019; x=1719573819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebUuaMvHVQnkndloXfGsR/owtWP+gpjE1NoWoH3dplE=;
        b=JAa7eP8NR3gPlIWuXDitYo/A9n1uSnBAtziN6wps1x1rrVVjUtYJ0ujtn55MkhJ/Tb
         ORWKkmkyukeN5BgoHQ5halpq6Fa+aWnKNioEF/R6sXt83DKoofB5jCtNeOZ9quJWNM9G
         As9zlAO51VCsfZc9q19X3oTw/5XCX9jUBEqNAmbj72DNuQAydzc4n2etJMySMJ1VRytY
         X4OXV6p2A2P7vnMUvuYj1htW5lrsgCPsqE22vEb9P/PtsBoHy9VkSoRGfG6cao17wtXo
         r0BEnujtQC2IP6shoU2xugkAXIHtlWEDUcvmOvaa/IaH8hLQngx1AEMhoFyDxNRKT+N6
         QRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969019; x=1719573819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebUuaMvHVQnkndloXfGsR/owtWP+gpjE1NoWoH3dplE=;
        b=rI+YufDT1r93Bt4bcEldl3Qv6/MwVzUWK57gkCF1WK1O455LpHPSGI3LanJNX2Vs56
         3qKGQyU9rsikw9mwbwPYoiWQX8g8gccIKn2H95NXf/lz86KMir9SacKDR4U5vTj5LvuO
         Sx6jnHMPgmOO/j3nsrx5GZUCMWScbJ96FYO7HW0ANcWIoQh1Re5aZiehmLFap0OYYQYe
         aX4lAizFOjAcH6TJG3OGCxR2nY1cW3cdJBQqYNOQCq7odOaxs5uu6FSlIthXcSeYFs5Y
         6gdfd+9iZABhAw1NQss+hbha5MlKRgI02/HDL/f9bv10YJDUsOPYbpXXs996/8BsHqMD
         2t2A==
X-Forwarded-Encrypted: i=1; AJvYcCVwbK9Y/OG0K/rDP8cpPmaf6VTwFOTn6Mit7+5shoOZAsg//rh5aUGT1BcxdIAo7C40ROw4SHHy3grgWuWjLlpQGaNAuqQ1eLfi
X-Gm-Message-State: AOJu0YzucDR+wFJeFcJaiy9QYt82TR3xaxwmSuzgDetl/2gtc1mfupJ1
	wd6uOst60+5SHHT/KESEmn3SFIM+sI44f9PbR5YSoEzzJRq1zh7zt29vk0rTJzM=
X-Google-Smtp-Source: AGHT+IGZv8gS1+I6ldBjfQ4fdMF7NlgFickAepkyUrui9xQnT8bZE+QnGQ4UWGjz1h6JNkW6Y5A7vw==
X-Received: by 2002:a17:907:a587:b0:a6f:bf0f:4209 with SMTP id a640c23a62f3a-a6fbf0f42f2mr378145566b.42.1718969019378;
        Fri, 21 Jun 2024 04:23:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:39 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 11/12] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
Date: Fri, 21 Jun 2024 14:23:02 +0300
Message-Id: <20240621112303.1607621-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c0 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index deb2ad37bb2e..7945d44e6ee1 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
 		serial0 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -66,6 +67,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <1000000>;
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
-- 
2.39.2

