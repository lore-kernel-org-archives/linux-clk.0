Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5251BDA84
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620721; cv=none; b=rJiWUxCbfpDAiqu8vxEW1gMZPIPvNQms4P4sQc3N4TU5A8KkHqORVl0znDwz82omAX/y1n9ICJ8zMoOb1hKDw7NKxmbgTjjWp2x8AdNtDP3qpxdExlAh8mVEXGLn9O04pIe8VROFXHKiismwL8vP0qL355MNe2VjZNEAkyRVFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620721; c=relaxed/simple;
	bh=eXTvoPKS+oHQs47zYuc2R5ELZCFJhy+w40ZN10IJ7E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLl8mmB1rGdHQFeunv3ktNPqK+L5ZSzt/vpL2K/Zh5HqLPWA+d2H6RLU0LvdOlPwiqRd/7Yxs/Y9QyweCQFmf5ydsRE/xkfBt13mfGPPdpFjS63E5kWgfsmc4HASsNhR8RLsmJv+HmOx/C0vfjWxc63u6xz9g4i7uXPnuC9qM64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpU3apr4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpU3apr4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so4281596f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729620718; x=1730225518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7UCh1zlvLvWNjXtSwm7AOTOHUIC1ypGlc0QUjncXTk=;
        b=kpU3apr4vjErHfVDB1PQcBNXFzlhZzqAamwqnJClP2OvzNh0BS/siGNSMwxoJ4VN3/
         fs7BXURw18SdQLxldcUCCTp+ee+m/I4ZrwpWk9wxjyX6vHHWy392Y6gbZz3cs913FIAo
         6DXs5WQ/9THVuqQEqEJ7zK16IUZLRlCBDUNZp4Y2q4K6hkjupXQFJ9gcHjuhKAL85nB4
         gW9zPFbl5BEQj2yRs9WOP/0LKnwboAmTSLG8+OF4UOKh1CfwZ7fRz3Jc34VQ7sfdCEfZ
         M5GdhCvf/QElydhx15qH5O1aXx5E7LEK3Z6HcxiQdoBiTUulkigrRHZR8rTieIUDaPZ6
         Pibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729620718; x=1730225518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7UCh1zlvLvWNjXtSwm7AOTOHUIC1ypGlc0QUjncXTk=;
        b=sj4GCR3wQmQuBhnSF+gyS+innXUUIi+C86JBOr35ZHKSQqrqhXixkXbY3t9ONXZ0qA
         MLLKjUuBxztsjYqD5hF8AoIGrlCK9fZ93JpMWy50bkPDLVqOvU7XqrO3ZdZNSN4rp21E
         IyQuUA+Q4p2p1r9b63WrQCaUnMBjtnicIBqGVmyXzqcXMIp7B8O/QtyXy6DK+E5WNCr/
         nvQTzMM1m/tSrHdLmCltlP8Gt9n0lPxYaE+0h4kL1EyQTwOLbx+MjjWXsCqkSQog6xkj
         nhImMOqRklHs9TKznjJJ6+pHnOLAjJMEBgjZ3q10/Fq4vX7wvir9vHkY0BNsiP3EpGH5
         31bw==
X-Forwarded-Encrypted: i=1; AJvYcCV9nuFvf7eOjr3XQDKG82uQxZQD+3M23mQJuSQMUIs7hf1HzCH8cnNsLN7SojQ4t1TzCR/B1zW+qRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6VUYjjR1fcQPuyjv5sqyGrtgRsTmTESM3HI7G1iNmZhfrGTWo
	m1ncCBUoVRBDi1oluchCqFquP842/tdcwqXzNuxWXEKmXKLJkO4rJ/bsQEuq8b2jFspOjmZYF/2
	ulYQ=
X-Google-Smtp-Source: AGHT+IGBR2rcLdVyu5SITxTQ/X2IRUOJzqygSqK/0j3VJAW1qReyCqWZuR3Z0+UiMFulhXzyZlTfqA==
X-Received: by 2002:a5d:4c86:0:b0:37d:5359:1ec1 with SMTP id ffacd0b85a97d-37ebd3ba162mr9273663f8f.57.1729620717867;
        Tue, 22 Oct 2024 11:11:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a47b74sm7106636f8f.27.2024.10.22.11.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 11:11:56 -0700 (PDT)
Date: Tue, 22 Oct 2024 21:11:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zichen Xie <zichenxie0106@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
	zzjas98@gmail.com, chenyuan0y@gmail.com
Subject: Re: [PATCH] clk: sophgo: Cast an operand to u64 to prevent potential
 unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
Message-ID: <96e884df-c8e6-40ba-a457-06566ec3a3b0@stanley.mountain>
References: <20241021205101.13416-1-zichenxie0106@gmail.com>
 <e88d7bf3-fd7c-4944-92dc-f2224f45bda4@stanley.mountain>
 <58e8cfd2-55f4-48f0-a9d5-60fff76d7abe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58e8cfd2-55f4-48f0-a9d5-60fff76d7abe@gmail.com>

On Tue, Oct 22, 2024 at 10:39:42AM -0500, Zichen Xie wrote:
> 
> On 2024/10/22 2:58, Dan Carpenter wrote:
> > On Mon, Oct 21, 2024 at 03:51:02PM -0500, Gax-c wrote:
> > > From: Zichen Xie <zichenxie0106@gmail.com>
> > > 
> > > This was found by a static analyzer.
> > > There may be a potential integer overflow issue in
> > > sg2042_pll_recalc_rate(). numerator is defined as u64 while
> > > parent_rate is defined as unsigned long and ctrl_table.fbdiv
> > > is defined as unsigned int. On 32-bit machine, the result of
> > > the calculation will be limited to "u32" without correct casting.
> > > Integer overflow may occur on high-performance systems.
> > > For the same reason, adding a cast to denominator could be better.
> > > So, we recommend adding an extra cast to prevent potential
> > > integer overflow.
> > > 
> > > Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> > > Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> > > ---
> > >   drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> > > index ff9deeef509b..e0f92f7a21bd 100644
> > > --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> > > +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> > > @@ -153,8 +153,8 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
> > >   	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
> >                                            ^^^^^^^^^^^
> > > -	numerator = parent_rate * ctrl_table.fbdiv;
> > > -	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> > > +	numerator = (u64)parent_rate * ctrl_table.fbdiv;
> > This seems reasonable.
> > 
> > > +	denominator = (u64)ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> > These values from sg2042_pll_ctrl_decode() and there is no way they can
> > overflow.  The highest they can be is 63 * 7 * 7 = 3087.
> 
> You are right. But I think it could be better to add this cast to
> demonstrate that
> developers have realized the potential of integer overflow.
> 
> And it can also prevent some static analyzers from reporting such bugs.

Pointless casting is just confusing and harmful.  The static checker could be
fixed to parse that code correctly.

> 
> Anyway, I can still provide a patch with "numerator" cast only if it's
> better.
> 

Yes, please.

regards,
dan carpenter

