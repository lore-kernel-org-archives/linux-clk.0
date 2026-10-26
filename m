Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021397;
	b=GTHT1lzeRakDKoHT79hp/KQtcEL03HGtKBTXdehN/OfHg1ZhhXq/cUiRGc/kG9FRnlbh
	 SQFQPNTeeuzVfbgXnEmtrScA0evebCAlreBCaCpdJ6LBL6gZAhdDsVCJLwz8yzImBfJsh
	 ajDiNjAkHayX6uYLJv2b98e2dH7tbPQdfggrVNhskXwmYkZXiPnZHqUWzcwH6hDYHtDtS
	 GnQxYEoUo8GJ5pM5DwGDE+CswDdhr0+SZ6rUxXayWBphQKqcDGgWvlDSKuUdvT24/ZQQK
	 KaRB9INKK6ynvjvnPMin6YfWjkHXiDOIVpDxYP4lNiwNeuG/qYXb3bhIMmPxnXSfwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
	b=Npa9FfB94pAn/2GvTtVZwGqnUyF+E2ffueohjTU/NCi/CDHzAUYlwXrGQYoLkpiua77l
	 LSJJrYIP8bvDqccMt7RGy/Po5Goo85RLUyb9NaNN9jB5I+ohuwgLKHZPOmqsgwIcaZEfI
	 tBgH6GzWhZg0EsApgJ2owWIMtS4EKcAx9End9b0WaTupeLR3kfhjtNVsvH9qMO5PyzzJw
	 AQq4thtlpq7sxvDMDVk7P+RfrMwzKGKCsr8CGta3sBihCNSpHNdsCuKvQI5E4V/u+Q5I+
	 ir63Jbn1PVs71B1Fn68sUmMysXhRA6/tlvTceu4ZTmPQAyANn9sc9Mpu1+5OSvKeKeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="K2Nb+/ko";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34737606A32C
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34737606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2Nb+/ko
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so35001205e9.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021395; x=1793626195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
        b=K2Nb+/koCRWjz5rN4BYYi0gp4TsWWbH/KnKT+9vScxxIHTLUl/nEEeYLXNqkY5aPsv
         ORsx2QDYuqnw0GsuQwNQiWFgdMhqCp0m/iAYysrO7DD8fNVipuQYh6o+Cd+y7Zx1Kh7j
         UFXKPimfTcBzqpDohvjFNIM37x5IpC4fDDcG63DSMr5zZH7zhAE7NtDuKkMfPevreoX0
         DPKVtZvxHlVriABDVqRfFLSnkTxGW5ynNkGOJkt2jUcCzHPZEh8G5A0ZuUBLeJSrPbA2
         AvHZCWAEA/tZjH3rIAXOsvtLCn+KuC+sQz5i0RxlvAIBfUClGfKlbqYKvhkKu5kMTU46
         +oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021395; x=1793626195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
        b=nYvdlVrxnh/0GCbGltKYWlsbMeOM+fjQFI8fgoJUOldUgWwZZkHTV0pnQxYtA3JWst
         fKrvQ+lG3JPBT6oy/dn46Lmx09Lhrq4ke1CIkrifhtjePlqpprx/cmKyMOeCBaAhX9bt
         DCDgx1OP5EK+H3+CAXrlEDzzJqmJR0BwbGw31FFiKIwGpppklU2PjsXsLF0Jj1NJmCxz
         T90ByYV3Lbb3tFdecw+XyXaiksU0saY6+4NDn+uTrDJvvU4MGzOI4MR4JmbAxMeHO8MV
         klcDKsMkOnlwZfKXR8Clj/JJZIEIeLYdhKZMOoq5NPEq7uhWIiA/TyMs5I3H2b2ZNitm
         j10A==
