Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4338A735
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129881; cv=none; b=tgpo8Ev8zj39+TF8inLTO3R4uSQBjDz/QXjhXQexS/XEBPZHkmozBm6KlY49YTi2/PDa44Aj+YvsrLGY2n8ZanhZ56qXc6cscfJdibl6Antqz+dv+MDA0zS7quTLgoU5zNENe+Q1V1TMbWUFI0+2JFSdewAQJbzav53g915r1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129881; c=relaxed/simple;
	bh=6qZbkdxMtSneOlfO4R0ArJjnlVRfKKFMaBW/o8xc5Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIjaXSqofmnYESDmF+YbBhyuVY5hMVZt5zugq9ETcqaDQObERkc8Q5k3zdm/kkDjjKYukH4OR2bOsyq4DvBp+Y1hAuvnx0H25PncwzmTCikehmV0X4RAUC4SXItEfpUTqwbQ4b6aGUeeebDIiDCliPnaq1P7L5lD3+xr2vM79Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5Qhg7u/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=by1E8jbz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5Qhg7u/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="by1E8jbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
	b=F5Qhg7u/iWyxU97gjnPyvKFgPdwS/pSuEfUB5vgHABVlsYxsR6396D2I/ozEjODNLuPTjm
	URWBoV+voH57augNRxgpsn4N1hrwV/Df2oaTqxkrBNhVMmyN5H0FOXkY9N3vWOyaaeu3j2
	XSB7eVbBnDdA15sWnHFMXy3//a5pTII=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-wK3yCDrWNqinVPTJ_5Ao6g-1; Thu, 26 Feb 2026 13:17:57 -0500
X-MC-Unique: wK3yCDrWNqinVPTJ_5Ao6g-1
X-Mimecast-MFC-AGG-ID: wK3yCDrWNqinVPTJ_5Ao6g_1772129877
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so143343185a.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129877; x=1772734677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
        b=by1E8jbzYkub+4GzRjAOtKCXq+ATOULTFumP4CEs1QmuEKcvs/RFYUIkEkyAYlj3Vj
         8aftob1A7xJ5UsJhUDNj8rWc1Whs5ZxvYRWNYZT6XHkIgHeZVhmJZU+Xui59kvBf5vCy
         akx0IV/7Y0lRxE6bJO0Pv5U1ihbvoX+nassZdq8Rg2w/iNUQrXHfGUoefzRmUyiaIcWz
         QF30GmNbMRz2xXRl44mbxBEKfNNyvnjqaPUyfD54qDO5sH+zPQCHZsTaWh/DfbD/MQ3f
         KuWF5j+/CmKX3kmvZUwE2qEOGK8MSo8XWisTnyO38XmVuofJdwomqDaSGvngrFaahtQ2
         awrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129877; x=1772734677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijW7r95GaxQntZ0kViwhWrj/j40WE3Casb9HevCeJAY=;
        b=PzNW82+bzUo9DRGtVNIOwNGTjijumCeaQAFXtSDnCIgCG0TaLQR0qrtNZMIbchISqx
         u9lkLBhEWTKye5VF4yyeu7Tziq8FAYbeyI8PGu/nSuD9gbljLtIzJClF6GOuOripzhEt
         89bI0wQ+nBsu+LI6HDl0bV6KBSfnIujplBEyp7RaH2uOxx7ljiDYFVWS1TjLhc/sKLAv
         vA8Csk1O6ZDKbgsypOsPu/NjrHBPEf6ZhcpOtmxJqHf+vsNZoMTJ92Hea7cDCx+VLfij
         9mcJPbrObD3DimAqlVjLC+NwgOI1ymR4qutE5kqTGyPFF/pjiUH3dpR01G7kDd6ukVyl
         1P/g==
X-Gm-Message-State: AOJu0Yy9f3D9mymcJedM18A2D26JCSta1xz8mIdtGKLiQL4j+C8GPi9I
	jpXaIYCRHes0e8zLr4ZhQOmHjoyXcNR+59xAPEqC94gJiiOyMS+9vWPNyZYb76X/kwDGc+joazQ
	8JquyUrTZMBxB4LN018cBKMmH+HIPeqEorT+mBm5gQFKPGsmxjduzbIRQh5JLrA==
X-Gm-Gg: ATEYQzzAtuvVwK/YmvkRyN0+ZJKJYIJ/GmmL+OZAlBM/RLpX/dl12YTYMtV42WDvzGh
	Fh4ikvKw6bAfLLoGVRoziOE2uNCe6+WkZBHDUhhrVn1qulzqCsPT0ldq9pkL4qtexZSy9sutdMZ
	X5mz4xvuG/r+wdkSDZ4evE+VmnOQCQ6rknwDFHQvvJJyIUb+U5SGDvFX/+mFxD36eu4XbXQ42bD
	D1uvw0aqvGNUhsKGatNbRjxbqlDIJJFTNgvcsWiM1Vq7LHmETBD8699Jb7i2ialH6UYACM2m267
	UGJmaG0rV9btmr3qQusgl8yPTeTFWK0F3VPYq7sH9469AT7T5PJtowrOAwSoTDDH4DWaI+iFsga
	b+Z2AFAcSYmLbebt2+sPSjqFeLObtZjPsQlpw5L0T6KgeJWmmbQFHzOKiznmK
X-Received: by 2002:a05:620a:4621:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cbc1122f4cmr327773185a.7.1772129877004;
        Thu, 26 Feb 2026 10:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:4621:b0:8c6:b315:1452 with SMTP id af79cd13be357-8cbc1122f4cmr327769285a.7.1772129876524;
        Thu, 26 Feb 2026 10:17:56 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:51 -0500
Subject: [PATCH 07/13] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-7-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6qZbkdxMtSneOlfO4R0ArJjnlVRfKKFMaBW/o8xc5Po=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9BlYqx15HV2X+DTHWy+tQ3WLucWER1nb59t0fHqz0
 INPZ69bRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5OZfhn84r1c09UaeFpBPX
 16vNL47RqE3oUs/llWBLWtxVy/HRhuGv3Nr9MYVLlc79SRF/8cTkh3j816Wc+19ncGTJlJ6q+Wf
 FCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a39c68d664655537e81df55c7e6d32304de9338a..db8e5773140a7f5fcb3b36f372e22f43675ee6ad 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -262,23 +262,6 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
-/*
- * clk_scu_determine_rate - Returns the closest rate for a SCU clock
- * @hw: clock to round rate for
- * @req: clock rate request
- *
- * Returns 0 on success, a negative error on failure
- */
-static int clk_scu_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return 0;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -436,7 +419,6 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +428,6 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +435,6 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -491,7 +471,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	 * clock status from HW instead of using the possible invalid
 	 * cached rate.
 	 */
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = CLK_GET_RATE_NOCACHE | CLK_ROUNDING_FW_MANAGED;
 	clk->hw.init = &init;
 
 	hw = &clk->hw;

-- 
2.53.0

