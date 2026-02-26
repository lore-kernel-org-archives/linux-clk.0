Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D932C39A7ED
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129872; cv=none; b=bKw9YUnD3M/5s24EE2ohd0/9iT6MXTWuP+6Jx+UYQrblGYVr0TQ+qIE4o852g52FHxqmP0c7ejuQ5K/0EuADWbkT9CQS4l0MIVRnmVy4M+XhsIvZFcfBJ7paMovlgFE81qJyBwta3X7HyALaSW8LdTA3Kf4z8p/1nu7oyxaS3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129872; c=relaxed/simple;
	bh=bBzMvmqbee0tAhmfGC2lWGk8kwmzi/yafPAhBAwndVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5913+ZcC8tKyXmw5MIIBsC435TkAjsZeAs4YdiYBGz0rfyER0UTLpzLcWY2RbzMAkmiMGz7jWcYuC1IQdTJmxMRcRHT7HufW46urhHmL/vcE9gcP/fO1YGFPiY2h6HSMlKQNr32rScSe3ywm48wM2evTHz/V4zQDpqgXgzrhdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMFEvGsk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OD/dWHjH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMFEvGsk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OD/dWHjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/NkBqB9S39etV2El2jszlwNIVVxrDFK46R0I9KJ2sU=;
	b=EMFEvGsk6btFwKBdUN1xMwSMdRX4owC0m0JoBm3GS1+JCQNZUp2meh+nQo60jZb0IFn1aP
	D8uG/5PeZnxDM376NSpwgkg+VK/wb30egVAsRlPWdoOE/NlFaIQMY4WpDxMwINVyEM50Vn
	mJrU/qx0GPsjgi3VG9Oz0w7ehDzj8A4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-AvrNurqmNd2wpVWfpEq1wQ-1; Thu, 26 Feb 2026 13:17:47 -0500
X-MC-Unique: AvrNurqmNd2wpVWfpEq1wQ-1
X-Mimecast-MFC-AGG-ID: AvrNurqmNd2wpVWfpEq1wQ_1772129867
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899b30c56c6so18477476d6.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129867; x=1772734667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/NkBqB9S39etV2El2jszlwNIVVxrDFK46R0I9KJ2sU=;
        b=OD/dWHjHl8P2y6rdZdtGIxZ2GmDxx+7+0BDcVJUSNcNDdA4y2BelV5hq24+8mRjUBC
         VN0g1jmWtDBCR9+49fA0Zj2oVLr1XZhEYivZXeFdL7BNnLca2UNRLkRU6DW9YjDdC97K
         0G1V3TRak4ynHL20p8LOrcIxiar3BzTlnmFViCJsGlITXmU1jmc/tgnvIoyS94qAArQN
         /6ykcuWh4NnSttjR46XAoE3mAu+T3qNJwfUzxnZrMn+vqzZgEQIa9q3SqdU6eoyiXP9N
         9DeW0le+OlI9V/Hxyt4LVcTEV6d4BgRZbKfNPaEMI+V3iFRWvbb0szUqrR9i+jwD51Pd
         FGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129867; x=1772734667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q/NkBqB9S39etV2El2jszlwNIVVxrDFK46R0I9KJ2sU=;
        b=rwbgw85tSEyMfa0h6QkAfjNw0B5sXYln4NNpjci6WosyN2uPWDyOmUgyTfO8ADYfA8
         JJ/P32KiY1RYqwuuLZLpo8WQn4WTiTBKIVW3F1gbSOkkTc0XHvNiTW8AxWL40yhhkcIB
         aIorz3CC4Wz2EVd3C664nKS/0uhWtGBr5T7QCl+1mS2FUBV35AlLM2vs99/8YNnKbiUP
         K+CqaOuUTAvT/BDei2B0xTzilnsFlfOOqIc16LAITdhFDCf1Duw2N1ibs5nB8cmjHUzS
         HNQiU2COu0z9hgR8ggqeSZ2sC4RnAnbwAohnS5EKK/86opGFBg4HivFXldWkeA/b/80F
         OI/w==
X-Gm-Message-State: AOJu0YzCygtJycHtbz4Q3uiYHvFq/s3gFpYuQeESBJYx141EDCTPUcMJ
	xnhvMdqbNuiM0v6CQXExCRHp0Vt3htkYa4JWWsnNcZo0MrW0MTU3bfu2Pooeb8ym344ciwgTpMZ
	Gk8u9gxw3qe6q1YlAgdvH45OxDzktWb0FcZ1dWI+EMzJdYT7YsKpmLnh2pzlt0g==
