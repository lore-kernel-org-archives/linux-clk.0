Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFD1E0E1A
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 08:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327697; cv=none; b=lqrnRPRM7bunB7eXQMwUwoX4XDYw+CZJ+e+XLXjWtggD0WuI/h+3dKylaneDnp8VpgTkAD8EZfMgtsh9bvEq0J6uAl40i41rk2ywRQuaHUmZMw/XoZv6L1xUn2DSIlFY8zchnXF+30t1ndJFD7OoNazx88pebzZAOy9TsCVyi7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327697; c=relaxed/simple;
	bh=8GAcD1p4qmOxAT6LKl7/yGsIxlJCeks3lmvdsRJmH8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=usZyo+cfgyPn6yiK0OIyQ4aVvUTI62meDzdjQYLjH3DMF6oI5Q6udUDzHMWTzMbWlbeVqyhTpLCbyqyGgAKuShkkZGQhBO+w7GgioXyFs1ZSe/bGnxc8QObivTIrKLb0KKo3rH+aZg4Y8wuyd8PZlfjV8jqP2lVu3uMiPP0xMsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BDMnWk26; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BDMnWk26"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43159c9f617so25384695e9.2
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327692; x=1729932492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR9u43Hyk1vIKlajLYqnwdEXv51OaTqN1pUoQT3Fdw0=;
        b=BDMnWk26U1NXmigmt9PPdQJsjydfhPNLC20W/rjKSc0fdXeT9HE4BoXu7dRPs2i4MD
         188C70Jx0VaAn8l/X0tc8qti3Ws3KxYeifODbCtRR85A23/AO5etkJKMbrDRSh+Ec8yJ
         8TmbGHAd+iKqXTIR5GMRPWcMbRLxZT09JBUAQiFeH6PH0MBlhTPW7u9ZSXi/5MKNI65c
         n/eKzY5oPCD0FqIXpGm3fRwnbAD0YiTkMvq3AdbAYkDFOrYgm8L1dUIaKpdTJJTtny9h
         rRMHpaR6bVo1flmmo2xiDMhlwSkN5UkMPWLbhOHKD2BG3VDOlUiqphVfvcZKHnw0eUqp
         93wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327692; x=1729932492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR9u43Hyk1vIKlajLYqnwdEXv51OaTqN1pUoQT3Fdw0=;
        b=mqHw7jATaCtCzJoXyWcfnO7mRnFHVbScRsgd8Xgi4cqRNK+MOqfgj9vmoxr/RVzU4m
         SVNWdTs95KtIlZ0XowbtLxd+tl/8f9QbsQizuf+dLqLhNGmFCfPiEoUP7d7i93mTd29d
         fBx3YwNAGfr2JsUSDhbTn5ErT+M9LH+G3rGb2/lg+KYyhPTA3tOAhOhe1OPNMFG9jvAw
         YERr/QfjK+rjKQF0p1aZ0yvEa0ahoUgG+ZQJAwy0OG4jtcZ4+C0qKD/URPUYtdGS63dI
         H74BnsWLOKYVxmQCD54Rk889QJJDD88pKfFCKDzIB/o8DVgZZFqvQ9EDlsQFMjzcd1U7
         xq+A==
X-Forwarded-Encrypted: i=1; AJvYcCX7qFPnsLPnhmdHhxoojGdrz5onLCIXd4wSptYgudDQiIaMtMaFbV1dOZibkN459++bz2HHXPBUKuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1XM28Vyw/F8ZZXmS33rxt5w9nu1hyqvzK4j6v6uAQtaKBMysy
	/ARClpJSy9zGt1li1e7ZxwwgQ0hJ/5ofW/R9OKXVqpWlSRq/mxGP+b5+hf1pJ4c=
X-Google-Smtp-Source: AGHT+IHsNssw3nPyESTNLOiP+9Mlv4+US3nWRprCJSeU2x+CacNFKb3J8zoQ9J/1GgCM0O9zmVhHzQ==
X-Received: by 2002:a5d:61ce:0:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-37eab4d1227mr3498805f8f.9.1729327692261;
        Sat, 19 Oct 2024 01:48:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:48:11 -0700 (PDT)
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
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 12/12] arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags
Date: Sat, 19 Oct 2024 11:47:38 +0300
Message-Id: <20241019084738.3370489-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
the RTC counter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
- updated patch description
- collected tags

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8067bf051377..e3252e24bd4d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1216,6 +1216,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
@@ -1362,6 +1363,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2

