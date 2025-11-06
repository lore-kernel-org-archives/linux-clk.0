Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6634F475
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471630; cv=none; b=d3fxLpPypu87aCcYBfYMgEjQ9Phk8J6uqKMX2KJO6TA9KeObcdsHtqbAS6ROfYLBDtOwKovS5+El3iLvUBgSB7t+VIPkpIfOqOijQfZweYph9Krgar7p0ghyQYSal+81CDKLsvW+SKkaIcZKRjWDor3ncEwLa09AypeD2kTrXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471630; c=relaxed/simple;
	bh=B3cRh6p3LgoB2SM5XPxaNOqjVUw8A6Swuk8MPDVITuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMinvEhhwJvHc7olDNpzR4n03zwQ1YtHBG5XyAw+qjtggEBKq+/0RXk7nb4QaZJ+nwNmlLkh83dV+Rnsmh0NGekw0DiZV6SKFhRJX6yATWX7RJlN2qwsSd4r7IIe4GekHZAaJjLv4sqit96Zml50gm757RGavxf3J4B+hLEPX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RIrWru6k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e/omTHUw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RIrWru6k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e/omTHUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
	b=RIrWru6kywONlL9XBLNuAw0K1Bah3O5BudCPQlV4bCxBQYY4goqk7KJ8Pcih4MHEO6iCth
	i7yjOoRpZS3+/IGV06RKFBktdcCaAhglSsL0zvwycGzlcuIJjcNgVYRKCScxAUbODZC191
	WxyBi9E6EVk+np6wYYooklZyf4FOF2c=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-lSClBBNTPw6BWLQeIVpuhA-1; Thu, 06 Nov 2025 18:27:07 -0500
X-MC-Unique: lSClBBNTPw6BWLQeIVpuhA-1
X-Mimecast-MFC-AGG-ID: lSClBBNTPw6BWLQeIVpuhA_1762471626
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88050bdc2abso5880636d6.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471626; x=1763076426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
        b=e/omTHUwU+CANw4p+YuwP9sp/dIxI0+fLm6lkvqNGDlgPjwoZ2I/doHvsdzZpMAf7b
         n9/Fp+uuVqHfKlrSluFlLsJ/vfUtRKDqN+Azi68LOxHaBAV2p42y7XmpnYCTx1+j+MJA
         oBRV6njikL7TGpCVc6et+CILyTMEV6IEEzbit2Kb0kAIcogDEc8yIquOvC9zRzy5hCxC
         eQXZ5oHU7XEdQ4NPvwgSH8O1PTbnvpsYlV3HJMEWQWvfZr2peSNq8OCMLryhJZ12KxH1
         lkNaNINOHReieIdetyMPhypyQEm7sn8BnhA/rOImmZyNSnGMRDOAsU6mo+EwY7eJCf/3
         35KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471626; x=1763076426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcn3zMZ53AoVHBM0SU+ff4cP6ID7GbGsImYTlghLRvo=;
        b=Nb+hBP5GZZZ+QgOEudEngAbPRVBTz40R5gRO6R4AfqrZDe3wWieva+f4c22GTmlNyD
         sUvDFw7FZgeXE+JYV5jEKa2m4AxHizEpJPJAGDxBJ7Zv3O7PrcdV1SbMWJ/rsxkyYoMt
         5+Y52Vv8SwctaWubINiYSwc1jCuaQr28LApVfXvfn//F5Q5J3kvYq88KQZE/lYHFBcX6
         yVaSGAh3jgWLBEY2ZAGcCj3stJbVVWw0ADQl17br3wCV19yd450Gv1cga/0OxoNWvBbt
         xJxNp4Sz03Ge9VAkwFcUQwhjx3FmZJ25davjw9LnuNdy7PGlY+9+0/IIgamoDl3xeooS
         3nXw==
X-Gm-Message-State: AOJu0YzqhWI5L/iiE/6ri6z9fV9p2khV9w86MO7d4G7qoE5YLG4pcco7
	oGIrSemB0E6Nkukl46xhExpXi9HQjwFJ/6qbQCdmjhbH5xY1nkruKAqQdWSy0/Z5OirFcmKq9vA
	G7F2hHhksH2cAKMawFgrq5qiU/1uvYKv/imIJn+jhk92j3UeeYzvNmYiJlBRfTQ==
X-Gm-Gg: ASbGnctyeRPkXlHE3qXwqYq0GEg9sHjCsf2LvWmjNVAw0XsNHLKNg4SaVe1XbHlN4mj
	aPndc+9y9Lsy4VbJLn4XO3d3NHbHVSy2Lc2YGZOek/Qc0KAcRfGFZevQQL72cXxss2Z6zQ8V793
	udK02Cd0LRtPaiNcY4fKDiDORWjZLCtLYhNwYuHqMS+kpg4ZJGyiNN8/iLisRItUz6y6oWa3Zgy
	hhDPTAgGGhXIyd7M0Mcwl4begxqoSGeRKjHTx/bYElLByR84Rg57drWhFOhAp9NJZhr71yNw4FP
	DOGXVymn2gPwmghGtuoDXb90jS717T7KSIDd5LQ519aJf/6TdmN4gpUHavUmuc8vTTnqKeKW0B5
	tI4Lr981dkl6rN7a1V+qgu2FjK55XeyonsHXoJYjK8w==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id 6a1803df08f44-88167afbb01mr19476756d6.10.1762471626529;
        Thu, 06 Nov 2025 15:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAKV5Z7B7KevWNhDrMQhaFFBe79yFfIMSER6+SS9G7GG9yGBlDbjxgm5e37vbwHrzd8zri1w==
X-Received: by 2002:ad4:5e8c:0:b0:87c:fbf:108a with SMTP id 6a1803df08f44-88167afbb01mr19476536d6.10.1762471626163;
        Thu, 06 Nov 2025 15:27:06 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:27:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:53 -0500
Subject: [PATCH v2 RESEND 7/9] phy: rockchip: phy-rockchip-inno-hdmi:
 convert from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-7-e2058963bfb1@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=B3cRh6p3LgoB2SM5XPxaNOqjVUw8A6Swuk8MPDVITuM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Raa525zMnJS/r9qwT+FG4FH7p/2ecBceX+1fMSF5
 feuhew/3VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEAv8xMjSUXVyxZ7uixJnX
 YgUTf0if+PYmbwaXxuFNHqoeua3y8fkM/2M+/Ld89F1Hxzyt1aThga0O43ShJKVrPI/Xnd1dkHL
 +EAMA
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
2.51.0

