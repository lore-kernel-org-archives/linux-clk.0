Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACDE13AA2B
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729627295; cv=none; b=KDqL6kYTx5fdPTYGQ3of24oRuT9z1K1KtsAi+JthS/lnl3faocvwFi7XIqwhBhKsb2JuxqC280g85DSovB7Z4dxs5PURqJGvialYYZ4MlOO3zyXaMkRFOP1PxdE7pYybD2tNaOsQZkeCZt+RcRPqjZoQj4OL4z0Y4mVEpZTSCeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729627295; c=relaxed/simple;
	bh=cVgqLifZm79XIs69QKfw1Ehv1Wwo/xbmAtYPEz0QLfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA7QAUAL101IcHky5Ai8kAn+KSsS5h4Fj5dXqN2uw0iJ9CWH5juJzeXoWXonvBaYV5J/9IUzDcmcz0Z31H5GckJFc2HPq9xyq9Mstiuduk4DZkG8IQPJwUzrJGTzhLVFcy3BSiqX961uoaJ84Eqq0bhPd6dL3bQS7p6dkCwEVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uvqtBqzd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uvqtBqzd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315baec69eso56296525e9.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729627292; x=1730232092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcN1PJ8IKwz+iLyGFmoK5Ojgzz+vKfU5a5t/+AAhhpk=;
        b=uvqtBqzduxGkXtsAqMVY/cygeP8ElBbeygqcuOysUCPO2HRIwfpTQFcWUb0MFdllo7
         5UJ/6C+pcjIAYHP1XO3etO2XSbVDlFSwAmmW6pxltgE2mJw1vHi8fcRJc8y6+aHS2ez3
         QrHPZOmDfVXMxoxuiIcENxfOLpyfTlt3AfkQfPWTITrNTVgJ2Gn6QZrSnwoXgLVH54TN
         blX6s6W7J2EYtWMOW0RaXSsa/NCpN4dTb0f/pYNODAMLu56zG9oXUBixNn5iviyBbsOB
         5HVngQhGhll70O+1f5ljB/PP7ZGL4Il+jSZ5gcAHV2nS9izfAdMeBOE4GI9epfXQsP1R
         XiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729627292; x=1730232092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcN1PJ8IKwz+iLyGFmoK5Ojgzz+vKfU5a5t/+AAhhpk=;
        b=bGF6hsxI47nAXrTqS8ts2StUGeMtLlIuNQJEt8sJBPjnCzmWqMx9yqOTNzxQy06UoJ
         JbTdJtWSYAdparttyV9k7CeH/9uvNjZAkVkXxyPlqsQa4mdK0BKlT6FfhhL6B1jFXmpQ
         IfQ2O0OpHyzoPYU0EEvl3dd9RDWNR3yEwaDcZLzMzJl789qWeCS0985rvenNc/0fm/4a
         n+zlvYwJyTMSUJFaSpPxMG4iBZKKOEh4ajMm0mxI9OX2fsuojotsqcdnkWW0Wk5uxCtH
         QcN4xhAzEmnvL7W6yubmD67W0YmeKEV/fgPSEMy1OXFWirVpihdLyxwrV84uj+Eji72F
         wfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsTMRlp2+0kfwBTrzZHuZcaO8iArppxT99LuUkG4c6NhmUrJWy2QQKHkTqTWj0gM2jd+xgSa73PpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwONdZfhvRFK7dyH+IRqhcf9n+GtTlC2pWuc0BFelwVaKu0uv20
	nbgs/ZwVcmbAqN7rzPHzL67nmSySu/kvBtz+dfE2Whn9djjNomXL5CVn4S1WNHU=
X-Google-Smtp-Source: AGHT+IEu8LVU4WAs6UoSxhmwhAnqHo9rvH/VrFYT71KN4bOvr2LcIS7wJU2Ktt+KWztiWUysGPhGIw==
X-Received: by 2002:a05:600c:314a:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-431842136d6mr2572535e9.15.1729627291728;
        Tue, 22 Oct 2024 13:01:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57102asm96497365e9.1.2024.10.22.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:01:31 -0700 (PDT)
Date: Tue, 22 Oct 2024 23:01:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
	zzjas98@gmail.com, chenyuan0y@gmail.com
Subject: Re: [PATCH v2] clk: sophgo: Cast an operand to u64 to prevent
 potential unsigned long overflow on 32-bit machine in
 sg2042_pll_recalc_rate()
Message-ID: <2bdfbba1-544a-4bd7-9b51-e239540c86df@stanley.mountain>
References: <20241022195500.8805-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022195500.8805-1-zichenxie0106@gmail.com>

On Tue, Oct 22, 2024 at 02:55:01PM -0500, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.

Fine.

> For the same reason, adding a cast to denominator could be better.
> So, we recommend adding an extra cast to prevent potential
> integer overflow.

I wish you had removed this or said that "We recommended that we cast
the denominator as well but Dan Carpenter said that it was a max of
3087 and was not even vaguely close to the 4 billion mark needed to
overflow a u32  ;)".

> 
> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> ---
> v2: modified patch to numerator casting only.

Otherwise, looks good.

regards,
dan carpenter


