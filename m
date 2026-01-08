Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25DD3370F4
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907181; cv=none; b=dU82VYPYY6zju6IFchmhpmN5C+JxHg+sdh7mEb+xE1szRlFWj/iPs9We2wT3Ggs43qP2SrTZ9JlegGTjTV2f69lOqXeNn+gUEhzv1RHCx66jdHsX9aBLj9k0O/umBhqjZPYOJi3wIoPN0EHXSMoP29NNvCy7GFoYa4ppgQXu3+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907181; c=relaxed/simple;
	bh=7gS8R9ubIL8YOU5prWLYeLbasyiJ1ewi1xZXoJO78ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4WmASucDkAmOCYtUxcNzRwRWkhPwd7/0G1zn6yFRVB9trczcOjUOBMnnl/YaijqJIN2OHpfZnORo2kajhU4V7X1oVwK8jZYMzS7kepgZwlkmuv9TUWDEmqL88zyNk1aSJX0ubUvQX43hmzaauJqXbnnFwR2dpeibxSJCaL86v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELWTyJa/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qv5NO9OE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELWTyJa/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qv5NO9OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgA35QJPt6bn7Cwt8Wzj2jn50koHv1JzEeGEjnq2gUU=;
	b=ELWTyJa/0mUOJKNbHGHuJcEZaak5XP5ldCEqZYVEOZlvB+ooXED3HSaX8VVTK028g9x49/
	6WR0CRLwAq+FyAI/+FTkjLAZUumPjl4TwnvXLgYfy6yBU3+KJOHtESxOlX/kgWrmLK5Y8M
	jT8K6G2TXQKjMEQkmNzwBa/1JbRddFQ=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-_8VSIqjXPO24CkHoQERbZQ-1; Thu, 08 Jan 2026 16:19:32 -0500
X-MC-Unique: _8VSIqjXPO24CkHoQERbZQ-1
X-Mimecast-MFC-AGG-ID: _8VSIqjXPO24CkHoQERbZQ_1767907171
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ec86f86afbso1701148137.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907171; x=1768511971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgA35QJPt6bn7Cwt8Wzj2jn50koHv1JzEeGEjnq2gUU=;
        b=qv5NO9OEQEYkb74Tp1qGn+FXlLV2xTguTO3V0KkF7IRMbN9s4tK6G3sAjgTFiwL8pE
         o0aPrf9WQWiO3TwXTsE2/64q0oAEq/oAIhXAMoakYSJapemjXhbaLeO8meGWxVfmCmAK
         YoC03hl+9J8QSJVUUr/+c2TwI1dDOktzMOUyTXsGAYVEuHbM4ITsiMAHwWzcrX76ljIG
         7meWclWDdoXUnMwH/GkfYD84gVFGxT+bm1iiGd7FB1yz6JskMfSgloBEondc85ZWVFzP
         KixSWCJ2D0/QPemNDUNsCjC56dEKc0PfkLMapjRwFzMTkY4WytQlsnA5ENIxvscoq6qp
         30eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907171; x=1768511971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgA35QJPt6bn7Cwt8Wzj2jn50koHv1JzEeGEjnq2gUU=;
        b=eGIm2Bupe15abiwk7QVrLG9Iddr81fDyWZhUNJj2svVq08M4HLHRawyOG6gnLE9t8U
         aKXbhXwf+XgIZzC83l5Ce6GzWBYaly/9t2Qlg+So9m/n5Z4QLdbucJ8S7rvkb9LXmkyl
         UqCGYysjaMib9NCARIGlA5pP5z62bAeNLmuhwyAhixhfoCbLBEXD+hErg+dJR2QJw2Ro
         wvF0SWxIUIarxgCfJqQTmP820SKK6NAxrq4Z30/dZqQUgrH/HLzgs+I0khZAq3F/oflP
         gBsrPDzzM2b3ON+kpKnRQFEhJ0tGXWB8houj/97mr29OJUBXP3wfEK+1p2BRFXm4Cv0I
         oDhw==
X-Gm-Message-State: AOJu0YxU2FVFtR79MVWrIM6ajI2gjAiywwGqekH2njXT499juPMTpzqt
	ACshf+7rK+UCJhjC5KS8uZyAQ4lwWrbTv4kQNIe+eg7AYMdLytRAgZTdk2VRIX/ZYsTmPiluS4/
	B5aBPzKMdedXkOvk1vGUtdl2Of747FpFdf2wW2S4ir3xlXGtrCK+NuF+1750m6oge1nB80w==
