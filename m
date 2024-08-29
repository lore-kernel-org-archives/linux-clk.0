Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F739AD6
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917885; cv=none; b=KBxo/sv3OfZ/W9dnjnPI6jbhY/AnLdio1vCne9eeiByM5WO4471EyZ6Oa3o5HSKMORiq+JjlnrJRmM8CabD/VQHaRF4u+7rglEhgy3oQYiyusE3VrkUx9ruqD3ooRHHtYk4SbSkV3FdB9Ph1C8rxj5j0W+n+su7NehiXNNY64cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917885; c=relaxed/simple;
	bh=b1iu5bBGMN/WRY5McVNmPa0sPk6pBt+y0aWDnZ8I4ZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W4ju3n9YhgqCJ+u14nerk1hKq8a1bsx9sI7ahSGg/F4qgacBj2XxX69H8swfckd8sR3Id6nRxh7D06i4lWv6PwBC2DiFsibJVnP1Mi3V8cN/l4WWuA1ZqXFxka3prtZWS3kB7GKPOSNLvGfWpANh2uTQ7Ir9WxY0EYyKmdD6/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7v+ak4i; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7v+ak4i"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso404443a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724917882; x=1725522682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNl66AlqwT4cAqEjUDGMGS3KRyt0fVfw/DJnltkCvlg=;
        b=f7v+ak4ix8VzdB6MuDGKwZJa0pGjw3pg/ey//Sanx/Y/eOJeq7xTU6BQfTp4wCEZcw
         dkDl4oJVYHcGE4B5NU+KqB5yuwq1/+tPm+9sSc8yIjjIB00H4O8ihIY7EClaO8Ok3edT
         0a3Ki2uXJ6v73eBk7bAWp+YN8YPHoEnBPmkjDC4ce1hg466DuzDFHLITZ9YHSrhY57vp
         6YHXRgtSlWq0/VmOX1+QQCSFs5+wt86yeMIt171rfLUqdcvQ4bH4kvcH8GRUCvHLRPxC
         tKEPFUL0r3E/ukUJVu37aPDENXPH0nmvj6UwqAbkYUY8IBYKutPaygsotNi3ZphD5W93
         ZGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724917882; x=1725522682;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNl66AlqwT4cAqEjUDGMGS3KRyt0fVfw/DJnltkCvlg=;
        b=bMZtFUoqy1/AT19lUtb1AaOpM9LbWmlP7nAZ7SaHusAn8Woj5WWapeqc3Zw4rShQDH
         jptCUreqFYH5UrFNzWVWH+olft8mTZWpBK54KPRG/gPbJJLsEKXjoPhl+ENEW0XmritU
         CVanZ67j8+DdiMdf3+PjN8JALfU9JTma8lJzXLjE57QEbPgJCFleJ5r3j3wmZAunnrVx
         soZ7g2+8n9QmVfFHTDnJCsw0eYNIn1m1o1OwqMnV7jdFIl3gw/JIeqQY+uCt0FehXCgV
         rtF6a8dwGlMuLKUXF6PANCyd61Sjj4GfI4lbR1B6MMfQG/7fRKKSKoo5t9z0Eko1NoKg
         2EMQ==
X-Gm-Message-State: AOJu0YywcjQiLyjY8ICy2y95Ki4JUB9RZ0eurfyv8cjNbHmuGU5Bh+Rp
	M7AuCp1feJiApGeZ+dlssAeEOO64gokTXLeF0MTX5kL7o+YB8yqYkLNLHVbuXtU=
X-Google-Smtp-Source: AGHT+IG8huFuC9IMIewGRzZFbVOx39XRXGgjaUUrnzV5sW03EE5Zh6Qoa3HKistxnMgRVRVgwscq8A==
X-Received: by 2002:a05:6402:268e:b0:5bf:dd0:93ad with SMTP id 4fb4d7f45d1cf-5c21ed8e66bmr1506357a12.27.1724917882000;
        Thu, 29 Aug 2024 00:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce4fb9sm387010a12.87.2024.08.29.00.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:51:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1720600860-18866-1-git-send-email-shengjiu.wang@nxp.com>
References: <1720600860-18866-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] clk: imx: imx8: Use clk_hw pointer for self
 registered clock in clk_parent_data
Message-Id: <172491788069.2543084.96108740575044278.b4-ty@linaro.org>
Date: Thu, 29 Aug 2024 10:51:20 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 10 Jul 2024 16:41:00 +0800, Shengjiu Wang wrote:
> "acm_aud_clk0_sel" and "acm_aud_clk1_sel" are registered by this ACM
> driver, but they are the parent clocks for other clocks, in order to
> use assigned-clock-parents in device tree, the ".fw_name" can't be used,
> need to assign the clk_hw pointer for the imx8qm_mclk_sels[],
> imx8qxp_mclk_sels[], imx8dxl_mclk_sels[].
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8: Use clk_hw pointer for self registered clock in clk_parent_data
      commit: 35121e9def072aaa2361572829e4f71f80dd6e8d

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

