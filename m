Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A22FBE1C
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774335; cv=none; b=Pq3NImrc+kFid8nJV/r4lmaEAJ+zjQXIqL64bJwNSrQLvVKXkIb4AY2Zh1I1Bx4IHBHgu4GLZffVkvvLK8PX1yC4dHSXXrt0s6/w59dWSJNXBOf91F97AWLHhlmUu48jHb04djOcfeF1/7WnFgD+uec5Q3HWROV4D5s4/DSbuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774335; c=relaxed/simple;
	bh=wUvy3QQiQeAOG1bMC0djoJvJvuxkTXceaEm1ZvLPvV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u//vEAniyOUu+L2lKKoFioRqG3OOJJf+Izr29G4a4WhK648myHPFqud4UAOs1MnvXzMynl2c/di0FGSqsF1p3O/LK+i73/OL6k7+3mzl7lpTFQ/a/WpPnlqRwg7If/eFRi+jyGURnLxbNWDwFlrTorDp4Pf42t5beqFfs80BZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSGxCtJ1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSGxCtJ1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8d7f22d405so341937466b.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774333; x=1770379133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrk2D5glHxinFpEivMEobZUHDU8krg32pwTF1WkjNCk=;
        b=mSGxCtJ1tG4lBO8X8fD6W8fQ3b/pz4jZY3JZk7qNuJxdSLRbFqaQs0NfAsSoSgbh0N
         ugLJQTxfmr0D2eIR0/+S3pPRDRuFKQpIibCxg0BRAku7WDY/L7EV4L3B5Jsr1qHWKA8a
         V0gukHT7wYD4JJLGFlNj4TD3QntnSUFLbIR1KqdVYXo/vfutB1lnLwaYUaWUC8MROdYo
         W1NE3vdfPQukQPV8Qo3SZY6/DejKKLYbvrV3hWW5J+iJp7JD+WtHSF+Og1kYeg7qeZfi
         O5v1bvkIbp+2lAd8phU0AKlZw6RpPvMBRWbL+sX1N4rbnnxs296WmtVn7sIH05Kccb5q
         jPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774333; x=1770379133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrk2D5glHxinFpEivMEobZUHDU8krg32pwTF1WkjNCk=;
        b=raAtehbmoedhg9YwaD/9R8fj94wJiF/MQl6qimK+0Qgoh1hRaztfE+9mqhSdByOK3+
         aXg/eOWWTs8ud2Wa5sgsds78E05/MAyp/xJltL6vwcu9rbm7FB2W2JBCsjtP9BXgceG3
         rXJPbBrRGMNsOKuTHNfjIn1vTN9CuZY9okrutCmafZIGqEqz4z/5QxOnxKAJBnhFU5JM
         lMgq9bBLX2YD9lZJ4qmvX1ICwCoRhaG2Y+4xd0Q8XCUELSZCAzsrbJDI6F7Z2oDg8ixf
         OUwNwlwTLMW1MuxI6F5YK35707yQkFw27XKz/Tp66ylYRCk+icoP3kUWxkNc6DG2N6fV
         iIxw==
X-Forwarded-Encrypted: i=1; AJvYcCUUSLqwfK7EIaxg5d4qGjzOQQyww9RjNKlG8WOwUTHHRzSBOOwZ7p6YRjUlKAR19Utjvq3uqLjeHcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKbE0FCXlohQGocfsdV6MHOkSElljlRQHSKtpYYUBJQImYTUx
	bHHq2Y7VqdM76E1UiDRHEdxKcQeBs9SKG+xg6blCIMxQoqzerhN6/D8W
X-Gm-Gg: AZuq6aJmRGBE+bMyIkQ1WdH8Y2tcAbUwAWCS9+SaT++jheYbXwBkB5HEHbCwT7EF4Gz
	pGYBoUJ8cs8x4BjOw2ZwdDyGXUm9oYFsXPj95nCXy/x33ai+oetTdGq8gKCrsonJUVopbUXNwwm
	WEK3NKiff08lYIABIGy46/ngxyrhR1Ot1e9tYewe7wC7/bG/MbCarC06PPVEPNPSrd5sC1ukXXc
	FwBY0vp4Ma1ijPGuk/WtsGfbhNLUq4BA2AXBvVZMJ7vuRmRcfyIlDzF6XNJGCUGi+Qk+sfl8vDD
	BU0OoOeglB5qRjskpmjkjSHX1+piyG7lVKoC9BX4UfEDa4yfj1yGw45Yu3pU79YLYGgKuDIIPNd
	kUF1+erhgqkM9Nv/WIWMpocloJxAI+l9QyGJhU40xU4ViFuaWBJ6E5GyK7kU963su0zU7XjYC6j
	ji49voFT8U0YFDlHKIpyZJTnt3ocLibW3s9rM=
X-Received: by 2002:a17:907:3d43:b0:b84:40e1:c1c8 with SMTP id a640c23a62f3a-b8dff6678c1mr156980666b.33.1769774332758;
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Fri, 30 Jan 2026 11:58:42 +0000
Message-ID: <20260130115850.253555-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 16771a0101bd..ee92d07c6ff7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1113,9 +1113,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0

