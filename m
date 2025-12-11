Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A90296BD4
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495041; cv=none; b=piqsqIQrX3GxmMYUbvW/e9SfDynLsaiCnZZUPdRj83w4o/7M1U/6O+6rcnjHwayEAL7/mSyJJISQTvdlm7oCYrjMfts9YTtgs+KyOUVTSAK/ab2d8JDdOOXJsZ61/ErossgY3rF+ugPxfWCJ2ZVT2aleYyA0S/fQt/fqBYAlzYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495041; c=relaxed/simple;
	bh=vrNhEauHRQ5KoNoMMi9AesnXBPWl/Gp5yOh2A0W6gms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNvXJK4HXzUccsJ3yeF1drGMXbq9jqblRIptGn1R/wmGjgRPxdd648IYpQYuHplUBW5PGZxkKr4CzsKZoPShLZif80At09mAfbUDBikf0jH7cGpm2c53g6fpkqG5bzwOsjAkZiZznxXPVCxmnyYcsjXWc07aDKkgswnyZsRSYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UE7T4vvd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOxGX7e6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UE7T4vvd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOxGX7e6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
	b=UE7T4vvd4jnngGbwNuAxSpw2up4+Rbh0NRtdnvSDt2wbzWenEKwwJo0LXlf2V/529q4zq/
	Iv+89Qu41dBXEbj5aIw1+P0mPURJ6wOj0owV9xvFiKAoLII2n4ySYa+rRA/NmYYLKM971R
	JCBtWhlXbOx3ekYv5YkS+RzRW0Bb34o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-SIONlSjNPS6N1Xj1noesLQ-1; Thu, 11 Dec 2025 18:17:17 -0500
X-MC-Unique: SIONlSjNPS6N1Xj1noesLQ-1
X-Mimecast-MFC-AGG-ID: SIONlSjNPS6N1Xj1noesLQ_1765495037
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so105132085a.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495037; x=1766099837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
        b=eOxGX7e6L76JO40H/C6OeHjqmlkfZ4fEc/5fTo6HfDqhPlBuLt/ozOUNvPlckZWUyi
         hmitvpPYeZtF7i9XEu8w973o8DygX4WIRADYfO4/DWNpIbi9sAyzYP+ByqDKq6Fza/b0
         yBJwqhA4y67Whc5pXHvsR2LUyo8/gDlW25Nn4mVC4eUXFmt1iwxjpnzPakrAgLlJGNtf
         SF5RiEIQB+7mMBdGjdZihg8N22MEwaDLwRop7637kHM/EDxK9A9KcTFLJUQPU0iYrFFP
         se7J7LboU/P1K4RsZH9Sn3xcjbwwh0+dM8fBvHsoNjJYb22UjcYcxHpStl1QzXj472vr
         OrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495037; x=1766099837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPuKV99ifsoh5aqHZAAkYRvR+Rf4lIg7BWEssu/CiJ8=;
        b=Vd60P00BVtv8U53pQbh/HdTM+RKxAiisZH7lvU7HLIinmCV1Hp6pm4k0Vtk+f8IGiA
         y7FS7IyfBNa1hwj2Fc8s9b8DpWP+f/K9848ycRYMzmDgDx7bDHC4ckBaNAfk2TPso/J+
         BM59v3B4AAKCWlLhxyi40gIDKWHSinvjYLda1id6IwCa7OgSl/oBmrpPQeMmOjlEQBVK
         Z6dQ3FiSDAn9LCcXdW8Lk7N/QJhQRo1FqzO9tnjLIw5VG4n4TpL7GSjU3QDrZoEvo5HM
         9aY3K9G/KQdjxn4BXHV/zp4tYAlsUMpSOTvHO0W+5V20LRNVzzS7DXzQ+LgEwBOUmeXx
         j5JA==
X-Gm-Message-State: AOJu0Yy3KKqztT97rUcqH/z2SCQOfJpXL0KPMWq/pY1tULeSbKbkR9jJ
	nIFFF4bSAQzqNc5A2zMB2YG8SoN4IFqc1YkeqmMa3REWF68b/vOcJ8Oixez5DVu+rq7l/6jdoN+
	cpW3HR8XjQOlI/TNKi1pfp+SwB6uqtYcsMn923ocXB3PcOGrv4ye0BiRsW4s6UA==
X-Gm-Gg: AY/fxX40u/uG4TB85eveZDA6UPtRJraU6QDNxEYrJELUh5Bt4P8oqunCfG0vRGwLwyc
	GYhtHeEDzis8S+lWQFKtC+gwyNe8n87DKXDvoIc9ijuXqpBsVoS4nygTzV1uYI3Ln5FbyZV7WdV
	cAhhMaUmtMuo99g9RcLf/dIJ11xLfMdBUEoeUx5dRqY3z3mdrlyc0+n7rff98Dv3WyCrEslEO6s
	3dKm7nLzkCIRPWBTjULzcB9TpEZYw2U1stPwSPEwVrKy/Os/JGyfV3scfV//0vTMtxwOcH8Rqxy
	QiJBxIafnRe3vJJKDnGBpN1BYJ5sr7c3gLVx5F9zJrXHOQlExx8pFILNh92FBxO0WjGWj6iMbRf
	hWXGVXbKyZCgmzJpe7DypT0Iq2L0OQ4xr8ngOh4Ra1HgI5NtTm8c8AQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id af79cd13be357-8bb3a248c9cmr37437485a.52.1765495037262;
        Thu, 11 Dec 2025 15:17:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb7AhIjE8zPjDhJfU8aDdJaYDnutBjCMxlmV9mYKDpi24B9muU+pgkYMBUg4HwaDmRYFGfZQ==
X-Received: by 2002:a05:620a:711b:b0:8b2:6ac5:bce1 with SMTP id af79cd13be357-8bb3a248c9cmr37431985a.52.1765495036753;
        Thu, 11 Dec 2025 15:17:16 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:23 +0900
Subject: [PATCH v3 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-5-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vrNhEauHRQ5KoNoMMi9AesnXBPWl/Gp5yOh2A0W6gms=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4JBrssMboevWX54tAvj//eOnz+u+ekf63rRB59E
 46P+ym1raOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ7JRhZHhdsj5E7aTq9jcO
 T97sYPf+/rX4c86W8toYzZ7TW7mNTd4zMqwJ9ZdIXKvRpntlr1TQhxi7aRs/WWw1fXTt7j6W+l6
 mubwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 673cb0f08959e0e4f2b1ade2ebaf796e8b76f8bc..438ff3605d90121b7bfe02b3ddca8194437ed9ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -237,16 +237,18 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 50000000, 1250000000);
+	req->rate = clamp_val(req->rate, 50000000, 1250000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.prepare = mtk_mipi_tx_pll_prepare,
 	.unprepare = mtk_mipi_tx_pll_unprepare,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.52.0

