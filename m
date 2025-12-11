Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E7296BC5
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495056; cv=none; b=QwljgLSt9aRnRkfxZgLfcK7OgmNOge+fnrN1j91dVRFzfXmPfkI5M8ROAPMt7YmX+9+j67vimwfbAHvMssBGzqMVFMjltb0X8KEB4HHrU+AhBQPpLWkZdogbH3R/rMrCUxdnAt0fZ16WWLcrTngLzPUPxeBtCnG5to42JJ/8DCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495056; c=relaxed/simple;
	bh=An56TAX1cqo7N9lFvO25vdxikpcfbBNUoQ6JxN8UiKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsR3O1CV0XL58596Q4AZdm8OQhPdbZGliQFRzUq1Sv0lVAtvyuDTxI5aiuUPaCo2I0+eEVYmuQc0EVNebrzrU6d46Z4FHtLxhp1b7Pw2gREzBzQ+l3DoFv5DtfaWkPgwFyXJGbK+NeLDlbJdPQ9D9C332rzvnqz79KILZtPGjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AW3yD3yg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ombH54dH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AW3yD3yg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ombH54dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
	b=AW3yD3yg0Ge5x/RKsL2hSUc3p8mCW2wkr1wRXbtBlzxbHBy2Rcmu8pd/hd2yDw21XD6fdt
	521XjkBRVd495w/TBAotswP4wDzdxS2x+yU+fiKsXuQNTzTeCls3H3WLJjoz5RkGBAKM9W
	c3Ri49jH5SDQIbu5Eyi+1O6pykQDMB0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-XqZEhk37PUaHwtOJNScEKA-1; Thu, 11 Dec 2025 18:17:31 -0500
X-MC-Unique: XqZEhk37PUaHwtOJNScEKA-1
X-Mimecast-MFC-AGG-ID: XqZEhk37PUaHwtOJNScEKA_1765495051
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee25cd2da3so11042391cf.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495051; x=1766099851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
        b=ombH54dHu0FJflYIlYkIQLpZY84ww0/oR2/LEUF9fnzkUIv0dcP4SCYHJ5OkQB1Hmf
         ZGLsvM5+PqcPxfA3FCGpnc8NUpULaGygo1Fg8EKhWlo97dL50xboB7BkFgyLU0gvPlFi
         uvQYmcTTyRkG6nzgG6KGyzHLMrbCTWgP4Wfj6lukaRH5npX5eCjthICC4Qsj5LtfGz9x
         TD2WFlVNCs4oSwXvwrwqn1ALRy148QwJj/bYw8SDTcEYJXiEM9z5yHl7RWZnX8efCKD+
         ur2eEt6o33Abe5Bk77gF/0Mli3Os50qc9uJr8l1rgjQOUcKjt2XW5Pp4UiubfiXU1qa7
         vJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495051; x=1766099851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
        b=KbLxcF/Sv2t8ivf1Wg67iGcjVDEmUQPHXOeEfJi995X1hnT53ntCsajONMY9QFJdWH
         vTBrWQ1ASKOaFSLrKG2jqqO9bAYgGiRlFSo99ag2OkKRznl2Z9Hya6Py8ybqP8o9jt65
         O4Wxgz3DAgiIAt8lT27Jfcr4Nm88hkDgQubsDwXEGlsZbX+bQS6obq2pBHc01VsXh5RG
         ZeHo6mIMNFWeBFMpE6aRhx3Rr2+qLY7WjQ9kUU34uV3StTT/BKdIZ+/AwLa/2/PZ6Njd
         7p9IBlVZEkYlFCE2TNQCZqbbwhukznZjtRRrh2S3fYCCtIYprRlgpzbl7rUP3nQxhQBb
         3zvA==
X-Gm-Message-State: AOJu0YyJpnemxeHrDHkyZ3oAU9NJIq2YTYm6i7N5P3GneyeSQWLynpDO
	EDp3kWCX1uSpW7/7+DXzLP4+WmghqX/C2yzAQ0Gu/Swz+N5MsB02s94XOA7F5+VigvGOygMhxrR
	C68r+lOa5LebW4bJc5F/ETL6oRxcggzJMyhE/L6mSGO2h0kk2HF4PwC7qbMHbLA==
X-Gm-Gg: AY/fxX4FctHMrVE/GipF/elDqwWaISYhEq+6RmuVuYoZnjA7yx9jYxQoEfPb/2lp2Y9
	knoPXADrCmjHhqQOCSA0kpuk4461FEcnzGAbNOuz1r2MmWRBiwQ7GY6RqeDTNnWQ+T06fsXBBDY
	H+TkE8voW4pRm/c7nXFj6Jr1RilwlyFeTpuY4QjBUgjelf9pXZEHzEml/sH9vOaNId9VbSlibj9
	5Tdg4RjyS/heLa1qLdJN6bDkqR/VtUMrR0F44aDSpHaoi8f80qDyCY/EpZWs3NEiex6kAncHx9+
	+9zGbENwXn85AcTvJFZK0wjDebTscgK6QI2AiegU/PGriUO96dk8Mn7TN3ErjffwIePRotcZhgo
	u2EywBByfMOneWLnf65ra9esy90AMHFwIAw4Q0uw15hnRW2e+0VSSTg==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr776271cf.70.1765495050792;
        Thu, 11 Dec 2025 15:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ2mASGrb1uGzvUHEFvIvmoh74d2qrejs22ELk7Vj6VjgPY8UzKXQvMrAzIodArePD3T0o0g==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr775831cf.70.1765495050403;
        Thu, 11 Dec 2025 15:17:30 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:25 +0900
Subject: [PATCH v3 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-7-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An56TAX1cqo7N9lFvO25vdxikpcfbBNUoQ6JxN8UiKo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5922P1Zs7hiGnB+9TFs04zdHhsnafw74/pp2aRZ
 xsa/1Ud6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiL8IZ/tcuZ/74xmunwK8+
 K0b12kU3f76araLG+bUwwmBtXFmp8SOGn4xTJlnuvLvryMOzu/sCg/+572ItvCozoev822K9vIh
 jf3kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
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
2.52.0

