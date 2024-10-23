Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBB2209699
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702261; cv=none; b=VL8g5YeObAYMLCdne04yB8TK2VWbfm+NhOcm+xIiTXJ9Vwo+t+te/+wvLcXc/DspX+4qn4lG6OHmVgDNXbESyu7X7PO0GkcHUmBTf5Yoh0BrO6wgU51xS9Qgs1cO/Vl91+ex/IPT1YQ03nU1MA0Axn+ZOiUFFnQ5ODWW1PmaHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702261; c=relaxed/simple;
	bh=YzyDLNl8va/xJl47EHT+vId7czfsGNnbHYHobDKQTlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQZ5BLE0ZaEc9nK/mHH+sKJfsbj6vUr5XHPzfZjRaFVhYrzz9FhDIh+MwZq1b+F33UG6K0xy+aJaL3AersJrgX0RXwYrtU6JGst9PAPl/y/igwos/gqqFTM3fsm1CRW1Ev9dRwWTvJcFk3BpjZ/DUfGSyvdk4Z/ERIr+1tBbZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=rkfrkLKq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="rkfrkLKq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so4185969f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702258; x=1730307058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
        b=rkfrkLKqLgRsplrsZqRWvZZGQof9auNQasLNinujzsbNsRUpqLanza6XyxYrrZNj8L
         nBNTJ69ZD46c/m1vwbP8V86QIw75LDiVr0O47Kav84XfVx6KSrFMge0yWP2FkWkiEAgx
         gT99G6im9kVqCogG2d34n8ArG2y0ZM82u00fKmG6+ftwcicErE30c3kPehmkUIPJ9fc8
         OcphUnIO3jaIfgP/mojARb63OqMW+uy9qwsfU1XIVK2BlkMzRKoFEMt2s5eDQHsYVOD9
         9/qtuUqopdPkNWEc1rsEWJgZJpo9YHLF9G+HEbNlt546icKw/7fG4kkHvKU6m7ewLmMk
         FoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702258; x=1730307058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
        b=UP5MwrySs3r+Btrh6qeqhpq+RUnPBY97KSR0DUnslTLEaDJ8hqUdAfi748MBp9rUqQ
         JFBYIlORjmOqLKt8368V1q3G9i1tnmPg/+J/HIzIuBHH3i6ijy4tu3xsZyv9wJ9Zlasr
         nUQqg9jy51c2ed4gAD6BqipiuKIjIf+KK8IDgDcBb5HQyZ9zOuHeBqPuBPbQhTOAPd8z
         U5i6g0wpacGQk9HWi+dZaBXjut3sQa7fthM1V+UED9qi7h6Li6SVtxa4NxaHYgIf7S74
         /Hz32XTfmZDbDF914rkbn8AATD2lf1OLgM5KHQY7qDs3c50/jDS97KEe09u2s/hBNsmd
         83yA==
X-Forwarded-Encrypted: i=1; AJvYcCXngnqSBYP1aW+4oYBstEJgSVZNNJc3n2iS1CI1oF1O9Rv851l4lnsxNUN1d/H438veIm2SMbeDGdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/iWCH8JYoXdDo7Qi573+f8B+1Bc9hkA2jiUKvr2SSV8bzHnb
	Z3iUbkc42D0SNygrrNMVpSOXYJXXzcOtEk0ymxcpFRJ36stqcHbaRePXiNwO3gw=
X-Google-Smtp-Source: AGHT+IHyDo7gKJ/IShXkUH9eaVP+PbzXws85gi+26NgIg+img0yXRqlCHCujQCnuXRFKsSClohiLPQ==
X-Received: by 2002:a5d:6102:0:b0:37d:509e:8742 with SMTP id ffacd0b85a97d-37efceee7d5mr2193265f8f.1.1729702257644;
        Wed, 23 Oct 2024 09:50:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:56 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:34 +0100
Subject: [PATCH 37/37] arm64: dts: broadcom: Add DT for D-step version of
 BCM2712
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-37-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The D-Step has some minor variations in the hardware, so needs
matching changes to DT.

Add a new DTS file that modifies the existing (C-step) devicetree.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/Makefile              |  1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 92565e9781ad..3d0efb93b06d 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
new file mode 100644
index 000000000000..7de24d60bcd1
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "bcm2712-rpi-5-b.dts"
+
+&gio_aon {
+	brcm,gpio-bank-widths = <15 6>;
+
+	gpio-line-names =
+		"RP1_SDA", // AON_GPIO_00
+		"RP1_SCL", // AON_GPIO_01
+		"RP1_RUN", // AON_GPIO_02
+		"SD_IOVDD_SEL", // AON_GPIO_03
+		"SD_PWR_ON", // AON_GPIO_04
+		"SD_CDET_N", // AON_GPIO_05
+		"SD_FLG_N", // AON_GPIO_06
+		"", // AON_GPIO_07
+		"2712_WAKE", // AON_GPIO_08
+		"2712_STAT_LED", // AON_GPIO_09
+		"", // AON_GPIO_10
+		"", // AON_GPIO_11
+		"PMIC_INT", // AON_GPIO_12
+		"UART_TX_FS", // AON_GPIO_13
+		"UART_RX_FS", // AON_GPIO_14
+		"", // AON_GPIO_15
+		"", // AON_GPIO_16
+
+		// Pad bank0 out to 32 entries
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+
+		"HDMI0_SCL", // AON_SGPIO_00
+		"HDMI0_SDA", // AON_SGPIO_01
+		"HDMI1_SCL", // AON_SGPIO_02
+		"HDMI1_SDA", // AON_SGPIO_03
+		"PMIC_SCL", // AON_SGPIO_04
+		"PMIC_SDA"; // AON_SGPIO_05
+};

-- 
2.34.1

