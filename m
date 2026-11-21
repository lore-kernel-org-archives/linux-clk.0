Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296476;
	b=H7VqeW+9O47fq9XZKDOJOMtWNLrbpKErbjxLczZc0D6dVnD/jXlDMAZjqzes3DC6PmoC
	 CdQAX6hW5xORQXDpOtGbtvgL9DfvMYGyMkpEIp8Q1+fZ7ttShx5ryq3AXqk6iXCx+RDrB
	 q1kyGMCJAle4fAv+ShIrcto4nXyb6aK/mlQOCLJ7ze3UsgaJPVMp86BXdQX7RlqEZ1HET
	 92gM6ZNl2ssXdTxopUZPw8C905tdrbgSQlx8x+5+U68xw9zbI/v9SqnFMMvLkkWhLgx9w
	 yo8tj94LLqB5cwfRYJn4gNff9rPdy7jQNt9qI9g8bPu5nZ4Zf1iR85mF5DK3xzhWffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=EANtbOD1xdz/SDrUvG286r0WMvVVMfxedwX0uGw8SqO46aBFIWVtGHeDQPNKEhirNun/
	 /2IfoOoQV07QNtZrb/c1F+jUi0Odv9JJOcVhhgUJZG8FADPonMkZn10Gbdg9SiS1521Vm
	 YvVZig+rW8qovZd0mQTy+4zh2S/G8furedjgK3EaK4nu74Vab41Ih/BZyK96AVdhf8IPL
	 j4CcNzTRzqVT+YToBmMSl8eCTqEx8Gl6WePFJFV9slWI02UOPzUJmcTVx9yobsui+SRw6
	 Iov6Tiuv8+2paRb+H26N3JMwc8pB0dnGatwgFNpH0eI+CWMdCuyxHKMRTYoGGfwenlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brq69Qmt;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71F606A33A
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA71F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brq69Qmt
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so12749175e9.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296474; x=1795901274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=brq69QmtSdY6LvsBGsyCIgmwtJxd4gvXCgAw8iEFSFZES0kqnoRxnN80CAAT4Hb8NU
         OhxM3IqTo2Bvs9qmauYl8MPUocEXyUZApW2LIiNtk0Lg1Zc35ctvcKvK+c65wALwwjj2
         RKFJ7aR8wpjuNXqUwmWtC03DTql1Vx5kLaQadqNb1JlBtAG0Yf+qFMZKEWaH5yp5cz5S
         AVkEMK5EIG3iyZv08sDRjYy/Q81xzgsxDhH5P9Sicu9WA1SCNJgln+wrAj4ZZfpamtLQ
         OCiF0jb+EuM+9GFkf4w4jaxZ35nISU518Y+3w81EZSwiz8/PwHWzKWJfOrXIMh43PHzU
         4Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296474; x=1795901274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=QyN4Y+6dKJtVwGFeJe1/6NmYrcv74hVwaxyh+dWDQ9NSJ0jEJ5rlg1LLyrqZZzZF8X
         EkaKPEDWPNNitJ8YOOYx/nXkhR7kEnnveyHEvIyURbHY+cBSA/YR/8WQHVE6+4Oo6t3M
         5jrImXcr5qLjse6D+ynU0z/kWqpE6lMWox5Dw7Y5pHHaQndrI3yfktu/jIO5eEBVk6Rk
         0pGGqMXNymlg31EcxADrHhVA8gSkx5SnmjbkWwLWrsmq5B/GX2kp4zZAxgOQHotPobih
         o0pdIQ8SLF19OdsH1KpfajCJBCKcNPzo49wz2oxqnBOBLpuvnDclZmcr+RusgzOL5VWx
         YhJg==
X-Forwarded-Encrypted: i=1; AL+hErG8i4r/AyuPMJgvDJCkACn2+IHs0rwvtNzSFQSl57gTbFH7gExE3t/Hl/6ImdlnFn5wP0UlPfwN05w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AIY6br2vhm8Ct7YiYgPql5TpFIE087s9/HBTU9Bm/9h0DBCj4
	jiGgc7h54hM3JPtb6jbEtV92HybY4Bl6OrLNaowQmSNZUlTYjjJPuHtf
X-Gm-Gg: AZFdTZe47cOruv/boQ0Hqrpp6ny2gJINoBCoKcZ0Mm4UmwT/8hPGPzuwvNkCT+z//s7
	HrVHdgSLRVrIB8mpRoBN/D6EArNnAVF1NfRvPWledMcDBMKG3ey9GYx/UWE+/i09U8Wz50Zdoel
	22qiJGlMCZAbqjXZQPZw2OmMKRlAcCnDY8n+b1Ce7cJ+DW8HgFO03i9E4HKB37i9iPcqedXaWhe
	CX2WC34hzRotMlpvsW7vKfPcx23sxqWzxMZacFTaBjWaWBDDDl4GUitdIHnmvsTmKcl9JaArxJn
	we+vqXDCyS9OikJBQNP2nLidpqFS/OQDDRTfzi4gtjKdljtyclkRVq2iD8YCMTa6Hr2zGitM+TJ
	Sua29XZK0rQfT0t/R4LpBQs/zTxL36PadSs77TK8XnqyByR/RK2D899goueNR+K4U9qxImsH0II
	6q5QvjkHLOdNCO/wHRY6Z9a1ZGOh3pzCt+s9UV3XfJwwhu4DVRPwu8XzNdq+w+OFbUNBQ3yBBHz
	kcEEQSBw+mrSKW1cMuSvjsltAtgxGMCpfkG+2HE6AB+KOMgcwApZPG8w+Bfd80BBiUxjN6dfNLE
	36UUXzskTpeEk8BxSaiXQu2sOrE/7l3QS+LaKYTxyS3NvOugTHspEvX/b9cg79tctiyQ9Om/SVH
	YItWP351fNURXYR2gbbJMxRDJbppjSx73BJpoznixxgI5UDZTBPI=
X-Received: by 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr157077865e9.6.1795296474193;
        Sat, 21 Nov 2026 13:27:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v15 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Sat, 21 Nov 2026 22:27:32 +0100
Message-ID: <20261121212738.170775-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

