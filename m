Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E21AF0AE
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658250; cv=none; b=h7GqldbTqUk5BJ8DyjasQB+ru9F/gZXpE3xn2rVpwMpcDQVhYerRghrbib5sofbYIRPmXl4DZI7rQJHOU3zXMdmCR1pLFipPOeymTVNqPZcDp4nJHBTlA4eylkfPghNSfayG6omJnw4xjbkPu/m951+u2FrHoKkL94fVM5r5a/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658250; c=relaxed/simple;
	bh=VngyX6/mQNFodLjeygVOszXh7E8fNJcmhtKdA0Y9TqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1jtxrKsJyWxgx9cPc1P09Bw6BkVNXTLmFMN+QGowB9BjpaAEEnOKa9YZrWmy8XtXMtltDjtzRBQ0hlfhrHY1ZW0hISgag/dNIjx2U0LbOSfXJIZt292ltfOVzg+tgmnbrDLwyJAPiahoRk1jX4nknIlTs/14cyFOViEe8HmeVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xdLh4OXv; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xdLh4OXv"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b5e49615aso445237639f.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658247; x=1745263047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=xdLh4OXv6IuZq8hx0LyYkwRWPToblne6uMxQtC6HHsQb2tzuTfoJvEi+nPWfURVfPU
         AD4fMCE58ioyuCqUYwt5BvQllruqYlAUasJykcIj715u4GdzhXZqvPtUfdxUfyzYOZvC
         nTxKwUc4De+d/NiKB40wJhS87ZImv4qVMQ+JK6qFBC38DjPJow1lDOtP8WB5uWwlEQEM
         seZRqJtSD9zPULK9q8Ac0bqEz8hf5+w+kSjc8S/S7hrs7YC8SIXu//i87qXgCla64R5i
         J2YCTcB3P1K7J2n2/HQmgGrXvjGivJ+g1f8+hXgmyjp4RO9KczECxv/Kk55sqzCJJkdR
         WyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658247; x=1745263047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=FMbesJvx9mfnnB4T3lvrxDJyMLJQMweGZ3HbJdCO2oFnxZ7S72w/f1/ysR759EQllW
         5h4FCNPRpPsw28iaQmy1s7qNX3T1gI5+l57OpZEyj3/5WetJwcBBssgcQgPMqi5wsepz
         CsQRKIvBUUY/E7iEO3YbZTXYoHhvKFY4o88fnKy/hBm5rZen5loy+r54npxbPIPJHLqD
         +w9X/jTQ3JwK3Ecx1GvrIw2TJjAwQP/IExFfjqY6qy5oogPu2IGg4LuNudt12nK00w2H
         B86gI2J1nAFmBoM7VfbIw2nvJfAGcuSkCJOCqC01Tu5AaNMirS6S2ePYq6O1VWBnzMwB
         iXQw==
X-Forwarded-Encrypted: i=1; AJvYcCVFZ57qfNqt7QzavnGX/ZfQ/nyYvJwJnO/jvIW0ESr/o1duAGKMg+FhVehX6/AKW8Z7r8BiwGUXQrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIqlEb7NgURhOX4b01shhtl8zi5oQlKql48y+J0GRPG9mXznoL
	qzp0UpomLslmABAN5LD+cP13e3I9TKpT3C8j89Os6ES84Xe50pXIaJXiSnON5S4=
X-Gm-Gg: ASbGncu5uWCVHeYW0C8SdRkFwVCfUTYR3Befx+TfRnZ5U9QphxfYiNvsy7f7TSZ4aYc
	ROdkDJvzBXxaxMyNcgPlJj4YkXZYn9Qj2k0hVHhTeBSgWLDsRTiHSQ8yMbVYsqJLAdU4yN8qE9T
	amW6wjlDuMpGgkVvYELAEoyH8Sk5JAiQq1vkP9+xhz4Xb8S2n/kCBXPtlPZCBuKZuLGOzp1O992
	IXlLARGN7j8aODQMFsFncBuFmNVxDX+lwlsNOb4gd0Izf76ou9W2C0yv9gqzzv5XZvIkNkcezXE
	oof7lGlI/xHKAXQDO4kl4PEELOA509jAJei4u5LV8aGIG+dlcEqpvUiMYD/RthZA9FwHt8xLn2s
	lK1y6iz+tfo/mxg==
X-Google-Smtp-Source: AGHT+IHJnhTbYGz+3fsC47NWjJwKIj8trSko9MC7l40QBwUPgSKgLh4fWO2GzddHNuwBXhAUnso6EQ==
X-Received: by 2002:a05:6e02:1945:b0:3d4:2306:6d6 with SMTP id e9e14a558f8ab-3d7ec27bd0cmr159074725ab.21.1744658247528;
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
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
Subject: [PATCH v4 5/7] clk: spacemit: make clocks optional
Date: Mon, 14 Apr 2025 14:17:12 -0500
Message-ID: <20250414191715.2264758-6-elder@riscstar.com>
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 09f101a52b1af..7494c97c3c7ec 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1218,6 +1218,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1329,6 +1333,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

