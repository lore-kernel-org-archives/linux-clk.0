Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D21DC98F
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723583; cv=none; b=jE9hWbcCxmnXpgxAmaGKNIw7euPphqKZC9YA5YvwpJ01Gn+yUVQxvqfPaNbRkZXRgJWc7FP/heXlJg302/feFRuwM5HcjACYEy2bmtDExJTAkzAvwq+EKvTw8vKRb5NfqRCFM8xtT14aVJsTsqEeduU7pHMGpkpVx1ubT+pjTEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723583; c=relaxed/simple;
	bh=qrwOsXO9LQ0XhMB4aywMF7ifzv1CDRWM19WKfNkYaxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUYGknuQgXdOEhftX40YCkBRlJYlyt7zfMGMFYIMQaib4VWCnO2ISDKBVW0wfyTZPU3l/OyZt/82EdYCPSxnqzUHb641jOSw8/DiH03OgAGUUbBgQKy3knhc9/pS2EqYt7FfF93HX18uTyrbKn4LJmreDAwr3pJRt5PNedOd7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FXBY3WfB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bwau/4Ds; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FXBY3WfB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bwau/4Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784723580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHv4LfvJs81HAHXg2ZdfeEfs6S8C8zkyh5yXF3nOHKw=;
	b=FXBY3WfBrd/X8J6SoDkTMlvPG9TqTr5966lpbTDk9yHctRSRo38jKvxoxzkH7KEsQgj8Z/
	Pk6qZD4fdvl++nmtJwVr9L7RRJJ7b0SgW0+SBUpqcRKaasCJcGV+6uZCm27PkTrCf6Qg+b
	KRBK1Cn/UHvWyY3jWelCUHUZJfE2/Us=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-hDoZKVC-Nd-GKKy_oj0JUg-1; Wed, 22 Jul 2026 08:32:59 -0400
X-MC-Unique: hDoZKVC-Nd-GKKy_oj0JUg-1
X-Mimecast-MFC-AGG-ID: hDoZKVC-Nd-GKKy_oj0JUg_1784723579
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso2382377985a.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784723579; x=1785328379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZHv4LfvJs81HAHXg2ZdfeEfs6S8C8zkyh5yXF3nOHKw=;
        b=Bwau/4DsbCCuNdr35owLbyhlcws58NombMpJtJwhu/kEXbkbhpX11S1cmoq3cwIJCh
         oFVDrjkpcObomTORkYZULUARln9n75ry6Iry+7ibA0bbJVZim1b6bytKlcRIqjA1fk1A
         W3IjoimU1TwW5S1RGoM7W8+XVDNyD4XJuYXp/OiVMF5V24AYuiMuidtNIlBxwwtLSUXx
         COeQV4P5fc8OQT2oFABG1LlNCXqlJelPcxNYAK4sxlW110x1f28rGZEDo1fpiyI8UWSS
         gbZOHXhKgugdQKFIELSEgiZAHL1Uhmi/20dOzn2KGFQwmpqnpw7x9NGl0A/uuyghI31O
         VigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723579; x=1785328379;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHv4LfvJs81HAHXg2ZdfeEfs6S8C8zkyh5yXF3nOHKw=;
        b=XLodGDqvPW6o5iCs7AovKqvbhkuIabW7Rqes+qDeqtqRGmLzn/HGdrxengcxu2hcGO
         4r1L1+Sek30v2o8bzCnPODMJNwV7G390A75tZgLvRBCiCaZ838DveVzN8ra3DiwUSZG6
         8BAgh3pfu6Or/P/eMozxY5ZIIy385qCA0NWXUsYum8v4/u0G1kuFex+YbcKdtfER0mHO
         1D8maWTo7dl3E2tpZn85RTs+Pl7kPJVF1+JQKTKEt9wFR3LB9lC3dk9QidOKGLgTdLGy
         eiwqGdmGAC9BG2Ngg2OJ4gU82izG0yPPoM8TW/2X1C55KXpBXxmnfugYTpVqA8DO0dLr
         cfng==
X-Forwarded-Encrypted: i=1; AHgh+RrXo7rfyTjk5IH+xC7R5TTuR8k6FS8M70K6JgE2mgv9oUEdnM3sSJWI6FTNeJh+smEiFCXbLeOxgdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQcKQ23lXLyOa73ow3qYPnj9HsFXJokVHB6DbcbJi9x7DH6Sl
	CqJqDBp1DKOD+cVaMdmwkNNROnrf5v1irePH/S7SzaRL44mUPC9anWAct3AJiJM8daq5Yf2rdyo
	w4o019IiMug38Zv74pSd/nT1mY03vdlGHagwoEFGN0wgwSxkwMm1fGWk/Tg66yA==
