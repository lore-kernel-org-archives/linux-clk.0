Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A11ACDF2
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022980; cv=none; b=mj/jIEMsKokosT2nmHhbJtP9j/w0nRRIRaXvs5yYBJtssTltnGIeOHiFLQxiYyxxgj9zMEozbYNrdaawFqR9zmZ6bMJ9iup9z8WGoBKpW6PNLIopOk6dtxu0e5+CVTNPlvrAn+U3j6dlTissjicwJE/W4Hy/ud7+f+r0c4nZWSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022980; c=relaxed/simple;
	bh=d8WVePSthW+dxNncbWzycUowwJpITS4AMD6P6eg6HFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOHGGFUxBUwO1jzMW/KutFN7cJKjb/iuN6KnW4I9j9XRFXzDwxG213ArehTsl4qkBwbSIQwJjncnJCGtiWe4xuJPK7Abevc1I0wxjvFgQgZ1egxNv7kfb0UZGU9UXjkGNaF2Hsmny+1Nte1i65PfFMy/XXkw8nQS8RNQcIGRJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cESEC9vG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cESEC9vG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso20040905e9.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022976; x=1725627776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iop8qqO9jUR8G5l7F3wNru9rj99Z66kVWofgsuIec1s=;
        b=cESEC9vGQf1G6itm3a/lOG0+UjmBw0Nk1SegWTZQ7FTJf+/g+HKpiDnxAtQeWRfbUC
         CT9kjOIOG3BzZrAqqy3X0cwrdqsj51KWa+W0SgHTpbR+l8mCk1sOT6LwShlwGLI3zGnW
         vY83neW2T9V76ghaqUmte3jwKue9NW+f5LpE6Pp34tpWGe7WjfQnQNY6htOJfhxO11kB
         PL81/0s44UsRGg5zyXPtiRYAEti8CYMFYbofSrLqAKaLy/Gp8WZJs2eFgnXVrvLROulp
         Jszert7N+MEJ3TZZ6vMJStCSP/63uAU/f/TO2q62/PMmh/Vnf1FKTLMvB70f5Kiju0Qo
         u+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022976; x=1725627776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iop8qqO9jUR8G5l7F3wNru9rj99Z66kVWofgsuIec1s=;
        b=Q55f+yo0Pi0hVrC8mWbGG24J0ltTBc/n1dzLunaHJMpJEFZ9aM8mRtZ94UUEE3vDdp
         v+DSYdjZVIq0V8gTMrxBwd5Z5tGbxUISqxZLE6sHvbGBtyqkgYKXb1epIDXfSZNXSbqT
         MWWtIVUFRm+XIyHig2MVAhEfNe/9PZUiBrd51dABvvLX9y/JTdAkhF7x7k4CZzugD0tJ
         gI5B7hcxti1cNWww3HQ3nZxkQ4XrH5MACprXENqMUyHufzcUVYqhqNw/lXdFL56Fi2A8
         jzHOmBy9w0fEzdGspKltJcHstwxaRdf086Y10S2juVRfodGsbKeGxDptBnHH+BpEj0lW
         1Oug==
X-Forwarded-Encrypted: i=1; AJvYcCVBqukowWvaB25qctfGs+lZ543Wkk3Ko8NJvTS8NyMWcNk95tezo3go8aBkSw94fq7cLAIBHQozx1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1rueiDSyUd+RNMoYlYdQTE3xb3QbTWPC/ygt2VMCcCiPh39p
	yZ7v4eSRvnyf/5xbbg04keNexSBBb/uTzIjiq32u2Z60VwmezCHVWxKsz7myOkQ=
X-Google-Smtp-Source: AGHT+IFISbcD0awVc8lknv+LxPpsY6H/AUOiGEDJsMkyVLmTSYhBZOirNNAhX9KU4dogrvwFZ9Xx1Q==
X-Received: by 2002:a5d:5351:0:b0:374:ba2b:4d1c with SMTP id ffacd0b85a97d-374ba2b4ea9mr332013f8f.31.1725022975647;
        Fri, 30 Aug 2024 06:02:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:55 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 12/12] arm64: defconfig: Enable Renesas RTCA-3 flag
Date: Fri, 30 Aug 2024 16:02:18 +0300
Message-Id: <20240830130218.3377060-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable Renesas RTCA-3 flag for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 465b70a06c33..40165e06c98f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1215,6 +1215,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.39.2

