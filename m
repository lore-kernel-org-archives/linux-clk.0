Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C501990BB
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693486; cv=none; b=i6Agw+NqwEE34PT9M5x0RDCRvRSs2LV33VrCWCZdNe5gonWHjrmEriSfhGBSJf5gEPHVWOmeRGyhGVK6PSMedmxQhvKgxcjTRHNlAjTBbJ2t9DRA3RaXSIjMu+A5teYEZupSwtfu8zulpu7Ni+Q9/VcVZaNBVNwk36qEj/J7LS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693486; c=relaxed/simple;
	bh=QTmsTIDi7cKHIzyRh0s31HScPPVZAg2pITfHlR5Hw1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pY9NhFy/WS2Jd92/JkslPEJ/pYNWf/CzJgYnt6R10HPf1fFOrfJbH8C4i9Y+XbFPDl2SJit69BTPayQ5x4O2mku1DBUplsh+zazauJDdhBrktHfY9ZyEN9xRxGqx6nKZphu493jdkVhlxf+zBNPvw+0uwab8D95KrqO9h+SlOJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bUW8wJz1; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bUW8wJz1"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5becdf7d36aso5137801a12.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724693482; x=1725298282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biOUpzjklUMw3DeHF9ZmoaEFGQg/45j+i/IYEf+/2DU=;
        b=bUW8wJz1zrX7dPe0/eoqW/d0gxEG0Z0dt2Yl1t7EhnpvaWm+Si2YW6lbTqzdTejivU
         MhaU1Fu1MX6I6Sxq3WTt9GiQeJqN5Ly08qYy6UbDDnZLO/ES0F209Bcj763LK+hWqRkx
         eK1Zs/WFnPTjQL9xoEfePGXKuSHUY7ZUvC/fhtT6YlWCzxD6ydz13SwM+7R25q+HqH7Q
         Zr1sn1QRaE4olMnhLC9KzWlJMqcNOosCAdVc/oCKcakfQZNBintCaGEt12bTvl6m5tfG
         9W+sKGzijiNB50bW4zGlyK0Kj3uGAd+wyuvg63khQsEdl5MEtjAqTk+wiWhqq2bzKAUy
         z42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724693482; x=1725298282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biOUpzjklUMw3DeHF9ZmoaEFGQg/45j+i/IYEf+/2DU=;
        b=JDKFQ3BSV9icWZVC0qbdmd8a3wPHzG8l2IahBGBUVcI8c1PYFYwFpw5cdYeNeIF4Op
         p/rN8vUYSoq0vS9xmsADPL3Mc1eioLLdgK1JVaMrTwjj/LhMI7lW4cw02Xe5hWY3RaDb
         BLIu2GIbTQ6CKkfCvEII0VYs9848VKjJeitTgk5pFHsZiuHL5ZUk6AQJ899nVeIt8Ti6
         xn8i2njvx17vXIp6eiscyflfKHxdusrzbKjJQaEgfe3m80mmMUGnWbg0AXRzTK3Hsqvf
         /F2oj/EgMc6tKNakOJm5p3no24oqGys3XFB+gvs036PQ/781/OqoiLybn1+29NkI3v76
         /aEg==
X-Forwarded-Encrypted: i=1; AJvYcCV85XQ6DT+8cABCHizN7qvwnsIcwRVKdqd9S31FLYNEDYUxDZXC/WsvUe+KwMa2I5yAE8tJ1wj0v7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2x10qMgjHYMOoLJLuot5duZotWNl0PYtq47W27p5yNPWHHD2
	yWrRdkYxjF+jSsYyQlQPzDRThsyfOkgXGhCKkpY4vi+mbhn5HgXOTY8vlAnbCmg=
X-Google-Smtp-Source: AGHT+IHerndDsRmrDan/43wV4cMl++NdUbzuQbGoEd/HEOURC+hfMLYMkk8BUPcq8vD5t9RBTqrNoQ==
X-Received: by 2002:a17:907:6d20:b0:a72:6849:cb0f with SMTP id a640c23a62f3a-a86a54cf6c0mr651740866b.62.1724693482233;
        Mon, 26 Aug 2024 10:31:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548781csm446566b.28.2024.08.26.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:31:21 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 1/3] dt-bindings: clk: at91: Add clock IDs for the slow clock controller
Date: Mon, 26 Aug 2024 20:31:14 +0300
Message-Id: <20240826173116.3628337-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826173116.3628337-1-claudiu.beznea@tuxon.dev>
References: <20240826173116.3628337-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock IDs for the slow clock controller. Previously, raw numbers
were used (0 or 1) for clocks generated by the slow clock controller. This
leads to confusion and wrong IDs were used on few device trees. To avoid
this add macros.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 include/dt-bindings/clock/at91.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index 6ede88c3992d..99f4767ff6bb 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -55,4 +55,8 @@
 #define AT91_PMC_GCKRDY		24		/* Generated Clocks */
 #endif
 
+/* Slow clock. */
+#define SCKC_MD_SLCK		0
+#define SCKC_TD_SLCK		1
+
 #endif
-- 
2.39.2

