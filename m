Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F14134B677
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448774; cv=none; b=cCqKSBAJlFx0fJ0TJwU1N+v72KdAzbMnqJlAU8VtGT+TiewEccpgvGJc9tqMcMuIElmbnqw+DA/Z7Dq6lWjq0rYlc5TUsHrMzeeiEapDhSz06HF/BQJ6igB+Vf4rswRn45fBq2ChiT4JKmj41o5u+JteikFGLn3kAW2y6urrzrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448774; c=relaxed/simple;
	bh=Ly8zzWDq2H5KxZ3JO5w8PK/DzLvp+XmT9nBrLcr/RRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0LYwKj8p9PfT0KgWIR1DyaLYjBWDQojEubvYUgz7o8EtdwlL46telSHKkdfqnQOwAijWKbHoIrJ8uj56CudoaI8ohogholsSYa+7b96hVUFdjUeMg3lOQZIQ1be6A0FbN5TbGFJ0twXSNum9+AVmVEQBb8KGZaudQEucDpeWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=beM6iXGr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="beM6iXGr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640ef485673so207818a12.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762448770; x=1763053570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiD3EO1rNl1PZIk/GGWVSfbo4R6DA7FH3uGtcXk+fNc=;
        b=beM6iXGryiZi6x8KgRSwPGIT6UxI+yuleUvMYB2ouZbMRGotti0L7CeJJOvgTImMfO
         /gd7oWoEHPQC6fx8D96llTPtjiPeprMPypwFAs3VcOt9WzxG7coCpB0c3xEMRUb62aBK
         6d9cF6akWDL3RV6P9OWBUp1OpeL5aj0wJNr0uW6Zj03Q2Me4YtkqH/wqRNaGBnbHGpvQ
         3hGrij9D/xrHSKvMjXBFU0GFFZMqp8no3bZNAwA3pqaoFn2W23P7HSMRmrNlukcEMS60
         u9Fsg/xNBPUsnC+rReuH0j28QeiRel1xqXIKnkDu03UQRVLCKaBDm9WEla46zHa5D7S6
         5mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448770; x=1763053570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiD3EO1rNl1PZIk/GGWVSfbo4R6DA7FH3uGtcXk+fNc=;
        b=vgsbmX2xZ10i3R9cdte2HTcWyTOSsPZi5l/SEjwMa7XIk8aNYwb01HdsHTP5iIFA80
         zv+l+GU7tn9IUK3SGOTVbUwhy2isKdczQpQlbPHvSR7IRoGNcpyvmP6PgMvf+JqOqMJs
         2KssrbcFwlOwEzpj4GEJc4WEJXUvq6ummB4AnGfzgU3mjIp4IVNI+hUkV4Qvr6Vt6PKE
         NVpHsB2YbtZze9Qv8xclAyujgUvViPkH6QIJSZ6059LDdNO6vRgCD5/cSRkcb89fkwOl
         aSzOxHzD94WIvUiph3Os5YY/YHPaEf1eVFPeQNMcNsnMDDHaqiIN8ZZW7kizyEIhMhWH
         eN2w==
X-Forwarded-Encrypted: i=1; AJvYcCX4viz5gGFrVF34G+7n3IsVCc0r3K66eTWMQ85vmfLiioM/FRaoHh51XHbXORudW8wcXrY6Rx7PkrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DeKO43hukURcnk5MI85BrerZrzLgVZfIefPmaribi6htMe7z
	WVkesSJEMA8XyX6kdnVhBjmZ5e2PFg7CeN+3w4JoHFnfYuUP+uxI2JUGKJkCD03F+1s=
X-Gm-Gg: ASbGncuJtvXYQF1cnaEK3LdT3awCgiwpo3dZ3wOltjeGnJYve1wLIXz9E739nHaDw7l
	cUBbxz70iYIrqeMBg8ffvGf3nE4kXA1IdyOTr8dMt7TnbeiEY15F4+zo02OcTq5V7IU+nW4d9V6
	ojMeeN5LRzBAYdUE+2biKtEAsuSBdqz82rDIsocRMRcKoGkgH0jIlOkovFJoBT9CInG+0hpWMXR
	q7EcPQhFYesfQp40rHVvO0kor+9QyafmyhZStNs5u+4WAuBjXeJ+qB9Nsy6qUQNWefqodblC8Qo
	hNX178cLFU7NVc/wmXWkwfRZfg3feeuPKvQ3kYVR2KDdW+sJqLmqTEqlwoRek6Cy65oaCqmTjd3
	8uygMn1ptfInLPcS9Dzv3fBlRsQuktsEbk/N8+fEoIg+CYjacljv8VFlRHCfyK20ai7G7eLbdVK
	mrotHGW7KbsnQ4PG4TkgCgxQ==
X-Google-Smtp-Source: AGHT+IGDODSfRoR2BHtZkTmzc88EZHUFY0L8k5fsPa/cX950AkjWDwLIrCB/BW+c3xdPiiHowTZolg==
X-Received: by 2002:a05:6402:268c:b0:62f:3041:c7d4 with SMTP id 4fb4d7f45d1cf-6413f20f99bmr22030a12.7.1762448770423;
        Thu, 06 Nov 2025 09:06:10 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm2302957a12.5.2025.11.06.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:06:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: sprd: sc9860: Simplify with of_device_get_match_data()
Date: Thu,  6 Nov 2025 18:06:08 +0100
Message-ID: <20251106170607.445196-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sprd/sc9860-clk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/sc9860-clk.c b/drivers/clk/sprd/sc9860-clk.c
index cc5ed2dd8267..c106b6422649 100644
--- a/drivers/clk/sprd/sc9860-clk.c
+++ b/drivers/clk/sprd/sc9860-clk.c
@@ -2021,17 +2021,15 @@ MODULE_DEVICE_TABLE(of, sprd_sc9860_clk_ids);
 
 static int sc9860_clk_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	const struct sprd_clk_desc *desc;
 	int ret;
 
-	match = of_match_node(sprd_sc9860_clk_ids, pdev->dev.of_node);
-	if (!match) {
-		pr_err("%s: of_match_node() failed", __func__);
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc) {
+		pr_err("%s: of_device_get_match_data() failed", __func__);
 		return -ENODEV;
 	}
 
-	desc = match->data;
 	ret = sprd_clk_regmap_init(pdev, desc);
 	if (ret)
 		return ret;
-- 
2.48.1

