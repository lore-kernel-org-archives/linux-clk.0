Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A82D23A3
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765496562; cv=none; b=EWyOBcCqk1a7IwRiGByj9LD6QE1tIvaxgn6jZBp5cN96LWUbIkgz9Smbf+m/OyNKjGIUnVVRz3V4DWNRyLnKdWUgWupALTUpOXus9q1fwrUdpmMRQwNdDAvS6XFUuDv0Bg3aZA92NKEJhF76M7YB9Z3IyHVeBQ9RYnjPiwrZauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765496562; c=relaxed/simple;
	bh=sglNQh1IEMOuPCNbE6JT2hakrSDVg7baBSDkcYQohgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTFOJEaOZkZJuOfnHo14CtNLBXRJFaTakS5RFOC8AESex/6tb82+Lz0XNCYyir7dLxs3XOzkdrNfCe0NsbeMXbxEFRsbgYHH+quG5I5QlWvJ9mIQa8h50ujI/PNNW5ZYuyFqpFUAVSnzbWUzMHXZgU8vC1cufKAxisEpgDSZldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hK8Ux3xT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mlWoYlvW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hK8Ux3xT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mlWoYlvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765496559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJQf3y7sT3rIO68RkbG9xjzhHjwbGfQC0BxQ2iZ2WjQ=;
	b=hK8Ux3xT+mepivhzkwJoD7f7K4lOXuxn1VC4RQ4aZ6g8K1h2OcA2poggMM5LhO9HDNjx8O
	ERjVp2hT10bmPiYDrTj3LmKjFD3Qs4j0y5j3KiVXCK3TnbHJtKlSlQV4GHDMNmZu5dNZ0T
	q1jSA7hb3xDrWWg7TYc/FA9A/FP2b/s=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-xqgFYsD4O5uIlCHISvM55w-1; Thu, 11 Dec 2025 18:42:36 -0500
X-MC-Unique: xqgFYsD4O5uIlCHISvM55w-1
X-Mimecast-MFC-AGG-ID: xqgFYsD4O5uIlCHISvM55w_1765496555
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso12407345ad.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765496555; x=1766101355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJQf3y7sT3rIO68RkbG9xjzhHjwbGfQC0BxQ2iZ2WjQ=;
        b=mlWoYlvWcHj7Vhyjm+ACtUffK5/8KCuRjP3fCsF8bH4UkEWtSPaqLlab0/4wLMETws
         F1Vbuf25bVR2v6w4Pc/eJlgrx0tM2DsdtEL0TQ+SklJEQ9KZTAcbLmLUjfQZ68qF7SWg
         XvDd0+EZprPp3c2cXVk5e/AYiZKaJ1JtvF2C6S1SAGlSNnOuIcQjMhOxl1i95GquJFoU
         axpdPP8D9ltr+EJnbDXyQ0l2U8C/WPRhwJ6aQIOcRmOW58FL5i2L0oAG3Xai7Iqnahwx
         hG7jX9X9Mw01hUcBNSxzZCxxtO/ltVyq1mtyotODNM6kkBkuqHhyNQRM3e/7w0IlAXn3
         t+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765496555; x=1766101355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJQf3y7sT3rIO68RkbG9xjzhHjwbGfQC0BxQ2iZ2WjQ=;
        b=LarBQFWm6OG32QucTWK04lZn/JadbqHc9W/ZVfLNaxf0zhz+4sO+woevEFgCiDJCl8
         MI8HLD2vPbAPbqq5faa3z4z736//le4oCI6TFZTVDQ8xAwf7RgVXzTe1vYWNH4dPfdM6
         pQcENLatZOsuZvlG8AFIXcKKRnllmP1jenJIymbWtyGkDAPULhhlKEllRgQSRD/yu1SU
         KXuejGSsFQsYI0nN7ov8HKURfQ50cftO+arvcBQKCVcDlDrMBtb686HshThnhzn2AULN
         QSLo4183/FHcAeAQaZlv3WbbT8u+KkMb10CeCHuElcLV2wMNguP2Bq50p3EYR1075A+2
         fZeA==
X-Forwarded-Encrypted: i=1; AJvYcCUqJ/W3f9pRAgnY/YfgRbsabmE+xWuDzaWIG4UJhamWx8iSgtyTcQOR7ezd7G2DebB3avs1KMnTcWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUcVKLKqIB3zjsDT/7eClo7dC/29cY8dnFvZ+RfviOPp+Y5ZTx
	nTAiLFXNlEaY9JLA2D55FF/RGiT1ceqG9BB91lg+Qn4JCQwZUSI1hnCsaEJrucJkoaoSGlPUGnq
	kMAHEl6Bh63sXslidZcA15Z/CWx/z7N8u5uvf6SbautYsd/rRQsgETwlOsItOXA==
