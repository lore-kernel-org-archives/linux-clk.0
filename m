Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DD4343E1
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799610; cv=none; b=FoNN4MKyjkDOEb7o0IDUKOWG2WY/8HurPZphLs//Hy6THGwk5q99FbSvOBdIJ2Q2y0QasjZz44tcqDmciyJDvOwsvpYIMn/VaHOef4zHQJj9aidyob7FrCXHFcylmIi47Yr2JYb4OXN5CeN+Bxbr/7Ub97GHvrN1AZ75+pB3w8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799610; c=relaxed/simple;
	bh=h886BmU9pfC+RezdnkZ3J5Ik53qoiogLhSBSntAHgiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPCcu4rr7K6+8kSMMZ4+g7ZGPm7v0gd9OCTI7tR8R7JTr1zI7kVjZAoxAitJvGLfQbQosMWAr3cADxMqnK6UqkQ58Sxy31/11pOrQ//XpGnUIhlzSLytbFcc8luIpJsPB+fRn5LFmQJ63tP8docmlO5CINQwD2JbEa5LDQDMOKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bCJb+jGM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bCJb+jGM"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f365afc5aso254275f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784799606; x=1785404406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=bCJb+jGM4e75C0tl4U9GuebKlWX0JSaGGcVCex7o1S8xjnQhwjnG+maVPNkSSQN8Gl
         y4Fa8IZD/ifNhTdiVWgr5G7TiQI6r8QyaNDd0jNhmd3K1hjh7spUzB766Tj6iAmtrInU
         ZjHlDtYAVxW50o62dFxs8vbvDfXCSUntSN8aQEPgp0LWbcOIwFflWu332tZ8/SGCSO75
         01Fz6+kte/g3umzoefaAA+v1fJXFmKAdF/Cah9oiFPAiof7HpWX6iTcBAUcWQ5E0G3sm
         Q53dBrugmDzY+WCvk68/PVsh+3HI6sOi8KyIRy37qF4p+Xm/0wxLSB0lzIuRdemx4+O4
         GJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799606; x=1785404406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unyjlYSQAHCuBkgYy9GiPNfKBr8X4sZKbeG1doQS/7s=;
        b=siA8TylrDIamTSn14Fpz3L9OAfJ2Kqbi7ccZs65oC5O6uv5AMJda9zF7OegRLsEQsi
         hH96kXUiAewrUB3y2AZz6RU9xJD1noY7UKKg2xO0XS6BguHIzfvlvxIQY6lC3un2fmcZ
         dOHL7hQlG2bvoHoSvB86t/Ku7xrORnKAvI7Wbcws5vB0RjmDfhOpRkb3RvvNtfDJnMuY
         3rch/XGXFpcLtZLwemWzXBw0Uem8wxQY3ZthO666epyZQsMrBBsgnv0CjPfh249BfQss
         cnooa9iN//Rx+e7ILrOWRI6A3dWFs6hN5KtVng/ZVYAfV0fG8oG2LXHAcBQM/+jBpxbA
         ACpg==
X-Forwarded-Encrypted: i=1; AHgh+RqHd7jb+e4/UIeMrJQG/9ySzTagE8XcAXpnsItdol6pIao+64qt42p0KEEjMW+S+JhFKwYdG6sj8g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhOiuA0D8JBAGIwD52DPrXCu3tuwV0gEzAIZetsCn5hHQjbygo
	OUZ139aMhSWfXsJPIYniF3VKn/rQeijIqVGphBeMg8TmDA5QDwziMG+pD4MzGXwSgjE=
X-Gm-Gg: AR+sD12i2MprjBkp1leFgBMVAQ32X3l8xKPy6dnBcNJiJP4pfz4+T4ZmwEk54v/6ziu
	pnAa72d+vlwhYikj8HF9/xxhQYOJORhz9fTejecHLHKIfI3Wov5xU7VSJZPnLDAR+hgQZWh39BG
	wR/4lG77iIZwvT2FBS9Jr3a71g1FMfttGnDhOlUzz0HRPPdIfaYwEsaNBgzZLCpaK1AQeOwRxdx
	BRSzROwL8DhKQ67Ar2N944k5y2RYgz6hWZOPMlaU9PFnjs8dFpSBqkEnhu9/RfQPcdmY0qj2Li1
	o9LhAUOTBdZQTuYWDEfgpir0mEFQylQaGfGjYgB5HHd7bgj+LKMw+U4umarhxJkzAlRyQOirnzW
	qp8UG43zozclkHgO0ku8RHOK8udf0J9vHu4te/BqsSWZx79Wce+ftMjqIqO6BF5Oi/p10+p5gX4
	F6
X-Received: by 2002:a05:6000:27c2:b0:47f:920b:7fad with SMTP id ffacd0b85a97d-47f920b8051mr1216847f8f.51.1784799606034;
        Thu, 23 Jul 2026 02:40:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3274:dbb5:2710:802b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c6f076sm14217165f8f.34.2026.07.23.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 23 Jul 2026 11:39:51 +0200
Subject: [PATCH v7 1/4] clk: sunxi-ng: mux: fix determine helper rate
 propagation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-a733-rtc-v7-1-8fd68aab94ae@baylibre.com>
