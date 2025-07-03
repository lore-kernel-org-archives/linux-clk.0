Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D02E11C9
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585009; cv=none; b=dBKaZlSXCaAHH2br0aMDGgxltrR9s4H4j0u6W6+zRAc50Ui+9AUyXDi5mRUFbUeLEc29A0nB5v70LY96mfC8uq+kBSXoqg2B0hc+cBZgKBI6soxNA2QOe2+yNBg28LhD5685HSbl1MFU3JsRXVLpIHZpxwNByS5qajKyQUxtakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585009; c=relaxed/simple;
	bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaFMwBv9JIpfjsWNSKtil0RSqf0AW+G+wZu8LxAuoolIEzQjmklryEf8wI1Zhzl4oQMeEVRY0kUyKAdm9K6kOuG89Dp7ZxnuicpDCzw1phCFbJ7coRDD8Mn8R8ilTx+oPpUxO/9L3MSWF9gp/u7NnZJhmJEC6wX+/UFwHsKz7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgRWBlL9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgRWBlL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
	b=HgRWBlL9BhglwFuxNhGyQLnYwojLJWAC5CtX4FTQDXWZHtcBJKHT6Cet8Yw95mdWrpeVfs
	oAgKXrBSIbCvTefY/iDxD6IRJKzO0moqkQrONMk4MZx3rOkNmt/w134UVgUWrCS5cSob4q
	xHGuXOH3LH0S04rsGKXzvufpxCVqBsQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-_NbZdO6iMJuzOVN5G1USnQ-1; Thu, 03 Jul 2025 19:23:25 -0400
X-MC-Unique: _NbZdO6iMJuzOVN5G1USnQ-1
X-Mimecast-MFC-AGG-ID: _NbZdO6iMJuzOVN5G1USnQ_1751585005
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faca0f2677so8523316d6.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 16:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585005; x=1752189805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLJPkvu+exBJdImF9hJf2W6Rmq4JjRca1LT16iZ+xSg=;
        b=bOPne32mzZDQG9tCxmlamEH1wufh2Dg6GGhtqyVLsWSo3gYnj5U813XxY4UqQ2D5Kq
         bhfQJc0tPyhaRswPPBSj0/jG2MsgDhMbbP2xTxQbnNh92FYrfTZQwI64wFWDcXR3Kkjh
         QKZ2FtuukcYBFtP3auv8T0JHRZoeY7amtQ4bbiHn/jOfdm46vZunQp4smqP2ZThiGyrJ
         smU7tItQsG+Nai0lNaL5oSJ2erm2zJIsMLoJAQDvnBPwVS5iXeRDhfJUfT34Zrt5xlLw
         ZyHbER3YAbhuWqfXTjB7bY8pLnvblP1x5lbiKwRymShh7QDkgMba1qSLpFJxiJ36ohO+
         TpRg==
X-Gm-Message-State: AOJu0YytePjEMtfVj55YP2GomUurlyCOVndlclj6i1njyyvdt7e0otAT
	fnLx7DPdgogoJrt3GX58BNFBjtIVVnRInydYixOPd2tFt5ZJSvFeZ40GzG3maVR0mLFVbhb/wBN
	y5IYPnbp1cp87jMrnLAmVUWXNXHrLUrLISpXtS562LSCEAzR5NU0YK1mc3rj7Lw==
X-Gm-Gg: ASbGnctp96bPKw3BpXrTia7ssASgdDzHqMXfcPvJO6cw9aXMhJ+aLyPNAOb1mlRJFHQ
	2Pl8gjB/L8TEB9/FEy5CnCnseHp0kLf4umMbKGnQxone0AcSJgl79iZDOi+c9UUd6mKpR99fvKa
	aoKmSdXF/rT67608rwtPjBvUdkN9fQmsAQLvEL/RyDPnireYyEJ37GElc7cLSkdYZMwxGSG47OD
	VPKwqR9RUl9fkyF1gApxdjbAvHSabrMiwcYVG7i94Pilza+lD594Y/COm3+GPV5vK+02zx3dkGp
	ixFW+e98iL4h59H7EsiufCIgwPSEbU1jVjUKCuY7YoMlJR+qt+eFDrPKxPxoUQ==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312876d6.30.1751585004843;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZUTcv/RXxDRv5oOXWGYLGuMzoJgJUUqtfCFBZdCd61PSDSlgd+Ecfdnm9HkmgohROAdoaIQ==
X-Received: by 2002:a05:6214:5016:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-702c6dd28f5mr2312506d6.30.1751585004446;
        Thu, 03 Jul 2025 16:23:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:32 -0400
Subject: [PATCH 08/10] clk: sunxi-ng: ccu_nk: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1938;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=btToz2S3ADP3ZxZpciNSy/MUe5vuMQa0nAdFifjfxYg=;
 b=d2ZMlN6C58BBAH6QeN6ACobOCoE2MjYgmAG9txbKa5xDhf1dkWNsPCaDoFCNoKlsbitIMf4tY
 rlssfLZk/Y8AJ4/97xBA/IKkdc92QGnzsPYwRqblNmN4ZVeb/pGltBT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nk.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 555e99de2cc6ee0c84ccaaac9ee83be2d88741a0..5db748fbb5bd9399a2d551c8821a4bb17ded005a 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -92,26 +92,26 @@ static unsigned long ccu_nk_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nk_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nk_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nk *nk = hw_to_ccu_nk(hw);
 	struct _ccu_nk _nk;
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nk->fixed_post_div;
+		req->rate *= nk->fixed_post_div;
 
 	_nk.min_n = nk->n.min ?: 1;
 	_nk.max_n = nk->n.max ?: 1 << nk->n.width;
 	_nk.min_k = nk->k.min ?: 1;
 	_nk.max_k = nk->k.max ?: 1 << nk->k.width;
 
-	rate = ccu_nk_find_best(*parent_rate, rate, &_nk);
+	req->rate = ccu_nk_find_best(req->best_parent_rate, req->rate, &_nk);
 
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nk->fixed_post_div;
+		req->rate = req->rate / nk->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +155,7 @@ const struct clk_ops ccu_nk_ops = {
 	.is_enabled	= ccu_nk_is_enabled,
 
 	.recalc_rate	= ccu_nk_recalc_rate,
-	.round_rate	= ccu_nk_round_rate,
+	.determine_rate = ccu_nk_determine_rate,
 	.set_rate	= ccu_nk_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nk_ops, "SUNXI_CCU");

-- 
2.50.0