X-Gm-Gg: AY/fxX7ALUX6y8/tkwz/eQJP7wCLOt8XMC40B0xeQOSfDYNS41uo/c2+FBgq3KXw1be
	RbXslJCkURWzOYfld+yluW8RDY53L6G2ii6MeSYPb3VRGQviCXft+VYt2867DdBQkFUNiZ5Zww7
	QW9832pDgHK9JERjONRe9lVvXppBbNO3y9ersL+MUugnNxLed2or+/W5+Xvuiz0dpaukd1BeWTe
	PSEZFjuCJB6qdS0BH6G1/VmAz6ApYJUAzAT57zMNRj+aOO4S5b5QZfLUGnITzj35pxqrKmElvzV
	FlcDxdRJjP+apG+UNd8WRHZhLdZmewHblzeJyG6OLiYKHx0hw3O+ggqZcmp3ygvJs9MztefVlHE
	rZfYCfBZhWB0L8Rpmm0qSdMfQVO8HoeJ93lyrtu/EPxOFyjW57qJLfA==
X-Received: by 2002:a05:701b:2908:b0:119:e569:f27d with SMTP id a92af1059eb24-11f34c1ba55mr141784c88.38.1765496555001;
        Thu, 11 Dec 2025 15:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfb+9VPFudEYOvvh4a4bAbcoWvrbRK4+EeDnsw7jslcN+LTmASF1ou6fb8Ojfy9YSNGfElDQ==
X-Received: by 2002:a05:701b:2908:b0:119:e569:f27d with SMTP id a92af1059eb24-11f34c1ba55mr141768c88.38.1765496554506;
        Thu, 11 Dec 2025 15:42:34 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm12034395c88.13.2025.12.11.15.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:42:33 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:41:41 +0900
Subject: [PATCH 2/3] clk: composite: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-clk-remove-round-rate-v1-2-5c3d5f3edc78@redhat.com>
References: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
In-Reply-To: <20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sglNQh1IEMOuPCNbE6JT2hakrSDVg7baBSDkcYQohgY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtw27u5PuwR8dCe+XOf8e/3T90nVF2xtQj8o7GLiwZP
 45eVajf3lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEitsY/pmbfjvPe/DN8uvh
 25Zu2/27UlpoQXHPFsFfr8JMbY98iClj+F/y8tmyVw8Dn2zZoNB3Wpi756L+r/cmilEK6c98ZG3
 /57MDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated and going away, so migrate
this driver from round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-composite.c | 38 +++++---------------------------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 66759fe28fad67f98b6c723ce70849490a022e26..0d96d46712b7258cf23d7b3768a5e75690e2c9d9 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -47,22 +47,10 @@ static int clk_composite_determine_rate_for_parent(struct clk_hw *rate_hw,
 						   struct clk_hw *parent_hw,
 						   const struct clk_ops *rate_ops)
 {
-	long rate;
-
 	req->best_parent_hw = parent_hw;
 	req->best_parent_rate = clk_hw_get_rate(parent_hw);
 
-	if (rate_ops->determine_rate)
-		return rate_ops->determine_rate(rate_hw, req);
-
-	rate = rate_ops->round_rate(rate_hw, req->rate,
-				    &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate = rate;
-
-	return 0;
+	return rate_ops->determine_rate(rate_hw, req);
 }
 
 static int clk_composite_determine_rate(struct clk_hw *hw,
@@ -79,8 +67,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	unsigned long best_rate = 0;
 	int i, ret;
 
-	if (rate_hw && rate_ops &&
-	    (rate_ops->determine_rate || rate_ops->round_rate) &&
+	if (rate_hw && rate_ops && rate_ops->determine_rate &&
 	    mux_hw && mux_ops && mux_ops->set_parent) {
 		req->best_parent_hw = NULL;
 
@@ -150,18 +137,6 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	}
 }
 
-static long clk_composite_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
-{
-	struct clk_composite *composite = to_clk_composite(hw);
-	const struct clk_ops *rate_ops = composite->rate_ops;
-	struct clk_hw *rate_hw = composite->rate_hw;
-
-	__clk_hw_set_clk(rate_hw, hw);
-
-	return rate_ops->round_rate(rate_hw, rate, prate);
-}
-
 static int clk_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long parent_rate)
 {
@@ -288,17 +263,14 @@ static struct clk_hw *__clk_hw_register_composite(struct device *dev,
 		if (rate_ops->determine_rate)
 			clk_composite_ops->determine_rate =
 				clk_composite_determine_rate;
-		else if (rate_ops->round_rate)
-			clk_composite_ops->round_rate =
-				clk_composite_round_rate;
 
-		/* .set_rate requires either .round_rate or .determine_rate */
+		/* .set_rate requires .determine_rate */
 		if (rate_ops->set_rate) {
-			if (rate_ops->determine_rate || rate_ops->round_rate)
+			if (rate_ops->determine_rate)
 				clk_composite_ops->set_rate =
 						clk_composite_set_rate;
 			else
-				WARN(1, "%s: missing round_rate op is required\n",
+				WARN(1, "%s: missing determine_rate op is required\n",
 						__func__);
 		}
 

-- 
2.52.0

