Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD52355819
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471624; cv=none; b=SeVREfrQYjidb1IHwcV/I2Yr9WYReTS35kEHNSO4I/9OmyYlS7iHTWsxJ7jJCB99McNvcrH6+CqnuGorvuuFGs94NJYkF1dkwG7uA0tsNE5JC/zKFzpKI9NoEzFRbyNzaVcFqc1egp5+BMcjBfOHZFTHtgfRc1X6KpOOV6njh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471624; c=relaxed/simple;
	bh=pGum4msvOB3xDDFVObf0RbWafZEF5jMmYiXTVfgLr2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1v/pdVU0hPjRQdoWhFh4SQiVBZ5+1GIQ9etkgkpNmq4o3kjtTf1FQ3HM+LCTwESv9OFRtfHsrPA1vKWG57KkdZr/fIbiUuLYMxlSx7apWZGqu3/E6U+/ofMwkxjnWP0+RvWME5GpLcG0/SB1stk+RQgax7k4iB2o+yMX1iXCvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqTM/YYh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CanFcUfK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqTM/YYh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CanFcUfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
	b=EqTM/YYhjhCONY8iuSR54NmnEKSSV3lXpSyLls28EdlWSmCKZcrVUEsuOvyW4AfIznPC04
	eByIxNNgZRMocwOOQ1Qf19sMfKZeyDK/df+SePPEhpPud0gL0f5uD4wdMFMsqj/Ct0iiKg
	y82Oy8yQfkyPizwevnxnUILD/Ni+mq4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-2H6FqrHmMkii56pZikpdrQ-1; Thu, 06 Nov 2025 18:27:01 -0500
X-MC-Unique: 2H6FqrHmMkii56pZikpdrQ-1
X-Mimecast-MFC-AGG-ID: 2H6FqrHmMkii56pZikpdrQ_1762471621
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88025a7fc9aso5650206d6.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471621; x=1763076421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
        b=CanFcUfKFQdKLXVvEw2UONjFN+33BVGRd7Kt1tjnqjtcxVZmzmvZkvo+IVj/OoxSAF
         7JNhVpXlaApO1emtSXubAm6Te0YzLEXy3QITb/vUr7mHcCmz4Xd5mgzojCZVFaT2sBjM
         CugtUiGW7IQBHBKZx3nCPA/gmYk7gCvnbO2DQptozHN6ApJt0wEfR68myJk9ap2TfqQ1
         9ihQaJNmq9cNp7LPO4MwsNeQpawj3DwJ5lffNJ+im5Lz4nVTcJAPqq3fPfb8e7en4Ucw
         DxMIGjC15mv/viE+fZ6QmT3I5YeVhqv7vEK6b44u9Hp8Y6qbTbZzTriTbhmcZeBCW9uz
         AbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471621; x=1763076421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZVea0Mun92OWS2efd7OZNCrg3R5Kgv6X7v7bFvHs04=;
        b=sH4faHSjj4CXZ7P/SUXKB1kH00YUlJj0hhUbe+mGu8vHS0x6XbToYvkaWns90xklDA
         Oy/2F7boVtUAUcGRXVlwVPaDkcDlQAwE7s5oBEOc3pgK1vAlF3ZFEDa9l76OxtBEvric
         QHcqoSXvYrJL+ffi5BFUCvp/XZFdlf6eFv1y2t4F7SauLxNZm32vktUMCrF0cLMoHqSz
         OJbSHMRWHInDrm7U0mle13whBrJuueqCJtmTDGfifCerfADUJozAAeAqXG+BTUoA9Vc5
         +1BvrWdI85/SJ97BxjpdChr1gh4CGMxzKybtiomQC+hVQRBfANp6ZRTej02Ta5v3aor4
         8q0w==
X-Gm-Message-State: AOJu0YzYZQmV2ZE6BpOFMOYRIeTibb01tRVW8dF0hpNQdqiys/y83GxA
	8jwWB5KVwQlJc8kSVj+P9Mu26dvMYQAhq2aaTrlw3TIS2LZ0FgJU3WD8MQp3ZCQ629HElGQiCLv
	tyh+fHlcdhKBk58a1bYcffu+4x7sgsTH+Pra3PHD77VIOAivNM9SCg4050qC9Vg==
X-Gm-Gg: ASbGncuhNwGD0OwHCMQaW+b1dkZZk+RvtDCvK8sswqCY4r5Y1jJS16MI+mQtEo+ghpH
	6CwhNFxEHJ3Ud6v4BXAB6NOOXLYP5SCd1VA7Wv8ZXYV8/dpknzCqrX2y0wBKJPAaBT2UKAP6BYP
	o3PizcL+5CXBI7moQW+DCUQhZbKMg36/+YdYBLwzqoqYB0fe3L3k6xVJwsJqAeG6KVNCe5WQwnU
	8595c6e4UGqKKW5+SNcLe8rwjUhn7GwtXg6TPgrqe8fdA/Rfi8/VGgiIn+08RAT9ClMR7GE9esI
	30U70z+GXJ64v0oXo8wPuPOU5dhLqGkdOooOmTFxTFer1TIQKbKS1YeSHCFhno+pdjdzl7X17Ol
	I6Kfqkrlf0LWYfbEjaQUCfxvkpPfplzkSicFsVwNkow==
X-Received: by 2002:a05:6214:4110:b0:880:53a7:a445 with SMTP id 6a1803df08f44-88151e4bc49mr17960466d6.2.1762471620719;
        Thu, 06 Nov 2025 15:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtHpA4COaBy2TQDBCCELqXAf0sfk+lQ3jKjHR4cm3lLWRVAj13ngGgT8ax+bpg/JoDlCOeww==
X-Received: by 2002:a05:6214:4110:b0:880:53a7:a445 with SMTP id 6a1803df08f44-88151e4bc49mr17960216d6.2.1762471620343;
        Thu, 06 Nov 2025 15:27:00 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:52 -0500
Subject: [PATCH v2 RESEND 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183:
 convert from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-6-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pGum4msvOB3xDDFVObf0RbWafZEF5jMmYiXTVfgLr2I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RaqnVC7xubvIvpuN3fZv7sHddmfyK78rtPpal0bY
 a34zmpPRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM55MfwTzdcOk1ownJ5dj3F
 lEqP2+cWf1utHLvJU8rLrrGyvaomjeGfmciaJ0/c/+l5/550WeiIRfKndL0k6eYkX0bZkg35Iam
 MAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.51.0

