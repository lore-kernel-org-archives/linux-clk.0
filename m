Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2E2D23A5
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495029; cv=none; b=LZ+hFrPBsHcW6RruBoOt451VNW5Dc6pasPpTVbG4XzNErdcmEMtnjnE72xvSOe1a/hTVD+ofEos/jML5VqhDsMw95eJnSJXJdxL8LOMGVKhhb2Dr2H74Gd9sRTUWCM74aIMOJSnCsrkXH8lVA73pQyE7iJR5AgMrb002CSgfVZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495029; c=relaxed/simple;
	bh=dOjKoMKrjNLxDaFcShGY+TJnvlU5rN6Rp3COkTM41N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3OktnIDS45kyHUYj984yT4Rp5LU6fgnxk5/zFFcjvM70Yqs7aOXtlnCNCC6YLBjela5A83M3KKH32CguU6lCm7k6Q6W6z+fGRFlWTPhuPIjlQhqM12xbYg/QOIeGEQBlyEUXnJOjM8d1ujtEsb7OHiulN1Z1RRHPRACnZkkxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J81Qapgw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXJwYrIO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J81Qapgw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXJwYrIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
	b=J81QapgwbYH44uKbWJ6ROx8uMLQ/Shcg8r4Apek//Q5R8unlgrtzIWOgh3qXVEeVBvYAyT
	1fKHv1EHDA9FjJDMAmORhFxcEeqJC2Ld6yobyjPdxuJQN89CrB7nsHtsiAUmbR5xb1YAMB
	vs00BQHtkMFHBkrBZFTRrB3lPoylZCU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-ZU_1dFyEOHa-_gnkx8lZug-1; Thu, 11 Dec 2025 18:17:03 -0500
X-MC-Unique: ZU_1dFyEOHa-_gnkx8lZug-1
X-Mimecast-MFC-AGG-ID: ZU_1dFyEOHa-_gnkx8lZug_1765495023
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88044215975so18656656d6.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495023; x=1766099823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
        b=bXJwYrIOuHg2k134SCpeBSqEehsYH7h4UfrZkfF3Pb8B4v8HeqQ1jub/OjvhNsGvEr
         d14/ONEWo9EK0xeTy1+pVhar7vfIbWbSzCurZGqeQ9XeAYUWOGRh7Ue11UAuqMhCaYwh
         6ibLMubjTMvYJ4NhOOQQgRX7WMUPEOsXTl4KwrjlJIumBjYkhC2LuKj2UYJ3KzRVSPlS
         +J6mt+ZIICMefNqt6F8P9anthasskJebZLE0BY+7BkXrPxqmC3yQcMFdOawgKeB9UyEh
         BtXKCI9n5ipNSjld48K9Tf/tQp2BFI/5DgO/gjEpg9kXlsQUK49bepUEfK9vECvPdQQ4
         7P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495023; x=1766099823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
        b=NUEGHctDo156S/C1Arwe8UbO8+jLYLm1kpaED8Wmfu3Y/Vsx0ljunax+3ab4njICdo
         k2+iyob0Jgk/8TzNvMhC6UIlxr5gcqzCjhI2X9NFsfM6c2ey3hitz8s+lKOv4+U+BtqU
         QEacGGq8OWZ/fLybcVSdcskdMm93P44wi3LFgHFQDgpnnSV50+NkjrOs0Drf+RxnW6gL
         ICn/sxfX+Oo/HicTjWaEoyM7d7pz30xs/Uu0NVxqhek5OCkH0+m2Noc65TXYw6EJv4Zc
         BYoCKuyh4igI22swpZt0+3d1KETxafe+JuGrjJld7xqPOFfXdRQrsXQwOFjyKwcS97Nn
         afSA==
X-Gm-Message-State: AOJu0YxvcS4Z+ZBFe9olW605mBNCgVo4j2Uu13FDXpVoCJ79fmLtlhL0
	jN/9Qv5YBdGj0f4ft01wFNONLRzDi7rV1x2stfijxxpx2OViIsxSbj5ev9k7yrH7l2Fy4vq3YcL
	4tOW5Il3am7ppapm9oNPIazNGSW08wPbC4Jl9bQMoNIq8YaxPKpYzeKYMskT/Ew==
X-Gm-Gg: AY/fxX5KcdJs5BSg+WLJRjfhIFjQEJPwYFNn3hk/0p+uSdDaoQGc+o3VJmFx6HT3X3K
	InNj64PtIewLVW752N3qAEF8UnfBCzIv9vwuO46tNglRa7x6BmhN50d2kjjOGL5JRM1uC7a7Xrb
	k4SdvFAsnmtwh5uWI3y3kmM4xzwi47AtaAlN/MdxDWcjjI+bwt1x8E3kblr038eXBIhQWCt6hSc
	YtIt9PnMYBH3pKVGdiwHCxaiHM/6XUJ6dUlkJt84mBmsYOw1DLnV+e/RIyZX2o2Sq6nymhjBJqK
	9Dj0V2rYrUB4A1GI10gdhiyfigUnEF42RpkqEmQh+SzGbFsDh126ovd17Mx4V22hOqtLnLp5AT9
	QTPdrhEpw5tt6U6GUEMRM5xPHurOBv7RJ6wSpgGXgYzXpzwbOTw/ijw==
X-Received: by 2002:a05:6214:da3:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-8887e1b44f3mr5869646d6.29.1765495023051;
        Thu, 11 Dec 2025 15:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmZS1L2hV5aQ7zoKqGzhOlVyBusG0wgauo3NmQeNT0uE4Z7Yi8ZXh/Hs5OUyLkYfq61AO84Q==
X-Received: by 2002:a05:6214:da3:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-8887e1b44f3mr5869096d6.29.1765495022716;
        Thu, 11 Dec 2025 15:17:02 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:21 +0900
Subject: [PATCH v3 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-3-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dOjKoMKrjNLxDaFcShGY+TJnvlU5rN6Rp3COkTM41N0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tW+pYkrBzwUUlxS0J0x7VsluaTZ6+7OiGG/29C
 o0TxA+mdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR1qmMDNvD7Qu+nZTe//Nz
 zwtxS0fpvY6eBWGv0n+W8BRfjc2fqcTwv2ByUtGe3QVXa0ztl0SYGceaG7w8xMv6I5Zpvld6Td8
 bDgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

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
2.52.0

