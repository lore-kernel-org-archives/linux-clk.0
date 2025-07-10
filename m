Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A142EF9DD
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163712; cv=none; b=gS+95P38dD5gIXmbRjKRkSB2OrM/Ne7I26iODSp9yeQd77UWhWHG4G8jA2iEVJbdxpIzi+K8M4w0EuPAjY4I74f4whB/Yi/gCPOT5pUu32Q3XrqdvVAoomUdZEVGrCIlxtQlCp4NXU0t1n+1I6Hs0nmN/YMqDfTeTj6FKk6frrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163712; c=relaxed/simple;
	bh=NHf2WrVpFvBK9rcSwwdfI+z+ewWwe162I0ZQpinGzTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5DULSLoIWVBG1Ct/+/lpdV5kkOyhhGA8NEklbf4+NnNtbugvqebuqY02+KCaJS5+f3FCsQm5UKw2Kys2MbUorN8bqtWgCC4+Edl5OZdY4g48UrkXwdfv46QYAASavXJFh+0kPHJ8uMdLquVOTNaSYZw96encbFCi0NXY64Pq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFM83+N1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFM83+N1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNMz/xyi0Wuf6bpUroOTdzgXVTFsqzyhX4e3vihgsBg=;
	b=hFM83+N1GPOUnc+CYPenhuYURfOoFE9Nztd6CIaELN7HKpIm1O3mIUbD1BPu1l59MRpJWz
	H1wbdjMBoHCK6OdaC+EgA7jzwWzJTFtLnUvI3NU8zwKbuVovHuCqF4SxZBzyDcgH/txSPd
	kp/GwzvxPzGZelJLlWgktdgobhPwxpw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-6UShxCNEPOm9xcmSmP6MAQ-1; Thu, 10 Jul 2025 12:08:27 -0400
X-MC-Unique: 6UShxCNEPOm9xcmSmP6MAQ-1
X-Mimecast-MFC-AGG-ID: 6UShxCNEPOm9xcmSmP6MAQ_1752163706
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6ef72a544so25872231cf.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163706; x=1752768506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNMz/xyi0Wuf6bpUroOTdzgXVTFsqzyhX4e3vihgsBg=;
        b=KKpdOs1qq7e40BteD2bgHjD8ClOQoyBxLGy4cqo936N7pRgAhOrf4Je8jU85luk/oK
         xJbalZEoQ+R5d9pb8TK3yDPHkJCceyyH0VD9qtkXJFVXHdcD8EwSe4O6RTyyxRhniJeV
         p14DTaRISRGtvZAN/l2+xYAEwWzhwADMQgJnOS5G55cIB7Qil8VonZwck7Myblo6L0E2
         NWOLBsFllcshIYmBcP7Qd8Mu7tgm+1N3pcCcFuEmb9WvhgPltNa01HV98wtxBMttvgIm
         lfvCZA+3CkK89TSGhV3naihIriT8Horyiq6aU6y7MCexK7tmomtYMcOIjaL15e9p94nY
         Zg5Q==
X-Gm-Message-State: AOJu0YymMoEsjfX7upO1SRyHfSZXOhiCSS4k+XkeVD2jGpZSUO66rpn9
	Jfnf/o8mY00jzryraRzprNKxFwIIxqBVxzDEf7Vq0WZlwgSK5j+qleqY48kG63kSAGEC5KbSr3I
	AV68OOdfoOBUz4wNjkRag154TVEbZkvIfZIbQqJb25jn6mIcrWJUQtmPyxzmlCA==
X-Gm-Gg: ASbGncv9jJXmKitq8ibZG84IctSFP8DYQ/caazG+gartIjQJhXoSlkfTxIbkd0LA8eB
	UoXN1uAHK/vV0MMVaBF4HTMMNj57v7U79YgjrDPcTwLiZU+GgpVgTftYUEWGPzsSt55ezIyjvRJ
	sdZ6o5yhKtm54Or5PuJ2qqcdw5t/I7z/08QrWRAOHNyMWe9A8mIWDt3pjyKBIbBwd6Le5n0Wtuz
	SuyWPC3QqcNZ+EEPPSOBb96Bsq1k2FrkqHGTDK5dpk7F28SlUptwmyM3oKRZ+1uBAvawe0WqXD3
	GbyA+auukZm1YKdc46jwpJFZEdM7pu5WfzrGnBw/n/c8TZWs5yUJcHC7eswA
X-Received: by 2002:ad4:5bce:0:b0:6fa:fea5:4da0 with SMTP id 6a1803df08f44-70498064944mr50151326d6.10.1752163706240;
        Thu, 10 Jul 2025 09:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYhZa76cHQRjJPw3H7mkaAzOvkiyujQRGMNOmHLyrMH7YSa97wvn3nU7BthDnNKd7pp0944g==
X-Received: by 2002:ad4:5bce:0:b0:6fa:fea5:4da0 with SMTP id 6a1803df08f44-70498064944mr50150786d6.10.1752163705661;
        Thu, 10 Jul 2025 09:08:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:17 -0400
Subject: [PATCH 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-7-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=3209;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NHf2WrVpFvBK9rcSwwdfI+z+ewWwe162I0ZQpinGzTg=;
 b=iJFp8tAaWU+wHaHcUB7nA5t7RfDvvhf4kk9dD1nEljg5ScIgHcdVuYZrpCfyQ1GumV9HBW7D3
 o5sEUuXM1iaDquqPWph1RO6DawQwo5Fhz2pFk4nTpsSuuAzjb7NEMsz
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 8dcc2bb777b5455d21a10f06c5ad842b2ddbc834..1483907413faa5ce1dc8614db05e6e929410404d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -749,22 +749,23 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 	return vco;
 }
 
-static long inno_hdmi_phy_rk3228_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && !cfg->fracdiv)
+		if (cfg->pixclock == req->rate && !cfg->fracdiv)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
@@ -835,7 +836,7 @@ static const struct clk_ops inno_hdmi_phy_rk3228_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3228_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3228_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3228_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3228_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3228_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3228_clk_set_rate,
 };
 
@@ -906,22 +907,23 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 	return inno->pixclock;
 }
 
-static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate)
+		if (cfg->pixclock == req->rate)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -989,7 +991,7 @@ static const struct clk_ops inno_hdmi_phy_rk3328_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3328_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3328_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3328_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3328_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3328_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3328_clk_set_rate,
 };
 

-- 
2.50.0

