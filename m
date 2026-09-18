Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095F305677
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706525; cv=none; b=JIu0mvghmeBCn4fQB2nt2iUZ1XDy4tArnb4eRuXjCUtgle9OR4rAaKZURWGYv7EOhXxVY//la6VuwA5HJdqz/45eYavwQT9LeKnljcl8HUZ5m+lvy1Riao0YhOgW1AXKwQxFvJ49P9T8Hr7Oraj/U1kFQTw7+hqGyTGywXQNLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706525; c=relaxed/simple;
	bh=EEwItVDn4j3sjRXIFX6oSgxd5iEJbZVXKN97spsMCpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZzschzeaVxoDj9ntCU0OW7bO16NiIMasQ3VrvXmnRkioB8vg687TZpGfNEQBlAQn7Imm06RWj4aWzSBGmKhaKXpuQphXP2OoGe7XbWGnmq/NYS/Nio/kGyyLoyDj49YS2XKEXdEFI3B0GJsDQ8vB8XSBAb7SJOqcyOSvvkQ23o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULEDbFCn; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULEDbFCn"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so2633985ad.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789706524; x=1790311324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=;
        b=ULEDbFCnojf41EW8LgBff1WUFxx0EjLxHQO6nR8smTdvHT85ZMLicU25QS/fR5Fn7e
         cMtGWQQBq43wlI3w9bgL9EmWNGNHOc3vg+iuAEU8Fow/ZtypmGBiMb2ly33+OdpZUz9u
         PN/vyNDaW3CfsWNbUhIthPRbOTc0wdZSQyjxSzCPJ5/gg2fSd5R/xvQvyN9HV2cCgBmj
         TypjXFOr4VwqI4tHkDxcEvRfSBS5YlZT9bu4/9D32uyjmwO0US6ykSHYUC+d1B1EI8RG
         T6eJwC7DqqBIqMHy/d5KZmyS21guiIsNJEYlpCxMANSU9ZCpYpZMnak6rFKJ9bi7itb6
         se6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789706524; x=1790311324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLhSQVS66izuo4+FI7QDBqq9bxYvfIHSP1AdZGaUGT4=;
        b=Htxl/Xued9Ih6OynsISDLnknWt/FcA+gYoZ0nMl5K7uI6zCLtTWUq6G2ymFrFAx0Pd
         6Jd71PwiJUDn257l13bov+7MRGAlcpfrn2xlxg/N7cH0e401L6+SZ/KuLoBUJNrIyLXK
         EZWVs6xlgu0972H0ki6nZTGrd647akVVoaO6Mgb0Gkk9aw238hg5TOqPN3V1g+edEnTw
         SWNIsjPwozbJ7+EUVBqvaLuuJxcTVTmcxOkFaa+MIQyTz5eAlRkJPRRxUJ2RDaQ7loIy
         lrUl3N+i2Xdn9KgbbeIzxTyDTuraqq25HCnejL2pEkurN+onSoGUANBmRH2Y7Z5Cbj9w
         b5lg==
X-Forwarded-Encrypted: i=1; AKwUvBxxrpVg3WPQYCjRilN7uKs6IxgPNhpkBppE/ORw6OqD+G4iMu351AtZcwRQAvnbJGoqTIsjUNYwwMY=@vger.kernel.org
X-Gm-Message-State: AFuF++l+UUCwYH7u6nHdNnxBIUGYQtwmDCiZdd81myeGNqfaXAD+k5jG
	wbUS25nRdrnF7Lh4KNxV0AQkWb3QqIuDQVuAQwKzMVl4COhD3QpeqbM=
X-Gm-Gg: AYBFou1ErY1LMmikBR61sEUpFPeQj9Vo7359gVvM+aLWKlV0p0qs/wJAI/iZdckCIKd
	dzTyydfWIHGQY2DMMvNcTnkzy/RYqY8YkdexlaPtBByOyK0aRdMMSXZn4Suck95N1MhdHxtpXtk
	c9vSC/MzVphtHKBolwE6fHYrEADN0mjZp5YKJ0mKnY1JxDMik5LK85Z+JCizPNOdTvaM3resoOD
	AfvutlkdSAIHUvp8L8l6wCKcOkb0HeBP4adgkELugipmDAzR+i0Q7yHmrzHFZl+IMmx06OWUucb
	6bzD6lNPGSwpuYF1pIMCLv6UBpFvUc8plbJp8eM09OCQbi44ByDksRCUpvf5+LR4l2USx/tmTH8
	a+pISKY0bltqsiObtPBMHgaODtKROi3/DMY/l4Ifk/hjwfNIovWiMRSpF0NYt9mBH4LawG8VkjO
	I8g5ZUtXZ2tWhcYCWwh62ZQilVktQZpTfJ7yHzPOspZ01UeZLOM2oTb9Ga1pFdH9XPMcYVdMZbm
	MMd66K6tcDbjb2iHGk/H7g=
X-Received: by 2002:a17:902:d4c2:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2ddb1c15766mr23812395ad.19.1789706523953;
        Thu, 17 Sep 2026 21:42:03 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb760d684sm1704675ad.81.2026.09.17.21.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:42:03 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	mcanal@igalia.com,
	wahrenst@gmx.net,
	triet.hoang.dev@gmail.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: raspberrypi: Handle cpufreq device registration failure
Date: Fri, 18 Sep 2026 11:41:30 +0700
Message-ID: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of platform_device_register_data() when
registering the raspberrypi-cpufreq device and propagate the error
if registration fails.

This prevents the clock driver from reporting a successful probe
when the cpufreq device could not be registered.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f1a99de6de4f..9882f243d681 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -553,6 +553,8 @@ static int raspberrypi_clk_probe(struct platform_device *pdev)
 
 	rpi->cpufreq = platform_device_register_data(dev, "raspberrypi-cpufreq",
 						     -1, NULL, 0);
+	if (IS_ERR(rpi->cpufreq))
+		return PTR_ERR(rpi->cpufreq);
 
 	return 0;
 }
-- 
2.53.0

