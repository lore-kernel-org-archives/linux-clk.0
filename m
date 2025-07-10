Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900702F0C62
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163708; cv=none; b=bl6IqmvDF5YbdtBmXhunPrpMv70NAO7LQYQdOZvooiJleKP60G9ETARRgRSjgi5HB8NAVzeY9GFUYEOTnF9vrZ9dlSXIqiUihwkajqrFlbf+UAZ8iX3of3Ixfs64JcJP1xpmJT0dBPdWGCKHKqVqhG/iEzWUF/x1Y7rksICHUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163708; c=relaxed/simple;
	bh=Sp7TBqvADBjUTdYv865HJDuwxPugQD7l6ebJ7mJAKsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPbkHvdlbcW/ofIt/aJgL4miXmF56S/spIqEYm+fpdYKmg/Y7hzbTMDeeBRjNuWaEHFmOO1r2Ep8GJG0VNjURArXUyJqnn+URqPVWx2Ktj+XdHe5pjyEngdAZzIlG/2dG1w0fRd1qAxhX1ghhYi7gsw5hn82FVMBEewQjcEs0uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GuYCCDt2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GuYCCDt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
	b=GuYCCDt2a4SfJkuTr/A8Vn5//3EJOVA+MslLvrcCVd3UJGwMF4FOLZOcz4mG/kHPI6yYcq
	nHqutictmmaOgPrqVzMJMX8YqeaQoVmtXzHHhc0q8eqdEGlWOOR8fz+Te8g683j/BaSPcP
	5ZEQSikIQyTfVJ7vtSMv2oAR1flbjOU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-zcQZUTvQP7iZv29EjJzBfA-1; Thu, 10 Jul 2025 12:08:22 -0400
X-MC-Unique: zcQZUTvQP7iZv29EjJzBfA-1
X-Mimecast-MFC-AGG-ID: zcQZUTvQP7iZv29EjJzBfA_1752163702
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d460764849so390302385a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163701; x=1752768501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4ASla69sSqfjU35JM1zsmkkZLK8k4ITigVacA38LgM=;
        b=GT2vJlDN5CtzEb8hI//1glI50BwkTlhjIrcvuRH0FMMK5QdSFSqiNEkVbBx6+qPLFA
         TZhHmHQKziymEAJGlveAaIDj5xZ5TSRL8dRidDYEeDveX52SI4FGUUrVFIWQdEcb5mwd
         VK83CjjIwUwyWQgcxErVe0WsImVwZfwyqBqoI8BPumciHzNFx+QR69sNGqVEfEsFOhTF
         S2sJGFl4IcRgM5BNf6aKOSBRyMMC8jJBJyKX1KpPGMxmN/ebWgDyTvYbcJZ88mSflsi5
         qAMmqYQ/mYnNJ8WYHRL6hXOtT//OJXPiew+hjQU1TZ0bAq4FXzkW9ViThXm7tm8Lrw7b
         MrHA==
X-Gm-Message-State: AOJu0Yxskhx0CCeMcuNKS605y4acZR8D7054cc0nUwi/7UVZYAnCQGiV
	1R+f5nAQe5BXCRePo1Gdt7it0NCQXWkhaZw1pLpNlXGExvBrE7LKzm/UWASe+p1RLBXXF6jTpmQ
	odHTEJDs+WjHLIzIsjE1pGu6RBkXar+Zfmbb/T/K68NHRNBHRA4TAYWZ5/QGoSQ==
X-Gm-Gg: ASbGncvvVhnFQ4LJwSBoA/7x9sJ0Y55G57EBKyqZ5iBgYeqTHqbNDWoDncllAhBci/W
	c3/L+01dXYczHFs5zNmp7MjaBdt9iOzIl+ZVDdrM5NIJLs03Q0ww+XK0/K+h44sunXh8A1/ANcH
	voBs96/2nNi4Jg/FEnRnlwhxeR39otih5f98Ymkk8AlzOqAm7/1v/bdHrHCOEJIGl5jYsiGR4VG
	t7tvrPlht5f0rpzcx3IoXfU6AOni8Qol4rsk33B6LVsPNJBCFK2K0s0vyODuTkpWcqAZSYo5QN6
	rf0Tmhi72bNre3kyI4gWv5cLHiHrZwRviRlz9WUqHnpZiV2MU0EFNzzKZKlC
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id 6a1803df08f44-70495a595bamr70247736d6.7.1752163701108;
        Thu, 10 Jul 2025 09:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDRrDKWwpckJ37fdbyhC+PMLfUgyhQZCTV67/zNoDsc5Ut1ZyXEkNXO6Agbo3M33HxjAj7/A==
X-Received: by 2002:a05:6214:54c2:b0:704:9584:c370 with SMTP id 6a1803df08f44-70495a595bamr70246876d6.7.1752163700571;
        Thu, 10 Jul 2025 09:08:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:15 -0400
Subject: [PATCH 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-5-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1519;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Sp7TBqvADBjUTdYv865HJDuwxPugQD7l6ebJ7mJAKsk=;
 b=QdRXZy3WXcCDAKY+nITPfzBZtQ8RpvdKNlvOltT6ZNVcwHEAkVhWAcnk2UBWK7KubiIjAaW2b
 RaP8yKzs4UnCzedb/XCmTGOR6M6qboXHNuqR38QkPjLse9NBJ4Rx33V
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

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
2.50.0

