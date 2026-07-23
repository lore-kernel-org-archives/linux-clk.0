Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627FB4C77BD
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826208; cv=none; b=GxJK1klMGMmEoUD9yD+//1U4PfmImf5vGpSyA6LXrIWk887onMDOEoVKi9TBxnHFE//y7lJsr25kq768T5KdbcW7W2pnA2HhBLLugO58G+t6bnK6AO9x0TDCI4K+sdeIt5MzApJ0XzVjfR3Af/tvs1xNaVfW577OoqriHdU9jSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826208; c=relaxed/simple;
	bh=HX9hHiD9Q8xG+TX4N8TVpWXrSbck4clGhq83nZuslMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cuvx7okAnOxhocIWb417YWlWyn5V3zwFyWoAUBPPGKHOk9duNDVAJu/XF4nJCJ5yVzB7wHhs3wQojUzgEp1/zTmBLT/5u4FoPCLPQT97dqni4vb4WMSZqVjMIdscfk92t0DlphqWRl/yv3QpmrBUNTbrBUoZiOaVB90zQNYnVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HUIzVuKG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HUIzVuKG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9631965e9.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784826194; x=1785430994; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bmXdjhA3HTwHbyEK6JtJWrwrPDwDFR73RowlJS9lG4=;
        b=HUIzVuKGgmxTMlPHTaqSHx2dL6Mp1A14WYiQsWg0uRvCi+5s97OCp1I8U5FSGiF3xO
         eflxzm1zsNoQ7hZ93sSQ5m2yO00WOyO9RXn3JpRU4y2C9bj9ff28sD0VueX8LfBaE4zP
         p3gR4Lu8Dw4WpBoV3/zP/V/sFb6XgOP3HDLqc+qkKRfY2/0fC3l/vuCk8dLel19lHCz+
         Ijx0OM6KjiUVVrstuxE7TPUtEAWQh5AT1kPZuPi4BgYvbRSh43SdI8Khl2TvC/zs2zUd
         ShtNlSdHV+wKBtE4OHhuwD4FUp2Sk6P9tCAIzVrfUcE5+ahTsOVCyI8CQc+Oj1fy46v0
         zFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826194; x=1785430994;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3bmXdjhA3HTwHbyEK6JtJWrwrPDwDFR73RowlJS9lG4=;
        b=S3YH3FkntZz10O3jKLHastlMZKZSsqxA3X79aZs2Xo6znjyd5RJdu0xolDaQ+HIgy5
         lz+l4g8HtNFW2nn4NtZJ+GrA6BwF5xBdpooDkbsgIGUr6Pz8ZCb+EXwRDmrDzSWk1I4R
         dMuUARvqZj1M/RwVZMOsuyrjvMV8hPCaD4nrR6Wq3EtSYXTOKiG972FjTCJ/TPNgnPXZ
         vpyxe//0Szg+zGlijePMK2buEv4RZDcoinHcL3CqZuM8olfZj4zEp3jxa2LRFIA4kJZD
         ivRaCrmLa4Qn+PEjrhPfSOSAaCLddc2yPQDuc6QfkjSfcFZdAR61/n2RAadh4dJNQqTl
         g6CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9bF2OBo7UXRfc8A7hCkELV+Y0sJaA8hhrg00ZakoMtW0Qs2EKxWlC6kqO4snzVx2+YrW6nMZBMCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwtdH6ii2J+62qhHwC0t5I/Hr4+3IeJhxpxwWmjPF8kCD46a51
	rfOSGVlJAd9Vuun0Zd3Abd36kruQhGDpcfVeml4UpZMcj5FLRLYuCL6gbE3etdIWJ7o=
