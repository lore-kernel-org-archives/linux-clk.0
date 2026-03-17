Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3421018A
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 00:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773707360; cv=none; b=U1UJMT0iKUYxD2QGSRNHnVkNzc4nDQDtkBGzj0MrDINenCfpd86koqvGQdsyBF8/WItMindkjtPIzbjddEcBHy0LeD4L5ROMCfT3BOFT2RNh/cacQH42O6XMb7CR8TVKf/Zgs20l6zbjqY/M8tWUl1wcWhHj+PYc2rIqhuQ2SEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773707360; c=relaxed/simple;
	bh=Ykl7pRMjv9ddmeTEMSu2XWv5ypxsnnaE2OuTTvdmJf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B15V+1QLHonfoWA1G8I/E0Nj7jZpnc2dMPESnleGKm3kW4vz5gMbAP7q2JyDE4TAO58gbr9PqXwGEB5c0n4xG6o6DKacM9sPxcNEWOtQgt+Jw4490Haz4iUwfwv9d9SxH9NIWe5AM8V3bvzUsATGXwkxhYOX1MV0yLoVgHygtN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKqgHCMF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKqgHCMF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a13374cf6so4614932b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707359; x=1774312159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEaJEC5yeKcESXwFqV6k9VnziI7uI+jjMq7JZGGKBfA=;
        b=JKqgHCMFSBN2PktyvNv9ikODFsFN4db8y1UDUAFV/l3h66ijBTPp/epT4aUYOshxTa
         /zCbg8ydFzlS1rtWzGwKKDfhw6mcsPjciA88tBxolmK90PX1Xd9qoy5UVXlqwkv31vI7
         B9CNqxKFN6v6yFspDcztc1/MGSwLCQSvZxQhInkWi+RazCtKvOwtq+NLIrfb4vVoPKau
         9+Qcrka58jKKJfCn3zMCdAaD+qXWKWfxvLgIGrPojnnR3XrAgOdvYdxzMLmbVexL73/d
         3cg/KRTHRhC3DuS/UC/C/zWRYnDOkV6SIuyvr/vqpN+nnztK90kvC5GTUeJ5McPGAwXP
         klfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707359; x=1774312159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEaJEC5yeKcESXwFqV6k9VnziI7uI+jjMq7JZGGKBfA=;
        b=CdywjcEy1uR5/oJ+bNQoHw/DqW/zw6/cqEQ79/SnbPgE/exR+3tyYwYFvsRDzAN62+
         WKYbcUq5ReCRIczixeeyRBSieNff2+qxqjU0L00CEXHekedrp/WeFDIIHrforhAkUaQF
         SAPImXhZ8oTBhyijMtKq40YpuBgz/plpFhWaGzoXKa+zAMGFYphCoWzTV842ZazflZHi
         33jrNW2d02U2MrTTKj9OXTKG4w/CEVxrVq0eztSC9hVjcYKIt6EUm8aTr8TRr+f/9N1l
         OvmKGBpT0ftJKBukAAXcZ1axcE+3dhNhXf1oHrc6Y2iSea18ZzTIZ2TdjaxFjbnHwlt4
         qqyg==
X-Forwarded-Encrypted: i=1; AJvYcCU9lfu4kzMDc15VibH3US5fSg2XyyVFpvMOs2AhQ9WzCdEAZ27vCy6EEeMtHULWvlKtdRc8I7umblk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+4L79Oy4V16SRJ4G1xpmY5Tex9knh1r/nRHn27+5QmpC5CwT
	johs0nDnn1SH6EMEFpRMC3OmyTViy8x6z5egVXJJipHCvTzVBEt7frZRWTK+EI3x
X-Gm-Gg: ATEYQzy/kmjGn6GqZ1SGOjncowJt+girc1HRvpvpV104qNKU88F4OSzjvBKCs6031i2
	eTLvWqnZHq9XZlH/LFDMerN0QwSDDY8fLaybJjyVw2aqBWi8RSUD6IBJz+sXL7DbvyoDITlKAT3
	PmsCYUDtgKXjs8h5NcpDDBkapPJTKbRZZzs595kw3/mdAJmucCLXimXy9xMdPqqKMi0dmTMQwHd
	TH+qp5v8VPgERiwlQpigGpwuW7vUd1Kh4MyTRRpL8qtP1cqW5rnCLR9yAjFy7VY1wU2N5lk4fLa
	lKr4bJeF65JcEoSXejvtnfL42KBkx+wsMp6ssWGMPa3YJrAHv531Dh2g5a/VZUDAMzETGa39n6m
	0/VVeLXjsyzUkHEnyaLfyLM7IuisR7pZqGOKhBBkbCDjp16I/bt9az1tOuc8ygcPVGPbauHs1r4
	Ld5s8Dl8eZXv11a1uyrR6R93RHE6JFKWiaGstBbT2ZCKgRbzfmlWk4I1k=
X-Received: by 2002:a05:6a00:1594:b0:82a:778:cd73 with SMTP id d2e1a72fcca58-82a1992c45amr10581048b3a.51.1773707358578;
        Mon, 16 Mar 2026 17:29:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072603c0sm14010022b3a.22.2026.03.16.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:29:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-tegra@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: tegra: bmp: remove kcalloc
Date: Mon, 16 Mar 2026 17:29:00 -0700
Message-ID: <20260317002900.71452-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to avoid allocating separately.

Use __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/tegra/clk-bpmp.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index f6d2b934228b..e2d506cdbae2 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
 	unsigned int id;
 
 	unsigned int num_parents;
-	unsigned int *parents;
+	unsigned int parents[] __counted_by(num_parents);
 };
 
 static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
@@ -510,20 +510,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
 	unsigned int i;
 	int err;
 
-	clk = devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
+	clk = devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_parents), GFP_KERNEL);
 	if (!clk)
 		return ERR_PTR(-ENOMEM);
 
+	clk->num_parents = info->num_parents;
 	clk->id = info->id;
 	clk->bpmp = bpmp;
 
-	clk->parents = devm_kcalloc(bpmp->dev, info->num_parents,
-				    sizeof(*clk->parents), GFP_KERNEL);
-	if (!clk->parents)
-		return ERR_PTR(-ENOMEM);
-
-	clk->num_parents = info->num_parents;
-
 	/* hardware clock initialization */
 	memset(&init, 0, sizeof(init));
 	init.name = info->name;
-- 
2.53.0