References: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
In-Reply-To: <20260723-a733-rtc-v7-0-8fd68aab94ae@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4256; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=h886BmU9pfC+RezdnkZ3J5Ik53qoiogLhSBSntAHgiM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYeFtpYPA3bOOb2j0Z9hzyBatcOuHwPVa9K9nD
 Y0q6zTCxbCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamHhbQAKCRDm/A8cN/La
 hXFoEACQiqosl4kiv5gDmdbrtXdNvJ48ZH9JDp5cPQpUo/TJyNpAMmT5sefdW4IGUWqZ+oukkkf
 Z0pS8hwDD1kwY2rHFnt+6wyPhQo4y3SOvckimSFCONLnNQEz4UbUr7JBeYrugzt6/INv3wjUdf7
 T8DBb6q3RKDzbncuWsX/QmFR5L2t92vuDCETY2IHpSI2p4S42P/XxptxLtMrkdvgM+mguKZOZ/5
 nJAB8yCq8m3bJamX/PBrfI1yGBnvMXX2zGeIQR8xU4aCo01m6v1RZrta2SxmN25uK2E9mfRSPyA
 /+Pdlnt9zSCXfBjyM34JYxaNW9y4+hfDOwY+/qQoOViGeXM9My4IG1OqeLjhsoGjEZcprUweJUT
 cwHD/uc5xbvyTsNmfnub68J1scN71a3petL9skxO6u0AEmz9MMJn6sJJTTidPmNafxpkcgfY2Ez
 c8azmoaMNZMX+KDtlDXT6LYTWBCDZbTvyVHh7Krhnlnrh83p4MrlEv68EB+c6etnC9g5uQZY/92
 tZ7rtUcBW03DB5w4mFXO+qEW4Ey1CA3UyCFcneniGBfr2w8cweBqgmUXxFnsFRoBDNfdJZz1EOX
 wqkIAohMIeAOvgigkj2icl0mrpqo/KjkcMMF+TmqHUQsYeRPxAYn/9HU2fVGNmgxeNMXB/mrUiO
 ktpwRCWZjUnHGGQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applying the pre divider on the parent rate is wrong because, while
handling rate propagation through determine_rate(), the framework will
likely round the parent rate again while cycling through the possibilities,
throwing away the prediv applied. This means, the parent rate will then
be wrong when the prediv is unapplied from a parent rate on which it
was never applied to begin with.

The right way to do it is to unapply the prediv from the requested rate,
which is the wanted rate at the input on the clock element, and pass this
to framework to do its thing.

Change the determine rate mux helper in this way.

Fixes: 1c8d7af61b37 ("clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 57 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 09230728c400..4503c9780c39 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -92,66 +92,65 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 		struct clk_rate_request adj_req = *req;
 
 		best_parent = clk_hw_get_parent(hw);
-		best_parent_rate = clk_hw_get_rate(best_parent);
-
+		adj_req.best_parent_rate = clk_hw_get_rate(best_parent);
 		adj_req.best_parent_hw = best_parent;
-		adj_req.best_parent_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
-								       best_parent_rate);
+
+		/*
+		 * This effectively treats the predivider as a postdivider.
+		 * It stays mathematically correct and ensures whatever
+		 * round() will do stays correct while walking the tree.
+		 * It may query the parent rate too while handling rate
+		 * propagation.
+		 */
+		adj_req.rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
+							     req->rate);
 
 		ret = round(cm, &adj_req, data);
 		if (ret)
 			return ret;
 
-		best_rate = adj_req.rate;
-
 		/*
-		 * best_parent_rate might have been modified by our clock.
-		 * Unapply the pre-divider if there's one, and give
-		 * the actual frequency the parent needs to run at.
+		 * parent_rate might have been modified by our clock as part
+		 * of the rate propagation mechanism. Same goes below.
 		 */
-		best_parent_rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
-								 adj_req.best_parent_rate);
+		best_parent_rate = adj_req.best_parent_rate;
+		best_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
+							adj_req.rate);
 
 		goto out;
 	}
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		struct clk_rate_request tmp_req = *req;
-		unsigned long parent_rate;
+		unsigned long rate;
 		struct clk_hw *parent;
 
 		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 
-		parent_rate = ccu_mux_helper_apply_prediv(common, cm, i,
-							  clk_hw_get_rate(parent));
-
 		tmp_req.best_parent_hw = parent;
-		tmp_req.best_parent_rate = parent_rate;
+		tmp_req.best_parent_rate = clk_hw_get_rate(parent);
+		tmp_req.rate = ccu_mux_helper_unapply_prediv(common, cm, i,
+							     req->rate);
 
 		ret = round(cm, &tmp_req, data);
 		if (ret)
 			continue;
 
-		/*
-		 * parent_rate might have been modified by our clock.
-		 * Unapply the pre-divider if there's one, and give
-		 * the actual frequency the parent needs to run at.
-		 */
-		parent_rate = ccu_mux_helper_unapply_prediv(common, cm, i,
-							    tmp_req.best_parent_rate);
+		rate = ccu_mux_helper_apply_prediv(common, cm, i,
+						   tmp_req.rate);
 
-		if (tmp_req.rate == req->rate) {
+		if (rate == req->rate) {
 			best_parent = parent;
-			best_parent_rate = parent_rate;
-			best_rate = tmp_req.rate;
+			best_parent_rate = tmp_req.best_parent_rate;
+			best_rate = rate;
 			goto out;
 		}
 
-		if (ccu_is_better_rate(common, req->rate, tmp_req.rate, best_rate)) {
-			best_rate = tmp_req.rate;
-			best_parent_rate = parent_rate;
+		if (ccu_is_better_rate(common, req->rate, rate, best_rate)) {
+			best_rate = rate;
+			best_parent_rate = tmp_req.best_parent_rate;
 			best_parent = parent;
 		}
 	}

-- 
2.47.3

