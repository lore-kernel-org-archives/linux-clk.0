Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0BD3D3CF6
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924714; cv=none; b=hi42ax9ndaJm1qiF5R4oEhpCEWNSwYgvZ88LOCTHzpP9+fQvEHwaRbn7shZSfbe6M91o9s7O/VNc7Gu5PVklmfkfqlSLa4H5X8CsyGhOan0w1IcZKFwXuK1u/OYu+S/TN+t/Dp2A/EGx9I69vRxostupUzJcxgOonGN5V1pbhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924714; c=relaxed/simple;
	bh=p1Dy5QwacmRT/b3H3p4y11qC+z1schtfyshS1B+/Zb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmk5QZdbSJgdB9a5tK/Ep0xMqEReMrADHv+awKKxfNFWtKUnTqJxolsRaKvcDcms1wy1GtvMc/qFmENiFJIHMYFEb+f22YD6nz9QnoX8PPZnk27dMivoRgO34RVigCbfJ6nS0oI51nVqONHzSb/td6GPcruUlskp2EE0lVPCfYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mA1lclRx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mA1lclRx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so652899f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924710; x=1774529510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpin9fgTSd6+Bb+khmyQR5GOT1G9JWW0tiZ2kKEgCN8=;
        b=mA1lclRx0l5QRBMUjfpEfV5KRNAmF2cRlBKRUK+Fq5EfJ2KlfZEMiE8IjzIc4WSBFX
         te9/eeaqyuV3WhZRRIrXarpUIihqLyg3MNfW++glTP5veO0Yo1QdsM/Y8bjsxtC7+tsP
         sLGX1nabOE06/erqET9U1G2SER2eMoIRKVepa4U/CM1FQ39ik/oMYqWKAkD6GyF3SlB0
         +l+OkuTI3Ab3GvFTpnJqcC4jJU/h2gnydNjWrc40c05HmOEWjJq5QfwA55XkL9b3qgyX
         SbT5FKWtzMWZvCnLj3KYTWMT19uEkDfAC0tyac9InmKOL35uTvY+s7jeSIHsXPdIg66Q
         rIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924710; x=1774529510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dpin9fgTSd6+Bb+khmyQR5GOT1G9JWW0tiZ2kKEgCN8=;
        b=E5yNQeOP5eqXWi3r/R/gUoMHXrhHpiYKvzNBVfyVx+5Jr64eS/TGXodxCCUIIHkqCi
         4i/9m7n52twrrKFJGFYF50B/0ql6016LlOORQSSgQSmaNPQ6Yol0eQmiCj2vdrskoZoH
         GxRHPM/qGPUdHl5/QHuKYfG7coFM/cZYRyd9hpwDU6FJQy9Inz7INVsuTZP2XtATs5bp
         wgNolRzFMsy9ox2YknYWuF5sH0h0caaak8eqVBsulhpHQ7Ci/NJUFay6Oezxe7kgAV5s
         q3GvaBhMp+3LIzDM+QReaArDtDtnsc0A3ATRzYw6rco7RLZP4zMx42OiDYlEyple3xlz
         84dw==
X-Forwarded-Encrypted: i=1; AJvYcCWThpED6lJW0jeqnW6YIh9H9E47unVN5p/POF9KrPPKZm8xapowamQBS+MYvTXdHP0BehOcZBLRGz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSpxHt+voDZtSBqQTX1MY/B/AXzkfJmgx0LL+ajzTD0BqyKVXW
	qa/MeDdSAGq1Y+xexE7X0oyiRdHZPOEKr+C6argmOpGTJPaRI6d12Lbr
X-Gm-Gg: ATEYQzzF1VdHGKeUUcp8ciD09mQw1TAvj/NWHt+S+Dx2Avhk3//QxkyMvh8NMyFmyk+
	Hbx1NhJN/8XDXFZ+mbn1Lldf3RZDzvpElnwRM4ra8NxoJjWVlU3+4xUvIh4EtRIwNyh5XNzKvID
	Nbhf6PEk8II841OAFC9m7gkC6wMJPPHxFhxi1BEv24ZRO0hC8SAT79O6j4krM36QIrEStvh0XTV
	eJUzAV9gHreva8X2p2VSxxwO0H2x5OW1YrLb25Aj6RRUZ6kQS3Zd8QCzgYSEq1fo23V0Sf3F0n+
	DW9xWu/XpT23yn2gM1mmdIwjUchOxncQOP6ieHCRdg+HaqFm+k3Sq0R4fIKCoJQr4Gnr0g3GrEq
	uBveVttJe/Le7DY1y8icG28pkMuS1k2piyYoLFtL757zlxDbGEcnDdlWMYRuNw/YTDebFKzx5Id
	t8rayrbHepjJ22isHf5HIrBbNdoTP5Uzg=
X-Received: by 2002:a05:600c:4e42:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-486f446359emr111081835e9.29.1773924709573;
        Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 04/10] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
Date: Thu, 19 Mar 2026 12:51:28 +0000
Message-ID: <20260319125143.230377-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
decouples the logic for setting module stop state on disabled clocks from
the iteration loop, allowing it to be reused during resume to re-enable
critical clocks.

No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f9e4af7f49d0..b68b0312f0e3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1586,6 +1586,20 @@ static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32
 	return NULL;
 }
 
+static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
+					      struct mod_clock *clk)
+{
+	/*
+	 * Out of reset all modules are enabled. Set module state
+	 * in case associated clocks are disabled at probe. Otherwise
+	 * module is in invalid HW state.
+	 */
+	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
+			rzg2l_mod_clock_module_set_state(clk, true);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -1595,15 +1609,7 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 		if (!clk->mstop)
 			continue;
 
-		/*
-		 * Out of reset all modules are enabled. Set module state
-		 * in case associated clocks are disabled at probe. Otherwise
-		 * module is in invalid HW state.
-		 */
-		scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
-			if (!rzg2l_mod_clock_is_enabled(&clk->hw))
-				rzg2l_mod_clock_module_set_state(clk, true);
-		}
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
 	}
 }
 
-- 
2.43.0

