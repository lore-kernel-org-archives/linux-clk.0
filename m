Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDF1481A96
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995500; cv=none; b=VkrE52ATI4XscvWYvzo9WoKjA7pANleN8tG5oNZ78DmS+98Wa8ADGYbxV8F85pQ3bYwD8lAvfHE4PeoOJu2Vwvl2veRCFjTqTCmkoT7+Ci58e5iLr2FbBsKW3faKraN+5vpKNW5asexqjaQMgqxi2OJ6vUermCuZJBEB4b3DLEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995500; c=relaxed/simple;
	bh=xos7in5Tx5zjrpPU8l6pvfEG31w4lotqHqq8+a6Gya0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKptK4IXraOSdOGvTI1Xhz9l3lJFMc/Jya+BeHw2RINwEWFuJD4LlN+YQDWsKgK42TWPk7Shq7+pc3HyU6XcpxTo5jOM/D8BwrI7KhYBFulPvgcuNe1Vg2C/8Y/JoHmTVHyE/1rJOkgrH3XFqLzobdU41dJoSK3CBeRCNGNkR3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLMsQTMg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLMsQTMg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso6809225e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995490; x=1783600290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSc0cDIDo1ZXEmAON/XiNWuduFFW8ewj9EMw/32lW/w=;
        b=tLMsQTMgR5OiW254DFThrfMEqVwgSv5X9RP7E926YGgn8hZuU9NbK81qi9+uln57TG
         c9WXWuYBgnx9JwFHT1/i3Iq/o5cnwnO/bJq5dK9Jms9NESE/zdtJaBSbQBBHdbUUyOkX
         iiaemvBSLgqoGYS3/WbF4h1LIwzHv596J2jotIY/aSP5m/8jQFT1iEj4psEJpM2riYLt
         YiMGfe+SvwUqdpVh9e5iqiAEVeKbpqY6/RUJcCB5eO8FzxY6O+Au9PqL0FuXwVz92GXB
         u/K0RdSIfbNdLAOOQO7TyJu1Vt09YrA6Gcnp9eZa5eh4jPpdGP4/q1aq/q2UTofrpPLu
         9e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995490; x=1783600290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSc0cDIDo1ZXEmAON/XiNWuduFFW8ewj9EMw/32lW/w=;
        b=YkOU9xsFDK+rj3QnjfXdggGKtfHqShRmgzgeNVwFC3k1zqN0QmRBFkKnmMj7H4eBKu
         QjDbdrSdaK6rECVBFPCKiTwM8xrjf/mXmc9+hYeS0kDq3LDTyVGHv0cAh6uWP+mZuCZv
         qiuH/tFAAQmR90ykzI0N1zIYwURnr8CyKJCgBF8MNmfS/uo7/pbY8KDrspDG9MPPNoXZ
         f3zzgc/meAurv6nxVl6tLqTItTvopglzewG+DEnceTvcoehEstmdjkGC91CGyQjwx3cn
         gu+i4GjazmeGE8lKIvVGAA6LvN3SuQBbN3gAAiB9tuw0miGkpLE7EtJEFx84x0W8wbqW
         85pw==
X-Forwarded-Encrypted: i=1; AFNElJ8WOFH1fbvl90hRO/+p9mDS45ESIL2npthc6JlkOxBEUBtfU04PovecneRWWmA74o6g0Prq19R6jvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBe14JoPzzwaby3Y/W2Bwmi1s/SlizL/2zYbq46hyWo+VzKusZ
	ga8YBFmlqev4PnfE+GpTni1I67WkaE3loSzHhmlE7+qtNVx16CXEFzKp
X-Gm-Gg: AfdE7cnIxyFldvWm04KBsgCjwEBi/Y8tn7+2i6SaeNB0mIMjO8MzCz53qoiSzPM3vjJ
	Gd5cXX7iw8x4gssXvM1blnywwbCuK7jQpmuzwPBZ7IReQEi0zy3ovRXSCp1CHBwyKPfgFoR3UCW
	cszyJ9BAZJQLtEglI7fnCcgmY6yO7f6VGR9hNRLpBoVxxksxV3GJz4JGuXd5drayoYuCgygExpo
	vPfkLfMahrNrLAZr1w1dv3fXKbtrUwrzBfzkiftPkDoKv/i+K5FPxBgf889Y8V6oY7nDNHrIdXC
	Kl6J6cXCbOTHWHwcsLEEUw1A2Vm2iWOnUU5NucGZN11ojsNLbo++kKM+XVUhiDHR5UUHHKyq4nD
	a3emMjNhUeqQ1oLmVUDPcKGz3Eve4RDcAqOKSLeo7nBgHRCErckB0vbNmfBvf9kiKwEE+3YJDdI
	klKi5ALLYIW0pfMc3bz2Cb3t2rYpB4uzTyWqAiLi5xiqkmQanVBuGtKQWYG66R3q2WouN6w/azF
	bsd4asXYCiJFX44zLbT4ITKKoPPP4MpbYN8PA==
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr102965325e9.15.1782995490018;
        Thu, 02 Jul 2026 05:31:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 6/9] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Thu,  2 Jul 2026 13:31:09 +0100
Message-ID: <20260702123112.161160-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/watchdog/rzv2h_wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..e9545b8f5fd0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,26 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool start)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	if (start)
+		reg &= ~WDTDCR_WDTSTOPCTRL;
+	else
+		reg |= WDTDCR_WDTSTOPCTRL;
+
+	writel(reg, priv->wdtdcr + WDTDCR);
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, false);
+}
 
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, true);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
-- 
2.54.0

