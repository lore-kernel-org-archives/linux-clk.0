Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A50A12A14C
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296688; cv=none; b=iCzW0yyA7NjwT8JCRHZ9iLP2dPodS/5+BaZuMND3g9PjwMrRhI4qSe8io69wFAaD9ngCScc8jQ0r4hwzkFuPTFt+KUxRnyvA7Sry6WSZZdxDBf1nsIp3EioUM7pZSQNJ9yNmUkav5uDNlRXcChekhbKcIc4BmCKn+dRn4ixIj2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296688; c=relaxed/simple;
	bh=stfv6wCp8LQ8d3OZA86W362D/4yVzrX9ApYD5+7KnVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8Qm05FcL07MlAFQCQ9uqKCNnZdWcXTxKrdYefrz8WAnZNXVZvZbuaxQ1sE9QyOrdGt3Lghovqql11MtLBkuS9X3USenYAniPXILzF0d/sqca+pKJbSkWUxq1iwBKw9VZLwEQdcVniGqvxm9Wx1RhB2K5d0pGWZNg/Wgxp0QO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ElxYlEfT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ElxYlEfT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-368313809a4so893315f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296685; x=1721901485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHnjFErAgDASCliWVSwJYSmFcBoJAvgxBHMIXQRsSBo=;
        b=ElxYlEfTeZq2CEULhjr8+kxylhjbHDBkXHo4BdUbKcrIdQ/ItoLIpzAEgLrg6ZHb4S
         aaCzTTo0AVAIgdFpSAWtQMzkkLF9HoNGBQVDZT63hC8Yc+OBkEhIkXp2fGxe2hVektOm
         MJXxE2Hx2eJsjAxkIxjnjTSDe3opnV5gG7oZ9oDE9yp2H9cXSv0UIgMiM3t/4BcaU7VI
         oHqmplvZX9exqnWV0AbACpqZEkjZ+oF88APYoUHigglMz3939AC/66ShmA4knR0pJyCw
         nuTkE7P/EnwEbX0l6h+ZWCX1vXhXjNHREKSOYpBrTU5Sf12+E/4fNM4OmDxKYXD3PemV
         o7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296685; x=1721901485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHnjFErAgDASCliWVSwJYSmFcBoJAvgxBHMIXQRsSBo=;
        b=MdQB1ZjIbiGbRvrvuSv78YI9ENSW+sVr0GQfIx0la0a39rbGqhGApIRedWrl5cpy1h
         C9aLlzALmsg6sV0Yp9ol0+Nj7pVCXiTkve0vn95Y4zHjQ1p4/o7WGyWcaqFPNNz9bWSJ
         jQTa4a69+j5bfK5wxAW23pJLogNumh/P/A8jWSZa9KniFYEqRdGOS7iyCvVLdSSvuqng
         8+RH2B/zAQyv+SVQzNM02sGuckSgvRRLykdVEizWYz5efULSKHpE+xu5fUPLWjXy9Xaa
         urp99fddlfstfDBopCxscKxhp99WYau1Rabdt953vodofPiNMht+6ployG6YUyLRgkwu
         bY2w==
X-Forwarded-Encrypted: i=1; AJvYcCU1U8yFaSwsf9NZVz8WBFpfEjgUffkpHE2nhkatlca7PgG3EnXJm+Y8vLtdZZ4XM2iTaXjavxwNWGRT1djyG/g/vFPO5NyJxT8E
X-Gm-Message-State: AOJu0YxMaxf0Ap/RbVKO3HEj6j4o+usi+PTnCnRxC35b7zBsvLWZW3xQ
	pvw/d9iSm3uWessPCR7H4uttI8WlMdNsaRKpAffzRJdVr0rU8D9GgBAGuYbVlhI=
X-Google-Smtp-Source: AGHT+IG8+Imv2pZJ1VDWhnhTTaOQKKCKWkuYOQ3logSxOWNN3Qv8MGDFasB5Wj/12nLcm5NH0GyuVw==
X-Received: by 2002:adf:fe92:0:b0:367:940b:b662 with SMTP id ffacd0b85a97d-3684b3c82e8mr1763009f8f.31.1721296685057;
        Thu, 18 Jul 2024 02:58:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/9] reset: amlogic: use generic data matching function
Date: Thu, 18 Jul 2024 11:57:46 +0200
Message-ID: <20240718095755.3511992-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

There is no need to use the DT specific function to get
matching data, use the generic one instead

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 8f3d6e9df235..cd7dff5bff61 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -129,7 +129,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(dev);
+	data->param = device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 
-- 
2.43.0

