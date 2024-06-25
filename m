Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267C156C68
	for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317670; cv=none; b=Zn8eulFUeE8zycUcB7cwRwE454MhZ8G28o9s62gchF62SsDxqgTB/PcKqjxIlU8ozX7yezrNohzns+rVNinQm8y95iK5HTGO26VLhRaTSXbkDqQd/nzzjA8ju81JSKw+qvC2XSygxjCJ00rYlk+XjT3iqJD2Ccj7cow3+dltDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317670; c=relaxed/simple;
	bh=aVioSRzJqXlczjHmYmBjJBu7oq6xmwTohrZmb+gYSbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oCUxRz7mEKnyiu2bEfJR5bMnzHKkQGzPEMAOfZVEeSlDFXjne74ES8YZ1wT3qULOd+wYw6bc7yDzEtOYWewqxgHq2kqON/b7zg/CIHJ4iRXFPMxN5REiS+GlwFeKPVblH+kMOUPaOCKGs6Ppy6be825DN0ETHrVwsJGu2wn+7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CLOglOsj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CLOglOsj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42172ed3487so40770755e9.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317666; x=1719922466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3mhaGF+KU5yeMisjPIARpLxwyj1AMM2/2N+WRoELhI=;
        b=CLOglOsjSD93t2ALtumKBY822qS/ALq8kVsKTFR6+BgXCwDb7ucCy6wJwQRr/Prmus
         5wnjEdfI/0MdBNRhHyeDP2fMmf20XGXLH4eHVFPU34A42Lv1emuW2WwdzlnOh4EBhjUb
         2iP/zyev7mILSvTRaD1rF0H04o6k30C+6YFP2+Q29i1XRIv5okEP5brmKVnYo6vWpnDD
         VloHNlOmLc5RnKf4x2J7wAqwc4YcQf3bIATdXt+VJ9JXgA+YzFzYK1UaFBjbQa1v3534
         EAJL35whdUwQJp8EzFJEZtReX8Z7SKknUl54dhPwFIg1S/nIzEzHnaG4rhDAMtM3Etzm
         iXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317666; x=1719922466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3mhaGF+KU5yeMisjPIARpLxwyj1AMM2/2N+WRoELhI=;
        b=gHloMboz0rkeDmDpvZIndDQTmT3Hdj0U2dYt21UUTWK6JlTVOEgwT/VsD5/mEsll2R
         UaImcYbCHdM15EDP3iDCmabC9VdBKbUJwV0q9vSHcIM8TG4qNsSAffGJvBjXelNIGLYr
         BqNn1VVrvW+xIH0IfpJpzA3AcAwveKG4HwXPOylomWcuxfZcQHzI36iscatto0fTIZXT
         jEbUFuDUP3Xqvew1mlT8gGKp+mHFdxugC+ouK311REJ4DfGuGwei0HQJz8ildfro18ql
         0kjVVg2Lx9Csqukfy46umtYrPgf7SN6Y34/sT0tcHiTKszzTrcuIjgROJRKrvsfSIVBB
         SyUA==
X-Forwarded-Encrypted: i=1; AJvYcCXmdBBBmzcTjgBeYKdQmBc4dK/T3HISD7ZpZHskRK8seIP3fNBcal7QBapJfk8Y6P8tOWQDdVv6kw3FQcVQOgpFMhBcZ4tHzB3V
X-Gm-Message-State: AOJu0YwdKi6eQbBtNeXJQCATJfRTCYoFAaPnHCEXxWgboB+0sqj3AIuY
	sR9cf+4R/4Y8Us1gp1aTb2/4bxkd54Y0y/FMD7Y2f2Ul+74plD6rXp2azMbL8n0=
X-Google-Smtp-Source: AGHT+IFK5iuAO1YBTxjhIGSX7Q8KoOhjQXwLGyqLocsV4KY5Z057M7ZH3/y+fDPFPY63w1kZ1xsu8Q==
X-Received: by 2002:a05:600c:4b1f:b0:424:a5d8:ac83 with SMTP id 5b1f17b1804b1-424a5d8acafmr6070375e9.41.1719317665539;
        Tue, 25 Jun 2024 05:14:25 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:25 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 03/12] i2c: riic: Call pm_runtime_get_sync() when need to access registers
Date: Tue, 25 Jun 2024 15:13:49 +0300
Message-Id: <20240625121358.590547-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to runtime resume the device as long as the IP registers
are not accessed. Calling pm_runtime_get_sync() at the register access
time leads to a simpler error path.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c08c988f50c7..83e4d5e14ab6 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -301,19 +301,15 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
-	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
 
-	pm_runtime_get_sync(dev);
-
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
 		dev_err(dev,
 			"unsupported bus speed (%dHz). %d max\n",
 			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	rate = clk_get_rate(riic->clk);
@@ -351,8 +347,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	if (brl > (0x1F + 3)) {
 		dev_err(dev, "invalid speed (%lu). Too slow.\n",
 			(unsigned long)t->bus_freq_hz);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	brh = total_ticks - brl;
@@ -384,6 +379,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
+	pm_runtime_get_sync(dev);
+
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
@@ -397,9 +394,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-out:
 	pm_runtime_put(dev);
-	return ret;
+	return 0;
 }
 
 static struct riic_irq_desc riic_irqs[] = {
-- 
2.39.2

