Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA822ADA6
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876598; cv=none; b=hrSQwMQsGxBnIf4KtXBagwpxGpgQ+439uuMfd4b/sL7Uykmhsd5h0/rD7P5lVxBPRyZOr823ScwTu5UzctX8L5wn82/fPsjYLIr9ir5l329j1sEcJqEEXJJxqQWa273c+1eOITUHshZmpQdd4+MkYoW+Yi22TIAlW0X0jKNpSs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876598; c=relaxed/simple;
	bh=gDetkg9bcTzrR7O835LrIsBPAY/4zF75oSJMNh2My2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdpRQn98d8BHRxO2rvqCUvgfMajG6lb8O5FNlBcymIZHa4DbMqIP8yEGp0zaDNbKUdE/PboKT3Mp8eDe06JUgjZ9DQMPsYDFMTTTQLAto7qm2FOm1U4SCRZQw3MtWAQ6u7B9rIWA4WTgx8VQu95GWeaK6LTmlaA5LFXhZj2YHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=QkROaNsk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QkROaNsk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so1446033f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876592; x=1730481392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=;
        b=QkROaNsk7CrE2+ZJ9WwKDE+K172he2S2K1jv/3GHo7jFJIkcLwtK31dPp3dLDSQT1e
         0qdc3/XkpTfYBDQKX7d0lsD3L1gGH6csAMO0SqU0EtFS3HRg4APiCBp+KU53W1nTAY27
         eZfClYZnvjLxbrWJZs57VP/zgqU3OD4X8lFHZ/isn4qgRPWm/YRLAYyBFhF8tISR8qSu
         +o9ssVYqaHJcOAW09eZP2uIgmXFiWJH2u5/OZbbcBwT+nHyuV3Oiw8UN+PRmCFWgkkJa
         jiSkBxL72vsaKnmXksuiCkLMfaPMpFHk31i/2fFJ9vpKKfwUH9T3UL9wOPPrBAHP8jqQ
         79tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876592; x=1730481392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=;
        b=wjbWIvExK0SkZ89PQ4y9irZ3vKPXXqWLEqbotAGm+X983Yip8/05KdN+dU3ZUL8UTU
         Bm6iaNkXvHFuuyKEXosfYKd5CUxvxQZHY6DbzmKoQC2WGACieEfj1vLoP2Xb2MhAimDk
         vlLKTyAOMOrlahAuIL8Cz21dYt7SyP8g41N+IeOdv7gZlK1qyWvuiCQFKcwikx5eGbuT
         VQk735crn1tIlZMP2+2fKQ0O8iG8G/wZh341NHyuY9qSD9iEWMSKY/mza+ZpjV1QOGaY
         4lIqJkoAww5myb9NlFD+j6p+CG3GY/M8vmXzmKqfC4Fh7uBBuqNIly2w4RRL6FayZUyy
         Gbqg==
X-Forwarded-Encrypted: i=1; AJvYcCWpUrXZ6YUb3dGq7CLsjVryLu9AFHjAtXe7ul4w9JbnUcAtvCTHatpF8EpIbmh9/8uMmpNgSNELvOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3bh3DmTllySegLoV5Yxgx2ZYyb1kK5+gggILZVAYktOaZsxX
	iodKL6iLgvgRzQBi1PYwXV3ZM1KjS+D6qv6cO1qR7gw8N0NHwd5+qXYoN8eBt2w=
X-Google-Smtp-Source: AGHT+IGlWiJn7Ozkgg+McXgEdyvgzuVLywKtK/tT5oVLgmb42gKrNvsGZclRa3uCRrKPuzJCn2aCmA==
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-380611e1392mr111275f8f.41.1729876592186;
        Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:03 +0100
Subject: [PATCH v2 32/36] clk: bcm: rpi: Create helper to retrieve private
 data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-32-35efa83c8fc0@raspberrypi.com>
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

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9f716b2223ae..b12d86720207 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*

-- 
2.34.1

