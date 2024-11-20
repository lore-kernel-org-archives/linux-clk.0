Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75931AB6CD
	for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123152; cv=none; b=rFBnTXiUEWrFOkKGPPFKmxBju8+EyFaw2yJEZkGkunkcWBiNad80/ueSE7zFMgjpyEGjhJkZBqdCaLbnOscaLpxVO9c3dBPLLtFFTgSIXrEdW0/pJUrBqCSbwUkozS+0PkO8l8qWO6P0ZAh+OHUbQRlqfEBwa+jo/NSz1D6HgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123152; c=relaxed/simple;
	bh=aMlj912aJwM7LIeO5svmmFwooxRnaRCe+Yl+8o1KcuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KoB8y58VBiTKCH7otzjAu2Tz+zWXIHrnwk50mbBt038AufAOBK1Ule9cmCJqtdYkKQyIz4x+7uSuZhksvILI1OZnlw2mnqsdwpuvZdONXcDOyyiATkZePSkz4WUJY4JQ3CxTLCQ2KURZMgwqeLtFbeG5ToOwouyDsy8Emz4hLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSRTU90A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSRTU90A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so42998535e9.1
        for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732123149; x=1732727949; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyiP0MxQdAmx7H0LainU7jczTRUd4MKDrKPjA66RP3I=;
        b=SSRTU90AB/FImv+Oov9FKEre//n4Zjo2YM3ajRDib0FrfNHea2nQSIa831/VtMnZ24
         oyMWbYFWfoOSb0k5S72KEjC6NtkolS9TVwXr5ouqboocuSl4ReqHMnvLxTWM83SnRNKg
         wM4Gfub9gxxedKd7ZatbYAvvqurwNHCMlf/ouiVvMyxhjaqVMEjA8+OQfB4dtSYcxDfm
         ilkE+H5hbCK3LruVQvSvH9YMfYWCckp9hjWH+vGfaf+vl9M/Nn/0VmXNbh+uzbmhGndK
         zfNRO2ukBXMSSzLO+HIjRXJFeip2NbvJRqfzhZe3zuIQeFZm0lpNzrBr37WXYZTDA8dQ
         Cyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123149; x=1732727949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyiP0MxQdAmx7H0LainU7jczTRUd4MKDrKPjA66RP3I=;
        b=wQQMD6NSRk9jOELLIcEvDjPSNmVA23Fzc5Zl56AYycITkbiyau+P4fG7qKdV4N6Uok
         ebOdZppGP5kTpPmcdvEee2puE0ZxGg9gI55mAl7aB7bUCnazzoXiC8RpUmeUluHrZrna
         JlqieAGdPGUINLMDY/eXX5pQpsrILEP2NJn2lxPMEjBu/FLlygqr5cOXNnbeN+EMaODP
         qOY7jFDfz0HDBV8JXG+wNuoPg7u/FE1CtAteHi86upA/jFJz4t0zxy44Son6G+8eSTML
         DcOnhVivjlfndo8mvd1CQ1cZDwC4JYern2Uj2o/vtscCSrABBAPW9Pgllf//1vGipgFV
         aJUg==
X-Forwarded-Encrypted: i=1; AJvYcCX+PmJh6NrXlbskpcoUoojFCN6fiMkTOI65qhaD4+qICk2WcL+I8sKksAsJbhYBhYzD2S9hK5ed6UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU53rnBW16lVGZX7aW/BrhHkhzNPI1Lkxv9fYNSsEJHRwttrxk
	13pCZs06wo4ADjJNo9uPWXuwwK0T2MMS06gN7+co+z4BcxJMG6QiaJFc7yGASsQ=
X-Google-Smtp-Source: AGHT+IG5JIx0KMSnLhIOx6fmV+jjW0KaoHFqxB+0+tP9hY+E93urgyzJG12FpUEVyW5mCoKbBXDttg==
X-Received: by 2002:a05:600c:1c16:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-433489ca97fmr35463405e9.16.1732123149443;
        Wed, 20 Nov 2024 09:19:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463b0d1sm25375975e9.42.2024.11.20.09.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:19:09 -0800 (PST)
Date: Wed, 20 Nov 2024 20:18:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908-apbcp: Fix a NULL vs IS_ERR() bug in
 probe
Message-ID: <6155067d-aed5-4799-9e14-6dff7be1cb3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function doesn't return error pointers, it returns
NULL on error.  Update the check to match.

Fixes: a89233dbd4df ("clk: mmp: Add Marvell PXA1908 APBCP driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
index 08f3845cbb1b..f638d7e89b47 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbcp.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -48,8 +48,8 @@ static int pxa1908_apbcp_probe(struct platform_device *pdev)
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

