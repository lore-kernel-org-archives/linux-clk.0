Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C067E2EFD87
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163704; cv=none; b=fyEqk5Oesh6uDs0B1TH4V5kGfj8buwU4U6eqWrdgl+sTitRsp+H20eqBpvn2nY6iRVwmDty/97bpHQG/nCp8vQMd13XjGoBnhMPlrFoaWF0tc4Xjct4gb8V9ZpbAKbWv9bl8ARhM2z5gCGlBegKFybF1wqevsCoOL1Yy94RJbuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163704; c=relaxed/simple;
	bh=DwS1eyPB/neaQufQvNJoTsoU5XhXKJIB7F14A2pZwIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4gnEgrNOd5Zlv+BeSO9fqZwty3iOwNfTh59y9rJNpUFW00tHdT1hvncAGC/lNUOb61tKoxKBAyD3vJrvn87UmMczcywijRHdDseHDQh3MPhm4vu/8FBWXTNA1eTanRWuN+fBk7jTrRbkeMiLOUHwS27rEGYXXFevTL6CEmJDu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DDA2dW+P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DDA2dW+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
	b=DDA2dW+PejeZf5W0sjt4dHdLgzRy96Or1l3+OyFcND9zm10RFhYyrJL6y1kp3GrBGYfcwT
	W3unCtuHiM0arwFi7dryAjYA0weDeO7rNwjVCNK5OueA24rMtK90eZq94c+ZjdJ4s1vp5G
	pMIEtHJzTad9fI00gAQbnqE7nN0S45Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-9qlvxo5aObejUWJ4sKzPSg-1; Thu, 10 Jul 2025 12:08:19 -0400
X-MC-Unique: 9qlvxo5aObejUWJ4sKzPSg-1
X-Mimecast-MFC-AGG-ID: 9qlvxo5aObejUWJ4sKzPSg_1752163699
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-700c2d3f3d6so13262006d6.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163699; x=1752768499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
        b=K47PhAzB4a9i65f2dpQuqD+7GlnTRJvdBKqBzCVl3Cvv2YpRXnI/j/POemWLVB7R4R
         FnkqJaVYDIjfirLxPwHMu2SRYCwLf2yefsA8ywWgR2kPd3VJin1GfAgH1OXK601nMKMS
         yzGO0/SmvUmL4d7ZaT4TOoY1dFesCBDXZQDiw8rHhqMs6kOrwkuNia+ab5E8Xld9W/fP
         U+2f/WCyYQgKRkFo5D8j5T/vkn/p12eGcMHp1ZjQc1jiFKBT2eucVWvgRbo4gbm02DaA
         7KCkF6SAQpc//WZwxf7nuU1DJfcH+MZsq41v0byns4djAfavnEaEIN1Ri2MEKHS/NdQr
         FjNg==
X-Gm-Message-State: AOJu0YwOF0kU6rauV8k9sDxHsc9jfRikeq8Da41GpDGHr/JAdbTMQhwo
	iss5nz2Ap8THMu7H1kbfLijmoxJkCtnEORpzYlvmgKTW6kx9Yzlpm8uWe3neoKNYa154F21lMl2
	cv+oX7FZdsdLJrsUWWaenVkcXglpx+kIignIIU0pv4+3jdkpugnk5ODjbFw2HAQ==
X-Gm-Gg: ASbGncsZUe35EIjinDc3udawilgPrurNmVPZpGkB5O9RyKyR4/dEDmEnC7aJQRBPDX9
	4PJw8DydEuORMSbL2JxG0h1N2O4zpqkrLRRP44TTYjNPpQy9Mb8c5yuv5TgcdpzX16/Cb6YjEmt
	lOKJBL9glExTaybo7k0e6BjluH1Pg4Zp6xirkesRG8N+RPySpeE6HwwoCJF21m+fRsgNhvf8yRt
	yjFa4GB/e6GczofSTC7qMg6R/zIb+aFN2gmcoUwR5MIFG85kj8BgjBcEqnUgLjm+nN8mUemjEh3
	aN8YtjiRbKxe3ipyNLMV3s5qjKxAu3NHRmKEUG/b2cxmdRWvLElZFXJR2cUp
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id 6a1803df08f44-70497fab6f5mr54886696d6.7.1752163698887;
        Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPjEiUWwXCCHctPequGjvxsmcP2oTYR8PP+05MEZihcEYQLxAz0y6yXBwiYJgaIGBkfIQAEQ==
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id 6a1803df08f44-70497fab6f5mr54885916d6.7.1752163698330;
        Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:14 -0400
Subject: [PATCH 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-4-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1601;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DwS1eyPB/neaQufQvNJoTsoU5XhXKJIB7F14A2pZwIo=;
 b=4cPcXNvbK3LJUngty9/hS4Cci5iNskdrVCzBboRgMF/vVZq4JO3qCRcMs3ZcshnLpFzqFvn2A
 ZJ4lm2QjCh4CBdhbHz6OimHjO2IugpTJTJVBSFGBISv7EeMJ0RGydsb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0

