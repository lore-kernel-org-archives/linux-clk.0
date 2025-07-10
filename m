Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE132F0E25
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164875; cv=none; b=mKx0CK4WkIGuDLkp+9FOltoA+KWtetsga0HEFaspT0Scvs8uLwr/yBwbzHzUz5i4GGuwVIfZT01GOhhMlgU1EySd943FqAEuQoWHAUh25Fm0Nmsh1VmSVopA6A3qweGzRbvLwrhNiR6ok6nqs6xSckotYmlzDIdTtpCQw8RhAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164875; c=relaxed/simple;
	bh=nqAod6ptbkqWsY1ReyritvzpOhyiZE8UL5uK1TlylSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZspUjQfqhxxVu9Qk8GHx/GTLHROiYjjIOksSTm+fpChyZNXqMcNROri/cNvIVnitS+RzH47qeb/B8ZFcrtezB+gUjnhMkksihhLXtrPT1lktpm68yhj0grvs9E9CORoLqgWrD5hJNja4adwsBn+ohoiL+5w+6qmnSV1N9jAU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GYMo8y91; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GYMo8y91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5R3syR4S85etmH81khP1EmeTBgeUTYs1zijTxbmA/kg=;
	b=GYMo8y91X/8JpzsTHmBwXm3AAAUEFIe4zgxNZJ0/K0mZvIjHH5t9lvvdzwgQyUCt656for
	1lMcyaLcj1VkgoNEYYW+0HfIRhQI86A369eCBZxVpapOl8EWx4c9EzVYiG6q4FhVRgz2Sx
	Wg+xTX0GULfXk0971vqT9W55rQ4oCj4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-_9Bd_3qiNdqRReeJTheagg-1; Thu, 10 Jul 2025 12:27:51 -0400
X-MC-Unique: _9Bd_3qiNdqRReeJTheagg-1
X-Mimecast-MFC-AGG-ID: _9Bd_3qiNdqRReeJTheagg_1752164871
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d45e0dbee2so192386385a.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164871; x=1752769671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5R3syR4S85etmH81khP1EmeTBgeUTYs1zijTxbmA/kg=;
        b=ogVRCtu2S/3kxsLHhPbiBTnkvCz/HOOVB518opQtnjGPOHeAnPBMh8lVYeSPubXuBE
         ZfCpShCWcWoh0WCV0OHYTRqu5y1vZLgW+qiY/3Ll7DyK11fgoRfj/L50u6/6ygWc1exs
         UJP/Lom7ey6aWcfSTbsPpJGrHHfy80aZfa93K//KXkCTA4tqvLxgSXmrSPqFkou2yibo
         waVYy+tZN+vBH+nMq2H9255z9A4spxv/fREdIOmtnt0rbDTDVV24b32RTWZwBRQxkeQN
         WcHq2ttxJweCXdbecfpYpUn+2cxqICpEb/BkB4VGMzmmXBOEXV28TznCvKQ0sCASlnLy
         sssQ==
X-Gm-Message-State: AOJu0YwZ/GYAPYTycuXPQ+A6Cd0B/LffoObvFgFGMRPesxD9kYcjyWK7
	2c8I3WduYs5Kqn0JOoRoJi0Suk8AYH2jmkWO2UBUYhz6VTNWTnNzialwni3qemOPW1HXWeGldEz
	VWrY5JN3ee7YML2zgFvuz7YoN9uXKcJIf16sroLx/iSWnOo5K6Uf8dc3DHiFibg==
X-Gm-Gg: ASbGnctjd3kAKfD4wwFORURuNSRc6gP8IOxvuWc+55LvhI3w+ciWPdLuhUxPnfWEUdd
	Z6R/ApRnTHZhUytVGIeqlpnVd/ILqq34jPgYvpXkCaztiOXy+/BFxp9ZfTRDhY+pJ1dpVcJCYZx
	zoBsCZZgXK3TPqxywBQx+9SK41BKMFskNm35HtGyzntRxGvg/sRRkNyxCVkmXcileBuyvTIhSyx
	FkIY5oqClpc7pZmE9OuZ41g/ZkRLJgZXlVJoV4Xm0dMdGvrL2z7VLQHxkrFHuOTwkrTPk8GeUzI
	FXWL++DJgWGgVipwDPy6HqSntsZvGUk+EO8hurk9i79PJFiJ/jAQwss2Gi0q
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id af79cd13be357-7dded1f16b8mr20792585a.43.1752164871213;
        Thu, 10 Jul 2025 09:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOyyYlCkE/VGPozckcGjQXSedTTbkLOtyXFJPCLzGJ2sRyA8bY8gLQAjWSxObzTseQLmP6BQ==
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id af79cd13be357-7dded1f16b8mr20785785a.43.1752164870612;
        Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:28 -0400
Subject: [PATCH 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-2-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=3196;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nqAod6ptbkqWsY1ReyritvzpOhyiZE8UL5uK1TlylSY=;
 b=OoNhhsZUbmAMdwPUtra7QULaHqehIf0/38bmAqXxUkaMeC3doTAw/V/9TIJKb+x9w7DYvOig4
 Gf4oVrvhKVRAcfxi2pcc58T03+pEYH6XMrMX4bp1bgSK7BzZMg4R1Tf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 36 ++++++++++++++++--------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..4bc9b7e44ce775f676fc89cf4565adeb309f0177 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,21 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	pll_14nm->phy->pll_on = false;
 }
 
-static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_14nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
 
-	if      (rate < pll_14nm->phy->cfg->min_pll_rate)
-		return  pll_14nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_14nm->phy->cfg->max_pll_rate)
-		return  pll_14nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_14nm->phy->cfg->min_pll_rate)
+		req->rate = pll_14nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_14nm->phy->cfg->max_pll_rate)
+		req->rate = pll_14nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +622,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 				   postdiv->flags, width);
 }
 
-static long dsi_pll_14nm_postdiv_round_rate(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long *prate)
+static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	return divider_round_rate(hw, rate, prate, NULL,
-				  postdiv->width,
-				  postdiv->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL,
+				       postdiv->width,
+				       postdiv->flags);
+
+	return 0;
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -680,7 +682,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.0