X-Gm-Gg: AY/fxX6NT3ucLOisr8uh+Hiu2hS6rojIQTc4DU2kSODuUUGnNLZpRBisd8lUYdjwFGW
	TjEqxCrqaZUs00mvZXyE1daxjQlkY6+qz/2/PAEWRsFKwCRoRrJOGlVWntg/5BpdymyRTNg7/DJ
	qBB6A40wdbji5iG67DYUGiNXkFwKd4F3DLXYMsXCXFuFv8nSHFUeV9XSAAaLssx4qjAW+g8ezRw
	6/NEFYCeHVFge1JoO3gVKDF3mmFmV0NPtK202nvTciv9+/aByneJ8P4mD3Xr4dHHnQ5DSJvkU0/
	pyPuHGVeEYKIfYHNex6tkRf0mmvzOlhEzPKkHvPC+eriQbZEbMROQCIM1LZ9P1vxjosw3+x8O5N
	Oqlm8DOE72FWXRWw=
X-Received: by 2002:a05:6102:952:b0:5ef:24aa:986f with SMTP id ada2fe7eead31-5ef24aaa8aemr42518137.2.1767907171068;
        Thu, 08 Jan 2026 13:19:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR8SU0cC6J7ZM6ORTAUjC6oyDRWxh5N7rfmic1Z80tAO+vimFrecGsZaskUobrNYaLX9pXEw==
X-Received: by 2002:a05:6102:952:b0:5ef:24aa:986f with SMTP id ada2fe7eead31-5ef24aaa8aemr42510137.2.1767907170711;
        Thu, 08 Jan 2026 13:19:30 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:30 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:45 -0500
Subject: [PATCH 27/27] clk: divider: remove divider_round_rate() and
 divider_round_rate_parent()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-27-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2813; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7gS8R9ubIL8YOU5prWLYeLbasyiJ1ewi1xZXoJO78ak=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb58B//GHHWfp3R8+QtIk27eMQ+zz2hs6VFrSDP2
 pNxNducjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbCfYGRYRd/E+/ZHfFxSj0d
 Gda2HWIC9Tt+WLPJxM9+XF/IK+fpxvA/pPTY9AMiZYv/nDnyklXtWJpzfF66jrHAcrPZs1KKqyL
 5AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are no remaining users of divider_round_rate() and
divider_round_rate_parent(), so let's go ahead and remove them.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider.c    | 22 ----------------------
 include/linux/clk-provider.h | 13 -------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 7e414017afa12c3838634ec030f960d8aa028b99..8439784ba08572dcd970d5d4ce3857c6c145763e 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -387,28 +387,6 @@ int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 }
 EXPORT_SYMBOL_GPL(divider_ro_determine_rate);
 
-long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-			       unsigned long rate, unsigned long *prate,
-			       const struct clk_div_table *table,
-			       u8 width, unsigned long flags)
-{
-	struct clk_rate_request req;
-	int ret;
-
-	clk_hw_init_rate_request(hw, &req, rate);
-	req.best_parent_rate = *prate;
-	req.best_parent_hw = parent;
-
-	ret = divider_determine_rate(hw, &req, table, width, flags);
-	if (ret)
-		return ret;
-
-	*prate = req.best_parent_rate;
-
-	return req.rate;
-}
-EXPORT_SYMBOL_GPL(divider_round_rate_parent);
-
 static int clk_divider_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 000f4063e0d10e6772f6d2af7feb0de7741e7255..85f456be5f12ec46e86e5819643fed3fe3790fcb 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -739,10 +739,6 @@ extern const struct clk_ops clk_divider_ro_ops;
 unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
 		unsigned int val, const struct clk_div_table *table,
 		unsigned long flags, unsigned long width);
-long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
-			       unsigned long rate, unsigned long *prate,
-			       const struct clk_div_table *table,
-			       u8 width, unsigned long flags);
 int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 			   const struct clk_div_table *table, u8 width,
 			   unsigned long flags);
@@ -1433,15 +1429,6 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 	dst->core = src->core;
 }
 
-static inline long divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate,
-				      const struct clk_div_table *table,
-				      u8 width, unsigned long flags)
-{
-	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
-					 rate, prate, table, width, flags);
-}
-
 /*
  * FIXME clock api without lock protection
  */

-- 
2.52.0

