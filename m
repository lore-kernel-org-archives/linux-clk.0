Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B76293B46
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183955; cv=none; b=fxYXzA6fKOhChUh8aq8JaUERPGh2c7n4+UifnRMayFoV8666xkffengZHg5pmwKwZfKJdgqxx9h7j6BSSjzxIRM2w/+YKDZGb3PAzLM9yY1dCF6y0M2fzvgP602w+4TqNtLVJ0UWi+OaRTCpNwmh42LKGkMOT1kawCqrM5cr1Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183955; c=relaxed/simple;
	bh=g+Rr9YJF/IJHNNqn5Ts7X6CuYQgHeDHcghY0SbxnF7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuhhVl1NtJvvhvkukr4Nmfav5RBrWZEG7MIAjM6ffz9PHVBS77+Xyve6tifqt3UwLefYrtULcjGvmxYgCUM7BV4wRa+2Vx9xCkBolq8emv3mzmRnxN2skYbOxpgVjY6GSr2fWl2+OHEX4mEKvNRZyiEdjr76AlKv5izsOUdEEHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrU/bs5S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrU/bs5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqPFMivkkxDCOaub9wGKuuvGzsTLzlki1gmCh/1JiW4=;
	b=KrU/bs5S4htzM2tKq11eKyF32xOyNLvYENCw3aud2aaSeiss8UrMGKcZbLA4fhhATxwwJb
	ycx2VE1QJ0mzF+VVjY02nN7UCTCOaZN75m+FBvwMJvVG6JJUPilD8jOYgGcIb5V+jirual
	+MpxE9ETBQmqVlKMwd9NrGT8XQdHYH0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-miAS3drTMH6Kz9ywU6E6Rw-1; Thu, 10 Jul 2025 17:45:51 -0400
X-MC-Unique: miAS3drTMH6Kz9ywU6E6Rw-1
X-Mimecast-MFC-AGG-ID: miAS3drTMH6Kz9ywU6E6Rw_1752183950
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40cf6614bceso1217451b6e.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183950; x=1752788750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqPFMivkkxDCOaub9wGKuuvGzsTLzlki1gmCh/1JiW4=;
        b=f80SFSUfZpXQpEXOz/Xg4Q7sOwo4o/WnLTcOJKRqPZWzeE3WU6KVbyCqImb+JZlqOx
         /U4qQ30yGdErfNMgpH5N/t/lq7CKZxr6nyF4So8X+NxoQwYORJOtpnqFKTU26WdJJtYB
         xexdxViQgX8he3HAICgMmoPPV9eEa3UNK/kvWctpzPslF39+0ZcoZ+80JrQ6WTLDdjU5
         NKvCRw8P5nHa8awm101XctKmk2FayPTZG8w/dy/vGwOcjTymyJ6wP9a1RKabfxQfl8En
         wgx2vlPlJIO/NRMDfNnwio3O8Bxq/Ls41cG5No//M9SJZ5pYmjlwgLT5pE4i7d1vaxZP
         xyCA==
X-Gm-Message-State: AOJu0YzrRVfMerRCymVcfgThvO+OVcODaDqDRMzMELGtaQXZsSvM05G/
	Wma4vh7hPshB+uAZW5ahnpbMVvIbbPnpi7fESHhdzhinu1modw/fx+C6ViCQDOWvFRL2ER/Y9D8
	3TcF6jIzdpUwu1zyyPgI9UtEr1Lw5GhZW6RCGMgB2czwk43LPnAysjOxlVJco6g==
X-Gm-Gg: ASbGncv9bRzzkxVi3rC1T+QGQ8bhylqamo+xtO3XlFbKiAA7D14yk/iAxMtI1Xp54u8
	LvDUbezrqs79uy7zcmPMjtul1RlPO6mvqEzdnBWoE29zC9wbnUDrVrrL0TMcKmAUD/x2Q+dl1Jc
	ukUmbQGMEyGyKtAViU5clm34q6uOKho3VoaG/MAJTMZmSV20MePRaFuY4rw2WTzv55QQEHnXFXi
	Ygj+6NTkcfvi0Qdvg1pAoDY/ownXV9fXit7MGivTTmvcGsTzgQD8ryjkN9igx5i9KVJV+ehC7Iz
	Bv9DkKpGM9EcyflefGwYeNrRK71oM9nIP657ZJzTjP2X
X-Received: by 2002:a05:6808:23d2:b0:40b:2d38:e8a4 with SMTP id 5614622812f47-41539d97367mr381821b6e.30.1752183950579;
        Thu, 10 Jul 2025 14:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWRtZWye+WvsiWpUjSD6HA2ojrPOsrb25EBqrMr3mmCi1XL3FXlFKuxXiCK8G3yi3fRSP7OQ==
X-Received: by 2002:a05:6808:23d2:b0:40b:2d38:e8a4 with SMTP id 5614622812f47-41539d97367mr381810b6e.30.1752183950275;
        Thu, 10 Jul 2025 14:45:50 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:15 -0400
Subject: [PATCH 3/6] clk: tegra: periph: divider: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-3-e48ac3df4279@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=1186;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=g+Rr9YJF/IJHNNqn5Ts7X6CuYQgHeDHcghY0SbxnF7Y=;
 b=25yPFhayTxvRCgxM2jMj5FL+ku9ZTaEWwWbBzThJCxpVzKtij7A6jKLX8tv/Kw9S7GDoOHRRw
 6t95b8gXYloCESNIeKYKrzuVZ/JyVWi4igz3p0a1pdChn58PFeX810J
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
index 0626650a7011cc877c084fd93ba961c6fbd311cc..5b81b3c34766a8d80ff2273ea2fc08e988ee14ff 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -51,16 +51,10 @@ static int clk_periph_determine_rate(struct clk_hw *hw,
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
-	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-	return 0;
+	return div_ops->determine_rate(div_hw, req);
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0

