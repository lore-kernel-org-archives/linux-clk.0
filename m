Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5514A639
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669293; cv=none; b=U4FwbgK9FH6eudVqDYrUSvdTr/kw4sct6cE4c7iAp4Zf361y6ZjGeCyqofQTi+2/ibPZO4wlJWy4MzhQ4m7mf/5KDaxhoE0UOd6Xf83OFRmPHerFC2Kixck07xWNV/pFAc0U+yzfwG/4EfCdeRkEjS3LTW7kU6vEtVcM+thHWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669293; c=relaxed/simple;
	bh=ZI5lBMFc1cHoxFZt7vbWopLugLAjVJgryNo1vtwHACg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMqA+mbegz4CDPLcK6qOb69yOFKUeqg7i5PZCFTUOSylvtx0yLrl/64H5yhtQUX1p8E1qEqMTHgzhdKA23HujQe+ySc4MW8VcEiM7FH409gvw95T4aTA8DNcztUSt2FwwvqyYysowxNE9IEqSf/0vUQzfaUIRTESeeJ+kzBzHQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j3C6v0sr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j3C6v0sr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314f38d274so88339535e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 00:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729669290; x=1730274090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fINfXd1URkGNWSL6T4uCfJrxT71As1APHUtMoAdVhOQ=;
        b=j3C6v0srL738daoX1qMLfszZrP3BK6Vwqo7N5Z8cKjtomTPN8jzJsGSeaYmm+PQG7O
         Yk4qZnCYBKO0zY8LE8HarPj5BEhA++4ChZwQbZF9PGJaOMXir3FisOOoaijeSQjJ08YA
         DKKcsNoohGDNYStGPbBBHNVSNaWWjU3fodGa6X6DZPvjLy5J1htMtOPHM6ZoYaKkYvYw
         Cy+kIpqrWf5yZ8lIBEm+Luf4NTdxpSLteR/eBGyZTPFqB8I20fKaYUjsmy7SfLx15GPD
         MmtR5/PdY5M5/viJROBIzJ/uDMNp/cIlF3Vc1eHYcPRe4Nz4XZXjB2Mo9FHDmCR+cIkq
         AXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669290; x=1730274090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fINfXd1URkGNWSL6T4uCfJrxT71As1APHUtMoAdVhOQ=;
        b=bvCRy0TLKw7AoNnGJeJC9cUgeSgVSSUrjCyaedq2fkHRD+iYTmtIebkLDY9tSsa/sb
         w2tphkZcYaFJsPVC+z0t0ArD8kN9NxpE69SaHvEoNO55rAv2uMbb9LtaK4pgj3FG6Zei
         BjmDJH2JVht/fDuOSu/wsCnoDqQdSR7FxN/BLwTcWDOn9uP7RCQ3LgrHQ63FQh1i+F/S
         7A+4WGAPb/XrKb4sh45n9Jg3J4ZGkTIOObmxXfET4Hh9JTXEbjO1yEiiGFCFEGOLad8L
         9umC6MAWqframKvEZSWO2xlU2vnT9TKEzYl59SVqb58RAQn9u5faaWPvUfU2LTm2gQaf
         LvIA==
X-Forwarded-Encrypted: i=1; AJvYcCV7QAbvQ1SsmOoofAIA9Ll8H0yAAZ18ucKAQxcW5Z3y8GiqRp6t/qHSaexE+E+uiukpKXh/Wkc7ISI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEEz9Aq3sPvUKRKuaycvLNtsPlVW0KnOmlCZFG2+SWpmf39qc
	gqI/Vve25nc9o4gzZQnWyUrNo/igHSuhwz/FTJYnnvEmddfzAprEEyug+Jg/KYY=
X-Google-Smtp-Source: AGHT+IETtTA+q2R72by0/y0KIlH+T4SNsmlzmtXYYdzd/dukKzZOWh4GiDtpD55w/iv+dNUMgreyLQ==
X-Received: by 2002:a05:600c:4fce:b0:431:5465:8072 with SMTP id 5b1f17b1804b1-4318424f0e5mr15375945e9.31.1729669290189;
        Wed, 23 Oct 2024 00:41:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c0f1eesm8458855e9.35.2024.10.23.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 00:41:29 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:41:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
	zzjas98@gmail.com, chenyuan0y@gmail.com
Subject: Re: [PATCH v3] clk: sophgo: Cast an operand to u64 to prevent
 potential unsigned long overflow on 32-bit machine in
 sg2042_pll_recalc_rate()
Message-ID: <13b95ab6-bb38-4b05-9c3f-f567c32cc902@stanley.mountain>
References: <20241022201244.8992-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022201244.8992-1-zichenxie0106@gmail.com>

I'm sorry, I have let you down in some ways.  This subject line is too long.
It's 126 characters long.  Please change it so something like:

clk: sophgo: avoid integer overflow in sg2042_pll_recalc_rate()

On Tue, Oct 22, 2024 at 03:12:45PM -0500, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.
> We recommended that we cast the denominator as well but
> Dan Carpenter said that it was a max of 3087 and was not even
> vaguely close to the 4 billion mark needed to overflow a u32.
> So, we only cast the numerator here.

On second though, could we just leave this out.  Let's only mention the
numerator.

regards,
dan carpenter

