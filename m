Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551A933BBB6
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907152; cv=none; b=bp7YoEQsauZ1loqlaIUGSVi675zwdOHiDP0SpoASV+Ygx7FbbtrzhtqZSWa3OewefjtU5VSV3HCqBnoHJPGt509SPV+2K1kuNqf89DEKV8BEvzw5R8PQCa2erTzPD+1sAOsE12UNVWAaxlrDHOTNMmfNtdoBTrMjuSeXMIqnvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907152; c=relaxed/simple;
	bh=mIU6ziQ0sv9Zix1Fh9fnfQrda1ivwOVmFtHvMRm5XPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXbKQx/AoILAyoFZjau70vIwzbSt3mpd52vQhuOemSSZU/Lz6I5nzd8KodQrfTMwfA5dp6EFSNwEK+qmWgOzJ9Wym/XAiqkASywc4x0Cb7kHbWNS3LyljQVc6Z3sWoGhpPN8kJAJLX6G2poe9+JcowzjYj99AExhLP6Rg2ff25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CQkK7Hb9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgLyvdf1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CQkK7Hb9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgLyvdf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4c2YEEJer+Zfzb55LpmjpAdfmYfGR4hEXOdQAY4IDY=;
	b=CQkK7Hb9V9Z0f1NAnezMxR8TLznQhBFdEn6XQRiyOwuRCWYTXC2N2tZ9jTvCyzA5mTqpMn
	jqRxtHsBTBbQkUA2onAW0+waqS3VqEu92Pi0xJYDh7WAs4BROFwc0EaPAR5QRvcJTIUEIi
	U9hdOgKIGrpE3KrpS1706nJppcf5mUY=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-1gu9ZE_BNOuRY9gOGJRKcQ-1; Thu, 08 Jan 2026 16:19:03 -0500
X-MC-Unique: 1gu9ZE_BNOuRY9gOGJRKcQ-1
X-Mimecast-MFC-AGG-ID: 1gu9ZE_BNOuRY9gOGJRKcQ_1767907143
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ec87a9e81aso1834405137.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907143; x=1768511943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4c2YEEJer+Zfzb55LpmjpAdfmYfGR4hEXOdQAY4IDY=;
        b=hgLyvdf1Q3be3dE1XuyM3MHZraQeDYUi/sX3Rt5QpRDoXmb2QT9TUQFKWNW8iTazMw
         W6GBuz7ESKBuAQ2PJErL9ygqzSb/3mQNDHeZPgY/lqN1jYOPuuMvWY06bhl6bAq5ZbQN
         O+yFLxY6r85Ro/NfTqP9PnyrVBA1NXqPVYaTh/r/ZizJd+ydCB0MFxr+bpI4nKUKr9PA
         gzrKINubcTJW1ruenFqDfFTFJ6l5VQ+iprH9T/iCdcKR6JUTu3wlMS7NmprRFrgPpXa5
         9yEbPCPlSr0dP4WLUTrvItY79Tr1W9OaUaHpPmmEZYwVn9ooHFxnS8QrZXrWUPwwpI02
         EHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907143; x=1768511943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v4c2YEEJer+Zfzb55LpmjpAdfmYfGR4hEXOdQAY4IDY=;
        b=Y2WlxZWWKWwc1+L4g/zLNy3GUzCUw0kmSfnRFFveBiIkN1I6U8p1i9qjANWfyeWMJT
         2cJpMp4Ob7CJrofpSM8Pm2AZwBWX4khKv0QEk7ELqWT6/Cdc45zYra0Fy81XgvTigP1R
         Cizso5NdnVwoOOzA72TVFPUf/p6CIFq1dpopAHNStxWvIxeqMqZ1qxQkJpOWHt96mNL2
         OsFRGcbLs8GCrBBJO3+Thu5SdXXk5smXig0QR1VCJc7iyD2ZfR5MW1bVI4CsjjNj0oKv
         jehVMl7O7s9ux/n+zStaMTy3tAqDXE0GUxpOp1W6/2OFYkBfu5WUvG6S/+qwgZOjzM20
         32+Q==
X-Gm-Message-State: AOJu0Yyy2GxOQ2lNnyWPUI7sONflRKh05dj8HJebxBjx8paGiWb1pojB
	UfN2Ipy1gzYg7oEm9b7nHFm41UZFBBkHbCo1ZaIeGlKtp6Y6Z5/Bz4DsYK2chbEMqoaZd4Ei++0
	Hugce1Rtt8FjEDnwqtPGnlq9usiP9uZYbbczPJ9nTn+6EfU4DZ2gtZICIKP0/qA==
X-Gm-Gg: AY/fxX7yiltmhnvr+LeMjv9qpeZnovq/MHEg0D9AyzU/RoVuPF6Y2hH3yWuoP7Q1ZxB
	hml6uDrtRz7h6rQhc/QmQTTp+0QhTm5sF7V/8g4EB87V4qxT6frsnCCQl7KGyz32KSw9jHgwde7
	dDx/d2/MzPsTKMhwJLs350FMlwWkdPfU7gwg74ap/pPXjScIpjgyufyGpeoZUDWek4sYUz4JCh2
	I240T69ax1q8iKGnusg5Bdw0J0c8MkXlIRQQ0u1JqklOEGSF9cK4vggabZS/KsuqwnYF5NAbYNR
	SVGLG120JwMES1YOfCmbCW0l5rmbfW3r37vQ4mmU6+8Ry3JoF3QoAUnjXKhsa2+5xGz28eU5lQ3
	t9M/zQRdVqm1vqoU=
X-Received: by 2002:a05:6102:3f02:b0:5dc:51c5:e3c7 with SMTP id ada2fe7eead31-5ecb692bd25mr2830885137.26.1767907143395;
        Thu, 08 Jan 2026 13:19:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+lV1dw9n8VVQIdj604XGIC7Kk1/RySzYFis3Jq6p5u65mYyh1jYUkHxYuUb8jxOd13J8DWA==
X-Received: by 2002:a05:6102:3f02:b0:5dc:51c5:e3c7 with SMTP id ada2fe7eead31-5ecb692bd25mr2830878137.26.1767907143049;
        Thu, 08 Jan 2026 13:19:03 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:40 -0500
Subject: [PATCH 22/27] clk: x86: cgu: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-22-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=mIU6ziQ0sv9Zix1Fh9fnfQrda1ivwOVmFtHvMRm5XPE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hbemvf5QPRx7+O6+nuVQ5Z/9PFMNZzA9q5F0ilv4
 /5zB/0rO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIFAPD/yKPU33dv/Qru/Y6
 Ob9K5wgTf133T13E4GnDi7d2SvO6RBkZVnZe9F2rrpQkx75EqWVrZXhn45NVjxn671mdizkReN6
 DDwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: f7a6bed91a19 ("clk: x86: cgu: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/x86/clk-cgu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index d099667355f8d80785b0f43097ad10c274dd61ea..92ee05d75af2b262d3e0e281c79fa07b3be1574c 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -137,10 +137,8 @@ static int lgm_clk_divider_determine_rate(struct clk_hw *hw,
 {
 	struct lgm_clk_divider *divider = to_lgm_clk_divider(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, divider->table,
-				       divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
 }
 
 static int

-- 
2.52.0

