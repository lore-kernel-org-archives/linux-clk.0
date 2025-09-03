Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D4C22B8C5
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912538; cv=none; b=gyzFip7YNisoPQQjkhg+TWU9zXClzlzgV9Jxnc1tr/o8PASPh1GWHQDQzMVHO24pAncAzLS15xXZ6ArkNBbAQsoAN5JFGHK+tVhSUeZwZQJlmUWQUjciNvLqdf/OotqfS1ZJmjcfLgqLIKy7eAPG9k1BXZUP1CJXslOgfF4Xyp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912538; c=relaxed/simple;
	bh=AjcEhiucMili9sf/wwjT6T4E9qy5apL2Ir5PIpobHoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvbfNsPCiXIUs0DSWeLhj7UY9+2rMn98JV8JBlTvI2I4dZkOIZuV2cr0wnHC/P4zO+6QkbSPzEFlYvp9iveB/I3oiRjNrDWGhw3dTuYQRKIezNiXPW6+AL94oEHglWmWt6CmxwWn3TDDBP/5F4PLA0xLWxB0XXxscw/cOC/ogM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJ/KxTBR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJ/KxTBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+0vXFzhSxSwj3v2mrFQi86NSXUL4ZDppFXq+HtAwjk=;
	b=DJ/KxTBRZzdXZhbnYxo3cKOTkGmn2J2UqGFw23PwT+7Vu1tQ9DQyu5fSKYGFXM8qkWbWDr
	RoHLF95g1zdB5A3TcwLtYI4DJ1evNzdVdD/+xqMs5YppD5mh2XJtxB7l8YeMAaiO/YmI4A
	lH3hNdtcLWk2E2CipRbkiq/dLsuOQ5s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-MlwpztLdPHe1F5IMxx3DWQ-1; Wed, 03 Sep 2025 11:15:34 -0400
X-MC-Unique: MlwpztLdPHe1F5IMxx3DWQ-1
X-Mimecast-MFC-AGG-ID: MlwpztLdPHe1F5IMxx3DWQ_1756912534
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72048b6e864so22664766d6.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912534; x=1757517334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+0vXFzhSxSwj3v2mrFQi86NSXUL4ZDppFXq+HtAwjk=;
        b=FUWXI2XYQGGVg/edU8Ev6IE/96V8dMraEC4vuP4imrs8doZttfq3FNKYNsPSUL2fwf
         oetu8UfLV0lonzIfnnRntp6GYfy7v79zU9scH4CF4z2elveBW5KyJYh3mKFb2yh/3wOB
         f/xmrLEGvnOWdX91Ccd+jYl+e+BUZ4wojDdx1gAK9pJchl3WYaMabE+TMriFPwn73adv
         EWqDGL+GYTw9/pNTL10NYZs7wA3PlX8sKe2hpgo8bF2VgW6swQ+QoluZT062sRfOklLq
         LM7vDbHQJjlzg8XkWv4ljGtvMGCqjYozdpVxG/EUKcBRtEJhF3A7OiiGp4Ior7D5KNsl
         uflQ==
X-Gm-Message-State: AOJu0Yw0vgtnDIHdIc1HYJ6Mk6bnJHLpu55q3lYQQVq+78UZ+bvzRGyR
	YQibkI8FE390HtU61J8OyYlBbyfjsfX+ZWmmUpJhyrYbDkULvoXAj1Dh4jdamPQtGN0daCso64Y
	5Z5uHKNExcLM1sbxl66u61Feo6ydQDxCLTuQkdjrdSRYEAbA0dmrKv4EHUwsPeA==
X-Gm-Gg: ASbGncu/sXLN+sajiqGSGNk6Nzg76PiyWyRSKBSxsGo2yQP7a925tCicw1/JKFRRtQD
	jdmrvl5eedogNaadCMwAfqiLjvyZla7AF9PyulFgi5Td/rOmFqsMBkK1ysCHydDsih34hrwGi/J
	ovat0KcQ7V1/tkmjLl/PNS0AsOEdlaOmEQChgL8koJj7ffJ97A/lImQ4Q/oLAv7l2/q9CgfVOvB
	adQbCN81Qx6aubzsuFmLWffsoTtrs5rtvbHjrGg7Z10+z/zJXEe6yFJm1MsYu7K8/u3zrWXKz/m
	ccdISee/0DG696vfq5ka0BC1kE1zmAAni5Q1hZciRFBzbtNJEi9f6TMVMyJtU2HHIWX/nrIygbA
	=
X-Received: by 2002:a05:6214:e43:b0:726:c288:a666 with SMTP id 6a1803df08f44-726c288aa54mr17036456d6.59.1756912533691;
        Wed, 03 Sep 2025 08:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3IlMKWWgNAO7Q6WOeecM/0SWSXq5cZbNHqhjh9Ns5zZcD414eMglOR+F+Y+S6eyNAlpLYGQ==
X-Received: by 2002:a05:6214:e43:b0:726:c288:a666 with SMTP id 6a1803df08f44-726c288aa54mr17035696d6.59.1756912533116;
        Wed, 03 Sep 2025 08:15:33 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:04 -0400
Subject: [PATCH v2 3/6] clk: tegra: periph: divider: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-3-3126d321d4e4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=1192;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=AjcEhiucMili9sf/wwjT6T4E9qy5apL2Ir5PIpobHoI=;
 b=70I3Mq4ZlKGkt6RonBDIV0MOdusccrx3oFKMRyi6Oj3qJe6anIuKkXklg2G3L0mxPS9RSXztK
 VIj/MFE74U1B/LMA9OcxnqvYJNn8ONfhSkWtW74K+w2SQ3VpCWSv8y0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate().

Note that this change also requires the same migration to
drivers/clk/tegra/clk-divider.c.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-periph.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index fa0cd7bb8ee67801dde3c65eababe30c96a176ef..6ebeaa7cb65648e77f11f2c676aa3428bc490a73 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -51,16 +51,10 @@ static int clk_periph_determine_rate(struct clk_hw *hw,
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
-	long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = (unsigned long)rate;
-	return 0;
+	return div_ops->determine_rate(div_hw, req);
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.1

