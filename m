Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1141607B7
	for <linux-clk@vger.kernel.org>; Fri,  1 Nov 2024 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455065; cv=none; b=O90Vb0zozY5KL/P23fndcUgarbEP10KG9iSSxpQzD2MTX9pS9WOysN9qWOl9YFNtGK/1P7qk/xekIyz3+ecyXfcu91ZNLV78e+yTveEfgpzepKAvVwWs1yh7+0TL+w7bzrim5o5lhI3/IzzyWU3DPpnjTA8Zhm4kooizN0/0ZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455065; c=relaxed/simple;
	bh=S+F2FkEdi2w5OLkb2FF8IDO/kgC5BfFXc48xK0PQxEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sjqTBtDi8hNfyLFVNa9onyL3dq0psmg92bRsX5GQYBSzCU2y5oinriyPxwNOmOnF9ODvpPcY9jNLf7MgndRlmJogwbA4ZV+6McKKgRKETZK4VTt7OreHcy/wF1HZlf1/KYbAEErWSNOj02UwKk5VaiaVubWAuz1/4o9pkzSMknc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YrXWyvte; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YrXWyvte"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so2448994a12.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Nov 2024 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455061; x=1731059861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=YrXWyvtemX2WGnv5ubtRDUhTK7QTIqTHAEEtO37tJi3TGtO5qMEHccZZIU4b1rRixV
         5KMAy1JPN1GjnLBcAEam6x/+cNejTDUnRnO09cQ+9A+LmSzfFX5DYoYXnCHiS/t713ZU
         4s1mfJxgD/VtMt6DC88DOmF3HLSRnG7uvnHW3goK7tqKhfhQkBY8kL34Obu4iMFgHgQm
         Md3YxmL6GNYahpg7tlG83y/vP3vKFIxeKrRZF2kQ62l0qJdk9+6xscRMU8+R9DsgxqfF
         kQvnKTrzUP9Qu45hBJzBL31OQXGynjYBW9aQXwmicpExEbWPb4WMuf0A5DeG6KC4N6P4
         0wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455061; x=1731059861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=UOxB8QEU0f4++zV7OYBEYbdEsObPBSHgRYX+YdEtM0XZvYqun4QHwlH0XWkkP7BRUs
         ANVoR82NP6HG2YKlBcqOGlR9fiAbvw/f/KlM13Am6469nySWkH3vL+j6MWurD5L7a9vo
         Xm79qAYV5STzZ8Plphz5tg4T9q9aJQDZRNk5jp0Y4V1PP8wtVYyC3C9rgeXICYobNK3k
         PZLtQWK6vHrcUIkWH9hKnQlQHh5jOLmnW5Uoc9VP0U8IpuDUsyy4FXHWQkAkiJBuTWbB
         vQ0PQCCRtoVqkBtEW9KKKZqbSJbEiFxdATklVdGm1gRR5gcstTaQSCwg4ji2ZyI1iZ8h
         E53g==
X-Forwarded-Encrypted: i=1; AJvYcCXH6nUe6f52spnRZ9Bmnw/2AAkkL6JZio31fnHGU9kDZ2X0T7r5Plk6g2bYKY66vJCT0XHIt07TKCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu3MvX847OJaG/NOC8uUudFeScAPFCCL5C/jA6DeCeyIgykN2r
	Hb1FuX1eX/gLSNaWeid79QsmW79r6tGlW56d7jqZ+25WC0ur77S1AttTUjPHyjE=
X-Google-Smtp-Source: AGHT+IEFGiN/u4W5r9i6MtaqopU2l9fL1FFrDwTz4s8iqC4tcmgZL2qm6/VdNeHlxydCj5OuRaUwEA==
X-Received: by 2002:a05:6402:350c:b0:5cb:69bb:ba8e with SMTP id 4fb4d7f45d1cf-5cbbfa78a8fmr13489266a12.34.1730455061093;
        Fri, 01 Nov 2024 02:57:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:40 -0700 (PDT)
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
Subject: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Fri,  1 Nov 2024 11:57:13 +0200
Message-Id: <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
devres managed gate clocks providing struct clk_hw object as parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none; this patch is new


 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 75444e250a78..a49859ef3304 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -622,6 +622,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
+					    reg, bit_idx, clk_gate_flags,     \
+					    lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+				    NULL, (flags), (reg), (bit_idx),	      \
+				    (clk_gate_flags), (lock))
 /**
  * devm_clk_hw_register_gate_parent_data - register a gate clock with the
  * clock framework
-- 
2.39.2