X-Gm-Gg: ATEYQzyiQoeaxImRIOhufTNivDLorECrRP46IJAIPiXyLDwQGW+FhOA7Ys0shZYsCCU
	ua61EDNgpGqFdgvJGrcpBHdFTPy1GtT1SQDgh61PQDluHvn/uNI+l+0BWPVbNft0h84xEM6Nwr8
	TXA+XpNhfsPYOMeqqlAP459VkYju7TrmOchDkL1qgUJNrQpb/E4C5Wdr7Nfu71WTL4HG/lAQdlr
	Fcr4TUlSvnUR7waHtLbq37l2xP2gGlYh/UF5+IgFdufHLPJ+/Tm3fxyc3Bd5Ul8EjvONIGAzVDV
	cYF2g76luTFPfQc8RNg9wv98cOdic5Y+xKV4/Uu0ToR5jc0cCYL6Qc7FtXnbv2ggI3gx2TVI0hW
	BIP/fpeynf3tfJszCp7/ZZ3F9xrveAzTZug01TrDe03L7iX1izwcqtsALO8Ju
X-Received: by 2002:a05:6214:2481:b0:899:be2b:68f5 with SMTP id 6a1803df08f44-899d1e37adbmr40256d6.34.1772129866997;
        Thu, 26 Feb 2026 10:17:46 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:899:be2b:68f5 with SMTP id 6a1803df08f44-899d1e37adbmr39826d6.34.1772129866527;
        Thu, 26 Feb 2026 10:17:46 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:47 -0500
Subject: [PATCH 03/13] clk: rp1: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-3-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Andrea della Porta <andrea.porta@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bBzMvmqbee0tAhmfGC2lWGk8kwmzi/yafPAhBAwndVQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Oke2/JU6LaTw3GvRzWLTvKG/U/Mfybott+1WrqSI
 37pfwfFjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYSZMzIsFhgE8PaQwpGEc4S
 6b0rdosfrW6pXnf+c7z/94Mc25uL5BgZTjkZs7gbxCseCTK4bvKnbMrSbxkPVrQqML56cWeLbVo
 zHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk-rp1.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index fd144755b879862612ea5e22e913dbb44a140033..acc50e5a7edd409c5f4b99c6f62af9ce06b5a4ee 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -1174,12 +1174,6 @@ static unsigned long rp1_varsrc_recalc_rate(struct clk_hw *hw,
 	return clock->cached_rate;
 }
 
-static int rp1_varsrc_determine_rate(struct clk_hw *hw,
-				     struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static const struct clk_ops rp1_pll_core_ops = {
 	.is_prepared = rp1_pll_core_is_on,
 	.prepare = rp1_pll_core_on,
@@ -1227,7 +1221,6 @@ static const struct clk_ops rp1_clk_ops = {
 static const struct clk_ops rp1_varsrc_ops = {
 	.set_rate = rp1_varsrc_set_rate,
 	.recalc_rate = rp1_varsrc_recalc_rate,
-	.determine_rate = rp1_varsrc_determine_rate,
 };
 
 static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,
@@ -2000,7 +1993,7 @@ static struct rp1_clk_desc clksrc_mipi0_dsi_byteclk_desc = REGISTER_CLK(
 		"clksrc_mipi0_dsi_byteclk",
 		(const struct clk_parent_data[]) { { .index = 0 } },
 		&rp1_varsrc_ops,
-		0
+		CLK_ROUNDING_FW_MANAGED
 	),
 	CLK_DATA(rp1_clock_data,
 		 .num_std_parents = 1,
@@ -2013,7 +2006,7 @@ static struct rp1_clk_desc clksrc_mipi1_dsi_byteclk_desc = REGISTER_CLK(
 		"clksrc_mipi1_dsi_byteclk",
 		(const struct clk_parent_data[]) { { .index = 0 } },
 		&rp1_varsrc_ops,
-		0
+		CLK_ROUNDING_FW_MANAGED
 	),
 	CLK_DATA(rp1_clock_data,
 		 .num_std_parents = 1,

-- 
2.53.0

