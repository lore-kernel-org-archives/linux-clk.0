Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE1E217679
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876601; cv=none; b=WZzW8m+TX803aeMtwrSLyQvyYYtNhSkfsG6Iba+JpOlNVBinD6VdxRPMDaKKrzGIt52KqZYX9iAm3Tqw4HpoGUSM2wTDAls1fLvqZVsfDJkRDJv8fM2huhiVkeQV0a0vS4P1trlwUp78m1AaGtntoDk0qVDnUq2mOnRP40EVaF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876601; c=relaxed/simple;
	bh=YzyDLNl8va/xJl47EHT+vId7czfsGNnbHYHobDKQTlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhlPe9icOhKKs6xR8gUpN6X8oO6b3LZ4rBEzIZ2R9zS+Z2HxP1FXSB6gqtpwuwPUV2XXZRWE1JNCH+Mza7KJRyfsKc643NODjSGjyoH1+U4PfHhunNOh4TNTV8xuNY07RG7gFRhSL8Y1Hkjp2tZZ7tgrAl7aSnkWQNF+MdZVGe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Gx05/4Ot; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Gx05/4Ot"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so1429763f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876596; x=1730481396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
        b=Gx05/4OtPlxFfZSmKt5wry6KA1iBI3l2cM58HJsFS0sukwTmrSbjdiR6BRbnpnuM2Y
         VjLk5MbiZ/ITHNJDC2ezGMsCqCHORpMAiUGUx7bOQhTY7Oa+/7UGZpJQ7lbXUH2JOfvF
         ycTW+8iwckQCqtTbdCLp7P4ogreh1MH7IcFTqA/wQLMmNDgbU3r29A2dq1RuPZ1CCqzj
         qxe9jAlSU2JNraQPIh5aQ1CUOGWtGxqZr1KyjEtvTeRKN4d/ThyTkjypysckrC+SnZ2E
         cW/YNjThFtZnFftpG1D5DnftzxJP5RJFDAeh12k9CEVd+V3LsolACACs3O4xIqIMSIa/
         bbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876596; x=1730481396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
        b=td9mraZhkU5RirIYXJNwKWsepZAOEjgpdrqRINc25ZU+JeswZ3jMtIVUCTRuIagzPa
         vq2747wXfx2FK49AeuW6nee4S1SEqUnvK49nOiL77ME01vwrFi3cs03Uy5ko1rNZD4U1
         gmTQ5SEjkayJKQXay+UGeYGHPtJeCn7WKbb0Bo4QL6tlAH+mgJzz2HLASM75f56OtppV
         obEGYToGlSCmLLFMr8f6dsRS0/olTM+OGAGKx6ykf+nc1IJoJppnlqq83klXBbaVAqqq
         wWCPzWtYcuMsvE+Z02F4ow+4kcx68dQ2b2X9UqJ1vYvVMZh8Q+/bOogrA2n9vo1o1E17
         x3qA==
X-Forwarded-Encrypted: i=1; AJvYcCWJOcphXMjtNb+fAZNC1LURcL/U/IeUNFr58eGldZCkuL5hK/E34gvEaZyDI2XDgHy8rsl43avrYrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPtDcx5sKqVH3+KlJfpqZ0TaodAQmcyyYwCcdzZCwOLJ1/ifa
	3/v4g3MI40kTFh8c9DAaIxuQzLIdwYOi21bJ5McYqCbLC3U7fayqqoQJWRMQGuA=
X-Google-Smtp-Source: AGHT+IHM4SY0KfVAQSpJ1+ccDJ+C4lsK7yh/l9hYanouQQltriHwErlFPV65caR05fmBTRpW7n50vQ==
X-Received: by 2002:a05:6000:e42:b0:37c:cec2:23c6 with SMTP id ffacd0b85a97d-38061208e5dmr101866f8f.57.1729876596081;
        Fri, 25 Oct 2024 10:16:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:07 +0100
Subject: [PATCH v2 36/36] arm64: dts: broadcom: Add DT for D-step version
 of BCM2712
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-36-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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

