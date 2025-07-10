Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED659291142
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183952; cv=none; b=roEFN5Yc7XPBtHvJLWRCeSk71cIL4iuv7RP/U5446b/tVsMT9qk43Y2v1f6/K5GODIWjixqnZf3LvXsN8UEHlgTVixIY7GR92eiZiC9hkYHEv11Gq9QGJdwxjxuSA8FN8NAzeLdgHMejwP/7MKpHe6pVVRQes55bbPiFxeu7qek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183952; c=relaxed/simple;
	bh=ndPCip5Ck49Ktpl48PQwNNnmNxNYrh2g8orjKuDJO9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ubg5ROzRQs9Y9LM7wc0ZmgY+NSOGpUXH3JuqbnxmuiSliAMKuZcqFK49YXhKzf3XaNUb1VQ7/XmvXyGMAgBOgarOCOZ1lmg4SNl6XGOn4Al/souz3sUhUfkcpAeCDqjJBtImewykWivcC9TO6UImIoxhHF4AoWy9LjuYn+ZeqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jGkXf8bE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jGkXf8bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONo+hxsTcQLvNwo/8GiZ2ZjWgPZLalbno8Kj8Xd4p3g=;
	b=jGkXf8bEktNRQnRlsFEdv+ROp+q+EF2TQpo0GEMAhrYZkxyWsB+S/1M4z9WGJ+GYQ+8LHl
	g8oVKNHfkuT1EosdErj5SVCUhCy/XQ1dPa/Zbh5mofSFc7AbtGWsHdVy+8/NdUI2YUdf44
	9AkpRQNggEUjTQwSOzmXQvM/xFz+ja0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594--IQKDkSHNzSqjz00Tyw5iA-1; Thu, 10 Jul 2025 17:45:48 -0400
X-MC-Unique: -IQKDkSHNzSqjz00Tyw5iA-1
X-Mimecast-MFC-AGG-ID: -IQKDkSHNzSqjz00Tyw5iA_1752183948
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40d04996136so1130150b6e.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183948; x=1752788748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONo+hxsTcQLvNwo/8GiZ2ZjWgPZLalbno8Kj8Xd4p3g=;
        b=WFV1Mj9Uv+Hb55cZQ4RkmktXQ2p22UzTbkpXA/u9tZVQ92TjkuztJsUZy9CILwSKB/
         0gA20bXbHtU1P6PElWc6QFuzrptS+v/0vSP8KpakKxWfeC2E59JoBWrjI8UgjxoXtE5N
         hl7M2S/pigtyxews85DNLU5huqzKOqfB+A9n1qGUk6zmCGXetV0SfkzNadd9wyzIQp0t
         3q0cVttH4zA8wx4y51v0yJyEqVgMZwBUutE6e6felaO+Q96Ax5vxp8s0wLGoA8qKMdF/
         gZo0jTX8CMZhYdzsCjvD0ZvBJbp90+UeuGW2wHMMAb16Zka7GEa7sV1horOwcwa5ulZc
         tXoA==
X-Gm-Message-State: AOJu0YzCi5Zd/KAwN6oZ0q5PvuSGtsy7o5nhFgI7BY10w8Ua2hbZ6UTo
	AGAeDTGe0c2+M505pJiMC4KRTC0fBYAongJIAnd5O47COek10jdpBdAwu4a9ElGw9+bk7cRx+rp
	djt58kKOdXTDuiTXgqLTxq5lDaEuQ+hyhuUomFGB0ot4ZpZQpbwRQ4rdEiEPfMA==
X-Gm-Gg: ASbGnctOpRaGEYL5aA81Vica8TnYVBaZ1m23+46t+OawE2n3g3L4+xkotxmRX1LKWuF
	g6kknOwAkoCmXHFa4RmiGwsX6ccBy/iKrZxtbjI2cNOU/HyNj3PFVPyNxq3HGoPNW+PbEJqVU+5
	gYJggifpikUMYyi20CjcXT61p7u+FEoOayTGHz/Jn3MBYRrBjOWiVJrX7sKZbXvjz72y9HZqn+z
	xS3D/Cl7lJTyzxOZdK6MwMtW5LZNN1onBhsbzkFtm42FyLZHQFwH1O4O0F3B5+ffTP7hgtGaivj
	dfu/zU6tHiESUTstp36jNk+lK3w2neX8nLyX8dXp3P8N
X-Received: by 2002:a05:6808:3013:b0:410:f252:f7e6 with SMTP id 5614622812f47-41511df266bmr906370b6e.34.1752183948136;
        Thu, 10 Jul 2025 14:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmEibMp4jcs1PHg2/eDyFmepCD2/DXzIyOVJWa/cAmoDFj6xW1ug6RaX8Welo8ps5dQFbrew==
X-Received: by 2002:a05:6808:3013:b0:410:f252:f7e6 with SMTP id 5614622812f47-41511df266bmr906357b6e.34.1752183947879;
        Thu, 10 Jul 2025 14:45:47 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:14 -0400
Subject: [PATCH 2/6] clk: tegra: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-2-e48ac3df4279@redhat.com>
References: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
In-Reply-To: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=2053;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ndPCip5Ck49Ktpl48PQwNNnmNxNYrh2g8orjKuDJO9I=;
 b=B/q0XSluAhzG2nFJAiFhQSNqVVlC50DcZTETKcq2QmqaxKRPZ49PFzu2nTL38lQA+XOSSZi6N
 6ENwvYARumCC5WpD8mGIYKyWF6ZUOmIvrRzeqmhuGeLszK53Nx9Hdeh
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-divider.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 38daf483ddf171293666cea25179a9c8809d8c3f..37439fcb3ac0dd9ff672a9e9339ed6d5429dabaf 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -58,23 +58,31 @@ static unsigned long clk_frac_div_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_frac_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_frac_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
 	int div, mul;
-	unsigned long output_rate = *prate;
+	unsigned long output_rate = req->best_parent_rate;
 
-	if (!rate)
-		return output_rate;
+	if (!req->rate) {
+		req->rate = output_rate;
 
-	div = get_div(divider, rate, output_rate);
-	if (div < 0)
-		return *prate;
+		return 0;
+	}
+
+	div = get_div(divider, req->rate, output_rate);
+	if (div < 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	mul = get_mul(divider);
 
-	return DIV_ROUND_UP(output_rate * mul, div + mul);
+	req->rate = DIV_ROUND_UP(output_rate * mul, div + mul);
+
+	return 0;
 }
 
 static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -127,7 +135,7 @@ static void clk_divider_restore_context(struct clk_hw *hw)
 const struct clk_ops tegra_clk_frac_div_ops = {
 	.recalc_rate = clk_frac_div_recalc_rate,
 	.set_rate = clk_frac_div_set_rate,
-	.round_rate = clk_frac_div_round_rate,
+	.determine_rate = clk_frac_div_determine_rate,
 	.restore_context = clk_divider_restore_context,
 };
 

-- 
2.50.0

