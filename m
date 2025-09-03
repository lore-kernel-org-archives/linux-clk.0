Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A3225A3B
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912534; cv=none; b=rW8X1s0P1db5YeX91/yo4E/56u2WqvXxtA77kbvIYQnij0yuTTCicIRfdd8im5OGNMRsAEp1PU9hbKi4V/ewMLVZAeIMr5lXgRz/viOG11QtBzPthdyWi2qN6vrq2HXGn38bSuYfhx58JGQT1XUYVVlwO5khOLupRgGmghb3J1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912534; c=relaxed/simple;
	bh=P/K1i7FofzljhrSueDv/pWynCeqTvU5xHXstL0F7owk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tw5R6mBgnKqOG+26/5GzQ+3atZ8e6LFAT2KmSUdgT6kJNJQ233TipWRGBFDds4ZuIF+g1fzGNWUPKwqGYHBsX3ykZHKtqfLkgPHlSBCd+pIdlZQTDl1Ob3VRUo22Th2X2kvdo0NRtaF8iP2WzmxlfBxFBavGWmtL9PWEAyxPiOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bGp6VlD/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bGp6VlD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cne1IA1KPb6ZTLi6iYFaT1l8FItUau4GOBy9fEXnFU=;
	b=bGp6VlD/KU/FvjGj/4RKX0xjJcdMbjVfWrZidgeTycl63dnvbPqOOELLbjx8yVgbf0mrXD
	TOsSm5l+CjdPh/n4iQpWdzVXl/t7QnQO3JscnHKotE8kM7hp42+QjJmpKmOGPQghCftdoX
	HXNi2NknKVfKlktffc6W3SSePWwByFU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-8Yrg4axsMM610iKYHAIAKQ-1; Wed, 03 Sep 2025 11:15:29 -0400
X-MC-Unique: 8Yrg4axsMM610iKYHAIAKQ-1
X-Mimecast-MFC-AGG-ID: 8Yrg4axsMM610iKYHAIAKQ_1756912529
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-718c2590e94so18518056d6.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 08:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912528; x=1757517328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cne1IA1KPb6ZTLi6iYFaT1l8FItUau4GOBy9fEXnFU=;
        b=R/BgORmCk05+BAepVE7cFdB8GeMix1Kh8tHB64Zi85VS9RvcQwSvU4JImxkQiYpZM5
         O0kI3jFRcw+r6TtyF28j5tZyZS78WQMY2rhZ0noTmSbT6AVTOVYK0vilnK3SCkav49wk
         yVXAIqE++iUE5/uh/THDbOhwQ6gKzCf9PRBVsvyqtijNEa6dp8mKbDncfFc65Lv8hlht
         fZEyfuUZPccGl+75ibJb1cc5/jez55gNRFyQdGJRunIh65SAOqaEaTJFQ7Hlej+LlnEs
         Vkb1jW0uZAPXVMotTa2iCX7khfTCaOv98XtQxxzDZvmQM+JqVNFUQHVd9vyNiHZhm7Q3
         OULA==
X-Gm-Message-State: AOJu0YyLt20371laMmyghUuD03Y4gxTVW0d3seBib7SQDg7DKmDqoUHW
	L6Ggznj2xcO/9ELoqsmfWL662m4yxtHwZYBIgSYbSoRi2E5E+8xlC3NyMCGgtYlQiESNYVfedLz
	Tpm4BF3ZWZTBj38qY4yWXEtuuaWhW35JWssBgq7O6OlqN3+1RRbSbTMQwnws7dA==
X-Gm-Gg: ASbGncvVXaIe6GpjbmYcfV/WuY3rC69X3tXIGflW1mAgVPP3r9gDXOXIGrx1TXZSUYI
	Bp4n6SAR4E68p8TAoaGi/5pU1c2EpuClXgvdPLA5XQs7vbSrfs+YljiTLwoTrkn8xTq4yEe+mZ1
	V6Pv+g0QBtxujiNrDjnbZCDSodbU00yQOWilYexnlXyDY8m4BnlDYsxBsp5U1MolqdHO2gGKgPu
	5NtRJZ82/N5jogG5MoOItSmAOL4QeSqofsfFqei1idaAqx1+ev6P4J+QMpBIZ+l7xwwHnT60gs6
	daga3AQltznRo04962LvrC3rpgZ3J/l+wjbNQciDy9Eif1wpR2hdP+i2X2Lygww3lzlIvjjwC1w
	=
X-Received: by 2002:ad4:5bab:0:b0:714:36b2:a260 with SMTP id 6a1803df08f44-71436b2aa69mr119383806d6.0.1756912528486;
        Wed, 03 Sep 2025 08:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKzf82nm21b07pPChbmaSLNG0cWMiPFqfO23yrmL4+PQzlGJM4jozMFEYUd/hUiknVHZDi9g==
X-Received: by 2002:ad4:5bab:0:b0:714:36b2:a260 with SMTP id 6a1803df08f44-71436b2aa69mr119383076d6.0.1756912527470;
        Wed, 03 Sep 2025 08:15:27 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:02 -0400
Subject: [PATCH v2 1/6] clk: tegra: audio-sync: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-1-3126d321d4e4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=1671;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=P/K1i7FofzljhrSueDv/pWynCeqTvU5xHXstL0F7owk=;
 b=WIU9TP1V3lwK1E6Bzl3annZF1C3X/dJCzNEowbNKKUGh/2qhcuD2XUgjQlh59rAwf72D6j2EZ
 zPdaX3KzhjGCwHySbROqsYWV6u1zxKdS6xuPBft/N1d2s+VikDW4r19
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-1-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-audio-sync.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
index 2c4bb96eae16e2d4da8740d4596cdb562fd65e73..468a4403f147a2bfbff65b34df8b80a0095eed15 100644
--- a/drivers/clk/tegra/clk-audio-sync.c
+++ b/drivers/clk/tegra/clk-audio-sync.c
@@ -17,15 +17,15 @@ static unsigned long clk_sync_source_recalc_rate(struct clk_hw *hw,
 	return sync->rate;
 }
 
-static long clk_sync_source_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int clk_sync_source_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct tegra_clk_sync_source *sync = to_clk_sync_source(hw);
 
-	if (rate > sync->max_rate)
+	if (req->rate > sync->max_rate)
 		return -EINVAL;
 	else
-		return rate;
+		return 0;
 }
 
 static int clk_sync_source_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -38,7 +38,7 @@ static int clk_sync_source_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops tegra_clk_sync_source_ops = {
-	.round_rate = clk_sync_source_round_rate,
+	.determine_rate = clk_sync_source_determine_rate,
 	.set_rate = clk_sync_source_set_rate,
 	.recalc_rate = clk_sync_source_recalc_rate,
 };

-- 
2.50.1

