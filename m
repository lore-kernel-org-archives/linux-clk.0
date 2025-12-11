Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87462D5A19
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495070; cv=none; b=up9GRecvXjhWraE7Q8zZeXfiM/d37STHoqTGuZQMTflf75sV1XhcSXi6INNyOuXQE8nJvNHgOgBfRi+nPeuaOdyz8clTzEV6N187HDsByVRps+j2jQmMHPbd4YNtbqmXufG4nVXUi57m9P4uZympXmT89jcfBU+ZSFl3dnPGFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495070; c=relaxed/simple;
	bh=NfOJan9Myaz8PWi/tdBEvmDwiM4IlBdU+UqmIR/UHpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgrO6GgZG4vOX7TTZxxc6YTYW7Kd4bnEBi58mccY3s0eQpbClzkatqE0nw9P7LZtHtAn7/63NC4PLJVgPFH1gy3xF4GX8DigNXbkA4ruAhxKSQdxYBS5O0WHt9OD6NQR0QEdCA+iDrYLj4P8FI4zDYi7Pe4PBulcWm1QJ2pfPSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhaceyLH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F1QKmuuB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhaceyLH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F1QKmuuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
	b=hhaceyLHy3stJCFI7CcSacWw1PbY3PKzmEyCv0Qpar9n3wKostRdSZwIh0Q0hVceIUX8+2
	5yZJnmrV7iLgLx2AHJFQ7Y8Rq/vsoOSM2WUk08vNPbwjL/6jInJ7M9mGjOT+RzifocUn9Y
	MWw7P8FY3GdQ6SwZBzvjA00aAYWdpc0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-Cm055mICMyy6tFxn9OLU7g-1; Thu, 11 Dec 2025 18:17:45 -0500
X-MC-Unique: Cm055mICMyy6tFxn9OLU7g-1
X-Mimecast-MFC-AGG-ID: Cm055mICMyy6tFxn9OLU7g_1765495065
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb3388703dso49217685a.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495065; x=1766099865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
        b=F1QKmuuBiD+kWHCrPIMgtLAYsiXEd90MFmdWeuGUDpV12Md3s6sLniJ10iXD8+zRoD
         3lquNpV9CsOJQdfdfmfIYe1kbuzlnmebizvPVnL0lSU6xszwxF8YOg0tSeT71Z5+g0I5
         XJlt/TNICWy04bkg/ccWz2iZ0nmgNCqSbUTjyMLB+fJr5Btjdxw3uguigaZk01cyzevu
         QuW8Mqg65D02Ao+EK/uuze6FTCuyMsf7VnBk2K/tmjICdEslsaZqABZPkMlPiZ9lY9Wg
         m826XqAV94bbH1qGFgafXJ2KynPpo80ykheqmak28DsiY6PY1mJT0YAhHrFxacIbZJ26
         cQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495065; x=1766099865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
        b=kyRaobJzz7lgVF3zZFNyY6KqbsrxJe3S1xKPSrsxaUuzZQ3jABO0YIhtRARSyOZYvg
         eDv+5mK1dsl3EzkA+xVwkbUa+wS3r4jnWbyf/QEegGuZxTsUCqaprdj2Qhg3ZxQ3HZ/Y
         dPOMxHoowrkU3RRL9L/SZx/Z+B/nAbgH3ihVVFlySjpaLYeabJRQ+YmhuO4EHPeV65KI
         p7GFZAyy3E5aRyFr+ANcAkbZ7+RNjVmGRdHLCH0jlWfm4zCJBh3jfa/lmSZ42SF2y2sn
         bO6MEmb1OOxHchI+JzF9Vz0Ei1BqRadbAAvKlJy8L3EgSOEtngt+t2WgCXa/iiWv43OL
         eYJA==
X-Gm-Message-State: AOJu0YyIhzm9l40FLxLCvcqrt3juZz6oPAfrX3+UiAK0p3klEefhq3Lj
	vS0Fr9+jnmSfAGsX75KuWbHtcOZfd0i7Rvug+RDYiBgSFyN6sGZtrI1/oT5Po1e+YHgFDJC3Z/r
	MrsJGciqGSS+K4yaYphhVTY2HXnId7aIwi+wetg3kWnoBSvTHyjBIRgn3pSKKNQ==
X-Gm-Gg: AY/fxX6EZay466rd8LYaLRa7W3x5dd9uKAL78bX07bwzAy6Dk6QdcbL3TN9gekyAMEA
	BxEgESP50fVg+yS8tHBkZkwCSDvNCvurQ+IqdflKhqceysQlRsZRUo+pyRHJ1WREDzzCivIBUbD
	vEmHZ3kAB35B+4iAWUQ+EhXtrUbhcF3LUhVqbWxKoPvHmBYGaoqtie5nYCdvrmJrmAqvswPTk4m
	kFGtzewUSCBptOXmbBSo3alUS+FDJvJXjZtwELZcYLFjPNfeSiL6Fmb0Dbt68GQzQk/tA793+60
	SMBdFUz9DlvcAhhClwdPTEPtjdZnbcxYCW0uxnsQFUA486AO14neCG/M8UQ6dB0ahfg3lUq40oZ
	WCVbRmc1Hx172kPj6nf7lJJvAjwtPcJynFpe4tUcEOncDoyXCWI5qBg==
X-Received: by 2002:a05:620a:4416:b0:89e:c659:3f99 with SMTP id af79cd13be357-8bb398d703bmr36052085a.6.1765495065281;
        Thu, 11 Dec 2025 15:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLYKRP7lHhgawU3OEaYHk6OghheRQMM/cwXxtpO8QhTtXeryEcvWYjXWc+lMjIJt9Bnf4lfQ==
X-Received: by 2002:a05:620a:4416:b0:89e:c659:3f99 with SMTP id af79cd13be357-8bb398d703bmr36048785a.6.1765495064870;
        Thu, 11 Dec 2025 15:17:44 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:44 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:27 +0900
Subject: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=NfOJan9Myaz8PWi/tdBEvmDwiM4IlBdU+UqmIR/UHpw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy71PRfV83r1eE1XcMbr4193OXztck+aIzTF0fIwx
 8OmyOXFHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkcBnDT8bgg94/bv76LP98
 asNWnk3r2i7mlX2fL39CbHOvzuf29BCGP/wVmU95Y0IeCWi+VV+bOlm/YtKFpXbSLZp8AR0a0lV
 hPAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index a8b440c6c46bb0c754845655f9c2c0ba6b435b8d..cbc98d4dec74560e6403fb899ebe2bb916440f45 100644
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
2.52.0