X-Gm-Gg: AR+sD133sUOyfjHgeSBpz50Zs5jdJAsBnlELTKL/1U5Tr1LgP0ScQ7mrHRHNGOKMBPd
	rQaJaNJkX262n5wWVnw9yeeaZehtsulYBqklXQhYH60TierG7ri//8xMeFAwH+LBBqSYHabZkbx
	jfzp9HodZkOLhI/pLzdwuh82dyk1oloMQUpNfSJXI3FMMJCrrTpJsjI+e2Dzf3itxgl2zjocB06
	0kst6CukJfjpuDVnIdeoE6KWQxAtdiW9cb3rJu1tJnUvam5EaQbhsx0iopkgRALLysJtqxfxvsY
	ZyVMdu44URD2Cbkf2pEaun5Put0cVVYmDRBrXX/EoXE97pQxYPb1QE4vRj9rRk4lRztO2n8n0z4
	gsTOoS701l2e5JlLde2KU86J+3pagqXp56bA=
X-Received: by 2002:a05:620a:17aa:b0:92a:e2a7:d55b with SMTP id af79cd13be357-930b41e281fmr2236194385a.47.1784723578958;
        Wed, 22 Jul 2026 05:32:58 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:92a:e2a7:d55b with SMTP id af79cd13be357-930b41e281fmr2236189685a.47.1784723578363;
        Wed, 22 Jul 2026 05:32:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a6a157sm151967185a.37.2026.07.22.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:32:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:32:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
Message-ID: <amC4d_RMA5oRR-ap@redhat.com>
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
 <al_3V8N9z25ho8g2@redhat.com>
 <1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Jerome,

On Wed, Jul 22, 2026 at 09:49:33AM +0200, Jerome Brunet wrote:
> On mar. 21 juil. 2026 at 18:48, Brian Masney <bmasney@redhat.com> wrote:
> > On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
> >> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> >> struct clk_hw.
> >> 
> >> When a struct clk is created, the module usage count of the provider
> >> is unconditionally increased. For a self-consuming provider, this means
> >> it pins itself and the module can never be unloaded.
> >> 
> >> Increasing the module usage count should only be done when the consumer
> >> lives in a different module from the provider. Use THIS_MODULE to
> >> capture caller's module and increase the module usage count accordingly.
> >> 
> >> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> >> pass a NULL owner. As a result, any provider module will get pinned,
> >> same as before.
> >> 
> >> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >> This issue has been present for a while. Virtually all users of
> >> clk_hw_get_clk() are affected. The majority are compiled as builtins
> >> according to the defconfigs. It is not problem in this case but it is
> >> if the configuration is changed to module.
> >> 
> >> The following modules are using clk_hw_get_clk() and are compiled as
> >> module with some shipped defconfigs:
> >> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> >> * drivers/phy/cadence/phy-cadence-sierra.c
> >> * drivers/pwm/pwm-meson.c
> >> * sound/soc/codecs/lpass-va-macro.c
> >> 
> >> Currently those module cannot be unloaded once they have been loaded.
> >> 
> >> """
> >> rmmod: ERROR: Module blabla-module is in use
> >> """
> >> 
> >> I initially thought about using the dev parameter and compare it
> >> against the clock own device but this proved unreliable. A clock
> >> does not always have a backing device and some paths, such as
> >> clk_get_sys(), do not provide a device either.
> >> 
> >> With this applied, we can get back to removing the direct usage
> >> of the struct clk in struct clk_hw and eventually remove this
> >> struct member entirely.
> >
> > __clk_register() has this comment:
> >
> >         /*
> >          * Don't call clk_hw_create_clk() here because that would pin the
> >          * provider module to itself and prevent it from ever being removed.
> >          */
> >         hw->clk = alloc_clk(core, NULL, NULL);
> >
> > With your change, can this code path be updated to use clk_hw_create_clk() ?
> >
> 
> Indeed the comment no longer applies but I think keeping alloc
> here is best. It avoids "linking a consumer" here where there should not
> be one. All clocks would appear to have consumer in the clk summary, it
> would weird. 
> 
> The end goal is remove the hw->clk. I've restarted the work to rid the
> kernel of using this. Some rework don't need clk_hw_create_clk() and are
> not blocked by this patch but most will.
> 
> Once this is done, we could probably merge clk_hw_create_clk() and
> alloc(), the split won't have purpose anymore.

That all sounds good.

I know that Stephen likes to see any changes that are made to clk.c have
associated kunit tests to avoid any breakage in the clk core. There's
already a bunch of tests in clk_test.c.

Brian

