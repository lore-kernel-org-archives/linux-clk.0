Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFAD36B071
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876597; cv=none; b=Hi/21PvxbLR5xaN8oXe8q2tZXldSTgQouLUHSUpQqdTH8vZmqazpEeg48JNGiAIgtQTUu+bgP0bqldJznVD3ZPhESbY5pkwCFGO7RxlEhNb1FfTkktASh+eVNfD8E0T2AqEB3aV7J98PfDHwxuBKkZ7LHGGvnBWVWYTjreDinfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876597; c=relaxed/simple;
	bh=I8gVSNxw2aOO4ZdP0s2HcOB6Vs9l7ZVMP8y4tYKEw8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiipPjkv28FRxNJC7cIgLjbopOAUBtuCfObTb37ACjRqP4Zw1irxMxEAmOpaSNPaD5ARXPpZPOsB2wcEKBc+cvNAFQ8/+dSaohl0rb7gBkTaG15yTbSA1N62FLHqYAXVRydXekfS1UmP2INP9Mi6vyImKkJs/prdPN3WeRtXMHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZp4HGLR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZp4HGLR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b312a086eso1985696f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876593; x=1763481393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l76VTWaL5JNJWQVkhMGxzjJJc96x+kz2NkszPplq7c0=;
        b=ZZp4HGLR8arYZ/gfY2EfteuDWGLseuOpxdr5xLQS+LZODQkb5OhycKOE7yuk6Ooxg9
         gVuYiQ1sHdNa+aDZDTJmytTPQAntLpSm573mF0B/jPUblne9Z2uECHQdces8FK0Zy9e9
         pUVAQFZ7ENkd6WCcOqDVNpuTrmHIVNoKqtVY0av9x/Z5+xOWxnT1ZF1ZY/ltux+OQuVc
         lj4uyqxCIJhG/hFOHEy/QyU3RTy7kH6wiSqbiDh4DTzeHo1MG5le69BgfW56FzkpIdtN
         nOs34CPd9YWydBKDYvaoj0+c8eDibFrowhNibKZ/+mtwaaemNjLhkd+KEj/QyA2diVuJ
         7rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876593; x=1763481393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l76VTWaL5JNJWQVkhMGxzjJJc96x+kz2NkszPplq7c0=;
        b=BnemnPjkS8mlJ8rQL9ZtdSPRYxFvrHQFHYOuGageFVfYa8h89dfA6RCFhdHAiNSyKt
         1HhekmSKVMK0DTHjsm8Py6VDMj1WzSmyeIsiYPO4WqvrPf0x8+BYxgyrJLXAL34CaEIP
         9z1l2vM3X/FQsgdvCRUaNhzV8mB9PUFmm9KRGyLKoQaS79EAsuEReHlX083GOp5gxJPk
         fEUeL+ZGqPPAyUpJQxuKgMwtxHtojVenUj8TW6a7JduZ8D4D55Aw0PKNF5yDQ7g6ZG1A
         DSlT8F/v0OpGZq7Qbtzh9/7ycLm2DmBb2k6pQDXkIeI8CWgvg7AbvkNlWg4jEvCpjb0c
         AhNA==
X-Forwarded-Encrypted: i=1; AJvYcCXEbBbigkZPFEQuf7IiRKhbAbxmhB6FKrsvd7FlFVDVHFwHAfYo/iRnQbl1ZGrIiS8+gxX6hk115/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YySjmZnvchg7ceuWD8jXxLpvWy2516xZB8NX3fUZnrz2QeMcozb
	UEsk6YHvSX44t3AsAyRaPSXwwxDRpNgQeslHlx/ylVaHdZ1CMkGDRM/H590Zdg==
X-Gm-Gg: ASbGnctOxrQwDldh2IvSPGabw4VYAZgf817f8hIQO5s/FmezcGZ0mr5BALVW+H1CdIQ
	NrjNqNlIpELrrNevP4A8JIsnCQa5Z3P6Ov2rkLOLXKRT9yToecjmuKKQZTiJ/E0muy41DUTDASB
	uSbggnCIQiTsfq20U31o4Mp3lwxrQVSy2sntWy4uyIZKavGLwiU0SwpX9qCsrPZLUlHGc9AFinZ
	K7u+qKQOBN1RnCZK7wfraFGln9qJx4jw+17HiO1X4rr6uIn/h4UHz0pnhJ1pcN5+zUoUkF/xgk1
	jcNiBAka8rUyZ6oHWSds2/oh1KweoMYnHqp2KzhOQSo3EOkRZm5NSMBXaXLlX78PyDRgrBFUWuh
	iSbBrhfNfrPo8PAI4P3iPZ5dzu0rpe10pt8e2oUJOabdL930RTnizc5K3R3CdYzvNm84aepNlBI
	5PnhFCMvtFMdxh6FzcHglT4Q+35j29RQ==
X-Google-Smtp-Source: AGHT+IGrlsOxD3VvyhNqHTYmqSwZXcEDRU2mam9V5xs1eNPMUgYcK58098Bm6bZZtgLeXYdOtcLo1Q==
X-Received: by 2002:a5d:5d0f:0:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-42b2dc6b007mr11397434f8f.58.1762876593479;
        Tue, 11 Nov 2025 07:56:33 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm28676766f8f.19.2025.11.11.07.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:56:33 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 3/5] clk: en7523: reword and clean clk_probe variables
Date: Tue, 11 Nov 2025 16:56:19 +0100
Message-ID: <20251111155623.9024-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111155623.9024-1-ansuelsmth@gmail.com>
References: <20251111155623.9024-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework and clean en7523_clk_probe variables to make them consistent with
the rest of the source. Also apply some minor cleanup for pdev
variables.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b040f0f0d727..d98990a157d3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -700,25 +700,27 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 static int en7523_clk_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
-	int r;
+	struct device *dev = &pdev->dev;
+	int err;
 
-	soc_data = device_get_match_data(&pdev->dev);
+	soc_data = device_get_match_data(dev);
 
-	clk_data = devm_kzalloc(&pdev->dev,
-				struct_size(clk_data, hws, soc_data->num_clocks),
+	clk_data = devm_kzalloc(dev,
+				struct_size(clk_data, hws,
+					    soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, soc_data, clk_data);
-	if (r)
-		return r;
+	err = soc_data->hw_init(pdev, soc_data, clk_data);
+	if (err)
+		return err;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				      clk_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
-- 
2.51.0

