Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04338224B0B
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213467; cv=none; b=nC8Ry9V/PMAiEKu9ZDlzjXPfIvUcpP0yB/3s/DYcEXmYhggrckTI3mKu6ppL/F7yNhabuzxR/wExIfpLmPpxNZS+410bktMtcJLFQ5Y0/8wL7Ah3SWy4bEMOaOUIoOzy6N90GUweF9g9BdWy0KBd0QhwHm/fE+pqUF0jHRhoHMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213467; c=relaxed/simple;
	bh=JnHdWEIPeM0wK2Ula9jh9MnaUM824531+Pq5OYIHFp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/MCb7a/LCk4aWeogbhdKrR4sZUpdJxHFDjE5edpoWg+0gzb4i5MXBTluLfqUmYyz/nY8kR1W4ZMkr7BAUslkoUmqXRniYMkA7+/U6Mvow1ilirezNcfrmCju8oTGR3+aDxUuq4rg432NuCpEHOlx/blG2XogzMNeyFq/jVUj9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jtUDPFa/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jtUDPFa/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a20257c815so3595377f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213463; x=1747818263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K4j572MT7sI790Ze+eK+i3Uz5b16gmlTqgWUGftrXM=;
        b=jtUDPFa/9Ql69jiYYVOviU7HYphSdOgrCUe+jrgzlzBI3DsL5reLSyvmAYj02UuQWl
         dTSujW6NhFwoLVU1S+/sqvYAKAFHx8jYRlpl+21r2meNs3a/52PvCqWkysXdLtUS9cea
         E/Xfv0sd9348LKvdcnHBTTALf2xU/P2eNPfq7mx6IvWp8l043q2P+C3wOGsKaC5szH9Z
         RdyL1HnUAUM5lHPux6WCw1yW2qJsPogGWhBCn1K5WY7IjRtxjOBpC6t/sdyjIzUoDrdA
         L1qvusUJkBobl/S8V9mVeFi3ZDeGv2SGyDdLAByntSQVSEcmn1ee51jhfSGszs1vM2AC
         wosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213463; x=1747818263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K4j572MT7sI790Ze+eK+i3Uz5b16gmlTqgWUGftrXM=;
        b=VXBJyzj9h9o0Itmzl3HXsOiPEAt5rdOQS48yMO6kkAfKSLqbKTmGcgxQKUyr+7fHKs
         Ub0oo8o0nxqY/QIY8A54uJwntI5J3zNU4jc1KsNYaF7qnf5wshR/tL1mFydVXyASoENh
         YAnQ4L+rA4Nx6GeQPeHnRr8jWO2tiQDi2Whsajk6vVeD9n+EKm31qwdvtXsjuaiEs/k+
         k9/HX58UnlSwRrAmFXBNpCZsjzI5kbAiTebz7I8OxPgUvQNbvjlTaqeBkJ8ntxruwsCi
         gJ2UmMb2nLS4M54sJWMVG0uTzpl6S6yjPyXxN0S0NEj3SSdMgQuJMGDteB7jJKqWXi4Y
         NzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfmmaERMhn1V6aJlWR3m7Qo4hwjF3vOGLTJxe5JFcvDyAoT+vu1pzddcEXWccwuM7S9kZIurtiqbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0/Cm+pp/QUR58Zq+RKOP5zhuY+sZ+RFe5XX2lqmdsfIQlX6C
	8SSvPRIK/s1Z0mW7+HL7yUj4VA0fVdy5jriH8EQVLR3hxFzAqKlhtxWPl0qFaFQ=
X-Gm-Gg: ASbGncv4c7fA4aK56eNkzrEvqjbFzvPjRmv4CFm4ED+jTZ7AXLs2/M/QONVxzdLxriW
	RR8Q9P8nm8YizseTqcyMC8YnK1x/OidN+SDt/2bv+nVUfP/rhBqX35Y0C56Zw4ozKnTROM0BZmR
	baJTHVQmTQdAW1WQqlLlsVRyxiLXTp3MrNx49XmgFWjcNGcoULKFWP8IOZCR8e8bjzslkoKJLkq
	c2I3ATa3mugpcGIH6XT/r8o6WHs60p1B8u07TY7S+6psghZQDzV3EtH8Hiz2aRpdvZQx52L5Fj/
	LYaMvHHB5FXXv8fTuur8QmiQhEbgtIPZxmjUR/aDFWJTcfH7aTQDdXyEGG/tdIdjgFxR2+DFbTk
	upQap
X-Google-Smtp-Source: AGHT+IGdaeJMKgGTg/Sc7hL1ltOR8m+B42VrjYSEhJIqNaP+mgKdctUxgZHq2QuUEOmWT9ML+hI28A==
X-Received: by 2002:a05:6000:2503:b0:391:3049:d58d with SMTP id ffacd0b85a97d-3a3493d7b80mr2348215f8f.0.1747213463319;
        Wed, 14 May 2025 02:04:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:22 -0700 (PDT)
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
Subject: [PATCH v2 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
Date: Wed, 14 May 2025 12:04:08 +0300
Message-ID: <20250514090415.4098534-2-claudiu.beznea.uj@bp.renesas.com>
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

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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

