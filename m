Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC05229B3D
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876596; cv=none; b=r1wmUPMeJqTmMguloLC1xzvVY227wGBQg8hETN+3XD2g1/xKiOtDnvJmL8vszQ2SwdTmVa0dR5VtkwDz8jg8nDIvqk8Zj4UQTzoWJnjXQqnUXF6VHH8e1qE3xLkYitjyA04VkjLDekwwa1JRHct2m6idiyAGVnUqsisu9+yV5v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876596; c=relaxed/simple;
	bh=0je9Y0xbsCwGhDIv3Ukq4aSt2NhWmJSUC9xO7wwoU+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUQ4aGRYTyiSrOWyf69aACo/30WmePkMBsS2/7TsmqoXUmKoYundNfSz3BjAuane6erD1xVBnY4MkbVnb0JOkDuFBeuurhIlcC3tOQoQl6m94zcJixa98TvWUxMZZZSoBvDcHRJFiIeQBWNOdmYu49tfpKGTVnsrOQFazBrtBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hgtYN84U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hgtYN84U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so1734130f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876589; x=1730481389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=hgtYN84UMLRxLRy3AfPk6vxJa3y5IDiRJTzQJNl3qMKqaQRKQpVMSJJHjuRk6H27Aa
         7GOT2N2SZodJGvmhEvb0R6Jq3q3T3p1g++C1Py2yXIRu7X5syfoe+T60fXeYiXDqzIJ8
         GSR5HqrWVmhxOTdFPkrXhapaq4X0wiSvSE3v56hqV6e1Ro6hQYGlyYzc0+JR6g9S4jbI
         Q0wRwq+k9Kvlvq1ea+6f02/G30QqD8FY7Sl+/zUpKiU92sH6fOPWff1KB49adwYPsIlK
         8TEW9PoWh7uHhQoanpsFi/LqLV/k7bXsfli0ZpKCrFKg0ZNzOXuBWbVOlHNwqmRKUx86
         mXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876589; x=1730481389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=TV1+HiPL8rGPLxqLGuE6BmQ/dVYoWWMPi1jotD3IhRjG3BELJebf6I34rYyQoQPR15
         I6CNCfQcanjXCXntZGNNLpxeXuVvJBNmXnQYj7bWuAO0fdi/i3kWXnR8/xlaRVqOO1rJ
         VWMXhw5dTi0D8AMcAMXkcnJtmhveFeI+y9P7RUmzLm6WD7Sg1HJ3m2gY+yJEdWestMxk
         BQmEvkE1puxM2EnIQeIMotb9hFhOhbw1A8KU1rYrhRMGDpmoqgWwQHmIvldXmCheyqG7
         PmT6w0Q78DAU1qM9eS37jG+jzTt+FYzlAK+j3Zk5klqFNqMaQzH4vcrt3Jb0rWIniNqZ
         QORQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLqppv6ywOuSiy9jMbtK9ATg6okpWECBOO7/cz8FjyJLSOQuSY0dLoexA24a3ExmX1TNEmiXUDbUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RFudmcvxmwkbclUXUzHoSaWHnjbEQVkARSfFILcyu4R5rpbb
	Gv72QMW4PlwqAxZvJAq5iwTeyJ2Ki4xLMinrOlg7dnNwFP2Zi+XnX1+SCkmilw8=
X-Google-Smtp-Source: AGHT+IF1bjTItLZYzib0RmBwDucZt/dcZd/G2s0GqNKrDbIpCMPlI0IgZqsUCGHdxbWn04sHiWM6eQ==
X-Received: by 2002:a5d:440a:0:b0:37c:d1b6:a261 with SMTP id ffacd0b85a97d-3806122feefmr91002f8f.59.1729876589515;
        Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:00 +0100
Subject: [PATCH v2 29/36] clk: bcm: rpi: Add ISP to exported clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-29-35efa83c8fc0@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1

From: Dom Cobley <popcornmix@gmail.com>

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1

