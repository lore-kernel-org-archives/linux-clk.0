Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2B2F0E3D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163717; cv=none; b=LIpBsAYnrFzQ/eeMjAfNAtKs52XefCs3xK1r0ydS1jUqO71RTttPTfDntNgGgna1HrzCYgd9lbe+GhHhnMJAGdhvRydHtirGBVF6i/aSOF5eb8BUEduspoXoEBKcMbhfBROiG5kjSdqVVvIyxHgNlhRKUKyWyFMVo90ATTRskR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163717; c=relaxed/simple;
	bh=pMJI6s5tTYu1BzJU7vvw5Y0iwaNTd3NH6yMHjsN8/cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aggub5QRyWa1JrR/DWoDJgyHBKHZd/EWezqQFoC+wjPpN3iJmMk8ge2tOK5aWjltjtIiBpWlLLOMli9r3mHgna1jP2dw3my5fzZN4Zvl62WVFzjuLPrJy7JVC2d04e3UzgivhMjPna1caM2vJbXQtlmfygZpFXz25fZCtrm70t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdlOJHnU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdlOJHnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
	b=VdlOJHnUZkTtNrDc25UOMa2zxqTSmYzR0PCSGFFDEO+hqX8EhSBvcX7u3gdVhS70+vYXVO
	OVxNrkIO0IR4oDPOS1Bbi1Fc0ex5tfYzdu2Dx2JXIwCUyvGPxG/68FR22NF8jG18oZwlcD
	PpGsbm/rIN71HLm6u/fb1jzlErC/7gc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-MS_xI66_NU2gfK6M4Zu0GA-1; Thu, 10 Jul 2025 12:08:32 -0400
X-MC-Unique: MS_xI66_NU2gfK6M4Zu0GA-1
X-Mimecast-MFC-AGG-ID: MS_xI66_NU2gfK6M4Zu0GA_1752163711
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ff810877aaso26395906d6.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163711; x=1752768511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTOJwZJsmHoGcZ8h71+3z1fiOauF+CUgacJvRTAcORU=;
        b=aZ8FBGPYFkL86AtOFZ9gsdPlmwZJ0TZMm0TlZIvQYGisVeTttvczvXU2ueSgzEasDb
         ivdsr6OD8WNbBi1xGXoPnF8xL1FN9FmfzEWBixxnN7u65rlU/Ks8coM6yEALGBbGmDvg
         RwmguCuXlhp5q5Jvot1uPP//gXUF+qORENfPFJvwZCv/MyGTXuyFqCUmZgXLSBSSGQQJ
         tC/SwL1SWwl1AsfRAby/m2sDwDSP+2pkvLl0f/z/bm0glUMNjQHRxI4r87yiyw7XESXC
         kS513QZSTiNh6VrpfCEgfHEEm09/jhC2Y1dq2k7VqPZu6mb0/gIxCXGNjIqtnE+XQDQj
         3ULA==
X-Gm-Message-State: AOJu0YzMzEINUF1e+AGdQLGwdqOSMlTFmG0nMcf6Z+sdLkiUOjGBwky1
	B0VoIouttldocD5HCWQXdHwLk2xBgzR9ngMtqUpn/isLWu7bk2VNAjRQKxQGqCQEyp5Ni0cg4xu
	M/GGluA1WpMDUijIZuZ13QOFkhj55YK0waYJRM40dCtRtc5FsGH4ar16V6pbRRw==
X-Gm-Gg: ASbGnctWNGamX4lkycqJyvn/lxSsdc9NOzn4w8AcP9qQQlgtTozFWzHBi1rRh7XBOER
	Nv9fJnt5+cYeuFUxPBpPrPrcHWF2tHkLwGVzX79cIqfBRIP3ev3AjYKSWgGx5DEH8o+nQZRen8o
	5y88CkEmb+ufXceQf7vVIOJTxdQex/vpVxpE1tQij7FiYt451vYT3QEZpWGpMyIdk2XRdYKUenU
	Qff6I/N8oUqibqfOazcc6BpbF/2yQdLDvEhaH989Omea49n7xHN1auS0q0aV33yeQgZrH49iGki
	YXObV2NkCfS+ASRRR/vjj2JimVCh+ahVEUZc/TomXZjXXcnz5AKPwxsm7PE+
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id 6a1803df08f44-704981edb41mr38252366d6.33.1752163711121;
        Thu, 10 Jul 2025 09:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlqOGrQN8krksQLxHGl7XCXnHCMvXuYKuTeyW1zhM5hweEhYitnN6UMrP83jETXzN/T64C2g==
X-Received: by 2002:a05:6214:468f:b0:704:885e:bebf with SMTP id 6a1803df08f44-704981edb41mr38251666d6.33.1752163710538;
        Thu, 10 Jul 2025 09:08:30 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:19 -0400
Subject: [PATCH 9/9] phy: ti: phy-j721e-wiz: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-9-0ff274055e42@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1629;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=pMJI6s5tTYu1BzJU7vvw5Y0iwaNTd3NH6yMHjsN8/cM=;
 b=0nPrE2c6cl5ohekNJUp1MPpsItdutqAcWnGrmBosgKM0YvNyBYPz4zo1bZfpAq6S3ivaSbkgi
 TWd7oICIP84Cvj784x11Hev/+JYsi8/Mx0kVOHPtXnwdacpkl9MVEHt
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index ab2a4f2c0a5bf3aa4b77045f4da8b0ddcc079f7a..12dafb2bd49bc33c13dd49246bc26df082e3dd40 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.50.0

