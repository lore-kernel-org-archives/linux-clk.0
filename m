Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393F4772A5
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152953; cv=none; b=rPeKLHny8i2Am2wQN5F09cFRCZgVH4Fm765yaBZddFotUZJi9pi40Yf1y/7zPG1HMkEqGICfSxXaeb2qUJ19FBwATDg5wWqZDrqaYI0ytiCKXafScCpbbarxDIUIOxWglDMQ8E9sIHhFLnEdD6SQfJVw6ug0zNfhFXLKL0o6530=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152953; c=relaxed/simple;
	bh=AlYVH6JZsylctzQviaLt4hc7y4RoW/sXNgqoYSnoG8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eavO2fSwZSB3YSh6M0Z8tIXUE2XMBwwCmnR3Cb2qzwWnO40a6M+JK0kaT0Clvot0/bu+ZbJEW/v9ju+mlLVt3/erffhG+jt3jtFBer/D9KEJATr4I5W2L01CTfMPF5j4OvryOMQ0cuTWI4VUDab0ZO8tl46/QugWg5Djsjsnb38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YLJKfbjb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YLJKfbjb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so3005275e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790152934; x=1790757734; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n91d5eWYAIFJCF0jV6IWCgrzcQaMYxpIShAjrH7dsh0=;
        b=YLJKfbjbJIocfNSOVi9MCfMtu9HdsuELgm5mWnyk+bUDUy4OPE6PUcxvHQBe9MwWnh
         gEo/UIuxacLxSwPZIbkfKt7/LjK9kjVyghYyf5a+qehu33UOpq8ZgRd1F20tWhMJFuYV
         3ZR2tMOuoyAVLZGWSw/79XNtyf+fy5o3d354HM8pnzt2wT6nI7ZS08jW+UJwY1u7+Nng
         dTtDewWupFxu8Qk8BWTZUel3EMp6FHU2YKZoOR42wmd1HQZMBrhl9LzC3G2fJ9QYJdcu
         dYmZmhG609LgHnbSjCTSt3w9kTyc74iOavUAiDr6COhWFYfKQg0jlJbV9ArWVFs7N0Il
         aCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152934; x=1790757734;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n91d5eWYAIFJCF0jV6IWCgrzcQaMYxpIShAjrH7dsh0=;
        b=fCEgOAOtbyJ387f6N2S5/GW56ZmakLdEq3cBMLietwnBZv6zn9sO95xO+Cqt9hej2e
         E7M20oxbaaSDsn9sLbuHUCjbInH4SHIwKALbJeH1FcG4sGNaQlxauu6DhBipT9zaooeU
         2xBtjNF/oJMQ/G79ZwKCbG3Ipw6f0o5Kgb5M5M2ava5XuDZrs0lZ33Smwsdc4uo6Or0w
         EGSWoak3bYT5LXysi3FrS1HpuXlaP39nTlHhzwQEtuSoVrrKE60TPCjm9c/wYyr9tqDW
         Yul5yWFfXzlsJLH+nBoOlBgD8jYEAo2h1OVpyNLrKNRRuxmentL+R6asOXMcj2UkwSL7
         o46Q==
X-Gm-Message-State: AFuF++n2JL7SnZqo5GmASu2uzUBcUYOyZ2PWAdFbWpdKDtItnOYAWVK4
	CVcyxeyRIexQ+LlkTIawQjm5fIKFz3rwOOUxFgnqu3c5aG0CnhHPmu87G/f9z+EvPzM=
X-Gm-Gg: AYBFou2wwDEEPtUbBdTgp0lCdfzNP5Ew890gEFVXScHmBcy6rt/Fp3VJJoW+jYxqu98
	SD3jZyJjVNu0mf1u3MNg9Zkniq5t50GVzZm3zvIv8xH0tVMoymi32B9cuWvWMjvBZBhT56zO7j9
	+ugA2qyY7Pzk+7ccmrwfrq5xr1w+FTO8FtE7atz+Ibcd1+qw1wTn4JUiqA1sryVkY6wWleml2Lc
	Ig8TnMW8ZYYBzjUAZhp/G8UShw5IEM6u85xmLFu1KvFCeiCB3vKsvr+y2aXzu4lN+fjPBbA1kqS
	7OM5xYvrxgpHBDyTEY2r8EQ3V7qA2NJkDUGMfP8A4cmeFH9pyTKTXE/vvEQotDVuuP6sOEreRoR
	S+aOy6u0ZPLxGoxRDy3SjUdJWiR7IJokYOSna4Qdb6F/OVaq0nm4tAwZms5IYztikTJVZuhWaoN
	jTC9xaAUztJ24nr+LcPeaeRojL3lVrzddJZT8GxCbGv3OidtiPsCVmowk6yh2D4rxwG+PqCfqVQ
	w+qmkbbHFUsCWF8fHA=
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fdf2543f4mr22923305e9.34.1790152933630;
        Wed, 23 Sep 2026 01:42:13 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde134739sm56714325e9.0.2026.09.23.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:42:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "yong.liu" <binary_world@163.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 binary_world@163.com
Subject: Re: [PATCH] clk: Reject positive return values from init callbacks
In-Reply-To: <ccf-patch-f7a5fae0-beeb-4667-93c7-3a4ce9321890@163.com>
References: <ccf-patch-f7a5fae0-beeb-4667-93c7-3a4ce9321890@163.com>
Date: Wed, 23 Sep 2026 10:42:00 +0200
Message-ID: <1jfqz09x5z.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 23 sept. 2026 at 03:58, yong.liu <binary_world@163.com> wrote:

> Clock init callbacks must return zero on success or a negative error code
> on failure. If a callback returns a positive value, __clk_core_init()
> already takes its failure path and __clk_register() releases the clock
> before returning ERR_PTR(ret).

If a provider returns a positive value it is bug in the provider and it should
be fixed. The contract is clear:
- negative value on errors
- 0 on success

Positive values just means nothing.

I don't think the framework should try to defend against every silly
things a provider can try.

>
> However, a positive value encoded by ERR_PTR() is not recognized by
> IS_ERR(). Consequently, clk_register() returns an invalid pointer that
> passes the caller's error check, while clk_hw_register() and
> of_clk_hw_register() report success through PTR_ERR_OR_ZERO() despite
> registration having failed.
>
> Convert positive init return values to -EINVAL before taking the failure
> path. This makes the registration failure detectable through the public
> registration interfaces while preserving valid negative error codes.
>
> Signed-off-by: yong.liu <binary_world@163.com>
> ---
>  drivers/clk/clk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4053,6 +4053,8 @@ static int __clk_core_init(struct clk_core *core)
>  	 */
>  	if (core->ops->init) {
>  		ret = core->ops->init(core->hw);
> +		if (ret > 0)
> +			ret = -EINVAL;

That would at the very least be a WARN_ON(), but again, I don't think
this is the kind of checks we should add.

>  		if (ret)
>  			goto out;
>  	}
>

-- 
Jerome
