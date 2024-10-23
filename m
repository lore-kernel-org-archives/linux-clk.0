Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556821FE100
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702234; cv=none; b=pUjJo40sB/Fum5VPQvU+d/6VvTrEMavUzwgDd0koWvtX6XyOE+wZQI+sK0ZvRTs37b+XlNjCw/fyvQ+0czf9HkgTcG2pFIbYynT7kuDw55Ur4j+gZei3bwvnr9rJW1lbADsNZdefDK4be1flamwGDj5lKhFQKWy0/3O5iVEYxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702234; c=relaxed/simple;
	bh=IyKHYiKufeoyyf7FtpOer1Zd2Wmz7XPsqevI2dedQSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBfrkudi1tBSLjcUk7Kp3n3AuXBJCiCZnYuZSA4w6Cot5b8TVLKckn00/SyzXaDC8N25OpcOkZfO0pK/BPqvNUERbShBLeZNSPnG+p/niXaaiQD7szm8tdw1R6Wn6FWlPDcvgZuV5bDL0m20XfFKV1UdBP7CHtk40pK6C/INHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=J91/iyfs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="J91/iyfs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43158625112so69899025e9.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702230; x=1730307030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMBkh/eftMTOn1DNe16yd6Y0TGrb136mnMNPmU1BY5A=;
        b=J91/iyfsg+CzZQR8GXC/DxTzbxJXbrebeMmANvX5pg3aaKJk4emEWH836o7FlWUSeJ
         ygxQXBw+7+84s+b1MnPG6DlSo4i5FQINu7d4MItSSzf0XHCNtLuRLlhE5vVMizimH2/+
         T43dWe0cjER1F8I0PgqHkl9iBtxxv3rJDS91LkdQ2Xy6zPLybSTRs8QTnZnv0qNNpkef
         O8ITp+fPzSgivJcTEJP65iKTJ4IoY8Ic6GOqUZpU29UpyV6rBymVNMk/SPPNEXIyyB1H
         zlI8Sgzs4jjyMIEwtC7SAScO65rk1TjlEcjn3guI242y0LsLFReKf1qIByZznk42rb0W
         rOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702230; x=1730307030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMBkh/eftMTOn1DNe16yd6Y0TGrb136mnMNPmU1BY5A=;
        b=BsEzabkdkPnmB7Hl8EqfJFGpvO8m9SXuyTe69NZxgevXr077mrezxR7rJavDCT19gC
         fokODJlfwR3iZGrigsyotdMMGXlIM5sGYfTxD2Ibi0sdnPDt9wSG3dvdN/d47i7TZMXl
         P1VqMvwRV74Ldi+rscxaTnDhWZBe0LXFyFSUTNmGyt4jHVhvzuu5M1QvWzWHFzyLpQQu
         UBGCS2MS4CGYKYLVI+JKtH5bZB37aYufGnJDM7fnhTTtAxjcoDtW+HRf2DYD8rgDpWHi
         KMww3R8MkGNTQWtvaOkEtUoRTUMhDtis13PjBBlS2vZUsAVlmf3OSXLNAb6DFH+G5OYh
         m/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDACEIcrXU3UZ7BETnNsDIwhpdFeyOR99MruF05ISE7ouYkB117+M2OuF0h3dKSo9kLVpHGv/GLdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJcKY1vbBulWFc2RS8c/WrXptLKvv6TP7ErmgUN4jLemnnyWv
	kyI7rVYM4JyNOOxCa6SaE1H8814wpJsGTJbMoJw5GlZcMgKOE3rDp3b7vOpvuT4=
X-Google-Smtp-Source: AGHT+IFCvi+5ahxplV53y8LUMCNwv9cz+F40idXE3AmypoYPX6CS2lFPTrKeznboS3XkfQRNLTCaGg==
X-Received: by 2002:a05:600c:46c4:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43184224094mr28879375e9.21.1729702230506;
        Wed, 23 Oct 2024 09:50:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:19 +0100
Subject: [PATCH 22/37] drm/vc4: txp: Add BCM2712 MOPLET support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-22-1cc2d5594907@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 features a simpler TXP called MOPLET. Let's add support for
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index befb99c9b5bb..aab6fa7a8838 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -524,6 +524,19 @@ const struct vc4_txp_data bcm2712_mop_data = {
 	.supports_40bit_addresses = true,
 };
 
+const struct vc4_txp_data bcm2712_moplet_data = {
+	.base = {
+		.name = "moplet",
+		.debugfs_name = "moplet_regs",
+		.hvs_available_channels = BIT(1),
+		.hvs_output = 4,
+	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP1,
+	.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOPLET,
+	.size_minus_one = true,
+	.supports_40bit_addresses = true,
+};
+
 const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
@@ -630,6 +643,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 
 static const struct of_device_id vc4_txp_dt_match[] = {
 	{ .compatible = "brcm,bcm2712-mop", .data = &bcm2712_mop_data },
+	{ .compatible = "brcm,bcm2712-moplet", .data = &bcm2712_moplet_data },
 	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };

-- 
2.34.1

