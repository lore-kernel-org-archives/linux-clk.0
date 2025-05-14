Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7242E225414
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 09:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213471; cv=none; b=jzk1UQM6xC4qHFRxCqi1Pck6g1OT0EaOhVGAqXarYinIk3DrtYMXgbS2a/sQ0mrQQUJXaMdjq3A9TDkWc+Ythq/hGMWkV43ezsy8frWNg7s+rlcSKtUXDVjXe6O3TaPC2r+9PEiBMoZj+UipwIUYuxjZwqvZ6ElRq4Ro93CZMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213471; c=relaxed/simple;
	bh=lSx/4Ht8JBUSu1knPzCsb2MpBGaRumWB5Vw3zT8msCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAwjUa4Lcoq/ho3ubMhzGNS+nWzTUpgQj4SxNDnoVxO/RPT1El7Tb3540g31RrtRyFn7PeDArFAt/UETlRgty9j4PTq96TiTafopH61TkrnwqO2yHspmqSfWYB0bExW2TpLoGF1YzPVm66Q9/KytnwStOTVw+yNLCMCTIKBSfzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NuUI02+W; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NuUI02+W"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b291093fso460928f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213467; x=1747818267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vExdlpv8ucFDrl1qUaXs4AkTmkhk+6u8jMyUf6qz4Qk=;
        b=NuUI02+Wk+NPp2Ss55psFqA7BBirbj+TIx0+99/rQ9cMfXUPaTdHDQWgZlcntoTCbI
         msuPLngWCPDBufIga7vQs5EEJ78SjvJtMlEokirVWUTa++5FuZhg2B56YRYFhtzuzuyK
         eZ5t4k3HQ4XSOZF394VnrtTb7i015TO5ThS2QLAuqchfcdY8yCWvKjPscGDtTOEXWbBg
         LgMWV26sJM/LFxvaeUdJSEtYoDfOD3M1Iir80bI1/fD1oDe5aBPZCOr1SJjdt88bqycH
         7gUidE2JTTtEmlOwITM4wRx/9na1OhjT6EZ7cXcxsBzmrddx25BrnvOJB9mRmkux0BEd
         hBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213467; x=1747818267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vExdlpv8ucFDrl1qUaXs4AkTmkhk+6u8jMyUf6qz4Qk=;
        b=hUg0JhjOT3ughNj+iTBbomFaRoRQh0A7wTZSadCBz0//w/sz8MRQ1aiTlrANCxA7ij
         KzMYwzp7MCRh+2yhaUuXimr7cmf0t+73nTkIAKu+QcODXvF2XSADMGHkfkjCOG9qY65L
         vrECcdZhmjhl+ZxV5rGJMijRidn42yKMfPOM+0cA0uvfLTgjArwhe5MhxF8YPVxaqQe+
         FQmQvcAaFDPm4l7/OBp7aB0DDDK4znW41Mwik0xOVD+/ravJXWugs/yoUr38DuVDW7DE
         a1eN5rHAedAOIrIzD1JuABQSKlxAfKucWNg+LkYjiCDGAiTZ7a3bQ0AMtrG/ScppW1Zn
         E21A==
X-Forwarded-Encrypted: i=1; AJvYcCUhKPDd07edFU82ioJQR3q7SrbR+Bam5KZVajIwyXFUbaox5VclEFk6VYgi4bPZyTp9X6vtz004Z9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrINpH0/1fEEnVyP1UW+kRUurDUSXFUiJcRRXZITcdtuTaLrWK
	WrdHVBz7QHYVz78BFPSREU0FtWZBRHLIMTNX987w7THNT9TUKAt9alTDNhuOTRQ=
X-Gm-Gg: ASbGnctKIKNSGXttBZpJMz+1KzhOfyfLswThpwwSt6TTYInKUu++j81etMASOPV+gqG
	eXt81F5z6xz4XFHREIKJZOmqXzYVfSot/TEfNFL1udn0naJLEah2GYUTa97MgEjusYPX0pnKXqz
	y4P6U04EwHS/QDXsOsvJ6rG0MF0rTWTNEB5omOpmGlpdFPtdjt++zYznYdEytSR0DamMPs7P2ln
	7vm3BgKOkj/1XmShKJKWJw7lXta0Pw7D9aGH94KMmqiBZb5AuTaW2hnWzRL0Pn1x0a++L2CiE30
	c/NxKDGYGYBxYemsjILEU10k1kUggyK4/N3RO2h79OR9KCkf6LaJSXVjaYY+Xz8FQCaUR1yZcF6
	SbTPF
X-Google-Smtp-Source: AGHT+IEwGY9dH9P7XssOURNYKSf/3UTKpupB6dh/lRdyD83IIAbxghb+uKoLBi1qGeqyoTOE/MRvWw==
X-Received: by 2002:a5d:5006:0:b0:3a3:42cd:3701 with SMTP id ffacd0b85a97d-3a342cd3716mr4962469f8f.23.1747213466808;
        Wed, 14 May 2025 02:04:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:26 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 3/8] clk: renesas: rzg2l-cpg: Add macro to loop through module clocks
Date: Wed, 14 May 2025 12:04:10 +0300
Message-ID: <20250514090415.4098534-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a macro to iterate over the module clocks array. This will be useful
in the upcoming commits that move MSTOP support into the clock
enable/disable APIs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/clk/renesas/rzg2l-cpg.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 767da288b0f7..c619b2da92b0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1202,6 +1202,13 @@ struct mstp_clock {
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+#define for_each_mstp_clk(mstp_clk, hw, priv) \
+	for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
+		if ((priv)->clks[(priv)->num_core_clks + i] == ERR_PTR(-ENOENT)) \
+			continue; \
+		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
+			 ((mstp_clk) = to_mod_clock(hw)))
+
 static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mod_clock(hw);
@@ -1314,17 +1321,10 @@ static struct mstp_clock
 *rzg2l_mod_clock_get_sibling(struct mstp_clock *clock,
 			     struct rzg2l_cpg_priv *priv)
 {
+	struct mstp_clock *clk;
 	struct clk_hw *hw;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_mod_clks; i++) {
-		struct mstp_clock *clk;
-
-		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
-			continue;
 
-		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
-		clk = to_mod_clock(hw);
+	for_each_mstp_clk(clk, hw, priv) {
 		if (clock->off == clk->off && clock->bit == clk->bit)
 			return clk;
 	}
-- 
2.43.0

