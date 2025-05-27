Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FF6258CDF
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345056; cv=none; b=fnPuhw6RUT+SXJixWxuhrjyhkh53jhNTWuNswg8pPCIci4CzcaOCDVrhyqb/4Ljd81jL2purVUiOhRUToL1iVVDfB9o4ov0yoS/ae3xuCvxbs2kMLQDVjUUdRZSMDZGrlXOl5sM+ja2bHZFNVGmpig5nuTxAzbMJYnC5dCfr8Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345056; c=relaxed/simple;
	bh=ySv8MiicG70yIYdWD/VWDHOvRt6DoXeDwWbcOVt2NPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEEZ2vve2cdEKjYta7UQZpm9oFthC2PO6Dr/j9jFATA6QoLyP1cqEG77xApfVaQTZsBKCIscXMx/ZSfGal4soAgDXH50XVqJqVA2wJnEGjOBo+3RcPR5ueeLnGG/nv9DD/tsxMAMqMFV7jJqj9CT+7T7Yfq0FgObrRuwajZczLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j3+vslsy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j3+vslsy"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad52d9be53cso459257966b.2
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345053; x=1748949853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jQMddyz/b9XXlkxpzbvlzuW6mWfFvIUAfUlht1RCuA=;
        b=j3+vslsyH1dtFNBODGdVCCgWnY3MUxuhLPYUAaGWlBHlt5ChsZ53g7hABUkP0piTub
         +HdNhwBushnodlSCxAqfFXZasHfgNgxB/TsUIySrGl5Fce2GlwlifXZHJAcXspGXhQgF
         iS5eN1GNAAfxFjAmyGqu8Si+35YipzUJb1ZHBGtOEgLOwdIYjKXXfa1c2Hnf8T0h8Kew
         O2QT7d5rEwEhCUNE8Ke4eIoSL0p6aq7BgQG5FZCfx51lTqcloS/Q2N15e2P8YoY62FWe
         SALGWm7tz7NkQViI3A+UjE0Sr8chvrGeIOI1ujq37/cagkG3SxSWUNfUXNEApluz5Eos
         LKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345053; x=1748949853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jQMddyz/b9XXlkxpzbvlzuW6mWfFvIUAfUlht1RCuA=;
        b=lclrUMRirGyNKpWfC9cRluhOOwCZzpE8XnAznDi+KyinFUPIgsRusnBlxauqVMvDWL
         szR1f8j1mA/6lZV6dynT6ka0a70Umm2VMNa3zF00/Sb8aJcKBP818+BtdlIhk96mQqzG
         ldX2deP8lT9SIoEP+KxbzzzWkuIO/iEiwr7Zjzg75k0j9VjzJ8datwcBz2pGeol2KINE
         P0FHNynWAoz6nx0i9NtgQlxuRilfU4Bw2WUqZ4fwZxjxBVEyZl1tjBj/DUpnKUP0WlL9
         aizFpla9JqK/SxWn1qafMR2P4XqedAsCl3afCmRSaMFsYHqlNTsaAYGoJXPnEHkFHIw/
         psSA==
X-Forwarded-Encrypted: i=1; AJvYcCW8wt2wAZ/Ss2R8/1yADq0W0u3/mB+FHjo5pjihDZTqvnP4zEOvH6zzkHv0LNFYlFby0B2aMUaEFOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwprbCD4lOeSV2c6i/cSIjN/1nDEm0dyVu8mutxWaFejTTSpmEK
	mYA6S35Sw/66NEySZ3a1mv8+FmwBk1R/gLH+1q6ClRsP4nmk8PJz2HiAKSJ4xoqc3rw=
X-Gm-Gg: ASbGnct1x0iSAiWZ60JRl6VKCyo8flOWbbrIJAhom+oNPoxoqd46ztBSYMWGwJv3+8t
	0WsqGcDaHRJ8H04NS9vsWBsKfaAa+90ySTQ7AZkk7TbribSOxvFYY0m9xwmJxU5v5umaufsjB/U
	/XMXIyQPK6NtvqvoTuMd3sUpvTOVVoev33GC134PGmiihX9E0zd8CPJc4eyTGOg4ZpYzb6T6UnT
	9coM7tG67subBofqww1yWxLngpXgsAC9V+64VfNuoyuN2QNRR09fjTu45tkKsWl9WCBhlUJa+ty
	fjgMqs87OzJtX44H4z8Lr3R4Dr8m1qEAZsrWiCehbcXn89nER/iiT3CJFioAeT0ZHoPehDfEA3s
	tZKSF
X-Google-Smtp-Source: AGHT+IF5akmMqw6CEUbR/QQ6FymHHooQEWDKvO6sDDOO00kXHdchwWD6GzRsG/MefjnDhLywbLaIOg==
X-Received: by 2002:a17:907:869f:b0:ad5:a203:b6ba with SMTP id a640c23a62f3a-ad85b22bbb6mr1281210966b.43.1748345053131;
        Tue, 27 May 2025 04:24:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:12 -0700 (PDT)
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
Subject: [PATCH v3 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
Date: Tue, 27 May 2025 14:23:56 +0300
Message-ID: <20250527112403.1254122-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- postpone the update of priv->clks[id] as suggested in review process
- updated the patch title and description to reflect the new approach

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..c87ad5a972b7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1389,10 +1389,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
-	clk = clock->hw.clk;
-	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
-
 	if (mod->is_coupled) {
 		struct mstp_clock *sibling;
 
@@ -1404,6 +1400,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	clk = clock->hw.clk;
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
 	return;
 
 fail:
-- 
2.43.0