X-Forwarded-Encrypted: i=1; AKwUvBzhz6x/i3uaP62HYgTWok6FwSUzh6jYEUiidLK2suB+7PFURh9M9Czt1AuYM3wVgRBL4LQLlWB2Os8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3yONsWcXZIxJ/aoK9aYMXy4wost+qq/+buR24fzEtGfSSMKSM
	CV81tqgJBW/b3gK2zyo1xgo9fVSZE7xHRjXUdvVPG2VWwZYF1fgQ2PPZGgKQ15CqV00=
X-Gm-Gg: AYBFou0WbAZY2i35BQT5SbGnuSvCjHYVxFLSFpUQwlWkcVUjrGfupYkLWy2U7OnUVZO
	bvsRT/tBVX/pb20c3E6iBq+YE96BS3o4Js3dcEzOS3swIQEI6Pkw9+49W407GXU8InA727sWtoG
	VC61XiWoTXn/EkQkTEiVhVGExs3WxxKfXAPCtAinHcAB6m1GnhtdmRK+W/nCEmC8+FmwgVwjjru
	rKnmf+/2KKyihDFwUsUXzg57xl0MUYh2hDKj7mSwruO7X9AvgxJn3LUxmzAxsi6imZbWjG+OoVJ
	e/4ie/jsQvU4k+qyZFV17s0h85yf3e7dV8qnKuGTw1qNOR6+QYMiZJri1YNsH9giLKRxt44ZJ6n
	QspeuSQu1FChvJF5XumzuLZeNpiMSaCxYmNHtvO+HtIWERGMfyQwWUzn5NasWPgXYrcKZMVR5mN
	rPkaOdZgWA2LGRjs7knT8q58piQ2vOtDBVwCfnFrXonBHuO6No/v7TqY9otNBGvubBfWLs9OL9J
	QuKn7YcNo+ipfzuzygQB/ECT0Qiplm1YwgAiyk5ycGkMbJ2bilb34axV5IYnNtyv7CyIy1g3kJk
	JSJk8JY9J8pJ9IoKX+6fSKswSZUi3gkDbYfCPBSJIKABglYfbxq+QdV+UGDdZ/tzh/b1gPKr
X-Received: by 2002:a05:600c:3e10:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a35acba868mr111743135e9.29.1793021395526;
        Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:45 +0100
Subject: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

None of the Meson clocks using clk_regmap_divider_ro_ops set
CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
can choose a new divisor even though these ops cannot program it. The
clock core may then adjust child clocks using the wrong parent rate.

Make the read-only ops always round using the current hardware divisor.
Parent rate changes remain allowed with CLK_SET_RATE_PARENT.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 1ed56fe63cae..002e16865109 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -120,26 +120,34 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 				   div->width);
 }
 
-static int clk_regmap_div_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
+static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
 	unsigned int val;
 	int ret;
 
-	/* if read only, just return current value */
-	if (div->flags & CLK_DIVIDER_READ_ONLY) {
-		ret = regmap_read(clk->map, div->offset, &val);
-		if (ret)
-			return ret;
+	ret = regmap_read(clk->map, div->offset, &val);
+	if (ret)
+		return ret;
 
-		val >>= div->shift;
-		val &= clk_div_mask(div->width);
+	val >>= div->shift;
+	val &= clk_div_mask(div->width);
 
-		return divider_ro_determine_rate(hw, req, div->table,
-						 div->width, div->flags, val);
-	}
+	return divider_ro_determine_rate(hw, req, div->table, div->width,
+					 div->flags, val);
+}
+
+static int clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+
+	/* if read only, just return current value */
+	if (div->flags & CLK_DIVIDER_READ_ONLY)
+		return clk_regmap_div_ro_determine_rate(hw, req);
 
 	return divider_determine_rate(hw, req, div->table, div->width,
 				      div->flags);
@@ -176,7 +184,7 @@ EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.determine_rate = clk_regmap_div_determine_rate,
+	.determine_rate = clk_regmap_div_ro_determine_rate,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, "CLK_MESON");
 

-- 
2.56.0

