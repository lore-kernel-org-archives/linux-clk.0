Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28CC34AAF3
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471615; cv=none; b=MjCr1jRFqY9zDRZo0Sbq643gxN1/SUFkij+8x62N5YVV6yvQyKuoxkHvQ1SnePvmcdTaK8ahHUp5F4KsxNYUBzwK009qN70qtwylTZuRsy8bhAPZH8Vu7WU2mcwU7cRntBhGqkK+KfYCoRFHu99iTUT+thEvw0DG6RtomhuDCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471615; c=relaxed/simple;
	bh=9vVtfY2SWJyaK316COu6cQ1f5v68xmVdCSUMuW44eRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WL5UAE5SBuOAgOZAvKBjoZkoS/1cPa+lYMBTgx+pvTZZ2FmTazttU9iUiU8IcgTt5ehUV0cq6UeEe1GUfSc1t0G4yg7S5HhM9sfAgM78ZXIs0nT5/Hpw5Z+bVpIT0tTys5aXO4D++2XR7fXQJMpUNnBIDW7Z24ODSZDVOz/yoCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BzQNP56H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0bBjhGm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BzQNP56H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0bBjhGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
	b=BzQNP56HBzj39E16hJinFDR/y4F67/XPuIDoL1pJ5be2GUIv6eYg7/Q1XA6/kXX3B00GNj
	c+1c/03UaXBV2lxJEMWeDwY+nhjxQ2r4Sj3wkUjWDt+5yD4VpWDcFx3nf09T0CpOSnAvCZ
	Jtkw4jr63g3D562vS9GeK3VQSYWbqBM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-z6hZ5YJWOg6hyPAv3GTSHQ-1; Thu, 06 Nov 2025 18:26:51 -0500
X-MC-Unique: z6hZ5YJWOg6hyPAv3GTSHQ-1
X-Mimecast-MFC-AGG-ID: z6hZ5YJWOg6hyPAv3GTSHQ_1762471611
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87fb496e4d1so9029756d6.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471611; x=1763076411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
        b=M0bBjhGm1G+o8GjbnXYTqlJ4RwVBNpSuUucCRHhWo/6awm6UydSvfEZNm5o0CC+kDO
         v6LrAOX9gToVe2dYjksPWFFg0HB72qRpRKxBpe61NPkqxY37WoIoUYNeK4cpMpR/P7WP
         RuxWeIKz+RiqQDMbtqxLK2bTmM268Y6FErO0sQS1rLj+XbaoC+kHExjgtruHrEO4xvQc
         3xR4luVQKsclv0WdN0KykEFuOu9uQz61UQb1ONFDjhpIrpHkPXgKyk/KHnkgEmqPpez+
         N+KmamCnSJXQSwHJIaVWk5GmEuDYeW1qz3qdZ4e0Ieb10MBsR4X05YZG7x4SygSsgbU3
         aNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471611; x=1763076411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9SkuM/Zk54theYuUVPDuK/7cbD+hyZrLpLiRrTyy7g=;
        b=oQYkpmXFICHm+wDL750zuZMwm0kuoHDCxzWtrg2qJyePbgJYJC9UvHN4LY0/qaVu43
         Q+uemQFmYehUg3hni4DR3vXDpJtmiklC9HpxJMszFVluS5bMTskabdDK+evL+wmpDD2b
         bTGWWeqdxuKD1pkh7gLJGV//ofsoTGJ9t6x0/tScWTFBUdPuBU4iChtXCKvEI90MlJzK
         viVbiJ0Wg0ToJDou5EAYZ7XtbgKJcOsCFt4WZpULBLmA+qCLtOmsILcU8DD0197FALWz
         QW3MfvJvYyBsIcRkZ1Xy0pENXTqln+OOPwKDtD2K1txp7ZzX4VEiUhIptW0jdI+EfmZ4
         710Q==
X-Gm-Message-State: AOJu0YxVDKyi/vGwsJsl6FOKxD5bdTMxRl2v4ajNM7Er0XmfJYQc7U/t
	WJKZcU+1zoZiDQ0buQCdsawDqizRzZxbbGA3C/Ftb8LSdAeV1uyfqheikh9hh/x4tF40zf3/BB0
	28EmYJlWV0KvGTyEPBjLTNG0UvbinGvH2a/E+RItDyf3MBND+f+vIFShMGj5dEw==
X-Gm-Gg: ASbGncu7OJOWpa++F49Vt19nEqBThhH8dHz5TQ0Uo+OXrMqGgCCupgM5e2LNv1PFbFd
	No+mCX5z3QS6o5sau6KX9dH/UECZB+il4P8uQxGz+zJAtIWlAsz9C326z/UIKdvbLSziRK2YlpS
	pD8a/9b7LIsIanY1gyq0NIAnwRDcjWSNJBCad0pai8R5S3HbfWvYcQ4qXt75t3KsG5nwC7lJtZG
	u/miI6bfVy/f6GRAlv/FZtB30d0wR86x1M9VNZn3Mn6QTyr7pe2nly/0uQKiW3Ndr4hdj3/ANyx
	dhUs9YuCo9lDlvpGUdFtSjCobI9souBqro1YCVZ14tQvMVCWpA+YA2utihqwuIdj+VFvMAuHh7v
	a8Fw7G5djG0CzAAH5hlxWQuROe7GYQjPVw1i/RSAbNQ==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19319256d6.43.1762471611237;
        Thu, 06 Nov 2025 15:26:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSlSEV9dAuqFzCy0/F84dwpJ0FkW0yEvyVdQS2BVlZV8mmVJOC9OLuQQBUQWU2sDVef6rnHw==
X-Received: by 2002:ad4:5ced:0:b0:796:5c30:b079 with SMTP id 6a1803df08f44-8817678d8e7mr19318886d6.43.1762471610821;
        Thu, 06 Nov 2025 15:26:50 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:50 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:50 -0500
Subject: [PATCH v2 RESEND 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-4-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9vVtfY2SWJyaK316COu6cQ1f5v68xmVdCSUMuW44eRI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RYoBp++/m+KnEwCw2Xzg4JMM1sv5LqlTfM8z3Ft1
 oPpKx5c7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiTXqMDOsmKjWITF6W1vcw
 Rsfl37GwV6cmCusab9l/nnfG61Oh2ksY/pdXORfMfrL0V9JrDfar8z4f2SCwtyM0bMnTN+tL1n5
 89IIZAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

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
2.51.0

