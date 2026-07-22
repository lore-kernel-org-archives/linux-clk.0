Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33830439335
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706579; cv=none; b=MjqS2pukwkFNt0t52lrC04ISNhi4a0Ky/pyqs8AQAgGqCoq2pT0mSc8Z6t97dZ54MUzNVQlRzBqCJe2C4dTCEb+z6hbFIN25FhDbI8A7xvTV0HMGZbOMKfgmXUA9YSJe95Zbfea5vlruz0tLltScmuK192mPHREbLiTVgW61Hhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706579; c=relaxed/simple;
	bh=lVWDUqZMPFtX8cHC/95m/bpeCCDGpqECIK6EQAiovKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Odu/6a6hVnnr8rVQhknmdVOEVZRHqFNOTfMMYjRN5lo0H+0WcQ7BrsUc4dTH77IldYfOPrLmge/6oxLteGlMWPH/wOnKwfazCG5NbEGs/2kYk9sGsKhTPj4YgpsWQUUtsYrDeJj92bQWWoqP8aFElKjinNs27rZ3TEH6N1qnSrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=b0qVaJCW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="b0qVaJCW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495590dde14so32404245e9.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784706575; x=1785311375; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxEitlPnYg2kH9kyoModuHYbzqhDL9bDDTtUAFaKepw=;
        b=b0qVaJCWhA15wgKHTloLU+o0rEuDeihQuZyFmdy++KfrPBa/LclxohZLywNGabjky7
         acagvP8zMsbgTs8oLZU4mJRGfhtxfu9TFm9SO+FxLzXrsbFKiFubxnikS+vJllpnzQXP
         tKR7q0ya5/fdJZAMPfldui293bGayKGSH3A3YI3l1IHOl0fyNLH89F3HmGoO64lEn0QC
         YfpY8Vpw9r/q0++cY7PV7ZX6uw5/krDhunOjeN1oxDtkrx/uCbIufFtLoTdIOJt1syco
         UqZPPFqaNi+kGl5vAjMZXOXB7FAPNYs1nMIqMs8ttUkuv/IZ/dYBLqlbu6mbL/cYMkZm
         LvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706575; x=1785311375;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sxEitlPnYg2kH9kyoModuHYbzqhDL9bDDTtUAFaKepw=;
        b=lmHPwKaNneHLYZjiu+EYAtcBForslq6+SNVjLVZdBxNoxlcvhP+XlYr4yM89KzC3uS
         Zpz4D4Vi93EWlugh4JUvYlDFlbRs941Y2vbnTnLlJIZ6yMdCXYiSapGKkCkq7FOOSPL1
         FKZ4PgN7qEtu1Ax2O+CIYf9Dbhrer018lun+RDW6/uzzsHPIXlmeCAWvqLkPL8dmUDAJ
         jNz6BjGYbRx7CCE+xk2r8wf5arV53cVaqxPcBJHG6wkE9Wy1SYK9ui1fR59FBhAlw07v
         uCQTL/U1sRziQYFBFy4N26o5ogPeynj19N/uDRYovh6JiquxYQXggbyPon7GXjoqe7SQ
         E0HA==
X-Forwarded-Encrypted: i=1; AHgh+RqbYUUzMV+rPNWo30GPOptDVOfnzBdgIvJwRg8eAuDP9K4PQho+FpQqRa+ee++CCbmjZbLNqTH0z1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMenm5roKrlK7j6aaJJLSmnGEtOkd6EmEqGskyk+cF4CHg6RG/
	3uEX3IMIaNneviwZC5peGkNBULf4+IOSuQ1cKswURqgkDvEf3WC/fEJ5d0e/bDqG0tM=
X-Gm-Gg: AR+sD12Kc0F1M9GBbLDQViV7mQ21ePeQQ7GM4CQfef0sogNB6q5ygyoyDH0hy9CVd+Q
	t3rGtSApfHDMEClBwN2hT/x4ZcKTdOFly7ucgzpu23yIcnNpoPaNI/zn97SUn2PQAN3V3aEYamj
	ZI/Yzd/Jmq73Wlvv1R85QYTby2ljOHubzTL1iBFR2L3ZQ2tM3t5LQloFLPUnO+J2DbHmHjJUa4W
	lD38opk6gb+bEnBcOEVGC9epEEqd895QrOZhhpdmW2CysxqnogOQOWRjRrClEgNUDD6NfnUB7Ni
	Pciu8q72Va92YbPnqWRKcDp/c4LIxYx+DxLuwflEcPl1EzxcemxhSkxcJjOjnMziZ3OzQzFcKDL
	LvBSGtOE76LVFjAQ+I0ewI+jPjZjE65ECG1B0vO+mux6bTO1ex0RVKNCndh/QuMxsws/mE9Qudx
	cQ
X-Received: by 2002:a05:600c:1554:b0:493:c10c:22f0 with SMTP id 5b1f17b1804b1-4954a50d963mr288452635e9.20.1784706575219;
        Wed, 22 Jul 2026 00:49:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956ab22e74sm40387815e9.1.2026.07.22.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:49:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
In-Reply-To: <al_3V8N9z25ho8g2@redhat.com> (Brian Masney's message of "Tue, 21
	Jul 2026 18:48:55 -0400")
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
	<al_3V8N9z25ho8g2@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 09:49:33 +0200
Message-ID: <1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 21 juil. 2026 at 18:48, Brian Masney <bmasney@redhat.com> wrote:

> Hi Jerome,
>
> On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
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
>> I initially thought about using the dev parameter and compare it
>> against the clock own device but this proved unreliable. A clock
>> does not always have a backing device and some paths, such as
>> clk_get_sys(), do not provide a device either.
>> 
>> With this applied, we can get back to removing the direct usage
>> of the struct clk in struct clk_hw and eventually remove this
>> struct member entirely.
>
> __clk_register() has this comment:
>
>         /*
>          * Don't call clk_hw_create_clk() here because that would pin the
>          * provider module to itself and prevent it from ever being removed.
>          */
>         hw->clk = alloc_clk(core, NULL, NULL);
>
> With your change, can this code path be updated to use clk_hw_create_clk() ?
>

Indeed the comment no longer applies but I think keeping alloc
here is best. It avoids "linking a consumer" here where there should not
be one. All clocks would appear to have consumer in the clk summary, it
would weird. 

The end goal is remove the hw->clk. I've restarted the work to rid the
kernel of using this. Some rework don't need clk_hw_create_clk() and are
not blocked by this patch but most will.

Once this is done, we could probably merge clk_hw_create_clk() and
alloc(), the split won't have purpose anymore.

> Brian

-- 
Jerome
