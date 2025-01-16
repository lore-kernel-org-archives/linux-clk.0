Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C77822D4E1
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044661; cv=none; b=FqKynztZ8YawasHDBV6/NffUeSr8t1IYYEEUwhnyap93XSK4dAxB42Rw/tOiE5Az+XJ2lYAmFtRxzZcxiGr0+ylNTnfW0rOxOyaGZ5kbl7BTgI2gonASwF5R2uTR4shOSIYV+l9f2H+ihCGCpas714XtrEYBzGUEhBfgo9ysj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044661; c=relaxed/simple;
	bh=5J6vqNubQjfIM+uOUpAsyUfwCnOhmTpN0y5UuqZeUV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6BRq/IAKSyL6auCuhOQqYQoOLWNgM8FvyV1+k7KYbT7ZNi8LnImjrGUcj5ULVERiEq3VfmBfHLddDd6phYok0MSEQ7di2TW5LYwTlbGlRNJYSG5i0At9EpadEfBhl7Cm4+2+uouGIu+dqNPpwPj1bUXo/YK0peDX+CXSZjPesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AlRuOCkf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AlRuOCkf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso1264188f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044658; x=1737649458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZibngSwY8argeZ7qofhjDrNbekU97d1TCMP7QCVWYG0=;
        b=AlRuOCkfVnhf1Dp+Ld6vF95aWaFa7RD/m0O7WU/7azQtx/QNM8fa2nfJ9KDhBFYAim
         +Ni2jEOHBeWHkWuaRDcHd+SL8cKhV2cyEfzk9yaHpJOPA9BrDdjM8qlLxcYEhuT3wXgf
         kjoTSakaiKAJc31XbPJIhCLgpZCjlZOo7BgfwwmoDGnRKavNHnfl0+Cb5lc5NhamAy4L
         QAfvD8fv90lD65eZ0RFPg+No6ALOc+FBs+k3/9jsoKpAxTpXcdCdky5TPMvFDqY9X+aq
         +jW6FsPiEORtbwXKT69qICiMQtwqjZWQeCqTlct8ZImPhXqmRFr2r8HCRfkHMb7CbujU
         1eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044658; x=1737649458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZibngSwY8argeZ7qofhjDrNbekU97d1TCMP7QCVWYG0=;
        b=RAnjZPhd0fW74fiW9I/tUoa8/3L+VjhkBkXcgAxE2jVzNetUGeqqFLG55cTL2JfM9Y
         05X0Hxc3y+q/A//7uNNVnS6DsHuDzFslbT1v4yyIV590Ilq4HJQHaDAzGyqoluK1fPvR
         ZrRW2FinmO5ii36uI03DZeBLhscITH+RX7g8NJ2BmOaTlB7XeQJOF0clwGqauSWYxDAZ
         lpNstSxNbc1D+En28khkVG2yfheIYKLe5cMPXEYvBI8BEZNiWt198y5t/GAZ3U1KLfe8
         eCattsjn1OJvRADR20RIat6z0HeyMK3Pu1V8TLe8obwhZCGCLc5wNniZ0sqJj5sfMg0e
         zSVg==
X-Gm-Message-State: AOJu0YzmgW8sSqt9pYz56XdfNt6rpv4rCZ+LN7GHNHnbRH97J6dDm+t0
	0M1xAWE+NOG61o3+j7N7/5vzZ7wmPS7LAgwpgG+Fkevwz0UtPnN85wGF1YK+yog=
X-Gm-Gg: ASbGncv8hN4jTmYYbLX5v6Bgn7y0xyQ7w1ihJ9UnA9lnDN4AIqMeSdEmeSXnZaMhiOn
	THMciFjIl5pRiVhYx6NoWirFrmtPmaVblVmCQRyQR+Vb8x/sNeAIs/U+COpShaxBgT3mMMXsfXi
	iizRZfdlsPCaY+/Xttu/897/AyI7F+J+XbXXA5SA6rkyXe3VldCtNkRNlb37L0Jis0lnka2Huv0
	/aVtRq51Bi8hZRq79JhlSzPIqihXz6B/XZHnxWOAc1SAGH0
X-Google-Smtp-Source: AGHT+IFovdSUCLFl6t9Ci8wgrQdUI7v7DsdIkG9yNGdgleot+0dJp6sFALS6PaK+5Ttm99jIsf+Dng==
X-Received: by 2002:a5d:584c:0:b0:385:f6f4:f8e with SMTP id ffacd0b85a97d-38a873573ccmr32438272f8f.50.1737044657836;
        Thu, 16 Jan 2025 08:24:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:17 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:12 +0000
Subject: [PATCH 5/5] clk: bcm: rpi: Add disp clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.1

From: Maxime Ripard <mripard@kernel.org>

BCM2712 has an extra clock exposed by the firmware called DISP, and used
by (at least) the HVS. Let's add it to the list of clocks to register in
Linux.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index b12d86720207..0e1fe3759530 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
 	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
+	[RPI_FIRMWARE_DISP_CLK_ID]	= "disp",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -139,6 +140,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		.export = true,
 		.minimize = true,
 	},
+	[RPI_FIRMWARE_DISP_CLK_ID] = {
+		.export = true,
+		.minimize = true,
+	},
 };
 
 /*
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73cac8d0287e..e1f87fbfe554 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
 	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_DISP_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 

-- 
2.34.1

