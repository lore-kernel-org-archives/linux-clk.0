Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B071ADFE8
	for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123130; cv=none; b=jqrt9hwW5MEcPnjDP1tV5I72odyQY58ztDKdTwBdbXW1OB8eXXqd7jl6JhXnakh2F8MtCUU6F0+u2KnpFpT5KLsEy2yKweVUZpE+m3A/Ba6ps4Gluy/O3QHW3jkqVuVuhtlTPGgffRXDm60MyogLP7Cbrlcu571wAHN33O8mE6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123130; c=relaxed/simple;
	bh=S7sVTT+BQCDyJvL+YQlxm6ADZ+j/s89qtEt93n6e5G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EM+FZS8YAL7w43Cz0zvP1MbDprCzPaDP68Wmjop6afMjKs1RgEjT+5tOTVqCgZd80zhrTKQ08gOX+MemFcRNKsUemapOHvvUFwlkcRD7QNjBJ2l5OWpWVnUHk9SrPfCXL0NJxlQHEh7yu/Jyxwdl2pOvmS48eX+8cqcvrNLC3G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjWA2Fl4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjWA2Fl4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so59089885e9.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 09:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732123127; x=1732727927; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkJOMjQUTSactWFyt220pM1QP+p6v/Z5uBayhWP4whA=;
        b=BjWA2Fl40fEmh4/KQIHP4u20JnhjSeEACz6EVQpRt1ins34DMVSngHMvfjIeQavn4O
         dcf2ksQPi5rGmB5g/WOS1YTHsPvm4mtxlANKBAsxAAVH1YA9cTlsHrHr0QEJ1pgPw83Q
         p3YQnfsbtf50zc7JVq7fSZzrdKfrii1GhDrwLVRLj1jcicH62NlOa+06osbYj/LST0k1
         22/BXRLSgwjNbrkWzZoYRnV932YSyJBPAKtjCa7XONmOpqaNKpNOgYhYFSqxsVOLj7hW
         5PwkEmMPucrbnFvEglBuWMnlxUYciokQHr9SQ6ceP7F0SbRANQ6tNxFDPvUIzwNO/o3H
         gNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123127; x=1732727927;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkJOMjQUTSactWFyt220pM1QP+p6v/Z5uBayhWP4whA=;
        b=Q869iH+p82YFwwGTxg0YADP8Y39we/Oi3HGWH34B2oOaYjVMjP2EScHiqk8B/3j8Mt
         uWEg54o40xn8lESInt+b5wRdisZoTpsgsTEbfbSR0qRCsJZr/xGJz/Pb7EGexgfGXeU3
         OKEvbJ8UXp8OAiFWpp5H5x5YmFq7RbzpTYCD9w1T1ARPMTdVYwxNloxqROUFJNDqBSim
         J8UJukI90r6Jvk/cF0q4GYMF2/cDy2Bv5fJRnO0QzJjeTQ2BYbb0zN2xdBk8ovYvBrQz
         muBh0XifpukKM7RJRqnwEgZZjwl+l7i4NifNsr8cIrZlsZKpZk1i66mvJrrwXxSJKFv5
         TISg==
X-Forwarded-Encrypted: i=1; AJvYcCWZYV2nJ0NDMQSdUvvsDEP4Odj37XlYpiqbJFWX5qtHPDucb1ex2LTKp9hwntz91L4IKOqzIndO0uE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKTHzixfkl703eru9946dIOb0A4xBJgnMGcd6gqMTjBxte1v8
	1+NXRyvL7DEEdXRwkpmMfaaYXXrYHGSrwL77Vg+Ey2YfC9C1Oqe644SKcHL4bqTcr1PeSZsv9XS
	s
X-Google-Smtp-Source: AGHT+IFij8ZHbrHGnZwpofbTbq17XmUYoHM7wwOZwc2/mHQ70jtcHcBKktTC3s8tkz8+09L/SeJAig==
X-Received: by 2002:a05:600c:1d0f:b0:431:5187:28dd with SMTP id 5b1f17b1804b1-4334f021032mr27206045e9.28.1732123127205;
        Wed, 20 Nov 2024 09:18:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4642b8dsm25797235e9.41.2024.11.20.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:18:46 -0800 (PST)
Date: Wed, 20 Nov 2024 20:18:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908-apbc: Fix NULL vs IS_ERR() check in
 probe
Message-ID: <d7078eb7-a7d6-4753-b453-8fce15245c34@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function returns NULL on error, not error pointers.
Fix the check.

Fixes: 51ce55919273 ("clk: mmp: Add Marvell PXA1908 APBC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-apbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
index b93d08466198..3fd7b5e644f3 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbc.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -96,8 +96,8 @@ static int pxa1908_apbc_probe(struct platform_device *pdev)
 	struct pxa1908_clk_unit *pxa_unit;
 
 	pxa_unit = devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERNEL);
-	if (IS_ERR(pxa_unit))
-		return PTR_ERR(pxa_unit);
+	if (!pxa_unit)
+		return -ENOMEM;
 
 	pxa_unit->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pxa_unit->base))
-- 
2.45.2

