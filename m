Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7EC1E285A
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758859409; cv=none; b=jEMv29wo8oi8kwiBZlcBHAnuvDjOMgZ/HN+gPMr7+4iK13r6OE+cHatT62r18YMOtumuNYiwXxLF7X7NZmEsozenA3yNzbw5a173uD407S1oXmArKGnhEbzQQlivxveJCFBCaH01FZqoVsetgQCKwtyMoYReT1YdFcmv1CFbB/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758859409; c=relaxed/simple;
	bh=CMUvU7Q/eBR+laEBfAb7ZGtG2rKSkDFVZ54Tf8pVcwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRdfA8mGelNBDvCL/qAuvttGVNPybk5UwDKqBPadvE6lCj3/q+pVnRkuvtA+3GBPp4o5pwJ+DEhOzqfXJuSo0RPHf+DjdJ5tkDey6vh3ZYSgTv1zSbGBdLTBbrvrQ1wHindIV7WnQMjlNyPtcdWXoAEedSjhHrM98mXE9Q99OUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C5LVsrD7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C5LVsrD7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee12807d97so1767122f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758859405; x=1759464205; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=;
        b=C5LVsrD7/UCaewr6N0MlOvCA+xFcx0MbNr/0lR/82Q1SJ4hL3z3xYVxdVgDKRlmlU7
         V5oNniYYrv/Ar5i01vWX/2lTt8/fWEcCcngLuGuYklK35blRSUW9nfutCyJsPBYVkxtA
         CRbDRw90Z5J6NByc/CUB6w53ONR42xZnVfC6NeCia4bxszPRA+K/wdo2206rRXfqh//S
         370GJFljHk9oT6iiY0CuKrQDvSXU5sJM4yLGiyGftJGI7fqvVmFLzoPS/iIodMJzWYeY
         yF4d6fNa4XkpghA/bJzeOXofAISyeLqzIXKSuC4PiB5Y0ZMWURdKIn5JLAmw24ilsn7x
         WDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859405; x=1759464205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=;
        b=KP7HZptzq2zYbasWk4MfxIZODuWkCYHIuBDn8ZMWT2sol6okXILs51q/pDRf1RjCLk
         rgo1FCiGs50yZCwuDk0WUPrSvZJU7ZQHZNgZEYa0sMWLeDI5PcdqNk+AwItKrJszRcSE
         8qWnlxe0b61B457klyUoD46aok636Qgc9/NpYdYVxzUeZn27gkNss23ip6xYBzDlk8Sq
         h8R7s+v7/GpOZu1XCts+ZqHHUbTs7OFVr5zO2yMzTXIW8SWTXvZgTZ+/WRhm8BX7O+UJ
         6P/gMp1X3xI5XrENi9ve/kpL6UhehN2PnvxsG6hwTjlUV9cGiXKq/bm9YqBnDBMWtIgk
         iknA==
X-Forwarded-Encrypted: i=1; AJvYcCVwR7JhyeTjX7Y+Ij7jfOF32R5bogugq37HnSvH3biziVxAdhVpHusVih2LkmXFgvXjlTZ9XksCQSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28/MCQi2SkhXQbjPVTXOwuZOMGkmCO2ZolNcPW+bLqCu93s5b
	hogrSJqN1RAgar3mrxq1z+SleO9qu2Vy2ylMPRXENsLOvfWdllYc+wghxlmAgDkx/HA=
X-Gm-Gg: ASbGncsZdtw1tWPfgWZE4kNx+rr0kNtP0P9Y1O27OoC3M5cVikoj/V0DOrgZYevfS3E
	KghxjRPLEqUdbZKYbzy2d6xft2Hb6jWEYp8bSU0ua0E592de4D3POaWmoY0ncfg9tvY1rxpggCF
	0FNmmBFFeabwyogrUkK0kbcu170o1Kc1VadxFrFYfsJ8lFH7rC14YkfHkEkUUjSZLa2jwgQWOha
	jGhDgED9G7FuEVWFl3beM4eZyshlD9BcexcKaZS+/FYGRioW5DDvSH22HSjxTCM6ecrPkHpZRSP
	fgFmigFP1NHQiKfHAmQe3lcQz0meW1D1Z0aPLPHy1esxWiOuT9OzpdRjVnAGZfcj7zKeJoWA7ai
	BT962z7klS6HQvsDItihHfbZFTvY7R/N+sx7Uljg=
X-Google-Smtp-Source: AGHT+IH8jSZ9cVpDSOMeLWUT/1JDNyhLeRJ9I2gTVKvtZXYra39O++P7RTag+3K6FCsm4O/uhokkGg==
X-Received: by 2002:a05:6000:1a8c:b0:3ee:1279:6e68 with SMTP id ffacd0b85a97d-40e4ce4baf5mr4739778f8f.47.1758859404873;
        Thu, 25 Sep 2025 21:03:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fe4237f32sm5197655f8f.63.2025.09.25.21.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:03:24 -0700 (PDT)
Date: Fri, 26 Sep 2025 07:03:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908: Fix IS_ERR() vs NULL check in probe()
Message-ID: <aNYQiRJDmOO0mEWs@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_auxiliary_device_create() function returns NULL on error, it
never returns error pointers.  Change the IS_ERR() check to a NULL check.

Fixes: a787ab591c38 ("clk: mmp: pxa1908: Instantiate power driver through auxiliary bus")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-apmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa1908-apmu.c
index 7594a495a009..e374d7733f56 100644
--- a/drivers/clk/mmp/clk-pxa1908-apmu.c
+++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
@@ -97,8 +97,8 @@ static int pxa1908_apmu_probe(struct platform_device *pdev)
 		return PTR_ERR(pxa_unit->base);
 
 	adev = devm_auxiliary_device_create(&pdev->dev, "power", NULL);
-	if (IS_ERR(adev))
-		return dev_err_probe(&pdev->dev, PTR_ERR(adev),
+	if (!adev)
+		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Failed to register power controller\n");
 
 	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
-- 
2.51.0

