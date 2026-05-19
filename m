Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6059723F417
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 00:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151210; cv=none; b=Ysgz/8F/2U0DSqSHyLZHFBAcPqybg+pEIEb366+U+BsjGyheK5VHnf8dqv3XOoOimVkX+SL/oU+jZGjDU8VM6134LAW8bDSP4+wCDYV22jwObV6xDPLa8k6VGJSn/V3MsinR0bESov5fE6rF8VEzuzqJzf3LAF1m71gry5G48yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151210; c=relaxed/simple;
	bh=sC8htZrcfJEvRMXc8wv3egJtmeaLsQ3QudQ+ojdiVLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ehu5Odj7bVVNrOQncko+f86cLG75615mgwJXJkT3WMXmSr7Lo3MIm/9bFTyOoBRPWV7m0cpIc767mvPSfUSjgLZAaClKcydOuFlwpRjfMvowMAS89e2p6o3ptQn3Vkg83DFZRte8AvcQi9g5tS2jDpYDmtm4Hrf/8u7Xr+CM5Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuopbKZM; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuopbKZM"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8027e876fcso1194123a12.1
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 17:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151209; x=1779756009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=;
        b=ZuopbKZMj3PxJRzFSot3Ukb/mayTFjEskfdghvdgd7gRTNzt8CvbsZ8DZrl+fFqQTC
         Vrz5tjH6czor9uvfRaVkoRim0fNe4hEzNSbnUBm5KAwU4PIy5EAMzF2jOQ+z4ody2RU+
         1xMHTRcS/s/IUUKmW/N6I7TspH5QTNNGthPy9mNrkBNJkxhMt07n+yLJYM31+caQbyAp
         uKTg6uGQFDiR7OQnOoVaYOmRsB3Z/OH5DqSDdX0UWJ7iFPLM3i8jlb1RMrl7fCVoSv9m
         7z9EpsZakY8Z9lnvCxekrUr1e12RqFKK//086CdVgeLqlma4a0y01M2wdLJddex1NbjG
         tyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151209; x=1779756009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=;
        b=tDuTPtl63WbG8NRHkwwcTbkUyim2nQjtLbqT2buvHbKgCoz/WP5I4gIOS6C6bGbGpr
         MsbzZzhSIHEfzlf3Ilg5iBoISkvgngmropCAFy+/Erqb+fJeeKxqnO1YeYfbd+DA18dP
         PjimVAwhyEL90sr8jR1rmRSLWss8YBzBBgA3LHi1ACUdCHd97UNWHDK6jUBJaV8YqwCv
         5p4Or/V6BeJRf6vL+/gDtBjT5LyEYgGMvUuIus7GTphodtNckVY6tBsiXCn+GUI/kYbB
         kpWlmWQgk1V7Z7gtPcyJSUyGDE+IrXmsfuXqVkJ8G0wvq2hNfPXcTMLIfRDBy5qDXQ+0
         QuSA==
X-Gm-Message-State: AOJu0YxlotExforXr/jdf7MohkL3iOl8JIVahtQmwWACAyj5nB55yOxa
	cW8k2spvr6L3fNXDHjytH5FB8qBfXvBBJCL2n/yELdQSQGu3L+IhN+Cn84SzEctT
X-Gm-Gg: Acq92OEME5skI6Bx23N0HekD/Rl2/V/cFD3B0T7GhGatEHPeWSper9Lxoqb5NgOIy3a
	CEOnNQZjzP2fXMggZ3cLfXJbJlRY8EyeRcunZAPmbhoq566LmQGqUZYzJ23S5T0lW1wHMWR9efG
	c1HOZe9ExtDcBb5ibEclttHQUj+wUzpkLHsrCfE/r+jESmTLAO7QFOEXIAftBnnFiQTziOd+Stx
	O22W9AdiiTe2dPHEb/bXIITyB8JLGQyHPKYpN3yr0/OJ724LIxzE6F/PjJrGzoYbjrTYOAu1eGH
	e4hMen1qOOlHgSZQWyiD3n3gnGSoO7nKs5myvQLgusMt8N5ekYRy0Tp2jEddYX/gd3Y4eyUUjMY
	dSkWf8ZFzq1msx2+NhLjqqrCjDCNylndUxJjcb792m0Pe2htnDqxVkkI5U5/fpOWpyt9Vo+lT4U
	i1fXVnn8p/doUksxacZihSpi8u2D9ienSwjWFXb7Ycet/fZZroMdZmo8OS6+tN6RH5ZgsCx1Vmi
	avSmd46s4VKqoEjTIQIe9fSCBJpcwaYFhuJDkvJ2Vw53A==
X-Received: by 2002:a05:6a20:72ab:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b22e6685edmr20892462637.2.1779151208559;
        Mon, 18 May 2026 17:40:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062695sm14473479a12.4.2026.05.18.17.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:40:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Date: Mon, 18 May 2026 17:39:50 -0700
Message-ID: <20260519003950.626727-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_device_get_match_data() to fetch the RTC CCU match data directly
instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..a3cf0dde05be 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -9,7 +9,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>

 #include <linux/clk/sunxi-ng.h>

@@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
 	struct clk *ext_osc32k_clk = NULL;
-	const struct of_device_id *match;

 	/* This driver is only used for newer variants of the hardware. */
-	match = of_match_device(sun6i_rtc_ccu_match, dev);
-	if (!match)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return 0;

-	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;

 	if (data->have_ext_osc32k) {
--
2.54.0

