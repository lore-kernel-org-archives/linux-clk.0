Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAD26738D
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028667; cv=none; b=bYHtOXxsy7I2yqP96mXBRyWAC+QYMNG8H1tvRTzBQi2kQNZF0sLFUwvzBvJX+193fL56J4jAFft591eluSXVlEqXxSamv80ZrRRPj8IUtvvoCCTbPLSuznwST+foeRCzFnvaSJHIa6vMLcMMFS+E/FCK/TQTQV5ISeY2Xngtms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028667; c=relaxed/simple;
	bh=5KLGvHQlEx3HE68FkoUz+5ZZ08i2Z1EHZbkA0AZsL14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlGKTLSQg5XXUr2SUlMHkAkVS4F6ZYwvc6iybabNZNWWSqy7ugBPlCgHl99WT6vVL7Hvy30I23sIU09kMMJuEkYNE2gwpGWRbHxYxlxI+SLKoZEV8L58XbgeJieF0u0h6iyBSc/3MS7C/H1IJ4fWt72Oyfj8U4JNBeeZ6vbqJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byFPnbQJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVQO5o+0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byFPnbQJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVQO5o+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vdyTB1Bnm4PocyZ2yzoZbA1lY3Pfiu6QGknE0aPv4gU=;
	b=byFPnbQJYHIXjdVk1Xx6UsflWGHYrycvFN90R5H/Ns1IvjgzEEirLRf+NKozi4FDTBjJLN
	CVY/RPpZ5Qn8HlIrE+uZVvEEVW4eC3Q/PF47bF92zUT07yeareG7muHIrIQbZ59LPeKjKX
	T4fIVp9fU+okbwFXBUNC/AeHddTI+Yk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-H4m9KOvaNQeJYdEQ3eZ8mQ-1; Tue, 05 May 2026 20:50:57 -0400
X-MC-Unique: H4m9KOvaNQeJYdEQ3eZ8mQ-1
X-Mimecast-MFC-AGG-ID: H4m9KOvaNQeJYdEQ3eZ8mQ_1778028656
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eabf08affaso1646763285a.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028656; x=1778633456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdyTB1Bnm4PocyZ2yzoZbA1lY3Pfiu6QGknE0aPv4gU=;
        b=YVQO5o+0YrqvpqvfSAx3fmuN6RwEQbVAbhaSipE9r7aXdq+FWj+GOIqoY06cX5/OKn
         Z4zDlsly+VtiRrUOunyWKx1GV9CgCxec/+oUSFxnYk5au+w//bpUYrsWLYcrSY0qGJpI
         KD4vJwX/cSb3I5zAT5CalTayXmFErzItSYHRKfAO3zrGFwdDRBl93ajM/4oAw596CtJx
         638qqKRBLllXIebfKUk7F9cXGjB8H6VPDhLm6DGmp0JMM+G0J4jt8EaJk2mizC3AdpNx
         M8cROinlWQ1WPSFIzH5qLxXpPuyVMnaFXa5gn8hNcA2qbx0qjCmIIVTYhniWweDMId+2
         i3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028656; x=1778633456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vdyTB1Bnm4PocyZ2yzoZbA1lY3Pfiu6QGknE0aPv4gU=;
        b=j/pfHRaKmW68ZqjYuNHT6wkS8BLrFH97KlMxGvUBZGBk7kEJKUOZgiVJVlzWD6zua4
         3wkAb1zEOAKMcVlR+lV/zbpTWt8y5xscRv8TrnfX4SbB+HeJpqkYzLkKsugO//tLnMLi
         6KX8o0Q2Y9BDUTLXRTyijxAEL9txBrDlc55UEpzvoWX3JIXTSKDGeYa5dqdjz6XiR82S
         0VZE1lD7v4xSGO5oFr8RIxk3uh0m/DzbAWyunkOeQ85+tMpnnUfbeq7C6f/8ol+b9J7s
         0Z2TEFLuhz1xIgbKbSY2pLsEbD00FaP0XEvmKiYcy7ir4Odt7ariGNwXWr0RDkwVIgAV
         3ZXQ==
X-Gm-Message-State: AOJu0YxrttiP00KDQgrhqzqPg7qvb6sdPHN53FVF1JT8VWGtHtWLRINe
	3jf6o+zqV3d4jc3m1q3/GqFFCkwK4dOP4qnM7NSfNAFG8U9Kvh7+OAxoMdB4RfB23WckTXZEc2R
	KCz0zbPVqGlGsHaMzjOuCH022DdnnCh1JhlbpfGI0Lctz/EiB1NrCeePuJ4QQaQ==
X-Gm-Gg: AeBDietWzvXLkUvE80KrjSVB3VXAt30RfDh/dl7cVqzRVB6EkvRvrvuN8r/2FabUKl+
	rR9xPW3TKD6EjxjmlGbmRz1xI9pdSZ4XSKCBqPUU0Zjt6cQpTqALbPWL/HXeBBHMpUaNQVG+iQ+
	+xmI3C/pV0Qp0v7g7HE2OAKu/oRoLBIzxlt+gxukm6j9xuD47HfgAH5HPcleoQoIesQUcqq/gxq
	uDoNSlFa5ZRPfgshD+wC93BgRSXyWqx1GipSnTjUczKEFdF9QUA2xeW9IA+/wHxv93aJbWsQS08
	ZFTfX8jJS/wQp6QHl8RDBHYULoDv/TxxZH/Zl4SFTzaErrB7/i9PzhQIBC5U0vQA1r4Kl4vCN1i
	HP9q9LA7Ah4X6OEwiWKo+M0gODuvNC8ZC7insj1mC49K+n2AEnEXL5e3gcyaQWFX0UvcqCwFn
X-Received: by 2002:a05:620a:25c6:b0:8fb:1acb:ccdc with SMTP id af79cd13be357-904d63e78b9mr222383685a.34.1778028656519;
        Tue, 05 May 2026 17:50:56 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:8fb:1acb:ccdc with SMTP id af79cd13be357-904d63e78b9mr222380485a.34.1778028656127;
        Tue, 05 May 2026 17:50:56 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:09 -0400
Subject: [PATCH v3 13/15] phy: mediatek: phy-mtk-hdmi-mt2701: use
 clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-13-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5KLGvHQlEx3HE68FkoUz+5ZZ08i2Z1EHZbkA0AZsL14=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfB1aTIvCTNPe8TLm3/hGP9D9n6D3amfYvtPcJjkr
 riR/PZdRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP59p6R4aV4g7mhfH3Mhwzb
 Hf2bsn+/DQ761rkr/csdu8XbuHvjpzP8z9H3ZLl1srR7ccoTl3XGsUUZl/W3CIisyCwKOXhSlJe
 VHQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index b0b6497e7eed..c9a1f20e939b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,12 +90,6 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
-				       struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
@@ -170,7 +164,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.determine_rate = mtk_hdmi_pll_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.54.0

