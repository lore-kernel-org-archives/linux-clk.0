Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839EC41168C
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495111; cv=none; b=XkLd61EauNO1s8de4KbGkRp3mlSWSRtmb+M4WA6a3razG+K/BiPzDSMKB0uNKQJRPOzcqyajwQZSN8sdvcIKFfKWkSWBdHOtWIaG5yDmumHLIFjvMDjCs94jRuFFkpSqhGzGd/c88CH3JasBEZLz5A/Q3AMnLj2F+ARMFXZ+oQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495111; c=relaxed/simple;
	bh=SfG8vwTqe4TcUJSbsJF8gE20YotoiJTOyVPoOfSALB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBt/S9TWEGoLXmwIz5B7Vmgddqv28qCju43g4Vq2XEL08ElTP42DZK63VfHziJOHKpfvlJEmXzXiCWXH6poptgH7jxpOFtVuQtJKEwBjudU13ff2HD5MOp2SPCaeUlvRstgfwXdwWb2EZBK8LbQ8GEjvLSFY/dePxFh+CoYn74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GawNDlmf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GawNDlmf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so415555e9.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495108; x=1790099908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+H1sTCqogfHVEMIyxU/sX424jivm8nyc1UeMZaa0E9w=;
        b=GawNDlmfWcfonlHpEv2QPnsToubye99ITpC660uVyOUma1lJLN78dEdi+5662J3aKA
         S1mYuOg/zwuGe9AN816/bn50SZYks2gLdey6NS55vJ53FMScFef4PX1t9St1T80V8Iyy
         odS1aPShkw2ucHTwxxARWKq3BSh1+yPTs4UCjlDmiaGAJqMpSeQyHZFOYp5RuHwhb3q5
         NYe/cnr0uzUTPH9ZCXFTwDGwoGRuRBW3Se3090XcrGcNAMs6+eoKURuGjwxM9WsRLOHW
         oB2VlmhwF1IQM0/3Pe4RnrwEFP8637NIILAhkAyULEUiTlW14QyEuAJHCiz5LRlyQk7y
         yqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495108; x=1790099908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+H1sTCqogfHVEMIyxU/sX424jivm8nyc1UeMZaa0E9w=;
        b=bRVeCdBDkT8lmEGFK8SZVw1J0IzM0eXsGAUaAX11gk92p++9whHJL1dcgXJXp92nX0
         Vvwi6T/xctWp45GvjB8+PDm71vCiKNsO1YxUSLdeWBVC8617dRIP9BzHc6YHIO6SIY7j
         DSa1jSpqfgDo87P4pkDGbauMEWB4Bk1SIaptpetapTbx7cS8fR4ljoBDIbqk/0KMjHvo
         UrbbCErEEeTIVVp/uEmT6+d3tsuSSX7mVPTHeM30nVIHVp8Oli0nnqu7SkZA5N6wHc5N
         i78JYzu5gZN/wpwBlYX04B8z0C/MwTR087JShFPiDj87roc1F8iV52mldqnCnfz57FeP
         uBZg==
X-Forwarded-Encrypted: i=1; AKwUvByo90BdCYWFZaMMgSezVbx2binmvDH6njKhRJc06yNBKld9/1OYM+JujmIf4GKqahdVGsiIrjp3Z7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mxxUPiD2K7R08sUvEPJuIUK93ag63pcHKZuXKbJ+LRvack6B8P
	4cvTmmvXEfHDzCCXbpwqwmrcOw+oxsDhOS9PwfMSTAYnGUSQEDmLnUta
X-Gm-Gg: AYBFou3AfzrU4IHtgvzAKb/Joqyq9XF/5tQ0F+uXdv4oWi5HqSr6QUiXcQWsB3I4vKc
	HLpAXd2CtbWY3nQuGaQLPAwqOu1W7mKiH6wCw0zagKBYLbX9493gi+mLxHxl6Z8kSGwe8V5SB4e
	8LUqX1B8DPWt5yVlsp4ZlWUlccfiocsRgpv2fksfzBHbIVG2+9SEPtPhauc/cHadl0FIL0XYPKI
	m9d45yN10C2eU+OPSP6RsW0Th5dnuCdJPUfU58KFjsqp5kBm03uI8mcROHaDHdDotjSwuu3MCzN
	Gu7EmuPlkHUH+U5IeVz0mBA+SlApVaZBaMyqcZ+c92ZC90hA4lBaOcssJED+PkIglJd0vjnCsiu
	XqiMOclf03zpu64KJ0I8JhluWICnWOrYTy5bTu3ZuROEPz0d7PEuSgwgX7ItUN+zZQVJg5MIRMO
	t6h3ulGgPnrfbWoxmBUR3ViA4hlqjDFcGaSu1kL3ZLTNRID8FG6Q5FjZ2lFwC2RUdNe84JmYIje
	4ClKg==
X-Received: by 2002:a05:600d:8652:10b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49e7d73dcf2mr47539035e9.9.1789495107673;
        Tue, 15 Sep 2026 10:58:27 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm755687f8f.9.2026.09.15.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:58:27 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:58:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <aqmHP5QaqfC_St6_@stanley.mountain>
References: <cover.1789451862.git.error27@gmail.com>
 <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
 <aqmGLBRaLwQ5GpXS@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqmGLBRaLwQ5GpXS@stanley.mountain>

On Tue, Sep 15, 2026 at 08:53:48PM +0300, Dan Carpenter wrote:
> On Tue, Sep 15, 2026 at 07:38:23PM +0300, Dan Carpenter wrote:
> > Callers should test the return from of_clk_get_by_name() with IS_ERR().
> > The function returns a valid clock on success and an error pointer on
> > failure; NULL is not a valid return value.
> > 
> > Document this explicitly to prevent callers from treating NULL as a
> > separate failure case.
> > 
> > Assisted-by: ChatGPT:gpt-5
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> > There are a few other functions which look like they return NULL but
> > never actually do.  This is one which has caused some confusion in
> > the past.
> 
> Sashiko says that it looks like it can return NULL.
> https://lore.kernel.org/all/20260915164913.597D51F000FF@smtp.kernel.org/
> It does *look* that way, which is why I'm adding the documentation
> to say that looks are confusing.
> 
> It's pretty normal for these types of functions to return an error pointer
> for errors and NULL for not found, but the of_clk_get_by_name() returns
> -ENOENT on error.  https://lkml.iu.edu/1810.1/06936.html

Doh.  I meant -ENOENT on not found.  Error pointers for errros and also
for not found.

regards,
dan carpenter

