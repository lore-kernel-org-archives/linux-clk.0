Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF41B4138
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724095; cv=none; b=XYr2s7ToQIboDBeo59lSjNI6t1F+/9+p1KlSC2p9u8MjPiF9vl3SW1z0opG93WCbEycVOSnwb/giagsg8vV529VCXXM0zvQYx/+w3i2HeaKSskxcqIy2kESZQoxn/f/CqOV0ZxqOVOJgrp3dsi2iYHK6f8gnDt+hwB1eUbp6iiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724095; c=relaxed/simple;
	bh=5iYJuCX6lMZ7TNNIDqIotS2wplqEK0u9U2XSZjZMrBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oW4rbMzlIMKQPa0KHMXGGi0OZ0W84sGA5PkE+SUQ580Fdm2kgBw0tVEIGDW5tpL1uY3pVwUQUCstxowNLjCBpE2sEEfaWp0Eeo0s29r9SBnqGKoXbvBaWPMoEK9pG9FGMNXCINhzhalyNt/KGXNI0QHWx4ai531NOZHAwcbv31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HJhDV8LB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HJhDV8LB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so65754275e9.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784724091; x=1785328891; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XKEJ4GerXAvXM3BRhvBsN82I52BHRWShGxcVmHc+dzI=;
        b=HJhDV8LBjYpunaYPpdEXP1iBg+DB2WLroR54ZQwtDiQ8tEP+YRTNjukhMDcCzqV5cv
         m+zYkuoZlDYwYISs0+ue08aY2LIJmS4X5qG8ddlUJW/+dOO2qO8Udt4C5HSGzg+QCRPG
         k/pdAf9zJXv9ffcOQB5GQT1niV+4dkrib/3aqXZW9+ovToj6a5kbXDVOsG7l7/0WO3vT
         Lc/65O2W8v59u0GBjW+3xmfIu01zjy3lE+ramKm96sOPE+WDCFvpjBaLB4W4G9+ANPZQ
         b+J6jZm9iamL97FCds9lnRMzTDDo6Ouy3fRrTXG3mgGJAatUARrxRMTKThz4OSLOzJhw
         jl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724091; x=1785328891;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XKEJ4GerXAvXM3BRhvBsN82I52BHRWShGxcVmHc+dzI=;
        b=F96ucmEmtwU2qVG9le6I49AA9yahD61KSUHjbwn20WVMXFwuaHCsHtxW9kkXOuD4dq
         o46okYtnTjuV+0qVteYvyEOBqT0VqQBbsaGLfx0j8vIgV4ZwQEWYVyFm/iKRyLaQ4mTn
         X9KuKWO0MLFVOOxj+pGzjbaq7d9oPoB5Huql8NyzLjjsKiZC9+gJOZ5TLetuvLYpEXzH
         OAfFv+yQtVZB9KYFVSYW7Feivt7ygz1t4JPFBXxfd/vZSJs8DmUXw6FW61RjXHeIYsUq
         EiErRZJfWDkbgTErRVLl1+bAc2bZfRTToyjc5lb405pQT8beQaZxEltm1+5pFpt2l+bB
         ZZqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9g+j39brMAZakauRn1VkmxygL+mXeLowq3rA8uyY9V3EEv0wfKQpwxpVEPdgl3pA0jjcOm9YR5QE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjn58xt2vYuOf+Nzkt5U0C6Lo56pQsr6MkMoma1ZIqVItxxckg
	uRRdR5EtmR65exl7G2koecrcIgtelCwWvhPBylQGic9IQqkorfYS2GqJE7/1Zalf2+0=
X-Gm-Gg: AR+sD10Y8u6bb4y/Ukjr3Ko4WWPwmvEpeYt0oR4RR577/bwZKIA9rdrvSvC5wYaL2tK
	vNCAuQEi8KX7WjY5kylq/x4wSrdAv/aVIfIKVOtMqJK9ELYz/lEiEgSf66ydajo2ng1iACEQPh/
	mP60hBysaBvQUY2lL3ZWzc1K9+ffqvY4yHHTsheAM8NkV6dTCti0gD+J3ulsX6ga8/OOeV8twZe
	i4lfpzFNXrrsGDEBpGu6NWH/Y+91yov1qfnk6dvBTmH9ONs1Pgr4BO104h5yv4EG9xMIVO6ZpII
	pB75g57oxg5Ee66iL1R3RkTxvfvsoNIGoyJ3Sf1pl0B1hqzXZp//II53T3UkXHn6PNF4rUVzbFe
	r+yQYrbL+HTzpLamLZUzkrztbUV0Xv08qkbTDjz7FTOIDcll56O5P/gmVCt6l5iHKKdztVQoNlT
	kSeBf9sCE6Mvw=
