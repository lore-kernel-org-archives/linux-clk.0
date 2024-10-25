Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586AA20D4F6
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876583; cv=none; b=pFG1rhrfWyAXNs5ZnwrGxbbBwIJL3meE61iEdlTTAxneMN13UZssh1RZs5jcIC5H3Gyqn3BmTOyJ8yBygVeZQqAluxPYz+bkOw1w0ZilKNEYgKzVuE1YaMwCidrIau0K/s6jLNvsc4WKLC3zw8gxraRlTafKBBwNsinwiReBttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876583; c=relaxed/simple;
	bh=R9RFlDE7CyX8MJ0zzwylUHAIJONhAEoeNvhpIVWQ/rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfC9gURonMi/+G0d0HmoxnTP96utpJSSxtMzNuAx3yLtKHZaqoIq5eEUyPlOQ1dWXuMwYt7Btn8BNP6DeILrsU53GJZ+cqbAcmCbu0q53n3okssOg5itLPekvbqM3PEcHeoLHfARTBnDjuyXYJvqsJQ6SknV5wogpKQXzDHQUQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=noS417Vt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="noS417Vt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315eac969aso15930385e9.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876579; x=1730481379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
        b=noS417VtHrEuwOBe0GW6/HcX9bwU6/op44vU0B4OM/zOcGzn0mhPT1o0ad6j7J975V
         96PrBAga5iLUAEL1JjBelTAaKCugGFyg1FLdYyDF7S6Z162L+WBxuewIntBW2o/KqScU
         K24j6diI1Hp94Aq4D7b1nLLxKbVDCa7o6SiNV8Po9ztiEC5wwymqnCTmHb5sWUhx+xz0
         PJ6h+SfZ99Z0UwWGzz/eMytg9GzC9vMMA4cPYodmFA7R1IDIJjB2vl2e86MJH9iZARLD
         6JumseQq+vS2nvu4nZRj0rh7wWOSptf3ExD22K+uoxAPLHyGDGmrWCM7qbWp/L2fsxe9
         9/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876579; x=1730481379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
        b=gCTbyPTw879LGGojx8Ft323CpmSQuquc6NalEGZAZUD1kDHqKGnl0GCFrsFZJ1DF8T
         Fl5QbfWU89G4CeZpFkAlhOn3FFmrkzl/hrv6iDrpZOtXr0wUbHckjrHKpxBBjIZUvRoe
         BOedd9mIpX08y8Cpq2tDQegJfe7sAaDMRCPLJysH48PeK2y/WkAAb6aADOtFmVOH4/Ch
         ERxsvUfzMfYnzw/u38HY/UaD+YtPWA22qaTIQc/ZluPG1s5APiQc3eIM5Zk4jqiTnlNA
         PslCb5OGX6kldL8ypRvblChxT9gYNOAEyCaaFaorDEOia2wxvwq4xtyeetuoMk8F0zkx
         faog==
X-Forwarded-Encrypted: i=1; AJvYcCUbZ64DZsoryv6N7n82tdT5ooJNpdT8PwtETERJX24UuU3fq5H8DWPrnfZvx6MCfouV+Me+8KvKhRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59cSCg+/ancqSUJFCRKr6VGECBqntfQrzOcgF/aOSaTABI17N
	aYaTm47DK8zOb8W1ZHjTFiezvyX6Nh3Q1nZsQLkoTqjHDrC/LBOj+txZgvMD2bQ=
X-Google-Smtp-Source: AGHT+IE91xtUCxvlR1lRvpTqnlZWaqwRX+o7PpgAGm30e7rVreFkYxn6n2RZsnu9N6JSHjePT4SHEA==
X-Received: by 2002:a05:600c:1c98:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-4319a44e698mr2888895e9.0.1729876578594;
        Fri, 25 Oct 2024 10:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:49 +0100
Subject: [PATCH v2 18/36] drm/vc4: txp: Move the encoder type in the
 variant structure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-18-35efa83c8fc0@raspberrypi.com>
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

We'll have multiple TXP instances in the BCM2712, so we can't use a
single encoder type anymore. Let's tie the encoder type to the
compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 34e72e711a17..70b7a771ff47 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	enum vc4_encoder_type encoder_type;
 	unsigned int high_addr_ptr_reg;
 	unsigned int has_byte_enable:1;
 	unsigned int size_minus_one:1;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c2726ccde1cf..ecd2fc5edf45 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -515,6 +515,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP,
 	.has_byte_enable = true,
 };
 
@@ -558,7 +559,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	vc4_encoder = &txp->encoder;
-	txp->encoder.type = VC4_ENCODER_TYPE_TXP;
+	txp->encoder.type = txp_data->encoder_type;
 
 	encoder = &vc4_encoder->base;
 	encoder->possible_crtcs = drm_crtc_mask(&vc4_crtc->base);

-- 
2.34.1

