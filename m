Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD134DCF2
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471622; cv=none; b=IWGosdahvlsCLEcY5EN0Y5J4fXFfRmeEvzrm5MYJYxNgDM1cjpBb1QtIuGiYI0Ix5QJpTTTYZfrqv48cLVtFn7O7aXmkWii2ArTVHzowAB3QBybB3QnOOTN+eQhmTBEmTmG7PlRFeybAQVcCaoD8LGAT3GClsqzIrXSki+rvHyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471622; c=relaxed/simple;
	bh=0ONTyRyj5ognfzdcLi6VRYwQ6d+KVHGkkiYfjM3qIvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TAUQdZYaYb+DGZlC2vOUm43phYzSHh01FQVYyAs0+cVD9euyNhkf0eoevSy5I/PC7e46jJhlmUotxAYllFpaaDVCK/GH3JzLt1viKOi/SBGE8Gr7n5XvX8cfrjCbL7MSR8ljmkWB7U1bXNeHBIVMOs1fqG66tKFTbpJcnE61fGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IxKKqt/O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZamTKbOW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IxKKqt/O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZamTKbOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
	b=IxKKqt/O7BZDvF4+Dpo8QFFaom/27yooRf14eJO7oC/Io66D6m6iILOQvOzJK0IitXKuCJ
	GuUFtj8qi8ng+cI3tPGtQw5ctQXV44chC5XlEzgPmG5OuvQQQj00mESGtUpR4+Uz6WR4pQ
	2ug4y3CIlxqLFXJ5BdN6oLPowYF4ciY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-HWY8jOZcN6unupqxvLf7lA-1; Thu, 06 Nov 2025 18:26:56 -0500
X-MC-Unique: HWY8jOZcN6unupqxvLf7lA-1
X-Mimecast-MFC-AGG-ID: HWY8jOZcN6unupqxvLf7lA_1762471616
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804dd4acafso8995816d6.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471616; x=1763076416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
        b=ZamTKbOWh5YP2cECbXP80KdmxGgZpo3Bc2zbYbfGUL6VL05HjnfptMgPw9vp0HfUtR
         d2LkGcdCWNpjb428k3ZYUa100lAu1Ru/iCVqncR0YZKXjgexglnYsCYsuygwSq1qheD/
         p4EU3Gj7B0oIi1PW7aVSwYCrKqGLv6lHLpNIHsem1X6Pao4Qd+JElBJNy5ZA+AL0+DQX
         YqeY8+hDKkFeKcajNcGf0HNhvruWCPGZxZ/MKtPL7UUSaH74wB08wsTIkNeOdQpcIgXG
         8d5oYbHkAvlJjw/igH/4go62Y9Tgw8QTinVvpWKK02uhqoeILYmZjsB64bqXmt9yARM1
         GgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471616; x=1763076416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQCfd8zWOp32cxaZRehJq3msamMDwqa56w9I/w/HjpQ=;
        b=V4Bqoe9llMgLDFjXkLgW3SNQ0jeGOq5ugW9VQRVqLBBmucX12PzDJsjKovdrAAyWus
         cs6J9eppbwredy26nNwg+5FBey3QldjltZw3Ws4NnFfRygcXHv1+mj4dVDj4WyqyhV/1
         J7awdmEsCfvp8bEWccaKH883DGVJLWIMH+IdciV8CCNk9HmuqrW4WJmfqt+VErW4M0sb
         Tm2MG2rnwDPmGQLtniLJud0bjX5y6/6gWEpIef8skFGv2radGftzyQ2mQAowYfdCTEMM
         hyVBzTIb4PGIEt5rVlOCUJkW3AD/xhoawPDtjyPsOZHQjALL3PCoMVcPdKb4oIPzQz1c
         KPXQ==
X-Gm-Message-State: AOJu0YzwppnBlg43Fj2fgt4GEwwJIoZKdyat1WmW+k5UhqC6Genf8pIh
	rKvuxJAFRCq+xgVD71k0Ejl4IQ2db38A0bnmZGx7O4fP+y0DVwBR7KvtW5yXUS1/j8xjx9/b9SY
	qujxzsViSdFRhjbyi3nKe1BQWOZEFM23emT2P+aNc6YShpJPTH+rgSwP0uXhAbg==
X-Gm-Gg: ASbGncucV61p5JY3R0CpH4JBGQh6IoYmzJepZQtZHf6lgbtL3pOzP/Ac4DgExRySeEg
	avHEodwGcFU0MnXlyIWirlML0rIinKVrHBoHkasC0tDycfUqeAOT9C3wbFXCDjtcJuhs3dEkFg7
	GT+DFxy7RL82U4g5er1bWHUPCxgpKbB5ICi+Ay+dEAd1OhIOD6YfdgwLJYqpOtb8EqRC94lsk0E
	V5thBPFzLn83CR/VQM954MW9akp86QCAxQik5FF4Nm72FX+PWw5KejOnSfjBOzAyU6g8fuEDNdc
	NVs4RVIbDY6945J4SoW+ga/pwEXGEyYyNNUDE1dnj02fWwGd7z6ddheaidEdN1TzIsmHzlPhhK/
	8+k7mN85OvSGoPvkfxbgJ13tLHqr2MwQZWbj4TkkMWQ==
X-Received: by 2002:ad4:5e87:0:b0:880:5a05:925f with SMTP id 6a1803df08f44-88167afd114mr17958036d6.13.1762471615999;
        Thu, 06 Nov 2025 15:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5Z5NCJiDJsbMHVlrtUlpGjakDqi2/fs01RriUHfEFSw/5HUZvbsIZYCzQ2U5thVfZ2fi0FQ==
X-Received: by 2002:ad4:5e87:0:b0:880:5a05:925f with SMTP id 6a1803df08f44-88167afd114mr17957826d6.13.1762471615658;
        Thu, 06 Nov 2025 15:26:55 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:51 -0500
Subject: [PATCH v2 RESEND 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173:
 convert from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-5-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0ONTyRyj5ognfzdcLi6VRYwQ6d+KVHGkkiYfjM3qIvg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Rbkf3oWx/vTtHDr4ZNVHnvrgjPm/1vnKvxMrOSmb
 750m5RhRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZ+pWRYV4nm13uT+GVUvvf
 X+i7YP3Pldvp2mr/m16xsrMLpB9/nsjIMFm0TLfkQZN196ctK6/pBDG+ze6XNL4ZuiJg7iIPl1U
 XuAA=
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
2.51.0

