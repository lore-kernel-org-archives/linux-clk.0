Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D9312C473
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296689; cv=none; b=BmNo+X7Dkp9Uscj4oyQMcL2rzIUXYVpokSMdN1VHlURPl1HdLKzZ7w4rC3OLPiH1tMdnFllmqWm7IiMSy1VkJcxF7PaMl+x8j8zwYx91hUUYbRa/8/t254z/QXX7vkVhjcccPEPqaBY/qbHJY/TE85UisL3USRPkphsp8yNMC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296689; c=relaxed/simple;
	bh=vUvLQh/jO3ceweKyo5MuuklomweI2Q56BLv7uiWnR0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+7m/ejTADLh/wLzr8WoJKk6QIHmYprKXC21Q5JvkWhmIW3MY8kDNPEujn2bBwRWYkF3E6Hf2FJsx99th5bknHsXSzlKUjfdevOmamSR3Yzii8IJS67QuQBLwCwmpHeBWJkr0Lb1ZGUCWcY44Z2ZlcoIzAQwSm+LGIQmpSJlBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ro39/axO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ro39/axO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-367e50f71bbso369651f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296686; x=1721901486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOgT9D/DodptCqE2kKdT3PPWDoUGy8iZZzt0/7nqeFs=;
        b=Ro39/axODBz57J8mWllB92iCBbdH9EhNVDO6J1ycG4k0RgCPSN1NOKyhXxhKaQUii5
         YwcSc02Yw7STxE+M5IZ66rI2RgHcKF0p7+/BjLvjpah+60e9ykBsJzIHlpRAqaTih7a+
         7ypc8txKViv52i3tI8hTE/kTT9UHsDRMaeuUq5VeiAUVRhRXc7MtKnCD2ZptVrc1titt
         Mmlc0Rw6ttRJnSySXtp6ZCMGxcNCYXFH0d8TRbA6bjhUSc46FkArOwGLeu44GLziRauw
         AyVZkbSZP+ZmPtGHwjFdRK4yzmU1FZGDgdRZtPqHZ5FreolfQrEiG9piliPdm42bHC97
         s08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296686; x=1721901486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOgT9D/DodptCqE2kKdT3PPWDoUGy8iZZzt0/7nqeFs=;
        b=o3lm+yYt3qrrPcpA3a4iHHqtRiv1Xb+kgyptNKAjXhEG82jJSBzN043ZhAAWJO0c83
         EWvJgMLpAFRc69t2cFK4l3GXKOlWLW4SgXJQlIesZuGcOb6hps5W4yWEeH9MJO8HQ5uk
         izD2op73zdhukJKLzG8NE+LP4LLst2FM7ez4moHHQN5Uh6oQdpECddUmZBPBNcNeYyuJ
         3DLM8rVR7AtF8NzIXF//RJ7kYn+yuk0r/wO1wGK1cajm6D1UGy6L3ot+QWxgZiY5cDT+
         jhKHb8CXyYjhpCQdPB0Wkp6goH3kGxBTAX7QZuVGBzR3MHbaiCvGjtydoE9+5TbUslzI
         2UHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUgVVtLcgLx9ZxzkaWkcGqT1Ff0eMcIqiLwtInuyXwpdNnAXP5l+ARuXcZxdXQeodFCHawAzmye55Sh7uC/Pu43Jj9m8V6OpTd
X-Gm-Message-State: AOJu0YyDx99JyBnnX+LGVmxwWzhg9E9rlCuvINg32UC7q6sG25WsukuT
	pGyNMW+d/5embNSliQSnASzE36/9o8NULYeLvjrJATOP8fmWqiIwUqiL5z4XN/Y=
X-Google-Smtp-Source: AGHT+IGDhk3n3fMrhl+KxiP4qxoRTY3Xql+du2qHjuCX3AxvdTe+ANakilfvecMzJUQGpqBPrQYCqA==
X-Received: by 2002:a5d:4576:0:b0:368:657a:6347 with SMTP id ffacd0b85a97d-368657a647bmr411614f8f.34.1721296685836;
        Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 3/9] reset: amlogic: make parameters unsigned
Date: Thu, 18 Jul 2024 11:57:47 +0200
Message-ID: <20240718095755.3511992-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

register count and offset cannot be negative. Use unsigned integer
for this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index cd7dff5bff61..a4705021b8f2 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,8 +17,8 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
-	int level_offset;
+	unsigned int reg_count;
+	unsigned int level_offset;
 };
 
 struct meson_reset {
-- 
2.43.0

