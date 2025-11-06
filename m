Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D033C532
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471600; cv=none; b=SX3gkqmM5xHg1v7nAuJIEIKPzJeZkHyRJdX/1mGs0HPuc37AMw9xgSLfwlOl4NmW0gXnyUEceVj1nV0WsVRyJ46gAhIhwh+1U6R5VqyWbuEpSxNXILsRo547WUfH/duQjFcfwk4DUjdpELt0RPgMUXE9ODNEf7lXOzsbwGkQju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471600; c=relaxed/simple;
	bh=tPB5NIPC9Tahtwhg+nx3O+ru7wuSB+giCQQ8ld+ZnPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYiYHF+GXqjeQILONHRVL7T8nJvtmZ8N9TMjLpO67PJ2K2zwRqSz31fqpyzVpSD6f3G6uSHT9jTdvzVs5zcP8sdMwefYN7kFq0LkwyGCPUHo53Bmx1c+My+ybBO6Pxquhz2/vxYseefnl4z/EZ1DL+G6WQRHYXrYS5pyUqFrtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/zcMhy9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LLAsugIZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/zcMhy9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LLAsugIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
	b=c/zcMhy9EZznNvYlR2w9uJLmMmoApPz04cw4phZLhhJg1JheGn0mS6B/zK8dQvFPin10b8
	n1OcRTvM4oDTAVjlvz+i8DXK9NwrKs23IKVBR0A7dKJdZzaPKXBbeJvyjNfiHSSnLgSL7F
	0nLdfPeeqIN7hxn33HJcts/SwyaVIvA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-VmT0VcUbMmahySxn7vl9KQ-1; Thu, 06 Nov 2025 18:26:36 -0500
X-MC-Unique: VmT0VcUbMmahySxn7vl9KQ-1
X-Mimecast-MFC-AGG-ID: VmT0VcUbMmahySxn7vl9KQ_1762471596
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88050bdc2abso5870346d6.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471596; x=1763076396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
        b=LLAsugIZ5U6NlPGYm5+PaOx6v4LtD5y/PuN+RQFAO3hNTa61WpjvimE2I8K2GTmXF8
         kfFiIHTfHwXLh/QY+nbrxIdXAE1ezYCSOFounFNgpD9ibnsOLCmbp8pJEHWc+kMLH1Fe
         oStQTWuN+BXOPPo4fAKs8eSqPI7Gm/uw4UamvuHEn9Y3fked6Z6P5m04TNXTWObzyosZ
         GGNfUv9ergKBdh2RdqEbWB0FZX9ZYD4Pk5ycYNkQ0zKAAp4fv9fnmK88JhC0ewrSBhzq
         qFJtdbgst/uR70jZTrlgLu2BlEpyWSWcsWndT75G5ST7oWSMQcXaVNPnNFfH2YgKARF4
         pAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471596; x=1763076396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
        b=Cu4tdQkE50asx9x0FRs0t5BwkXWHP0Lp05cWQ9EzOKxAp7x7ptfmzDhZWY8Pwv2/P7
         m9ygQk5M3fVqQ+vGQS+/+T5Owjtu6SUuG9AyhbKTDl4OoOasfg0F7j/SMMRBGaseNpYf
         fQzOjnNU8rjQU0gXoqut5yVDsFoNgHhcD7jXMf5FOqzOX1/fdEJ2DghiOsMQa4GkXYMp
         aMKn1tRAzuVf6tW36kbyYmXBlviZY0Lg/UFjvH2N6eMHM2SwHYm57h51rq8LkdbnR2JM
         bbBvsnA3Pvs9w6v3gB01lDiBuGNMETHyMpK1X035E/wVPKqXenlX+lGr4TTk/Z30aw9E
         eUjA==
X-Gm-Message-State: AOJu0Yx6qB/iuNCxw5rBCyTMEavZ6dJaphsWjB71LWxeFJWx6NdKcJtW
	4TGTzeKkqpFFgNcmkQ3zc3ewk6PdFnyq707Jg8DofT+3D9kQ0Ql3/RMOAOsZAD4wlAsWCFuFBeT
	28nCYPMS8yj36HH1vQxGNh9vt7+fhnz5tI1OD6+wAIw2E99jK3k1XZbr2dLI4Ew==
X-Gm-Gg: ASbGncvtWHLs9hg+ZKgPe/oV1hXSjOgQJQuJU+L7DBIhpczNz/G1Bm88qlNST0pVXKj
	eGdGRRtnea80Qo0JPtFzr2L1w0eMUKqo2b6w89dYT6WMgYyk+D3NJ09BFPgIfTk19gBft1cM2+4
	hMw0kRA45JMyge7bwVs26J7jmBJZJb08SuaF6jpsfaeCz727CkpdXM1SWX3T95mMWbyNXBYRLj/
	Kdyl5ta/oHaFRRACh2YY2aX3biUeT5b+Mtu7kg5C6dVOcXPH1CmtWaLYRC+LPjrVmORP+WTjVBq
	K70rwtJCJ/OzizZMayjiDkEH5t1gg0krlTa1+mu5/7tVJ/LbbZ7Wn+ui5w2rCMEw3bHCHN4phlj
	EleOSyor2UDZWs5nPLZvQZt9CWFYMiM0XeLl4bwf4BQ==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id 6a1803df08f44-88167b1b487mr14732406d6.27.1762471596157;
        Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwsDTQJb9qqBYb9v62fMP1IlTO5wvFmMfSLsEpd/QskmRbsWz9CRa2AbIiAewvIcXXmKGXjw==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id 6a1803df08f44-88167b1b487mr14732096d6.27.1762471595757;
        Thu, 06 Nov 2025 15:26:35 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:47 -0500
Subject: [PATCH v2 RESEND 1/9] phy: freescale: phy-fsl-samsung-hdmi:
 convert from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-1-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tPB5NIPC9Tahtwhg+nx3O+ru7wuSB+giCQQ8ld+ZnPc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZ8qZ1y68Ds1+V38qKsPZ31ou/Hv9tT5Oq986XlN
 sMCmfTQjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZir8XI8K3jqEHi251Sx7c/
 Yjraoi5f92KzyTYZ7+2Xkg/s6jMsmcHwP/jWullLg5MdIhTUAyNY/z+5IpspNzcipfx2v2sub7g
 DAwA=
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
2.51.0

