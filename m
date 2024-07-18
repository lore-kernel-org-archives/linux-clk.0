Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07215C3
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721269560; cv=none; b=iKIZYfqy90NbPOqIODNczFDJrxPoJEqjU2BHa9iwDcZ99Uh/sBNN90Uez4SsIgzaT/UUNdVbYwE6f33GHM2EyqIa1MBPfi1cWi5FkJA0cQz/zkVwbscNYAoDgxfIw0jmIdTFbSOdIe5Z7WTPunCzaUwxJcL9T4634lrqZL0Abug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721269560; c=relaxed/simple;
	bh=M6VIKClxCKUTHKil/lftXivMZWewfbeoa7Xddd9eHf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0mvIdqg/F/G/ubiB1UytFjBLjPs55BuHRKpledxZReQWY6WA9p6sIEpUoKswo1rmk/dQgJSz6qD+8oGx8Ux24CqGragj2OpTl8tQytXMCqlNcLl5zivgiAtQcQs6JnM4LniHxcxfQI2vcT2oc7d/tlQ3obHaZyoKp1/0j4MQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPKBNa0j; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPKBNa0j"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-250ca14422aso190117fac.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721269556; x=1721874356; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gklRP1Mg2lPJDFn6YnROe/wcKMjIXNM5Cvhi4UGcBq0=;
        b=xPKBNa0jmD+kLpOtPIT1JsGpQgplR6ypUfDz/AjTVQUUGLhubdKwFnLmGiVP4MM0FA
         KtiCK6+qNneo90+fSnQ5BFgm0F/OTPKiEMvim3EoT49k6bCMs4lQWelOSF22isfCBOhW
         CesqKLr0Q8ThvHmXeB8q77wGxJn77gA53ddXfucNxKDBXqGMq+MXSYoQAlCw1q0/WVBH
         bBuFtb38CbAcLniP0ICCmzFSZxmaZP2oEsL6b2h2ZHIbVK7wFQCQfMSroEThfVeoweaP
         JWUD3IO+vAiurkQhI/6KhNuqrmQzsjhSFJPXpcXH9y115EFGXO/uThqQDSzRmRi1UEht
         oFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721269556; x=1721874356;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gklRP1Mg2lPJDFn6YnROe/wcKMjIXNM5Cvhi4UGcBq0=;
        b=aPcXzjAIBByavfqBV5NBP4THWR5k60V06hRhhe52JouqE77CqsrHi6pYTYDtsnGSJ8
         ozcp/NRNLJPUQ21IYD2vw89Oc5jbh76Q+mpLmK52bfAlLO6ioiu0GCOrjT/5IoTo586U
         gv1e7tZSiBCdaKRToUJLYxnsiqqXuU97Vefi2CwuFHsgmpJbc5EyJrZLr3UvoVxfIv9n
         N5u48oOfUKU5To/RCvpy8r4eoMNHyHzw7zcBqKMFse69XwyGWfZn37AYUgezsFXP7mWQ
         8k9dR5bULtAPxW9jxn3tJwZ2D7IJ1Yd0tEsiSa+6k1TQ2kTuiO1grOlG8tLodFjQMqWH
         VJLA==
X-Forwarded-Encrypted: i=1; AJvYcCWl7xpDNfbiMWwh4SddWpkQFlAB8Xm7On7ZOx3c/UUxAYD0gefPRFVT9FyMnpRIHdR2eBf8okeLGCUjr8kzBOdmKB27O9TWskoT
X-Gm-Message-State: AOJu0YyhrHYn3j3INxR+WUqKkmARCIQEcvXNaSJhHYVHDYbUat3hbN2n
	VWAc2yFLQ1YIAuVr+QHg4tKruqtbCEIUW2EHVc5d2H3qgOmEO+naQny1ZSnLmGI=
X-Google-Smtp-Source: AGHT+IHupNh4IdHfYITPiJHzo+24fJypzIvoRScwFusZfpcnc4Pu3dq0o5eCy94zxrmTygwA8vdt/w==
X-Received: by 2002:a05:6870:d206:b0:260:8f6d:f029 with SMTP id 586e51a60fabf-260d9504d8bmr3106193fac.42.1721269556637;
        Wed, 17 Jul 2024 19:25:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eef3:26c0:a400:406b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260ee947f82sm192994fac.50.2024.07.17.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 19:25:56 -0700 (PDT)
Date: Wed, 17 Jul 2024 21:25:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: sophgo: clk-sg2042-pll: Fix uninitialized variable in
 debug output
Message-ID: <baf0a490-d5ba-4528-90ba-80399684692d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If sg2042_get_pll_ctl_setting() fails then "value" isn't initialized and
it is printed in the debug output.  Initialize it to zero.

Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index aa142897aa5e..24b0eab6154b 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -387,7 +387,7 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *hw,
 	struct sg2042_pll_clock *pll = to_sg2042_pll_clk(hw);
 	struct sg2042_pll_ctrl pctrl_table;
 	unsigned long flags;
-	u32 value;
+	u32 value = 0;
 	int ret;
 
 	spin_lock_irqsave(pll->lock, flags);
-- 
2.43.0

