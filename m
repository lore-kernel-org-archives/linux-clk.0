Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2424679C
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028643; cv=none; b=ooj0Krbx1EE9ir4cdZq/wZeeXjlXAmGqyLWSjEeTXTKB4JTLC84dIXNMji8MDQ1c1GZmbiMgXZcooVifqWn7h0sJ+2Z2s3pfZFscgSUIACL2rjRjSFCXwhMR9DaCrGroXtMFlbM/0XVqDfJVxjbYx/09cR3DkJza2/h0gFopM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028643; c=relaxed/simple;
	bh=EFyIEKskge6hOk9rzkELQ1uDigPfI3FsHy2JyR+oUkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JC8uE0rbLeIs252kOFFSYowhQf2dXIYFwlECndtevej9cysyv0ZPvmIGjUz9ZD/oXygdjwUDcHgcA841Qxe9kZAQotFiXJrbD33a8Y/EbxYEXUR8yTFrXPAk2OlAx/a/VNteQUBGDqUgWq3k1QB2Yw4A7rjgezXeeW2vKy6Pc2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OSzjkV06; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PgojmVj8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OSzjkV06";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PgojmVj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fXojatcnuMt7Hq3cnG917g61uDNuqJQuJSFm8Ri+EcE=;
	b=OSzjkV06E6TNYOhLZIOsdiJLjpok6aZiTTSJKsylE+maEg7uBKcXTV9lcgXlnxDvpRzJ2w
	57eTHc5VVsHxdQSSYVf2pAMcwae+Rr3+U2GBjhy3VMDkLCz0lWSIbVdZg1WG1SIr/p/3Sb
	7Jk50RY8FT+4TKxr3SpImjsqX1mh0p0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-6kVt6hvxOvWG0teU0j14xw-1; Tue, 05 May 2026 20:50:36 -0400
X-MC-Unique: 6kVt6hvxOvWG0teU0j14xw-1
X-Mimecast-MFC-AGG-ID: 6kVt6hvxOvWG0teU0j14xw_1778028636
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eabf08affaso1646716085a.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028636; x=1778633436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXojatcnuMt7Hq3cnG917g61uDNuqJQuJSFm8Ri+EcE=;
        b=PgojmVj82h8x4C/+zqLWR9UenMNfxcbWADDVCF6xn6InvhIw97FgSgYRTaL5oNFuvG
         /7p1MS55dwMFi6xt8FYEWK0r0E74DYc5yD/R8NPKh3/7gx/YWNHS3XMM0C6/y3eF4oeN
         I+By5ys396PfsSdG5HS+UWIhsHFsFHcMBzJ2MhZ2T+b9b/WCaNBCDibA/S0Q5G5P5YDB
         +ZKwIzCxA8PmLkUQhuDyEJ60PNQPx0W9qTdUXl/+l+6bChYMRCi4iqUxK6PJKkcVsUPZ
         kgE6ehW/Kp/WgrTjZszkoghpufjnsaS/h/v0YHpMxUgvHHYnDct+RdZiyameJwiruPBQ
         7H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028636; x=1778633436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXojatcnuMt7Hq3cnG917g61uDNuqJQuJSFm8Ri+EcE=;
        b=TjOmsIQLy9hwVlp+mvufqFdsK9xF0VHkpL3vx2QgQD7Nt1Xvza857Rit88BWslYoNB
         LWc5rWjNZCH1e2/KIjJ+rpVuBq8Rn6z2O1fscbMS4iZUq7Ro11x8TfhECgVWH5W7rGMr
         rLu6HIESVl/JqSkNoBIcwmMK4conSDvX1WGm/uxkfO0UvYbEyyi6RWy8x5h5bQDBi+XJ
         zZuEXnEsqdfN5a7TsPWtmTShf0QM+q0F+wvDwOvxMX4ThkHP0NVXjIlCwZaKksbzvkd7
         C6LNsSWLBwNrC3LS01Mk3GYnPf87Iir7IzAlH6o+7cUasF6mzzeV/wj09LKkmPGNZ2zi
         m43g==
X-Gm-Message-State: AOJu0YwXVnaSlTR+STXYdvtcXlD6K2i7s/FBZUdnqhBoU5Rh1ViiuLXX
	s7tQKLy/yphLJUPuFOn90IFjgb9h+RouZjoAvK7nb0R+0x7My1WxF8ducGnBo0fM5dT1Oyi8qca
	Jeug9cegZAPV06qjmfEpkiM50tQIJJvmbFNoYMFc/B2dk3afUhDbuE75a5uBopv3HTsrLykOQos
	Ol26lE2ZeSsDkZSY7biNIbI0uPdzKGPE2v51dFP9CcVuMP
X-Gm-Gg: AeBDietFtmm0Ekcgy7i/eYvYmBfof01ReN95HovE3ovAwZ4KG2BzrWNthwAxAmDc63s
	0+bXvxWkMEfrrwWxvG7sOmCQkG5oyQo3niCUBket5MJnzzO1dbznc5VdQXeslVeGSHr9VmV2B79
	XD9kOtHDIx8Ji0SnA+TiP3QcpwKjey3/DRNwfmIio4SaKeQovGnvsmL4Nb8rB1CIIu8zkM64S9q
	4vBUL6jN7NFra0rVL3H4TvHN0ifghrOP5GKfE1wzHddb6ISvjKA6uLPORGAxHQoKzqUqkv/QpMS
	XU9PWlnZwjJNExnCIG88P9U8o0bfDviLLhGdjxS77oNUVDrD3ar32mDoeqOyedwX0Quv7bct+vX
	akDRqrQEMmfAGjw708ztPkQw1owtJ3jm/pEbEXtOVBfdXXMFkNdrcNB5hYT9rAZEmQbnjamzn
X-Received: by 2002:a05:620a:4587:b0:8ef:f1c0:ab7f with SMTP id af79cd13be357-904d4d5463cmr220588785a.24.1778028636343;
        Tue, 05 May 2026 17:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:8ef:f1c0:ab7f with SMTP id af79cd13be357-904d4d5463cmr220586785a.24.1778028635898;
        Tue, 05 May 2026 17:50:35 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:48:59 -0400
Subject: [PATCH v3 03/15] clk: hisilicon: hi3660-stub: use
 clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-3-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=EFyIEKskge6hOk9rzkELQ1uDigPfI3FsHy2JyR+oUkU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXCfzfeOt/+aiW6Ci0TqHoEV2w3urzu6+mzQW/uMx
 yqVrF9kOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIHVZGhmVTXbfX1h+tNt05
 6feND1uWLWh2nXymdO+3jD1i0jN5Nj9hZGhf7/TRu3Tp6ZN6J+VFWMomPnljJt57+K5ob2fcJmO
 mV3wA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 7c8b00ee6019..0cb1c0538eae 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -67,16 +67,6 @@ static unsigned long hi3660_stub_clk_recalc_rate(struct clk_hw *hw,
 	return stub_clk->rate;
 }
 
-static int hi3660_stub_clk_determine_rate(struct clk_hw *hw,
-					  struct clk_rate_request *req)
-{
-	/*
-	 * LPM3 handles rate rounding so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static int hi3660_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -97,7 +87,7 @@ static int hi3660_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops hi3660_stub_clk_ops = {
 	.recalc_rate    = hi3660_stub_clk_recalc_rate,
-	.determine_rate = hi3660_stub_clk_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate       = hi3660_stub_clk_set_rate,
 };
 

-- 
2.54.0

