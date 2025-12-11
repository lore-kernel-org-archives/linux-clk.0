Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA81D798E
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495013; cv=none; b=a2/9xXssqC+Zk7v2mjgHJno97Ha+AYv0GGrCOuEnY1K8rqBiQKyzSf+k9U8f1pjODGxUstebrLg8R01Zudx+ZQTyev/itaGEeO6LqRxiiksSXt3+y4VsigPRJ9jX5GBI1SoGXsggJKjq9i0Gt4RjInhGI3cSEW5dI2XjPwrKET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495013; c=relaxed/simple;
	bh=uyarQyJgmaEeLScoBV74B9PZPRT2iTzM/dIYFjpbgc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Clg48g5mddF6h4VOqRBUy/oZJXLsdXOAYL/sblXj9fn/EuGkLK5O6ohX9WNWjUMj6wsOPLQ2vzdUV/wgY6jEFF18C/1AYeBG1LTjf93WEii/ihb3McWVE6WuWswyMaN1p8CQavdN1dEbgIYYBc5RgvtEWL3jDA2iK8o7gv2BWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMXKNPif; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HkDmuTk/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMXKNPif";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HkDmuTk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
	b=CMXKNPifcTJ3eNhvLgL9I54WyuBhv8Eejb1Vkf6cEQ5yVakL7HZaPF86exGHioRaYJbgeo
	2jnFRabPAYnX/VZlF6PRDucW/0QzQ74jvLLokFPX6Bbs3jbK2fu9XKvrzzoGUblJekSyFD
	1MeaWAGVvdWcGjjHTxJEyRcfDjySU9w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-_3fDQN0iNr-PNtsfzF8jxQ-1; Thu, 11 Dec 2025 18:16:49 -0500
X-MC-Unique: _3fDQN0iNr-PNtsfzF8jxQ-1
X-Mimecast-MFC-AGG-ID: _3fDQN0iNr-PNtsfzF8jxQ_1765495009
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e2342803so157213485a.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495009; x=1766099809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
        b=HkDmuTk/GFpBE8BS6NMlGrqxKqCAaM63j0vUHA/BtS6EzIUrtokfYCdYSI4SJveqfz
         9Ej/N9nkYJrdxCo5boEE9efOabuMeLAe2uVmsjkEXM1ETP1CB/k8LePgUmXSYa5MINBU
         FLEIw2xy8SY5oXvlMO/F6Iu1EDoLU/3gQMiUpY4YkAT41xHmn5cwuDW9D6jcVnbsW6S3
         DOAokGWUpermCMSlIDritcfTJqMzyqGTdeELtk+PgYzZtYw+ntAKqJKiqr4Ns6TKergX
         bDrBLPpVvU1Sd0yPd5HHjRnUsel76IDtFV505W61jKINUZ6ESLVsssDVXSvPj+j6dJZC
         caWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495009; x=1766099809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
        b=cRX/8us53xNfV1pED/sXlp5T6273BeNNk8q7aqyfpU+qOApRrbHzTpErRcyBT+TghI
         7E2Bq+tHjBCy7Lp9frBF+7gn3xocvKX8w1ZbvoU50dtupRLJBtx+29jT81sC7v/g5jus
         j7icqHmGnBeVel15nL4Wl+P5eyvhvI3Ss+MXjYAAioYahxqeKGhyBfWzWKeDBJCnMsX7
         0zveil1hnZjsGkgGCl0mFJ5ca7eKJ0gtOE9535DwSaHQrobavyRNvM/gLIZFQlgmjLaB
         Fxe6Njddi4QybJrskTMR7BryUqxCorO1VMaiGDkrXeBAm3tjhGP0JsvfukonA0ILXsfl
         Vkug==
X-Gm-Message-State: AOJu0YzvPO0LW1ZDEnovQR+7ki68nw5nCIN6FNc6JbZLtoOBufiyG2i+
	9nd9Evlj+z4d4JRckGwcIwTYRIruQ6X+Sxq/QZJ031Cclsd6ZawSoudl9K1g7v2CTkYILZQr6iv
	9OsaRGZQkH7A5PsAKnLdSnCthjnww77PXpDZnACX1RhcXKg+ymK10nM6NM0fqmg==
X-Gm-Gg: AY/fxX7ey7AwAO3KSjda24Ak++3P0MEhrmWc6wLJYeGzRJyE/rmwrLzKU4O7aSEHlEE
	oF5URPJV2goY6n1AeK3bCcOHY6TPlzDXupARgy2nf52D8GjYOiVX8bpQ9zpQ/wl5vVR7p8Yu4gv
	CXzJrPr7GIHQa0jEynQgirvWAwHIpa0gWx1z5KqEjojswHDAgNtbWAOSLpli/bUUlb1V1NIXk2i
	HlLoptD1iJVUqxNqFblPSXczSaT+7YFIJBOUEqS1iEAU8sgQxhhNAtnoxIDheKlOSsQBFwAfNI0
	dSxL+mMA49VxPC2ijTe40cZiS3rItQvq+cxrCdSFDdAJtl2YV3TWU47NoIb1h9gDt8/3Bk0aeOm
	+3LAq3qBYGOv1vHco3l6CUja6+niaUkf/mxaPyKtJ9HcR/kt56kEsMw==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id af79cd13be357-8bb3a3888famr34766285a.61.1765495009113;
        Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzGfyg51QMkMX0nb0URo4omcvNBrodsNtcYzQ6shcsy/VZXilk5dO3Eb+B70Ty3ot1LOtMJA==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id af79cd13be357-8bb3a3888famr34762785a.61.1765495008710;
        Thu, 11 Dec 2025 15:16:48 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:19 +0900
Subject: [PATCH v3 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-1-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uyarQyJgmaEeLScoBV74B9PZPRT2iTzM/dIYFjpbgc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5OubvRVPFUzMfglqvZrm7+AqavlWs+rWrUvSgqu
 cN+ieikjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyTYKR4YrlqZuHA698WfRY
 zW9m18O8n8eYZ8/9E/SH62Giq+E3XgFGhj3SJ5lOVnSoTmeLZfR5ljSpR+/PukrH6l/eIWKHHy3
 JZAAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 191c282246d96e3f6c5a8d17abe078892882bf44..d010fec15671d33cc363af79e9f1c3f26ecb3464 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -570,17 +570,20 @@ const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_h
 	return fract_div_phy;
 }
 
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static int fsl_samsung_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy,
+										      req->rate);
 
 	if (target_settings == NULL)
 		return -EINVAL;
 
 	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
-	return target_settings->pixclk;
+	req->rate = target_settings->pixclk;
+
+	return 0;
 }
 
 static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
@@ -599,7 +602,7 @@ static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
+	.determine_rate = fsl_samsung_hdmi_phy_clk_determine_rate,
 	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 

-- 
2.52.0

