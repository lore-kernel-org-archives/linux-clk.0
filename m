Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278472;
	b=1zdwFKa5iv2o8MiRFJbA1JL1bTby2C+PeUjE/Hmw6ZtSIJGUSz3zc7/2j2x10rMOdGdH
	 E6X8k5FROAWfTiN96APm2tQX9P9V313VXJytYwvvC+JgxO0u1vrAF6Kx5x1/XSGvRHu+/
	 MNa3di9Cb2wdylAU3hmywi/Va9IWwnWrNmc1pvbp4IogLmrutZyoUus0x4Zvr5Y4y2F3a
	 nVISYjrq0EKtrCLT+mdzsj4epiQpxo9445qLgXwJla8/vK5j6tjS8wu/BHn1jXvV3TRd9
	 p37a20zuy5dJuO9TrS0fcDIDXkQufzzX3y46qJnREb+cRPP/yIBywnA7UJ1clJFCotg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
	b=c8DB1EaKGj5fi4FUa7Qk9BmBxG+5j14SF2z7iz0pJxGW9gJc3E8WOOD2ojDGeKhXN6xb
	 swpOAHKICmyvuSoBe6gS5FDfd2mDOJnxRQEVl4JdN9s9HN5KcyzGTEOIXDwK5lw3fCiak
	 Wev6Q2KNOTTxX5F786N7vGyQYzah3rDmK/NYUDVTUJJxuQ9O1kAlCWB4yGok+IrTL7Chb
	 vkirDBYoHLLWcJHQA3z7LFFhSeBCCgZi4GdP4YbyspevbQ0PwnaY2SkNLNY/VnhqjK9bR
	 5jVqPcgwQj4kVdOUZhboH0UaKJYs+aHhe32e9N+e9RXC8e1zwLg9pdvm3eAW0XbdGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bJJhj76E;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422B606A333
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0422B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bJJhj76E
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17325155e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278470; x=1793883270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
        b=bJJhj76EIaQw+OBumHCnSnRaYtBXaK1DSRXb/r/grQwZ1utoTKdSq8NiUr2WfgkrAP
         gphHcNLr9Xy5nlxomkmpqSSoKnkRHiG7cVpUL6XsuTLS5KbZxuZe2onTyKWp9o2Gr3CI
         eOAz7wg4lIQtTbjMynRODrxgZdLgXJdT8qIpRpBlieP3SfPbZyR8Ug/b5r+tiFdvFCaZ
         OAzUMRtEuNR8+xfRTdXHEFoeqnM/ctiJEzGdFSGrR0AU0j/TFGuE9w0mmm+Y6WLEadAC
         CXrKbKMF9OZ7NRAozHHg9yJPbrFiCz9JH7YmqWxpJDMWnH1xBA+jPGd2mC8ckafhZ7nk
         1J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278470; x=1793883270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlnO/XQNGCl3Ib1nyxoNZ+8myRyO4vnZro6S1iLdVc4=;
        b=DuVp2XcYRL8U+xzmeddp5rG6iD0zSxplAlqrrhiXJEzGWfO663TYito3GTA0x72hrZ
         LPC/3W+YpA64ybvcv9EAhl+4QXtm95He/ubvDuOlLY7nc65sqIsP6adfzlAkz70d4wm0
         dn1XK4hecHTXRCCT1PE46xeDYqACv4Ar0kb9xAe+wgWxVVyCiodJJHRfeMItDFZrTapY
         XMnymXRDvbQU7PafY1MnHlhOGmY7SvTeh15m82d3PzBaP78vmYuyz3B/kZFada1q7gVv
         /jwE4lmc0+Z2bGezy7V+1LQZXTac+mYqRUZynhXCsfOniACO22sKgyZuQG5kWprExlZt
         yn8g==
X-Forwarded-Encrypted: i=1; AKwUvBzPwRwE7uDS6gm0xmal1sfOjoMKcgJGZZscryEw8Ru3ixau6BJwRtebYgtCOz8HT7e3vZRg2dsO7DI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWUrj8nNfz/msiJ3s3FzCmKC1uDwV/zX5CCzYNx2TckJTDJYbM
	vlo59UtmO7em6SjNmimFOo9wRKyjp+eok2MVBVs7ww5+DBWX2gszs7vHYF2nXMOmiiU=
X-Gm-Gg: AYBFou2SMW20ubKqkxdMcsyh3Xd7zoHovWHrJ6NNZXkcXccnpQqAAEwB3u/v5FzzNyQ
	pauS0uDnraJUSld/fi4pZexJR8MmQ3SEO3Tt1TO+Fk4c4CR3emYaA38eYR4S8xnOdYiWP2Olwt4
	75fqn5roAL37uUWLEBEXaWHVmEe2jhv4yHZF1y/2QpGvfR99NpbaKwGKqCeVBQb5b6RaA16Npsd
	es+zLcjgYikPNg6U9EHft9CBYFe6ByTjRrtpNmJdNsdmw7pyuoM938i1pZ1FN/4dMzUTJYGNmzm
	r1sW7AkSXJPnlIuo8NnuhB3RC0J0VSbUjtyGE221JmayvSRgTK1fecjnNB96iETmCvVAiA9iLBd
	+lZBEZsBZqwRe4/6qRWCT+ovWXG7izA0U8nO7cZwMJU95IYKXJEmxiSmA+yd9h3zZlImSqsmMl5
	cBLI4v3p1u7wgeyEeenxaialMjOyT17w78ic8kKIVI+wVXgACsDWnE8f/cv6YYvFbkg3A3atulW
	9tcR2ez+By8pjeReMBV9rB9DfUDoaQFYt5j0/i8VUqEfj3DOxG105puSrCqT+ApbKs0VwhbSe72
	M5kTZ5TTDEvDxYRNXx8kkf6b3bZsAGPA/sIrtPRcZSy+Tgk5thSCjQ6g3gYu/aiFvutkRkq1TF8
	lC1EdP7MmDEvuHtWAOJPTrcwHCeSCoVD6xbk05+JaO2ikyA==
X-Received: by 2002:a05:600c:6095:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4a9643d51aamr113545565e9.2.1793278470416;
        Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:29 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:21 +0100
Subject: [PATCH v2 3/3] clk: meson: regmap: use the current divisor for
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
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-3-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
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

Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
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