X-Gm-Gg: AR+sD12lFXa2wdSejohtHapaLgwyNbdVSguDNXRGIP50FZWmigDGz3E3ww1FmdAJCnC
	Pioh30fozI6CW+Krbs8kf4EIr9ICJtaJ2BAo3C+FSlEDhWiOr84Fj4RxZyaNlWc7bGW73UTD0sY
	DTl5ysoOjb8o92C/E2cJx27jUylOypkq5w+xw2t5MHoKdFkebdTgYVn6y8KPq43yXp9+LDX1wQd
	ZGjGL8xyAOX86wLw9x2rBZEiFem7+8E+819VOwKqSu2sITCqZgBmg35ixTOcb3MQu+rc0kQX84o
	OcVm6MfPf6kM+dwqM515F/3wNIs71DYQOrGC2KMh1EohrScgFMotKl5Q1FuerlUjwP3XPrYxCgI
	iVOHrM1ui/Cpb5cAjOA2OQm314rY6WBY/AvMaWiwmdMl6X2aFHvm79053HpN26yPb4Ia9kXUefS
	kdb0T/mF1JesY=
X-Received: by 2002:a05:600c:4ed1:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-49573d11690mr46042655e9.28.1784826194117;
        Thu, 23 Jul 2026 10:03:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5f98:8c28:3e2c:1c72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af16f72sm8890055e9.0.2026.07.23.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:03:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
In-Reply-To: <amIn3DO_65uyItS_@redhat.com> (Brian Masney's message of "Thu, 23
	Jul 2026 10:40:28 -0400")
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
	<amIn3DO_65uyItS_@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Jul 2026 19:03:11 +0200
Message-ID: <1jbjbxd4fk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 23 juil. 2026 at 10:40, Brian Masney <bmasney@redhat.com> wrote:

> Hi Jerome,
>
> On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
>> clk_hw_get_clk() lets a provider get a struct clk for one of its own
>> struct clk_hw.
>> 
>> When a struct clk is created, the module usage count of the provider
>> is unconditionally increased. For a self-consuming provider, this means
>> it pins itself and the module can never be unloaded.
>> 
>> Increasing the module usage count should only be done when the consumer
>> lives in a different module from the provider. Use THIS_MODULE to
>> capture caller's module and increase the module usage count accordingly.
>> 
>> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
>> pass a NULL owner. As a result, any provider module will get pinned,
>> same as before.
>> 
>> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> This issue has been present for a while. Virtually all users of
>> clk_hw_get_clk() are affected. The majority are compiled as builtins
>> according to the defconfigs. It is not problem in this case but it is
>> if the configuration is changed to module.
>> 
>> The following modules are using clk_hw_get_clk() and are compiled as
>> module with some shipped defconfigs:
>> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
>> * drivers/phy/cadence/phy-cadence-sierra.c
>> * drivers/pwm/pwm-meson.c
>> * sound/soc/codecs/lpass-va-macro.c
>> 
>> Currently those module cannot be unloaded once they have been loaded.
>> 
>> """
>> rmmod: ERROR: Module blabla-module is in use
>> """
>> 
>> With this applied, we can get back to removing the direct usage
>> of the struct clk in struct clk_hw and eventually remove this
>> struct member entirely.
>> ---
>> Changes in v2:
>> - Update comment in __clk_register()
>> - Add missing documention for the new parameter of clk_hw_create_clk()
>> - No functional change
>> - Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> This looks good to me. I'm planning to send Stephen a pull next week for
> content that I think is ready during this development cycle, however I'm
> not going to include this. I suspect he's going to want a kunit test for
> this and I know it's going to be complicated. My suggestion is to post
> some kind of rough test scenario for this, even if it's initially not in
> kunit. As I get some spare time at work, I can help you to see if we can
> get a kunit test together for this.
>
> Brian

I understand but I'm not adding an new API, I'm fixing a real problem in
an existing one in the kernel now. The related API is already used in
some kunit, so there is some coverage already.

The problem was known (as the comment in __clk_register() was showing) and
there was no kunit then ... so it is a bit strange to delay fixing the
problem because there is not kunit associated with it now.

That said, I'll check was I can do. acutally loading and unloading
module in kunit does not really feasible. Maybe poking the owner
field with __clk_hw_get_clk(). This is not really supposed to used
directly (which is why I did not add the documentation around it)
and it's bit fake but I do not really a way around it.

-- 
Jerome
