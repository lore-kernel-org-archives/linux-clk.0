Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7FE275B03
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028656; cv=none; b=YtThPXzWQ8cnpGHsxjCXcotwiGYlx1AbBuOuZ/NmoTk4pG5KYkb9I5y3glmvaEoNmHccll+KnVCbv+1CIUPR37sYiShCptLWxC1dk1w+W+H7vwQtmi1ID4GN36KFLh3ejhZ8ZXu/lMWsdWiGL6Ii87KzacuxaTUKysTI82FrYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028656; c=relaxed/simple;
	bh=2EubRrqz1CKes9tst1i0puGvx//nmPwjXrkFr3IeEQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBwAcrUyU2Pogv1+d53GOIPOjKney9a+16mpmCmu23h3XZOQAK3aqNy/P5B/hVkSFdNs7WQj4pwgC/iBgza01kGdHFmg5fRAcKuurSe9Eq3ZRLbjt3CAVb8xXTOFHuXJ1fu4yiW0ZRCwL0Ok82tPHyXCyBWE+zBmVo07XhF/H9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPn0Ivdd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBl1zMyZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPn0Ivdd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBl1zMyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW3YRTxYaf40CWp5RWfv7O0bvYI8K52/dUN9PIKVl70=;
	b=hPn0Ivdd2EZO/TZ8VHrz65YVIs9qP1ZuEWZ/1hix95Thf+fUTjbJJyXG6Xh+FN1myoEpmJ
	blzzYQjJKz2EtgFmQrJGvSdMAUG+PITWs8eI18Otiw6KCfcQE+mhvNMec2VXmKV01akItp
	wXmFcaQtsZdIfmFFSJfG4JJUmXWKysM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-yRFuGj62O3qkMcMZhv_l4Q-1; Tue, 05 May 2026 20:50:46 -0400
X-MC-Unique: yRFuGj62O3qkMcMZhv_l4Q-1
X-Mimecast-MFC-AGG-ID: yRFuGj62O3qkMcMZhv_l4Q_1778028646
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eaaf673eb4so1437172585a.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028646; x=1778633446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nW3YRTxYaf40CWp5RWfv7O0bvYI8K52/dUN9PIKVl70=;
        b=PBl1zMyZd9SnTUr8R1FK5JGAyKjspxDL9pS5IMLuTGZQjorMLDhKoWFdGpkNjSVMVb
         mSEAZSK3DigzTZesyvjS0XxWnAdROyZ4ldr/dE/C6ve5kCT3+pZzD7tr6hKR6LKgTRDG
         5eoAmxL8RdMgr7EI06ojLg3923/wiaHb5bukZl5TwS1CsJOwL6Ypwh31ShMm+JDT1atL
         G2EUDV7C2dVVHo3pbgMSVkGTGS8ldCjqsShP56KSs7rViOUwM/njg1agk+VFG8R4oxEs
         fTvWY8UOyi4SZTSDa056PCvw7GE0YMAVYcxo0YWafC6CyoVpCqdbtx5LBVAtVXDKApZq
         He9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028646; x=1778633446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nW3YRTxYaf40CWp5RWfv7O0bvYI8K52/dUN9PIKVl70=;
        b=TQ3dxoNwTAwP95yCLQKoy0pmcUlznyqXVvQlf8Qwi5bwBJZ4GWMGzRqwHpXAnn2QRB
         rVgHe5DGO3bgIkA72ZDeqXc7fxLVYXHib/2FnstyptMMv+YKZaqXqVUbGzlgsA5/AMOs
         9fB8Rgus25o0ktW2F7mTKf4ciwJ7JdR3eha07nSK8yk+jRXm/SBe5bFJFXOhFDoPvKSU
         pdiImkfU5EUU4TwQkYr2FV2kSFjK9uNuUzPTv3Yz4dbvVG/RwdzOkPevLP0ymbbCRSQJ
         UoVjDeG/4QG2ciJNhBaQXDZNDn8MikdSUlel/jicm19ZScqyxjBd+3SLcdveeYDQEQKt
         WwLg==
X-Gm-Message-State: AOJu0YyjgL9rcntC7WyfrkIqLgjjXTb0ufyaRayTQDLvmIbnjtVQyAJ3
	ZFgn/kt3rNbnHBX+PRX9vNWBf+oxMDfwtAAdLmQc8YKqrH+tMbvcsmQGvYhsv5fS7XJdRdUiSBi
	YZ/H2nXIe9bNSJjm0Tf54tOBlZl1FVbe4MT8RH+uFgh3UcM8KeTsGIL59K6r8Gw==
X-Gm-Gg: AeBDieueBvPtQcy2ebM8kDj1yPtNyZBjeKObs3ROUOfkB9WBufbKptDzDuZiq6mJNAm
	dvrGfXhNXLlr5e3+vXMsfciFxvcdcEe8KYnvfnEVvak0vO+rwtVdnEfxTrtZE33rRyonw0F4cAB
	VIptikC7QQRJneYqP8ZgyIdGW3AqZrO8Jll6T1CnYpZSkZI4/IDsSWe2N7agjE5JT3qlI9m+IkK
	StHMz3MXkKTHvPLPZUgJCQ8P/cX6kjDyzt/f0lzDoBhkrpyyPxFw3wye9hBfwF44itft0EGvWWr
	RdZ55rHTjgJ4J7TmXFxmvaxnK1n/PL2fBF/crk1kgkdSexqtUYyZwL5c21eCYdehvHmeyqCFTRo
	A0BBy2KShndLR48s5E2mDXJszc+3cqy08/oyARasmQ091qwWMgG8dOURQm8ZMeobDJDdFiBag
X-Received: by 2002:a05:620a:4714:b0:8e3:5bd3:c8ac with SMTP id af79cd13be357-904d5ffdf15mr223472885a.34.1778028645741;
        Tue, 05 May 2026 17:50:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:8e3:5bd3:c8ac with SMTP id af79cd13be357-904d5ffdf15mr223470285a.34.1778028645339;
        Tue, 05 May 2026 17:50:45 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:03 -0400
Subject: [PATCH v3 07/15] clk: qcom: smd-rpm: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-7-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2EubRrqz1CKes9tst1i0puGvx//nmPwjXrkFr3IeEQw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfAqFKo5vvPDtI1/chxT42/qMM+MlvzSuK90YYu24
 z8pSWGTjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaipMHwP4XjZpXapzN3jWZ5
 avR+idea8G2RRHy09MPS62+nFd19ep6R4b/651Uz+yvvldc0v+4yfqdx++icBgke2fCNm/0fi7K
 u4AcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-smd-rpm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b..f28cf9646cb9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -370,17 +370,6 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_smd_rpm_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -427,7 +416,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
 	.set_rate	= clk_smd_rpm_set_rate,
-	.determine_rate = clk_smd_rpm_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 

-- 
2.54.0

