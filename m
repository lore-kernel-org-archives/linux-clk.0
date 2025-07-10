Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E4E2EFDA6
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163701; cv=none; b=JgExWSsP6kgCL1ib0WyCf13pBelJR94HFpDwtn/pk2pq9Zio9h+2ZAs5BkEBuPbYyx4EPNi3RDIdFn8dj3v/yg7go+zrzkePnucldG3JfQb0xX7fB4F89cKEIMREA4u65TUn9vloENId1ynV4ONimyC/NdrZnpfYmVaRvssYmuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163701; c=relaxed/simple;
	bh=4qM0ky7zv1CT6MbG0sETVffzH28Znb5sgT9aMpTi5PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pP5kKmvr4uo/C/TF3v+kYQvif5lA7WSNLw4htwz21VnMWAotEzkPOPvcioLrEUKc6MXGhvljOBI79gy9Hu24k2pcBryoGq3Zhgl+bL8em7ZyYAEpxBGy0souqstLa3btD7j46mAU9cSAPdC4z1exFrAW+R3XSqeFC5sWiH21bcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HEIAfX84; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HEIAfX84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=;
	b=HEIAfX84M5YAi4Ns0L12CNhZ4z2PgGjTuV1MlSkH4j7iURC4Ybmawh7LvelflgpLJYjal3
	Iik8gthP5xguJ24LvNMOuI9u5NIGksa70we3OZZinPWRl8tJYL19YDq/uoJR935hJ3c3Nb
	AG5WVLVFmoXiexhyjaIH6J8UKcaTk0E=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-zHNOfOtoNFWDUefqHq9VeQ-1; Thu, 10 Jul 2025 12:08:16 -0400
X-MC-Unique: zHNOfOtoNFWDUefqHq9VeQ-1
X-Mimecast-MFC-AGG-ID: zHNOfOtoNFWDUefqHq9VeQ_1752163696
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5720eb48so37319266d6.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163696; x=1752768496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em92yw37YUfd/ntHD3Imspo2RSo4KaG6Dl0swLQCNKk=;
        b=g/1Mnxh+gY/Y6zwW1ygWojC7H8U/4ny4QXTMqoRr2Z1IYLFNJLMuXzSY7ErPWCGI0r
         zhBcqQUZiX1RKC8bt434pi2LBDDwGZNLQJuusXuZ0L1sJn9JHNCSivB0LHP2+sMeC+5A
         SpR07qkBKo1hWNOdG209+lCaF7bW88tGxZpv1zpMRsT0rg/CMqX7TLtGlSMiDEMbok8I
         eoMQ0NdMuIlcKkRv2z31s9XHUJPW2WWhJnIBDV5xg93yOXfp6iYTgMAT9XI6o9ek3X5T
         aSlmPXVs/HlwtUusm64pkP/OVWupoOZwu6ts2P6Txt2OHW4mrn8q5yF/mJBmn5FProJG
         y4ng==
X-Gm-Message-State: AOJu0YzBgvI/OYqY7r/YYB+wnzZTEfBn4YZ5cH2ja0V68XQGipWLbWCH
	hb7xoiB6+u3b4EJxbCigYuetpG2YMChZ7w0ROOKVHaNkY7JGS0ZuWXCF4J7lp9eGDgpbMlT4gVI
	oHFK7C7VPIRgrzA0tufGyJpYn+/BHhHu5JhJkyFOT18ZS9CpiTaeYyfkGtKzU9Q==
X-Gm-Gg: ASbGncswaubn6dzj94u76iXxABK3cALZeR3NHAqfYm6D/bw8Rhqf2PYzgNy+UPjxF8R
	cB0LxYq/5T5+RQUS6tLPLvwteTNnvyMFhdXhLIE0r7CxHq4j9rH10SEYl1L5oID740gy/5sPyjB
	Qnx8L2v6dmF/fDFZaFtb84oOq4TqB1xmVxzFoPNXdfySYxhBtyYTvyMwBFV0l8i47wDVrs4zMyG
	gKydWtnrYKL4O+Hl0t4aAOXaB+e5ddx1nh5OIf9nu29rzd+8QXCPvAyaF1zaom2SJesppCwkTzL
	xS0PY+Gkqc/i5dfqxTmTXYJUqFzDvcJpg7K/mu0RCVFZiTUVwNNPTHjcypHX
X-Received: by 2002:a05:6214:21c4:b0:6fb:6913:868d with SMTP id 6a1803df08f44-70495b03340mr56700606d6.22.1752163696318;
        Thu, 10 Jul 2025 09:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLcSXwBvzMgHcxvaGx+jxenoScUgyuQu1/XLMH/JsUnJsRg9oDtwMu2U2WZdTeBYZEBbFhcQ==
X-Received: by 2002:a05:6214:21c4:b0:6fb:6913:868d with SMTP id 6a1803df08f44-70495b03340mr56699946d6.22.1752163695850;
        Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:13 -0400
Subject: [PATCH 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-3-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1767;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4qM0ky7zv1CT6MbG0sETVffzH28Znb5sgT9aMpTi5PM=;
 b=OlOFj1qtOHlC4RTSWWBUoK0UK6p8kJw7bEiAXyh697CDgkPWtlCgHYWxO4MvlcT4VtmGy896s
 MhkQvLZz992BJ4ENElsvaaczY9Qr1s/zBYA7f5mWOE8/m/uo3t62K5q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0

