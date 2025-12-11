Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942212DF710
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495065; cv=none; b=d6IxxKfPLMbXNx4fMI6w6cSiqQxS0EpYmgqFDfigtLuo1FZkEKSRwkgtPgxe3Fo6EkAsza+bCVRrh2GhNNW7WC9flRQRaIIxgC88i1TV6ysoOThnsztyu7ZLDlVVP5tKcMnA0KujMS8/l+83A/qY9xHRqA2gzqVBmo70C0Ugux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495065; c=relaxed/simple;
	bh=1Db9NFuUnQhQu9U41X5Z8TkxHRghSnvnQHsnP4RTW7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVz0tCknFukH+H8rGAHcQyg3vnnLm55Usg/jpdUEJ4//f76lWIjDtMDpBuCT8Go+bT9C3Q0No8u2pGuK9c9/ZCUAxqrx9nHDXvwmTAbBACln2/d1rK2kCqcJz+FubRCLzeDbbA2sNVqPYGpPyPh6nS3Tnbas5Jg4Ykpvapc+KJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BYDHNO6c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCOMpnBh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BYDHNO6c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCOMpnBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
	b=BYDHNO6cji9UF5K06vYu2iGM2W7Dwi7WJhKHV0EVlDpoOJ7NwLv9UhrP1QfaZRPllj8HhE
	msJWDH8KhSNUi5JMsJMd6uGv592I/sGCqpz447XtKbEXkx4P3iaOOpM3yDtYf+IUX71L+d
	CBke5HmQDH9dyXfKDAGVVtfmdojUD+U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-esB2c0BJM5azSQYcENXMgA-1; Thu, 11 Dec 2025 18:17:38 -0500
X-MC-Unique: esB2c0BJM5azSQYcENXMgA-1
X-Mimecast-MFC-AGG-ID: esB2c0BJM5azSQYcENXMgA_1765495058
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b286006ffaso152878385a.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495058; x=1766099858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
        b=QCOMpnBh5doMdzNcCKsp0PWDHOemjceo3hdw5v4e++H4rweckUTrSWAeKD/K0/kM0P
         24PtIlEcep6alv+mt8FEkhey+Zc/tigiM97hDdez1WCzuf9Q5bsyd7F2DWbzWEzw8TxN
         h81snbmE1uXahCiTars+lLoqypuZfOiJzwjLj/noGOyCMKvo9wJDGjnwlDfx+4ENl5lX
         bENVTPhXvbt94eFXBWavV7EKiW7yl3jb2z4k3DcjpthwLc+lUKBSgV62F8WiR0UPAIvG
         S1ijOTWe4eoGZm+M+0frGbkXp4eNkCGfIY7TkM5gUp9I/WhevitYlNPfWVwzQdhbnYY4
         OEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495058; x=1766099858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
        b=GR9Q5SMkkHsabtHPWsEyIIu31I/FLUEf96gi4C4LJIkqKL/MvvblLOJjF/BGpjgc3o
         WHjPuKI+nlW7kJ//jbhew7BTV/GpIP3bv66kjtbHvpdO+zEm8iYnbak8kJ3QI7Ymw0hA
         ZPLjCbFqhoW6Zzku+vH/HHNwKWWKh3PUBgE75qvxy1ZSbX+86AsiGqZYhsdxtAX6/azj
         DqbVZTk1XM85K0VmPqGalaykONFeEe62JvPMK1BxExpKZ3NoWylHPwvylZnXm3v72Hsn
         macEnXXF7f6psvUsNyk4Y0Wx4ZDASnb3hufjZGEpxT1noBR1KzriCFCENmmKFaFFczCj
         F/bg==
X-Gm-Message-State: AOJu0Yxy3n+BuisX85RbQdSbOu1a70kkJ3ToBt1QKEMyabd9pzWifGiz
	qNrivA29tGujLfJo7slFM+RFI1csu3IKiYHhFEF9gzs6V99GADc/Hj5jfqp8AV9GBuijZCvxM4X
	DdJuDjIO14HCkudyMZnTwf68iqZ/M8kefz5Za+Aj4zFsP0bsRewNElgH/+Lbnbw==
X-Gm-Gg: AY/fxX5w7Hgt4c3ntJi6Ux9qOcZ3VgELFKJRGku9yOtBUjjXTZIIxXIbaJ9pu9TPyZ+
	5k/bku3lFY11NV7wNopaCrzGcHgub+KIBt06INCkC/VD0netPDp9n5MdQvzUo2uHKafDyeKsU3E
	XS0DXVUNg8mOLMMHP5ILUVEtCsS5PYII7tJkAa2HQFCQHcXxeMn0jITkcdTG6urRvFVYHREiwFf
	tc0PPXFz5yyP6AKNYRjzigL5HmlSU0QBcZPFokH5cpPbf4hkhDU7v5xJ9dorRB1tK7XKSmrI2am
	bVabUCowDaf10c/95mEx+32rIT9TrAo1ZtrjQ3X5wbKCRZ7aZ0kxs+VNrz0In0m1zS+J5HarEE/
	ZfAppRsc6DJV2iQDUrb3vHBzW8ju1XMwNKjrs1BO9gp2G25fFSWofTA==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id af79cd13be357-8bb3b358530mr24779185a.61.1765495057882;
        Thu, 11 Dec 2025 15:17:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ6MyvatEvjXLdrucEm3djvv+DCSWYW1g1m07kDWXIN1ABKw8EYPVfgJJ5sUpqpKlTIcYAIw==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id af79cd13be357-8bb3b358530mr24775285a.61.1765495057473;
        Thu, 11 Dec 2025 15:17:37 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:26 +0900
Subject: [PATCH v3 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-8-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Db9NFuUnQhQu9U41X5Z8TkxHRghSnvnQHsnP4RTW7s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tv/mBQ3J1ntD97t0PtZ/sXbDtX8XDgquXTd8ZR
 upqaUakdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRI7UMfyW7Kk4WyCmZJybt
 XVSS8SzsoeutV4+lLCYXcK7IPTTpxzxGho2HvrnXvlrEFdS08UIvr5StzpeJsWwOEuUlB2Zv/XN
 BlQ8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 29de2f7bdae8a31958e31b0a64281532fd76e64d..315ac97f52d8af6d3010dc87788575039c7a6b40 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1870,8 +1870,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1880,9 +1880,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
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
 
@@ -1897,7 +1897,10 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8, hdptx->hdmi_cfg.bpc);
+	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
+					  hdptx->hdmi_cfg.bpc);
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1927,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.52.0

