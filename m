Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33BF28BA94
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658247; cv=none; b=kFZrKXya9SY/YXktpeH6b/rX8Zrh4ZiT24yo0NFGJ/p+tioA/3Nr9O9K6DumBO6AgoKm661jjx4r1tEyHQrZu5dOkBuGfM1CQQX1+id4dJdmvkPU4420gMthNONd6/lmrtVsg5GH7X7a5ksS0VK4DRJTuomGjZtXK+2OLo9z9sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658247; c=relaxed/simple;
	bh=EAW+HDTqn4JOg/LwTabgEKzUOriy6DOvjcW5MZPwhWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivw/dw/UEjOiEhIenFRXSXabm2R0ickGH8K+Pq+9NmIichqZk7jM5xqySVYQmVCqFzYB4WT0aRcJQ3uz3O0JHNTRxAxxpALCjBTfP7/Jg7BPcbcyLEa3ktJGtNpiHNs0X+hhgfIDek+UqXfxla6GtjdsFm0PbOLsr5JiU2j0M5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gJfqfxuw; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gJfqfxuw"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85df99da233so448315139f.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658244; x=1745263044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=gJfqfxuwowCWsuKqeuAdkMSHl9bb8j8JZm9q4bFVYmzeyjqsV1AC+lVzKfWTOZXgnx
         t/QV5zuJ65z5pBd+GJTh7kPD8dQvIabPvOBbOCKrD/xIPZFaZcSCOwdaUP6mcbW2Z9km
         FOD6ZGCLJPltcfBiSzBt7Thvk4MPQVU2VZcMCFC66fraPhW5h2QzqYl5yHxzUaSvk/Jy
         0FKlCVh86zTXbkl9OV+Ene4wK9F66jp7wryNIWYl9affzYaa+sOuTobe1i8kXfjqINZU
         /QRnwkCec5BcYogPKHZVoIsy+2fJSiTXY5m2/ct6toJqp/IAithIxfwZnuh5p7QtGjOL
         jmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658244; x=1745263044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=XwPsekcDl/tc+Ueb2aJlNW7BnktRgg7L5FwT1Oayuz3+fIJx39AmSMFT2IVFgjbVaz
         jpJCUG6HngFgx0IvqnsYLOelYgDhRI7cfxVpTdMzEnEWJZqpvO66KhAMX1fLA1VamBi7
         wJZ64Ll29XyGcYDujHmOlxlpYEKyCl28gSYrDCHnkT54Q8Qrpan4+ViCc5uQmlZNZ124
         ZgbW1cSeuAax3RAKAnR2KotzduRaZDAorjJngp9QO1cmKlWsDd8JzkVZ50F8986UXPIK
         C5VrsTUj6iEdBDesE1wSnrt6RLgnE198sMrRi628X+50EtG2JOPRER5s9uMTPrWzmru6
         Zz9g==
X-Forwarded-Encrypted: i=1; AJvYcCUGI52MuztA5chFaLH6g0HMLd3jzL1eCycAl8QicoeyJ9f0FSU7L6+XWZcQMojfnOC2oet8579EEh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7DOAu15KhXdsq5ZurtiF5YLIr9TupwdPN9GrDgWNZKFiDTLi0
	phcpWnbFQE4OCAxnzHBDLX3nS6+IM7u5dLgoWiCAZ/Yg7mWlqZvinFZoPlLNLVI=
X-Gm-Gg: ASbGncsusO1pvcMJwlun8ArjrV54qUtXlCNejwxH9DbmugcB0Ieemoqi0edvuMMJc3m
	aHn1sVtz2R0bfKNVUyiO1O3yfmo3QzGd8la/5mloANOiPaEcXvLix9jqN7dUHTl+CQNbgrcLXek
	mJnTc3ZZTWjHtgv/1s3esRo2URe8D+5OV2H4wvS03D39piARRletQJU7Nh645WwFc/NYKs0zfd6
	kLab5XtXGfVjKlkY9mq+42Xrf8DaqPoPI0eFNJgPocuWK9CbNWc67Po1yO8c3PO0b34Bh8QgQKG
	lT6RnQUB7vCQl9DRAa23KXrJI+SNerw6rdURbTbbetfew4BUTEfUg3YUfwc18mPmvVEeUcniw4z
	149KkN0MhfycdveU4upFMLnvW
X-Google-Smtp-Source: AGHT+IHzgkKPo3rteT6o1FQjeZVctNmK9CtfxtQBm7TMKIVPM8zC+qltuaZQi09FYGKSfneN1EH7HA==
X-Received: by 2002:a05:6602:4145:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-8617cc32960mr1403266539f.10.1744658243876;
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Mon, 14 Apr 2025 14:17:09 -0500
Message-ID: <20250414191715.2264758-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "clk_" to the names of the fields in the spacemit_ccu_data structure
type.  This prepares it for the addition of two similar fields dedicated
to resets.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a55957806db31..4db91c1b1d280 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,8 +130,8 @@
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
 struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
+	struct clk_hw **clk_hws;
+	size_t clk_num;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
+	for (i = 0; i < data->clk_num; i++) {
+		struct clk_hw *hw = data->clk_hws[i];
 		struct ccu_common *common;
 		const char *name;
 
@@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2

