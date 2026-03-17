Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D781A9F93
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 00:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773707559; cv=none; b=ms6/ME8+xxF3thwzmKQPj++XtcJRpEv4CaWLcV7P0NQKq7AQz5W1fRa4c8io0g/t990ABVxDAwVeFcN5yZD5WlJY+aUPs/ctdVSoF2D7i2J1wnAkA2TQPfoMOPmw9FSjT4ecB5kUcM9bpXPtA/UpS3EnMPo69T7auoGXAvfh7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773707559; c=relaxed/simple;
	bh=QmoPvHZv7I3xFXH+KsMD3N90vgw+pDI/1KVyvvBmrVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6VjhmD1Z1LgMeUlhB3g1bbpkxO2h+FGcJNlfhJo+kukm+rBCuhfY4Y5TwC51n6yl5aiCY2LfW0HM+qoezH7HvLi6SeIlNsmrbucbxh8nhzD+UYSNxyNFjwUNsuap6a5IuI7tPogYPKFBcjUYt/J/nWltW/Hth7hvDLfL09+fgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcKKuTQa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcKKuTQa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aecc6b0861so21547775ad.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 17:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773707558; x=1774312358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjsh2f+U2hpeWjteAhQ/eYeijSGr3dLnz2WVmUmGTyE=;
        b=CcKKuTQawY1Vmiwqti0ZQbsfWKJVtwLYsRS39kzVq5LbTh+96r2zb0G5f87iDUsR4/
         37NN7T2/m5eWDG3fBlTjd/jE0aRZxSnJJdTJKXXCeA4Tdz1EmMrv6FPhlRPNRSkbzsLF
         CNHvPSbqHwXPvlzuGbZKWtg9xdZS8tlADtYwlg5fLgX27aKlhdtK2ReRvUEZtOawdnPX
         yqJVofqVDxcdzQinHS2yGMU008/UCnPOrSo0NYB4HxGN8lFaot++BhQWEfqRQAXurTmI
         /OTT9phg+xe2JUvcm9NpBicXobwV87bufF9p1wtCpy1oNevo5aZqRCFOH5pb4xfVZLpb
         AQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773707558; x=1774312358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjsh2f+U2hpeWjteAhQ/eYeijSGr3dLnz2WVmUmGTyE=;
        b=TUJwQjmxcGoNf5kk7Rryxpa6HO4it+du0UI6/m2W04lBDpfQXZJp0/ro5UCzQuNcmg
         aOP6a3pcxh55+UNj+ARgoju3gzdonmYBL2SrncioxWM4Z/3YGg/xSt9Abyn8aepOB544
         e3y1jOmM0mSGvJXHDe/K+jotejNNU/MOWmcRN31RsJjAZaXEFxOg/Od3xDasbwAwWkkn
         qzF98WlWgCcN7UH9ckePMrGdWluSnoKrlmaRqlNmLv8zCZYxoAMedcbWWee4BPIWv4CT
         tB/4wNE+FJJDweWY47BtIQT/c9xuHFMrNYf3ANT+gdpy3Kw0qz4qGBNBgjtwnpO0ZgBF
         yMFQ==
X-Gm-Message-State: AOJu0Yz5TpWfvk5WTMo9OWRucp2sbt5z7rcMggXPFxCMiBedghmIyfrK
	DATLagRkwnBQgGHEzz10doe8mX0Irfo3k5CdIbdV58oaq2XOXF8/694IekoDIV6W
X-Gm-Gg: ATEYQzw39RM79WTC0KuoiVy2G51hNeozePAx9Py8hNRzOMtcE+WYaduuW3Tcz/D2FFH
	pdje9Pi4qtjfWCjfC1XVsh68wiuvphnFMpdHAU3iKGDmDvFGjL1jH+gmG6WVpceGk/MmopQ0aqO
	wyt0E2OOCfcpHrBPi4huxCh+OJiwzX0TiceW3rNN284VuQHCFDta2JY9kEe/pFLWk5S2iM85pgy
	2/orZukmbnKWhCYXwgk1xiPiOvEU7thdpCbbm5zx5mJGccfSnlUGbNBhLhX2yhi7sal8/msNQnx
	0AsdZbAK92G5XVMdj0McimrC31ReW0VUhT+IjqSQmCnmVgrMTnbsje0vCPX2jwFCSt5Ix7zQ0Mz
	W0GbGfZcfjOCXxkOU69Rg+IgjePyeiKwR+Uf51BVYTtovSUP6EM3SS/GE4NSsWnbJeGYgoKYacK
	y+8ZNN8ilD/9XdXqRHseN0v9KgFzxDGijrAw6AA5dBK4DULngMlXRC1aY=
X-Received: by 2002:a17:903:3b8e:b0:2ae:aa16:acf7 with SMTP id d9443c01a7336-2aecab0be9bmr141252575ad.40.1773707557570;
        Mon, 16 Mar 2026 17:32:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06272ab03sm13019265ad.64.2026.03.16.17.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:32:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON MA35 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Mon, 16 Mar 2026 17:32:19 -0700
Message-ID: <20260317003219.71972-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member instead of kcalloc + pointer that is not
actually const.

Simplifies allocation slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..6eaca5b35dd8 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -17,9 +17,9 @@ struct ma35d1_adc_clk_div {
 	u8 shift;
 	u8 width;
 	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
+	struct clk_div_table table[];
 };
 
 static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
@@ -83,30 +83,25 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 {
 	struct ma35d1_adc_clk_div *div;
 	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
 	u32 max_div, min_div;
 	struct clk_hw *hw;
 	int ret;
 	int i;
 
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
 	max_div = clk_div_mask(width) + 1;
 	min_div = 1;
 
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
+	div = devm_kzalloc(dev, struct_size(div, table, max_div + 1), GFP_KERNEL);
+	if (!div)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
+		div->table[i].val = min_div + i;
+		div->table[i].div = 2 * div->table[i].val;
 	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
+	div->table[max_div].val = 0;
+	div->table[max_div].div = 0;
 
 	memset(&init, 0, sizeof(init));
 	init.name = name;
@@ -122,7 +117,6 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
-- 
2.53.0

