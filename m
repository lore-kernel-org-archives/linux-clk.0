Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3201224DB2
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876581; cv=none; b=Sqbkvqisj16wfwGJvng+JK8VL4gk9AGmV5pehCP+rv0BRMafw9cIRCScE4LW3H82Q+ZcYBbbYK4sdr2CsP3Vf6Ed9X5BqC+8+GnLalptDUwF4uEZP3goVF261nM5J2diblvukEX9laxyuLzZ5mNMzDQqnsCaRrHYUrjEZYGpJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876581; c=relaxed/simple;
	bh=UWJvMv3Z0a1PpjzyOCbjoPTg3oDPbd1fp/cxOBSwg9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWrSWjsfHO0M09vNBFbn1vbN1M6xJlSkzgJyZg8b2IvOkH9zXCQ48/GaFgEVftR3X8TKkk5ZelvKV0SXE8saG3O3MFr0djq8aiI8Kiw+Dod8P1yothYviG3svjtZ+oclsriIpEVcCDEmPAL8t/fToM7O95uzZyVxdskAJoQ01Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ttlZGNZV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ttlZGNZV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1567275f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876576; x=1730481376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
        b=ttlZGNZVB0Ams2NBquHqNmmwhH2GPS2xxMSvClEwatkCAy98C8hAa9vgvRVCQof+fW
         kblThihRuEMi4SiKp6jeboYyp5rAA7TXXBgw4YJp4r0dtq6GJe2uRZvpumiiH+1PoaFX
         cnMExDFQj7OHPDdhVKPeA/nGKLJXHXtznyhBgMw6eSDsg4LLS3kmhYOoW4SKfU4j1rkV
         slAZNqP1IgMXmh/NHPa/2ndn6LMRyUbBe6W4LomXg1ErtX2bPvWa1dz2kJ7oWUSlYjOF
         OlfrqdujKiZ5xbSjAgPRiY0gj72f2eKFqx4LyxQVaxU6pUcltNKM2H5QUAj5/N4kU839
         pmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876576; x=1730481376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
        b=N3piAvMMrv6PPSjyMMC5+OfyPuMu4y+xUDuYximZ0gq57zmRYjrAAExcxMLwbqFjDt
         w0FNiQMJOKpx0YmzYrYdtvacasOE3Ri6o5WExjUS3N/G2J7RYcJpu7TWX5xn8+gxUqwR
         6sc7ZsiN0U9PTHLzfvS47U5X7oQtc92j4h7W7SUd/NrN0zWxIhB1FUaCy5ZConSHuGwu
         tdQWS3ECQM8kRB6LLyQKLbr5RKahWYUCBZdSN0z09II7Zut5w2SRMf5QHAYJK7Mopbr0
         MhEzTTgZwO6J5nnWQEA+Ctrcv7V8krM2ejnn2PxHFShNo8duoyaaYLSkcFh4/hHpV72m
         jxMw==
X-Forwarded-Encrypted: i=1; AJvYcCVgMTeDlwde3ZluRkcDnyaGrXUXTkG6mORM78i4VCaDrXKcVhi5G2WP7cwzZZpBNYc/DBoLflLvmtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEA/FiG2tuVfa+QzpTm00elexTguLkKaFAWV37SW+EnYyz867x
	XyBly99cIOUkF7HO/e58Yrw+GapbAXZbJSplemFXou33ZTlpnaQZwxZticeOtBk=
X-Google-Smtp-Source: AGHT+IE/VfikFrZHBGY91VEfdMxjOv4Me9kCVd0mDGc13MQEknYwxLSPdeWAl2uAqA6slK2aB7I+ww==
X-Received: by 2002:adf:fa83:0:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-3806120c614mr82922f8f.59.1729876575760;
        Fri, 25 Oct 2024 10:16:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:46 +0100
Subject: [PATCH v2 15/36] drm/vc4: txp: Add byte enable toggle bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-15-35efa83c8fc0@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

The MOPLET doesn't have the BYTE_ENABLE field to set, but the TXP and
MOP do, so let's add a boolean to control whether or not we need to set
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e08c90245f94..27deb4cde02d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	unsigned int has_byte_enable:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 6fe378b454ca..eaf30b2cfb5b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -287,6 +287,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
+	const struct vc4_txp_data *txp_data = txp->data;
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
@@ -309,9 +310,11 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		return;
 
 	ctrl = TXP_GO | TXP_EI |
-	       VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE) |
 	       VC4_SET_FIELD(txp_fmts[i], TXP_FORMAT);
 
+	if (txp_data->has_byte_enable)
+		ctrl |= VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+
 	if (fb->format->has_alpha)
 		ctrl |= TXP_ALPHA_ENABLE;
 	else
@@ -492,6 +495,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.has_byte_enable = true,
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)

-- 
2.34.1

