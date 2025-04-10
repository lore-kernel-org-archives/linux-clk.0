Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B371C174A
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294006; cv=none; b=fQu+DbWOIjRPt0qAAm4DxjOZ74BYYynN9lTSE5l+CQ+mCq3uBOoquqexk1f2HXPOt+5jlh6rHY3UQjMKVCH2UAqMXNV8t+Anr/S1rlIfa5NsBSMAMneOjQkODQbt/HytEFd6xkOtDARPoAS6soIUIQ9+6nnmo44E1A1VuCAfqGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294006; c=relaxed/simple;
	bh=U9q+8HraNg4JM2K3asvu+3Dz70/97utwVQBUEVgctoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjsEtCKQUu6XiXrpT8CedVISMd/fueZrKVMvk5zBWHGDotE3munizOkwVzPL3rIDFbKD/X3FETYuLc0g2u6RLW5CohqHRxDSJ+igrMPkrChTWbWvwsUdxvL90gc5f8d9D8a1JSVu3WQ52NRzB181+iaZ6H0BQZkOR5G1gpYPTEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dyL5Zl5Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dyL5Zl5Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so7037055e9.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294001; x=1744898801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzlWKmbplGkiGN2v7k/ekxq5IRTgVEaVq/S0RNAob/w=;
        b=dyL5Zl5YBj98FycXMpHoB4OXqWU1c5FJ5xlm4qw5zIwaUBkJ4g4XdNRi8bszuyNBdV
         z9GDAClWWZ1Y+Z6ZpnMBfY6cYpgK/zCKjDCZzglP7zcF/DAt+URkrAlR91pfqC5omLkA
         ARYnHE9WRaAI7B6w4F1J+hk3inoaCsAaXchYezctYzvKCtaAooBKsbz/zie5mSkwkF9b
         nSi3b/TKZRVeCDjO6V+aDY6SSvRhRNhMAkRQ+Mt5wNaqpXpkH7tSa/6UyzbnWcYqB33K
         /zmGhAbIjCdlNrcmdyrR/kHISfiaEfhQ6clICftG1wmfp+T4Y6lET0gKw3i0HKNa9nAD
         YV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294001; x=1744898801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzlWKmbplGkiGN2v7k/ekxq5IRTgVEaVq/S0RNAob/w=;
        b=Qd5by0d5KLKB9nD/Ss5KrYoGuYPjW75oqjJ4mJmS0YvMU6UrIRPKwaDtDj0kFR3vYT
         vmZpnK/JU9uu80ZZv49mgZJQb1EZG5f5Pht/fKKM61Yv9KLp6TXdL+MDmGlRJ45nSh2N
         ZRm/N7yOfQa7Ink7Tk10d4dtM+5Tn4WGJWA1FLxgt5+qGMUTp4exVkYHNfxdK7GsTHe6
         7cwqGZ5hmzZueIdvkzT9nAswId5rKGBd20NPLMBathrLuAdGrMY3iSl44aVYbDIE+VTQ
         T4yQMQhOwQUrx+QKq0ebtvrUNz9IwoKAz9CoU25iIvQPH4cFqeS4alNeC3qdR3rhlUfs
         sjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmOBxL358fYIaLL/rzwsrs1aW6SG7uZq/APhzm+n4mtQQyZgeqeiGPkFgonQTS+U0arGMvRtRe6M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwraHWSdic/d5iYZwDpzL1TkhCIkjzBVlGVXVHUstzOlkF3KRbe
	gGL36FjtATYvlou9TGWEFCwaGyUeK90UW0AWjTcTMuBW3oozqiKsHQMdw1VuQns=
X-Gm-Gg: ASbGncsxKbmdVf8mniMITkfR/NYGu4K9Ufd5VgubZgqQwr2sU9frqAvJDcNUYNjpN8x
	YcuP7lbsj71Z1dxlzbsLRQRs4h1YujfSzrq1wNh5+K3wIUfobCZBpxEqNrxYRFG8od8aLJ1xdCV
	eR6+UrM1H2aTDgvoeUDW+xFuoa9i7kCuz5URmQheFOncNquEqL9Ljt3jlEaUELNaEAKvLShA2Tk
	5gP9Tl3o2pndXvaVvmSfsg8SzR3C3uZm4xJBOtVOTV+MC3VPahO8SkCQQOsYx0+2AJUQ4DW2ZS8
	9dr7ylmlNw2gWBekehIcLkGwdQHvi/CJEIwCPoiljHIoMevXx8rQIIPDsGCgGkcPBBiAhA==
X-Google-Smtp-Source: AGHT+IHFIdqfR8VnAOPw2AK4/J46cf2SZb245hEBDTyrPiE7X84if8Bb9XtXir3NzJADmlsiOCSEgw==
X-Received: by 2002:a05:600c:258:b0:43d:fa59:bced with SMTP id 5b1f17b1804b1-43f3611175fmr5250945e9.32.1744294001198;
        Thu, 10 Apr 2025 07:06:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:40 -0700 (PDT)
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
Subject: [PATCH 2/7] clk: renesas: rzg2l-cpg: Move pointers at the beginning of struct
Date: Thu, 10 Apr 2025 17:06:23 +0300
Message-ID: <20250410140628.4124896-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move pointers at the beginning of structure definition to avoid padding,
if any.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 2ae36d94fbfa..bf2453900f36 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1183,20 +1183,20 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 /**
  * struct mstp_clock - MSTP gating clock
  *
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @hw: handle between common and hardware-specific interfaces
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	struct clk_hw hw;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0