X-Received: by 2002:a05:600c:3b8c:b0:495:5039:391c with SMTP id 5b1f17b1804b1-495503939b1mr240105375e9.26.1784724090821;
        Wed, 22 Jul 2026 05:41:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956b5c2108sm92979995e9.2.2026.07.22.05.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:41:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
In-Reply-To: <amC4d_RMA5oRR-ap@redhat.com> (Brian Masney's message of "Wed, 22
	Jul 2026 08:32:55 -0400")
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
	<al_3V8N9z25ho8g2@redhat.com>
	<1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
	<amC4d_RMA5oRR-ap@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 14:41:28 +0200
Message-ID: <1jy0f3ci2v.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 22 juil. 2026 at 08:32, Brian Masney <bmasney@redhat.com> wrote:

> Hi Jerome,
>
> On Wed, Jul 22, 2026 at 09:49:33AM +0200, Jerome Brunet wrote:
>> On mar. 21 juil. 2026 at 18:48, Brian Masney <bmasney@redhat.com> wrote:
>> > On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
>> >> clk_hw_get_clk() lets a provider get a struct clk for one of its own
>> >> struct clk_hw.
>> >> 
>> >> When a struct clk is created, the module usage count of the provider
>> >> is unconditionally increased. For a self-consuming provider, this means
>> >> it pins itself and the module can never be unloaded.
>> >> 
>> >> Increasing the module usage count should only be done when the consumer
>> >> lives in a different module from the provider. Use THIS_MODULE to
>> >> capture caller's module and increase the module usage count accordingly.
>> >> 
>> >> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
>> >> pass a NULL owner. As a result, any provider module will get pinned,
>> >> same as before.
>> >> 
>> >> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >> ---
>> >> This issue has been present for a while. Virtually all users of
>> >> clk_hw_get_clk() are affected. The majority are compiled as builtins
>> >> according to the defconfigs. It is not problem in this case but it is
>> >> if the configuration is changed to module.
>> >> 
>> >> The following modules are using clk_hw_get_clk() and are compiled as
>> >> module with some shipped defconfigs:
>> >> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
>> >> * drivers/phy/cadence/phy-cadence-sierra.c
>> >> * drivers/pwm/pwm-meson.c
>> >> * sound/soc/codecs/lpass-va-macro.c
>> >> 
>> >> Currently those module cannot be unloaded once they have been loaded.
>> >> 
>> >> """
>> >> rmmod: ERROR: Module blabla-module is in use
>> >> """
>> >> 
>> >> I initially thought about using the dev parameter and compare it
>> >> against the clock own device but this proved unreliable. A clock
>> >> does not always have a backing device and some paths, such as
>> >> clk_get_sys(), do not provide a device either.
>> >> 
>> >> With this applied, we can get back to removing the direct usage
>> >> of the struct clk in struct clk_hw and eventually remove this
>> >> struct member entirely.
>> >
>> > __clk_register() has this comment:
>> >
>> >         /*
>> >          * Don't call clk_hw_create_clk() here because that would pin the
>> >          * provider module to itself and prevent it from ever being removed.
>> >          */
>> >         hw->clk = alloc_clk(core, NULL, NULL);
>> >
>> > With your change, can this code path be updated to use clk_hw_create_clk() ?
>> >
>> 
>> Indeed the comment no longer applies but I think keeping alloc
>> here is best. It avoids "linking a consumer" here where there should not
>> be one. All clocks would appear to have consumer in the clk summary, it
>> would weird. 
>> 
>> The end goal is remove the hw->clk. I've restarted the work to rid the
>> kernel of using this. Some rework don't need clk_hw_create_clk() and are
>> not blocked by this patch but most will.
>> 
>> Once this is done, we could probably merge clk_hw_create_clk() and
>> alloc(), the split won't have purpose anymore.
>
> That all sounds good.
>
> I know that Stephen likes to see any changes that are made to clk.c have
> associated kunit tests to avoid any breakage in the clk core. There's
> already a bunch of tests in clk_test.c.

I know. What I'm fixing here is a bit odd to test though.

The way I did it was to make a dummy module that registered a clock and
requested the consumer pointer from it. Test pass if you can rmmod it.

Not sure how that would translate to kunit to be honest

>
> Brian

-- 
Jerome
