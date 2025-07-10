Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C912F0C77
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163713; cv=none; b=sO9EwjrVDtgHARV6vo0o2edQhZxiMkxEMLCL3+llYaMrKJsn+JgN47nLk3prteUZudYUvbPC+ZOw3Kc9EBV6kDR3SLXkCbKxYb2fS41BNxIqUWD0p7wzm69Xgif6BqBewEg9QcJPHfQkp0bJxS21OfufUFtgOBNATvak3ItpTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163713; c=relaxed/simple;
	bh=tFpHMfoqDqhzNTaVv7v0N0qvUtE+54itjjhNS/n95Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOq8gq3OUCzjG4qpn2ZV9ofeStmDIqCJzaw+71ldhJsl6SkC3kfRx5VVz2Y3VGqIZPmi9FujsZgucoxgeH/s4moBMsRLjd1lc55OiTCVot1iDdgx0V5MyL9VQD0NxH+wMdTrT2szTaZ4N8r8Z89mm1du3tN3a1rTmraf0OUISEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Usht5wR3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Usht5wR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X6cvCt1VBmJTFRCGYPDZTJ8fBnxpBorEBWf40KWv3BU=;
	b=Usht5wR3L12E54pHg6l8xqJf8gklr3/LDb5gRxnoU337kzLtPhKxd6AvmzEuZLeCD/Uxlg
	dAliKJCZBrRpe4HX4XNbFjnaAxHmUD32l1GUmqQCXBvavVGr+x2PpXJrqnaoSQAuzUI2kB
	fMkW1U+JqwVGzwdJGZnHcRo5nGSq8fI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-2KebDCUAP2uiA0YUb7Oinw-1; Thu, 10 Jul 2025 12:08:30 -0400
X-MC-Unique: 2KebDCUAP2uiA0YUb7Oinw-1
X-Mimecast-MFC-AGG-ID: 2KebDCUAP2uiA0YUb7Oinw_1752163709
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabd295d12so20464036d6.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163709; x=1752768509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6cvCt1VBmJTFRCGYPDZTJ8fBnxpBorEBWf40KWv3BU=;
        b=YXxm5+MeTphffx9gdDF9ixkgQxELYJQiAa0Ksxl9sWJRzQSR0644La4+wvfJZuGuzc
         dZCisyWqq1O7eneQJVXCZjoR8PU1vQdqDf3+XF+wcw8fLlIiiiunb/H4MtMxMzESgiQ8
         8BLiqRQ4RxQ/CziyY+RhH6xYs/CuKdajBo9KE/q97VH+AZvoTIF0iV32uXFYX4d1kAM/
         AuZz1vcR0BY7eWm2QtlnBuDhr33PzB6Zr6cyv42AmyKI3SwNez9UPKQMz7t8HRFk6Jw8
         rGpnflEoLl4+PzheK2Qi6Ix6v4UOVwWBuMeFzZJhFPxRaQLVvThl1perayM/TT2EuRWJ
         OooA==
X-Gm-Message-State: AOJu0Yx3FfYGkC/5nGQBDHvD0dO6k4t2V8XYkgO9nuKumSNAQDwfGvnq
	Cq+8S1K+yBg+XrZi06sl8KqnWgn9TFefYP1mS2CxEii0rob41VDNbLioTQr/zlzI3s4D6WzOF7l
	LNubj6J6TEbGvSeZoJ/L+IOL4VuKTdiLlI+2gU+E27sMIF+7o8TQ2PslEC8JDCQ==
X-Gm-Gg: ASbGncvtwJ6lPosOAH+OP1yRHqBfHeMqlV0JV/oELCV48B/wECvTeKfsDZmp1XS1cD3
	8YbFc0/p+ASCmKHX9K1whwYvW9KJ9aTYwJJLKs5rMeAkDqx/fmAp4LKlGJX/3bzZJUws8IUcTpB
	pKVO7PDGBnBZzTC2PFJhzyGvRmQBUeP1lfPQ7x2ssio9ZpubMhzoON48cFSUtg04j/oEy338ApX
	BQltiOehmP955ZkBCl9n/iC/zRVnnTXzU/3YjHZNBYcPCcQ2DYkLVUY8H4A81/sEqtCNtuut87E
	LGMbAR7nNDCrXLTzEqwpT56uTBN9ES3K+NmhqsoY4COoUcTXRptqfCGm6alJ
X-Received: by 2002:a05:6214:3107:b0:6fd:61b6:3360 with SMTP id 6a1803df08f44-7048b8bd8b7mr113600556d6.5.1752163708704;
        Thu, 10 Jul 2025 09:08:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7IKnx0oGY6DzZmPHsoNfOxbxEl/6NrEujAZIrZneNt1HGeFa55m0X6zYpF5NdeeHumqI+Dw==
X-Received: by 2002:a05:6214:3107:b0:6fd:61b6:3360 with SMTP id 6a1803df08f44-7048b8bd8b7mr113599866d6.5.1752163708155;
        Thu, 10 Jul 2025 09:08:28 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:18 -0400
Subject: [PATCH 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-8-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=2561;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=tFpHMfoqDqhzNTaVv7v0N0qvUtE+54itjjhNS/n95Lc=;
 b=e7X3yn2YeXeKXrOkS5F+e0IypwltHuyXsyzMnUIUuprHWBg0Yjbm20ihxHiKGf27VyMww7dN8
 zNFlSuHfbztAbMvbZ4Tm4rj9g4qefWj2ql3S7qfHwrgGweB+1fYDH7N
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 79db57ee90d1487b51f4ddadde870a275dd7b17b..f027d2caa4c2ebfc0fdec08bcebf3f415ff1a064 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1869,8 +1869,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1879,14 +1879,17 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
-		if (ret)
-			return ret;
+		if (ret) {
+			req->rate = ret;
+
+			return 0;
+		}
 
 		hdptx->hdmi_cfg = hdmi;
 	}
@@ -1896,7 +1899,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1925,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.50.0

