Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7C239E7D
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912545; cv=none; b=Ck7EsHADgOVur2EvxiUnBhuRJDKh+b37u7urYVx5HjisA21Qta2fEFMd/Qw+8LzhlHBH4/A0lalShLa41ywaYJGm0rHY4Meu5eZg8/oE1/ojanL/NTW1fr4W7oQgSU/PzqLbAyOhSSKzgoyJC9KGmRcTly/I7ah1ch0pV21xHss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912545; c=relaxed/simple;
	bh=xHYSF20Z40O1IS/P13jD4/OabcPSIx9zs970N7AMeQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVHDIGJ0/j9+kd6WvWAOd3Ug4/0ihE3z6f+t8lA7g3K9iobtZxt+/TkpBYKo4epBsVhD886iACjAjYW32gE1O0ImPHhxVheu2pg0RLjgp14aUzog8Yu12RP+oE52WM0ln6L6s7OUqzNSGzMUz8GaHw63YL9MsL9jg/R3h3qREQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqiZFDMK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqiZFDMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DqnCcjwRpbK8o4p2iXe6lSoJojb6f7QiC9/BUgcCv0=;
	b=LqiZFDMKbJT76BexlC321tSqNvydhJIC01RfBxQbOglVVataJ6JdNet6dHyRdf9wSCdPiX
	5FkYfXqbBCa/XnCoaIzXiR09O9x5MPcDlLimEDiPhgHuJZch9zx58JrJIhI6EknBdbZSAd
	Jh3Trbqh538JUNqaIBW9CqhW17JYH2M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-Kg-R26NfPua0fcyDjCHc3Q-1; Wed, 03 Sep 2025 11:15:42 -0400
X-MC-Unique: Kg-R26NfPua0fcyDjCHc3Q-1
X-Mimecast-MFC-AGG-ID: Kg-R26NfPua0fcyDjCHc3Q_1756912542
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-725d32eaa99so15610086d6.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 08:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912541; x=1757517341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DqnCcjwRpbK8o4p2iXe6lSoJojb6f7QiC9/BUgcCv0=;
        b=pYsJ9N0AvkpfmJCDfaCjuIcN8gPerWH57hoqj+wpPKnQuzN5e7BwUU48RlWR5DjOfv
         zxitRhpgd/29F6FEPGRyA9Pl5jSfoYbs0jEIX6wTzEBLXiUWk6sU7yt3IcEtmhGaz099
         mTk3LOn6ylne6GHZPhUCwXVU7TkqEMpmDhUpFexzqEVBCGMzsyRdA7hPdrisaR41+IEq
         fpCrmDF0Zb2ziosqQfyNoUm6zMF21E+BPflACSuTBLv6xYQ9k9hXSTqFULlIqQJjZQKN
         DXweBquh4mlLrHBlhlF1wF5Imrr2hYha0mgmCnhiuQuqVyXo8pAnExEeK5ZoMpB5gNq9
         VRIA==
X-Gm-Message-State: AOJu0YwF4R0q2E4RsXoc+CdnDzWyiy2zdOielJBt8PF7k7yvVTBpN3FB
	yp2LoUhsvmYYLdDtXO811fdDCIzhYA3+1qVDK1o0iXh/tBXoPB5X5JJ3EEpYyHonAWJWHtALBAJ
	SSaZwT1sgyqwf7kCPmbbthEnFIt3HSfmraGVQfv3XWj4MJ8jpgI5nQTqzqdejdtvRyIS1fg==
X-Gm-Gg: ASbGncsV6K1Uabe533mzhQnLvgNNUXuPwINjmZb8pm86TBTQOVqoZtOK+oHHSRKNqZL
	V9dZK+asuW2VJXt9daumWDJSbbzAwmNRWBvg/96MvfVqYfdu/0uuR/N1j/nCwBKv9ELp66JMtWt
	iOCb6b06loZXrsnj0iTW0HzoTicgDhX++d2BrRQK7zH90dQkoH4hRppKF6h6tK2/NNtIKy4fmz3
	su5guglJADauZc+lLHXy1HIvAlV8TThzkufj1Rh4iYpif7T8gj4J2yOk7edGnvstrob5qkgVAhr
	T7FWKy14eHx3LeC3DGm3xTftruBp7Ym96aY7gMxSxZ8eZQJLdnbnxFQuoKAfY6dTer8lr8NARq0
	=
X-Received: by 2002:a05:6214:501d:b0:712:e30b:ef1d with SMTP id 6a1803df08f44-712e30bf1f3mr165062006d6.63.1756912539784;
        Wed, 03 Sep 2025 08:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5I10I0WKxYKgKAEy94Wym7iHHUY6i406j/dnJpfUUA78DHHNcSjK7v+PoMe2ZX5mXlpF6Hg==
X-Received: by 2002:a05:6214:501d:b0:712:e30b:ef1d with SMTP id 6a1803df08f44-712e30bf1f3mr165060786d6.63.1756912538520;
        Wed, 03 Sep 2025 08:15:38 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:06 -0400
Subject: [PATCH v2 5/6] clk: tegra: super: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-5-3126d321d4e4@redhat.com>
References: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
In-Reply-To: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=1247;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xHYSF20Z40O1IS/P13jD4/OabcPSIx9zs970N7AMeQ4=;
 b=N3/ppBwKIalyXCuBEW2R9w9ULDE/nReiU7B/SInxIldEMfFQK4/50ssw1KjHFQxbm//MjBL0r
 6WVAAeReogDDWplhQIpZ9kTvZzJ/B0C4NUYb/zmnGIQq4g+kbCW93kh
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Note that this change also requires the same migration to
drivers/clk/tegra/clk-divider.c.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-5-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-super.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 7ec47942720c5aa43f35107369b42804f4847b97..51fb356e770eeaea9d26ef48f298dbc00e164732 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -147,17 +147,10 @@ static int clk_super_determine_rate(struct clk_hw *hw,
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
-	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	rate = super->div_ops->round_rate(div_hw, req->rate,
-					  &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return super->div_ops->determine_rate(div_hw, req);
 }
 
 static unsigned long clk_super_recalc_rate(struct clk_hw *hw,

-- 
2.50.1

