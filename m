Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82E2F0C5E
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163707; cv=none; b=sUXH8/YgwV6ncnYe3hydD7xWHqJ8mQijw7KOVZzqNQG59SPpUzJExEHwR1C0cfE5aUsPLMeMcGUGbKTrRbWw+CcYv7bO8oxBQrHz2S7dJVgucBZsncEUhMrORiCyQ0QYhx/sHh9kzTyOz3hO42uu+zctwcLSmYMi1UALl9kDGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163707; c=relaxed/simple;
	bh=ZKlsIvlM5HHyda796a+VTO47/qeucu/BCMXwHXG/S40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVIja0o9uSgSgfvPyDKvOPCX8p3k9fRqRWhFgfc+BjsIQO5i7x6aJ6ZnSt2oDHLLsjK1fqpkdX0NAv1SXlpGn3xAnCf0F/zDcQL47kYKLlq+GR3kY8pcs5AcjYTeXQsOHprfsR/WEHrWFGQnp5+DRQekJwzA2e6cIys/LA5BsQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mz7duTc/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mz7duTc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
	b=Mz7duTc/s2VgEY5xR95Ic+GAlYvyBxKyfOh7VEzaKGULzP/SbIePxexbqQWI+NyAz5iqSP
	+ERRBjif4hiKoWlDfa1QQDP6gIxDXryhLnWcxJ49PqbWtt/LfGLXgvKbf1qoIRXJYsf1tD
	LDxiGacK1csstZkG4lmVG2ks1HB2tm4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-VeXyfXPpNc2yDHEkAZHtiw-1; Thu, 10 Jul 2025 12:08:23 -0400
X-MC-Unique: VeXyfXPpNc2yDHEkAZHtiw-1
X-Mimecast-MFC-AGG-ID: VeXyfXPpNc2yDHEkAZHtiw_1752163703
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so194697985a.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163703; x=1752768503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g80E3oSz/omJ6RwmtY0/wAHZ8ite3UzHVCEfpHhebcI=;
        b=sxJgfCDnvV1N6RAAa1ZAGkJJpGg5/jhuxMHOQovgbuanB88uMTlGdfhYENLKnI4vyF
         HnRPA5667sHydUkTc0O6jBKPlHuzb1X0mHg4SUaba1JUPU2gb3H9oiH74mRJpvx3dZyq
         9ULx28hc7mQQ1U8hwhiUnw2D1R/VMM4P44KH8FUq2WzszRa/BN5Auujeo/dSEqnUmnLs
         aipfsIDYAUDetHLSEORZxp4SMmlpj3+OIXA/ypWmpHLBxouhn6gE0ZJk3ZWeLRplXM4B
         wxrNcWCzFmACTXfrCOa5ht8RK1J8kl26MmynaLkX1oxVlgGvxXYFmQcwCJwNYaTPtzJo
         Z1zA==
X-Gm-Message-State: AOJu0YxQsOMlc1d9fHpZbzUtc8r5DKNQxNgQ8C8wG/2ESYtCrwy5sIqA
	+GHWrbVYgnSENvI7d6tTeRyx+ACCcuXdlrmw/J3dIyqFWc5++YVjfqifannDX9aphRjwYCJA893
	sRIjv1IKNKr1lbsatg37WQ58IUNoX1tQJfE6eybz+FCPEcwFzi17k7dl+vZRGiA==
X-Gm-Gg: ASbGncsBGdIQFxHIEw4mSYsKJ85GAOJFqFvcIPfBPW3kh3MzRsDOaQh81iPYvwDjOJz
	tXXr/HSnQ8MtnpBylZfu2gfBjx2LnOR17OXhS7icFyLXm6GZSoQ9YcdodGVNswJjUHR9CY8xrit
	Wmi8NxTLzftOjVxrC18HXzlWVcgB/sCfiq9m/GgZlGFh7p+VXWjXsRLxktVwy9TEebEcNSLAhzM
	ym1xCYUhBddrelraj1PTw0WVIY4pTfbngvgbrZ+x2hNiXy7s4YaA6PVf6HaqSmkvI33oigUijLO
	/XVlmZqy9N3b3ds6DHQSCT/WsCacg3UoJ8nHS6RcIsC33fBGManALz3lLEm3
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id 6a1803df08f44-704980653a9mr39030206d6.12.1752163703053;
        Thu, 10 Jul 2025 09:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdCZQ7W3y8kThWl4w+CnUCECNX6Cyj79KFh3PeC/HpUcHl6P8QBnf3iscE4pNrdpapav2INA==
X-Received: by 2002:ad4:596a:0:b0:704:761c:d021 with SMTP id 6a1803df08f44-704980653a9mr39029866d6.12.1752163702588;
        Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:16 -0400
Subject: [PATCH 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-6-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1507;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ZKlsIvlM5HHyda796a+VTO47/qeucu/BCMXwHXG/S40=;
 b=+r3EuMe/pzh9qF2oPdX67HS2VmnZ350abewNM1edJtWvBPtHINXt26quhidSdRFg7SeVLEzsu
 YVJmnDogbgKAaAbXcN1nbXJrSBi27Fk+BJ7qXWfiPpZHj+x2CtpRepu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.50.0

