Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DEE2F0029
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164884; cv=none; b=ojR78mN/6t5X6Hm8D3dBcY6TTPG2CKp8qh/kbFLC4qPjioYVuKYBLCZ9hRGySz6CUHQFH1jz7lHXAJ8EQXjnW9IWcH0cJCP/fKPXRsYdfAuvOid8QDjETv93a8haxNMYqOlQdeGGs1wcJGtPxV+58pg64JjsGHf3i3qsmk5Jwwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164884; c=relaxed/simple;
	bh=fHdUScMRQgFwOqdE7Tmgso+w2DIolpqysA/pehYb1fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUcJvo4ITVP1LY+6m0wLr4K7kP+hRQjiXbDXYTjKFF3keB/R9+8h4Q2QZpZSMxRWVBb2hUr9EJAtxLfIFNUxYja+zrsCO3xZ3h9+EkkrMfhpamiEIFWAruHVZDzAlgBpkNsL+MzC90jUeXwwi5H4gb7pHC0YGpyE4cNDq5BrW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h18WQlFe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h18WQlFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
	b=h18WQlFe5UUL/UN9iSZPBMR2TMCNDRfczaZPj4jAe9HLabWcLAS4UFl7TMmCMuzpVhoBVN
	cfnK0VtDATeG6z3MefBANIqwZvsY4LjEeOFvccwRJamVE4Ax+9StTNCC4P/GHx6nMEzH4a
	BC7U64JhjBhj7w8Emi5B1xIj7R6N5FA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-vX_y6yZNM12YjN04-icAcg-1; Thu, 10 Jul 2025 12:28:00 -0400
X-MC-Unique: vX_y6yZNM12YjN04-icAcg-1
X-Mimecast-MFC-AGG-ID: vX_y6yZNM12YjN04-icAcg_1752164879
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d460764849so394324585a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164879; x=1752769679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
        b=GUySfDUfyiMwuGk41rkwPqzgDLUT4iCf29YbXc5dLLunFFV1l3pGBjPVOkrJ3VNO5x
         RWbV9oxpYeaJDQ3LeF4yPliDnXJuLr1rLdcXiH08e3GHAiNuIaCrQBd+ypNMj0QgDdvX
         yaR0DjjHTZfYRqN8wxqkKGEY/xdC6y4W66WTp8dCPtItVPGAsB2ZE5G2uC33spDu2FGy
         ZAnKeQ1PFOcIiw6wqUO6JAfVpQSpv7YZx5HviWAMEQi4QXi9tcQTU9vbUdm+H79lnE2O
         XwikSvE6CWbkmq9rKKvMgcdfnCySHZcbZ6uliWrWYTPEJUYCQGAIj3KMDUUgyOeWsV/T
         fkqg==
X-Gm-Message-State: AOJu0YzFXYwnNnoJJeTl5OwOggxjjhl8vEyXQiNSnjZ9ZlSLVEJI30UH
	vA693wJOvDbL/sqqRUA/F6JAokqm9cR/GWvurBgGJxflRNrFoycMbsxtvyuNHdTxSwhGyymfXLW
	uZ2Xui6bUeD9THRKs91hlTFV98XVJfVfxkM9BCjrRKRQcsmKCAxImZ5vYT05EoQ==
X-Gm-Gg: ASbGncsy0iArv5dCkugUeYCOKDpnxZ9jl292zj2X1s5J5XSZsOslFZoGWi/unDjrtup
	uDBTmVcuzFeu/fQFgi+crBjAOLi7hPAaBhgsGVS+G4fPOdzhgIe3uI6OIq5aqAOZhcpcdmjPK6e
	+UMGea29p227Egzz1wwTeyp+Q5urSxpuFHumPq9Jl3ZhaVnGkvVxEPNKPVuVeyFCgwTCzxkCRjU
	2R9n8gPvcjtQcdAeD698/N3N7a+5XbqWT7Mijj1JulUBhTIbcOULozpkhLKXCnqCHhlDTlKBkhD
	ihFSsrNQrYap5SFf93R478r2jloUxAKM+otjga9YKs5QBHzODPXwAggZGjhV
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7dc998bae5cmr548837685a.21.1752164879314;
        Thu, 10 Jul 2025 09:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkhR4yI/meVA7B4yGGlSkWsy9sNAiu5N3YSBwGR+IQy1ADhUxQ0QJAqnJLJknz5+tK3xy+vA==
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7dc998bae5cmr548832785a.21.1752164878821;
        Thu, 10 Jul 2025 09:27:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:31 -0400
Subject: [PATCH 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-5-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1798;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fHdUScMRQgFwOqdE7Tmgso+w2DIolpqysA/pehYb1fc=;
 b=+3BZqcT2g8BzgtT08Ofg1fLcRnpWlgjhSzHJ0bgUn4yuktzceZYntu7KHdODtXiXiNcU928l7
 zP16Ptox34vCfs3DTh/Se8N38Ou8pARiNhSmor1jXf2v9OU+tuAkQxY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..eecc4e2ed51547709f9643c52eb2468f17966de8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,21 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
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
+	if (req->rate < pll_7nm->phy->cfg->min_pll_rate)
+		req->rate = pll_7nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_7nm->phy->cfg->max_pll_rate)
+		req->rate = pll_7nm->phy->cfg->max_pll_rate;
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
2.50.0

