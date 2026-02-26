Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094E425CED
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129884; cv=none; b=mec9wnxotOyYf8Os4FEucMH1u2v+5mYuAuwayI+/NxBb1Urltbkspqt0PSu1HUH77ZjpRMDkZrTWwxRU1BAUHlDJcltetZMcobUl0x7Qy6jLPFOPyDQupgHC4S/51e1CCwMrW28r3KwUWKRI3CdKX9otJB7/PrxeUTgZjsPnVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129884; c=relaxed/simple;
	bh=363u1/C5GJNNagKFfPNFsGzCCRZzZnwaJnG3/9KHzOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvv2RcI0X1vsJlPsUyuuhYKKRfig2Av/76KvuWhFnSBGzpUYPkla3o/Z5pWTIuJyk3gxoBe4FguFvEGiVPgDbnGCrRyiBUuB4i/+gD5I6SLC8RgysR+NxzvWhn6VHGiG7K+nqEsRCHp2BMdtMqxc3NTG3vl+TEmEjiDFhwYgFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQEQGnW2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XlSKv96b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQEQGnW2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XlSKv96b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TrGP3ZwfQG02ZPKLOCP6keCAvG84uonAYWUbTlHA1+o=;
	b=dQEQGnW2M8AdJJPsvcTEh67OmBDHrj/a+n6aqqrDgj113D4XpJ4o9tUggStstfmtOVnUu4
	ogI0xCtAFuZx1Wjr/oJnbHEeWo8Ax1xQx1ZLvmHH5V5KgtVNR61Ao84WXRxI4OslCMJQ3W
	fVAr/vA35xvbK5myU82tAViJ1kdZ1ug=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-z8FiCLVRMsyWBpL7xiDcyg-1; Thu, 26 Feb 2026 13:18:01 -0500
X-MC-Unique: z8FiCLVRMsyWBpL7xiDcyg-1
X-Mimecast-MFC-AGG-ID: z8FiCLVRMsyWBpL7xiDcyg_1772129881
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506b1524dfeso95674411cf.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129881; x=1772734681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrGP3ZwfQG02ZPKLOCP6keCAvG84uonAYWUbTlHA1+o=;
        b=XlSKv96bkt0NY5PXxvIL7acQTbusEt2L6ZuROuDRWgi8+E6sUzJqM2q0ZXtBlIMDus
         vBvbOiA0MgobcccKsZ3K0e2b0UF0XfBkYVun7EMFNbXeCk+ChGgIXLjsNtJ9SU2u/hR3
         1Wnukq+hm8bNpwoCso6VEwbc5LjFZbNxWC/W96QcmCqBfo9dbEh1g6JepZdChNObc+zf
         sh2LJAK1kW0feIJSWKW0jjYP+fqo52SdFMhMy6gO/nTuxkdSYH476iJiAcrvF4AlQKE/
         oV3Xp4BlLK5oqruVHsvgPJeadjcQd+YQZRzPo7DinJB4LCk07PxLzSYZxEvmfY/4yiJ7
         KFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129881; x=1772734681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrGP3ZwfQG02ZPKLOCP6keCAvG84uonAYWUbTlHA1+o=;
        b=bgSdJwgiAKfIYk1JAUBQ+qtI1wnnTijEJQoirxiTG+pF6eKtBy3ndC7WyHmyxhjvXw
         Q6xgdYBx3HxJbwD1ASxgx+GF1h/uULKc5JDgbo9voAc1+HnbFExGNKasEv6o3mqmA+VM
         v6glcrbOLDBCGXAWJOHVZi/zOn7Cxz0vQKRrxtMjmBWaz3jvYClDT9Nu6cq6umUIh4AE
         oxeuc3edgEf8nBJBFV9Ebz4mcS//lDkAIvOOfqTBo7w2X6O8r2uBeBloIY6OQCR1+22a
         U3GRN3x38oX/xTKQ2dnT7b+l8XgedDRHAnauW4dmdObnMh2vgBsCDSz9tbmyvjQrrwou
         CSSg==
X-Gm-Message-State: AOJu0YxSGSjT9Qi7nqhqUskqsoq7Ao4DS/FqDsiAmKqdIlE7iQrtreWf
	yxD7GyTXyECP8H38RXFXxxITutuwryJUZ4KKGIzoTPJAqd6GZHbRCVx+hO9VoF2kzj72ShHASXS
	zS87yyqqV4unW7jcbxYBSWlyN/R9Q9troV+LqC/kSRFp5Izfom8QYk2aXxQtEDw==
X-Gm-Gg: ATEYQzxWzXdpQSYxwQL0/pk5o+c5pduUBBBVc7pY00Gq7oOLY6Mk57OR/vub1AWNgTD
	hL4gVlgM2vfq2ZffSSNk+KMbDQtOgOxW75dRrhzsPtDfkFS9wYING89ko9NkWQ2hqZ+TcageK28
	9BbcF4aGwpDmr4k8SFf3amU5n17WrQcZkoNQvi1lqvits+xUMGcN732lXUBPCUVwW3itJntBsiU
	cNXFhHZRqiCaNu8lG2iVYypqXkYnicTNZLB2WaE1wHuyPoRYnnBDTjN/3uKdL2R6+HEcFZw/bVN
	Q4lZNV2vGlusbSklcr637rX6/kIZcn9jjA1U2QV+CE0AKKUOIp3wuc5fSnC/qBnit7DnHxXf0zk
	wE4fAE+0AlhmjxH8PmUZ2HwTcUgtTUKpAbJYrFHoSjSaaYN9oFqEQGC9NLLl6
X-Received: by 2002:a05:620a:708d:b0:8ca:3d7c:e74c with SMTP id af79cd13be357-8cbc11d2edcmr379559985a.69.1772129880836;
        Thu, 26 Feb 2026 10:18:00 -0800 (PST)
X-Received: by 2002:a05:620a:708d:b0:8ca:3d7c:e74c with SMTP id af79cd13be357-8cbc11d2edcmr379556385a.69.1772129880351;
        Thu, 26 Feb 2026 10:18:00 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:53 -0500
Subject: [PATCH 09/13] clk: qcom: rpmh: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-9-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=363u1/C5GJNNagKFfPNFsGzCCRZzZnwaJnG3/9KHzOg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Bnd6C9YlLRWYWnhxIcxDyzvLsnW/ZSxteSIzmnpR
 GkG45UlHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwk6zIjQ4PTnXOLvH0SbtqI
 9VhvuLFAQ4PhVi+LkV1ZkKy7dNEKJYb/Mek2NmG3hW+o8v/ff1HWyaLGQcd7/bzZIn5Jxrmn/z3
 gBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee01cf28c11ee8c4bd2f36d7536e6d..18fc94e6b98713e6aaf20a6d6144234f435d07a4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -129,6 +129,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_bcm_ops,			\
 			.name = #_name,					\
+			.flags = CLK_ROUNDING_FW_MANAGED,		\
 		},							\
 	}
 
@@ -321,12 +322,6 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_rpmh_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
 					unsigned long prate)
 {
@@ -339,7 +334,6 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.53.0

