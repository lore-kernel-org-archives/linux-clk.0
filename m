Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966346;
	b=fJMTTLVlcMN2y/23RWiMlGCX6BfBqSIdGPXVUEilM61upHohZt7yRYqwdEWAZJG/XCfy
	 GxNNke1LMbvZu04DH5ATVTQMT1UXDEeLPCAikXwFL1x6ZPKJZdDtLARqXZmJwVLYymUZH
	 ed1jLMhov/9OUdIfysuYAKvIwuApOWrK8KnO9yWFjRw5dB6eP1hok6MvwDS73BWMSDyEJ
	 b9YIAGgLUhpf1q1jPf76x+IvHrDKZnDQjAMY06QP3VtJkYbrCt+GSjFLYvh+oza/0wdoq
	 oPButR7QN+28HdRU0Rf7o2kEA54bq8CgECtjF5yNmYKCyiVX669FXiRyrUYeEY0YmqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
	b=WCHcLQTBn6z17wRzDuuVoZprWifIXli+XKEJVKe2R2bhPxVX8L01U2wS5CkHuy7V4h3I
	 5lLVe05DqrYhV7RLbva4HV1AzOtWqIsHPOG7yQFnPyNOUfrw4+oR8jYV5u5dNkT/iAZVk
	 FblNA/sE4dfIKz2JN55Dxg/wXc7EagMJSN58KEG7iTeYKKv+QjPJpFJolmJtknLVPHikb
	 0a8FdUe9vLgRxpLhFvw/XRgKh+MDjVfHiBB6vRUq7DauzaOVeVRk5mTFuT7lz9smeohRN
	 rP83wGbvrwyeGcKNDGZjdZLLVrYWMhfyuqP7E2jGVMW0Lesu8zBXLxKWGcs5Q00Ex7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxpMzx4E;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27811606A33E
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27811606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxpMzx4E
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4182935e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 03:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966343; x=1794571143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=MxpMzx4EXCrl9s9/r80CSIZEdrWtkGNBI4tsPzbGF9W4RTW0vwPYtBaBd4L5FwbNnY
         pnekJ2frko/Hyl9XJnPDIq1Vp46gE0w39QUttIrA/mFoiQJ38hYrkzUZ1JxUygkPp7T4
         jtA+rNm9xIU37LchpUoGzylDBEztpERrFnZFJL1R36Rm+crVa0A+llSLmqDRhnMAdAHl
         LVFgFL1yjWAMr8VB1wQGlSfEr7/sP3rZXPeqY3ydpy5LqEJ2iBhgw4WgSOTUpkWk0SXm
         /02K/3e0H4VmQ2eH2GHmi/lweDD+duVaMbEouJD9VtpWV2y/kXfWGATWI6HsJ+FCyj0O
         ifIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966343; x=1794571143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrxKnimkJlrFR0WRqhZUCXVjI+A7zsd604Fm1CjsY5Y=;
        b=xOdkydzM07X84AJfW16gtiNSgydq7Fho6rLCBx3R4lLkHg9Eubz58jw6Oi9eI0r0O3
         gIg7LAj2ZmLZO42dsVkGEA2l+qpumtY//yyoE0lb0cTcGdABiba2t31Ci1HIBTpPugSe
         OquuHzK7jD5JjGd908YFyTnBEtrnJmxjyi4kP4uUpjRHpT4DbhhmfFz33uBH2PUCuMSi
         PGMCFVXqV67NL8dtyOaPsY8mTjR0P5TW/xwO5T8RO2/KACYW18u1TBW/bIyZlkuaWXJn
         lTEOTcnFdWNpTxM/uLNwSQMeNcVxAurrM4J3ffysO4fgexNe2y/N3qqe2BpWs4Fw9FYQ
         1qgg==
X-Forwarded-Encrypted: i=1; AKwUvBxUS0EiXZlyMk/w1Y1lf0bZXxDD67ZUXQiOnAK3PYpIxgNf7jw9bmRBObSJh2KT0eIVRSrRuYSzyiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VScmsUDG00eaONyZifvSrADdzDDprps09Z01wWTPg7RWgMsrT
	L0RhNjsFgbYoAU2stSqdOfKbrz5eV31+eFBzZUAmGbKTsNBQLtQxbfji
X-Gm-Gg: AYBFou3/dKE3blGKu4THQgtJmsX8uLeyfAB0Jh/yr/kh+PAw0555ZWBinymqg903fUM
	rnFBT7SnITyWoGrwd4YWRwAIb+7zPR+xWx5jc/dMpBm9F1e2jYCHBR7h+JXIZHRTyEhagef/GEq
	fl07nMh+e85MDcEmXRJCGiKXSQ4VrXu1CE2I2TpwSMN1QiobNRj5qdSY2xvX3mkw2OPwKsTJVuo
	D0MApKbz3vo5/xNgODs55EitSMLwq4zr2uaaXIdMHqaBXNo4wuKpQhWBI6i/9PZDCWDBfK2Td1y
	PVbKhc+YFDh5f3ZfsAfqcz5L2j3ayEHtdZhsbzmQXQ6PeZC1judsmGNuvKlqi4Vr5bfQ6o+i2U9
	p9h1eL3HO57fXobLSFGaY1nrB+WYjbo3Gf9olT3b7gxr7QoNKW3sYjtdSX5W+9ne5ai3ZtQWZCb
	432p47SdbVCELyafudjmmyA+BAUgopEenxp/dhDy+te2uX8gXQfpStfwzM3XhDI+/c5OpneWdrI
	6k2vhqRle9GMiI9UPVX/eoVNKfSKAsoMB+WUGz3VL5Yh8NyV9BmCNF+yRZ/2agQDYWkiKyPHgaO
	11aoIzQ4vSMvN88g7yGfDb9dlxbeeo7fhrpwIoVxZYiNhxe/o1omKF+Jaa7efSK9zuGzVYZ2lki
	+J7u3o1DvrkSlqbs2LPi2vSkM4O6ekqAYog==
X-Received: by 2002:a05:600c:c058:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4b6e0172438mr27417465e9.35.1793966343552;
        Fri, 06 Nov 2026 03:59:03 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:03 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Fri,  6 Nov 2026 12:58:47 +0100
Message-ID: <20261106115852.189098-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..2baec734df9f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -708,7 +708,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -770,7 +770,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1105,7 +1105,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

