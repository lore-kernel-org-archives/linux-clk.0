Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18302D5C9F
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866687; cv=none; b=qU5pARhhKbcIMTS6eiXML5Q4ir4wZU9/MUABluSjPV4zyuZ8wtqaCAi3MNdO7AMYi+rsTS919mhj7Db2SLmxPugBOP5g4CraoRxoubLMtrufZ90GCKOftpw5uxC2biRmt6YoT+PLCLWKs4Uci4jl4NOeAwUmGK2G+FxIV37wFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866687; c=relaxed/simple;
	bh=TCVYIFivGNX+30I7CcW+hQ/ILyWbQUzfCulxzbwFiso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U735R8E75IAmdNOiejUPilHAisdL7JepAt8qU/ySxEhEaq0uINnEGdf7VbX1alQ5mx2rkKhgY+ZVFTyrFMZdRX2A8NsdxYmnFLcU0k1z1FXtADQBs+sOzxYaUs5feSLONrD/MuwC9fqOLcpxkWn5Se5f/S5tYdfxXF6eQRiWsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjTmiGNL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjTmiGNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
	b=RjTmiGNL2tjpiJzMXUy9oCYJ0aLb3y2RWfg/bbkUHb++BM9eO6h+IMwwhbDrFwaqLc4lUJ
	ENh11W+/GmLhEvd7WEf39j4Ke9cFhCGaAcALSdqQX4NC5/wvOngKisFysRgXf/khw/X3SO
	d9hC6S5C5WOwC++nfIQwpBAT4E8Jp+U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-6B_hedzINeKAp-qmz0_W1w-1; Sun, 10 Aug 2025 18:58:04 -0400
X-MC-Unique: 6B_hedzINeKAp-qmz0_W1w-1
X-Mimecast-MFC-AGG-ID: 6B_hedzINeKAp-qmz0_W1w_1754866683
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073cd24febso38312426d6.0
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866683; x=1755471483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
        b=aRCZ7MKbH2WJv8WNP+M47aE1m+4oFNObNa+ZJIovjuevqu7QZ0737HzQ9f9sHnhOGI
         HcDEJdsTkzqtheDJDrQpekCHsMeTK8OwgiCMArpSmXmmjhkCmjWj+3u4IwJFiUv5+Nyu
         Rz1O4JVgXA99078cUJHZ6MjLx2xqzyC2GIn0MO0EUBNf/ycgsvg8NiYPfDWh5nuq+XpF
         aNFFqze3R7Ldnc4QCB5wZsfeDAnFrBjGVEJdq6qkUmLYDC4hnKqW3j0l9BG9NpGYrCgq
         T1aV6Z3UloxhPsY1xImVpGo5WtyOqibCPYL+GZRerYlfp0xIRyVWaOLU4Xlsq2TJlHKw
         3e+w==
X-Gm-Message-State: AOJu0Yw/1A/VKzJvjgHVhZm903w5eaG7dd71UP+SdDKXbyNVrBcScM2a
	vPDhoj8ULUKpm4YcmgoMoip3uhunldaoJFbNT4tUbI1Dx8EMggSyLmwUhIRcznOwIww4cjw/Gas
	x+Pjp4XEJhK8BjDIUi3UtWqFI6mzYv+COvm3E1fZUZC94NcRnG3TMOzrFbwUbPg==
X-Gm-Gg: ASbGnctxL247giyk4af7I8h/I65Hq5+ldb0rbKogKvlcL2u3V9Yek1hle9r27oh6kFO
	svvNMJ9jG0vZyKU8UR8Ncb1vm2kmE3N2r+5ZavtMP5c/dhsovIuBf4AtdB8TeTeaUGAY6zhUkWv
	nkdhLDS65aN12C3XCuhdqk6G8OYxLec+Kf2kpemkgv5zNc9YB/7eJ781eZ/UxvbKYonM5HPUdaF
	VtLtydO9nGbuj1GxnMNtR4YVJdzfiLUC2p+xFOUeuisKK+RGv+sl95XqWfWtNLspQUE/66WxyFC
	Q4QZv2/6s411WR74LQF9T1jmuo+FYxoiTLZb1VADhTMBW9VOPcAAM/mpKlGkPBAY7dLWq5R3d1N
	MtqhFog==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id 6a1803df08f44-709ade97506mr71682696d6.43.1754866683140;
        Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkOu59xQUnrcN/f1twSlF1BrFwL5WoLAQ12FYDXq2PWIP1hHCC8VcITCPbW5zGS+dtgeykrQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id 6a1803df08f44-709ade97506mr71682586d6.43.1754866682705;
        Sun, 10 Aug 2025 15:58:02 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:58:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:29 -0400
Subject: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1762;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=TCVYIFivGNX+30I7CcW+hQ/ILyWbQUzfCulxzbwFiso=;
 b=hYrBk5VBcqe8AFaw5M0JbEMNQ/+5/EqgXMuDpqvpMtHJTmo1+Ev+Hog1C/ZssRnCSzPfMgO4W
 91f5Z5fMemWBs805qoxKufqYrIgn1TJu66F/ixECjawgTEoSUzz+mJo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..c3bd3f89434eb7d3d0f3bb9455d22aa00915e797 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,19 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_7nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_7nm_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	if      (rate < pll_7nm->phy->cfg->min_pll_rate)
-		return  pll_7nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_7nm->phy->cfg->max_pll_rate)
-		return  pll_7nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_7nm->phy->cfg->min_pll_rate, pll_7nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
-	.round_rate = dsi_pll_7nm_clk_round_rate,
+	.determine_rate = dsi_pll_7nm_clk_determine_rate,
 	.set_rate = dsi_pll_7nm_vco_set_rate,
 	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
 	.prepare = dsi_pll_7nm_vco_prepare,

-- 
2.50.1

