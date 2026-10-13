Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00173E5A1F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875019; cv=none; b=Y97eTOzicKaO1/H8NO4N5wleGZb0PYVHIUpi44nk52U2tRq17Gj0MVwmMT3pbHTfqOUxcFoxTxM8595MwmZAXLA7nDQgVcW6PTivyKhKj1qRq4rQi4S020zDHw3EzD4g66AEKpABpAKJ3nJa5beNRLkJnZGvwNFcuY7UK9smQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875019; c=relaxed/simple;
	bh=bpVKy2BhDr0Xypr7ffunLET37+ynqUZSFqpwnsDkUiI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V6N2c3683v0R1ItLl7Rlf2g7Lue6IgHonY4OUlKxyqNOZEDBFv2JFN7zOicejXJRrFu+Hk2Xk7FsOUONwMrnnj3EH4oB3pyVlicst6iyvNUCwxlQdJrmLsgpISdV3u5T+mQ1Inzy0KPynn/KEKUwZG7VTlGffNVUYJ5MQTrdrJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aL738snE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aL738snE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49e73611928so28740545e9.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 00:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791875016; x=1792479816; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfEF2n+OMurtKnv7qxvMH9ExfmZTYZWpuDvpjIsu/+o=;
        b=aL738snE2xmARTbvpsgE+9sM2qigUWJOQIS9SCYHWFaPSKoL7mBiPlAdKHM8a1pV8y
         k5vskTYfBH/6I+4lFdlgE8RMcI8Sdw27xhpPAGzGfNTRERMW3MvCTgw2BSomh+fhQIwR
         kUHXoQgtupczQGIEs7u8lOXb0XNFrf1/9QAWXVXvRhExs7IScF4XoT4dmrZGC/OzVs/u
         yC6FLv8H82sdph6TD+P851kdbQRLxYYnLdCqrVjmm/JuoeKksQkc+J19dRL7JgAej3N7
         +zszAaWpL0Jv3JxJALsqxRsQheDL+4ip4LUfIgVqQv3o1T5Wgn04CBXiBnc+vP+oVHR+
         7TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875016; x=1792479816;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfEF2n+OMurtKnv7qxvMH9ExfmZTYZWpuDvpjIsu/+o=;
        b=VuzQVMGQjmzNHS6jHie9Ojb4hc8UedBX3xxV8c8Vrp68FO1keFgWUMA4hYRuDHURoQ
         xWzarlCny55lyGvm0SaabGKB3iHeCu+KHsI70UjoMLzOtu7aN5TXu6eoW23i3hoXvW10
         nKyYttODdduiDK1WvpZIGVnKKgG6KDFZGuaItdPwfaPcYPMbC4Z8/Qk/OQ0bC9QvQaMD
         h1DjlhlySW+WKjR97caL/kqKiOwhUqCayP/0610/tnGWbPSZtwaWxKwnX7akOPGiIci5
         S3gK5Lji3Onmaa9E0ZPNJlLm9CCpYJx46l2eBHpcyHJC/y25DBt48+JvaWyjq+jhy5n0
         MfjA==
X-Forwarded-Encrypted: i=1; AKwUvBzx6jG/h6uY0wXq3eqdNhQRQa3VamxBxBAkWegYv2+sM24TwblMIzlk/lg9rPHzQYgxXrGEfk6Dbw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfDVcNjmLGPDVAmDovN1daG9NeM78uYD9bmIpTHSulzCXQdFiK
	Sv1MG/L/8+ntpXfA5chWcpzS78iN1v15sIhUI4qR5sFFupkYzacBPWV4+dMasy0+TRo=
X-Gm-Gg: AYBFou2REPjmtcHmhHNkR0yaZ5WKsOvwpqpQ+Ouq7ryx6W1IbYCUqGAhJOcnEqnYgwZ
	/tXNaMY4H7QYzSO8TXOjL0FdkuiRNMFNKlvlRm/tlFPDHVygXairPafIatOdeXUZ/C3fbBJ18H+
	UV/cskANTMHdLdHlVK9LygHsppthB5+33hjoupJDm8Aa+/cDQYfTMlnp+kJEfabwaCHUr3K+j8A
	fIYqgUmJB8JEcDjHuyUJsFDRJHbzUV1sBdbUAao3ELovhn8Y5U996oSdyT8u3qULM8d6PaFpX5A
	xvLQp3uWjyBbo8B0g260jeGpHOhfpAD64UFqP+GzbYAtH/nZNUT+f3Touf/K7fAUEN/jLB7NCZb
	gNbWvexti4F9mEtm8QcU5QKm09LBDwmHPxXD24o23bwzz0cFRf0qw5d+184emNPQ4dqHjz55wj5
	5I0dzoLsv8284YFdgTXBosTU+D7c6BsSLhzRr15T9rteEflVbKFAsQ8rwDSOZd05RUQGXF4SVMV
	k5X6geWxdKo0LW9796xkWzSpmCK
X-Received: by 2002:a05:600c:3146:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a18e4a7cb9mr228807105e9.14.1791875016083;
        Tue, 13 Oct 2026 00:03:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm174001365e9.2.2026.10.13.00.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:03:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>, Daniel
 Thompson <daniel@riscstar.com>
Subject: Re: [PATCH v3 2/4] clk: toshiba: introduce a TC9564 SoC clock driver
In-Reply-To: <10007ecc-3604-4c58-9da7-f056dd4355a1@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-3-elder@riscstar.com>
 <179183220207.266355.11690534397452731561.b4-review@b4>
 <10007ecc-3604-4c58-9da7-f056dd4355a1@riscstar.com>
Date: Tue, 13 Oct 2026 09:03:34 +0200
Message-ID: <1jtsmq9j5l.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 12 oct. 2026 at 14:59, Alex Elder <elder@riscstar.com> wrote:

>>> +	TC9564_CLOCK_INIT0(MAC0_TX, 7),
>>> +	TC9564_CLOCK_INIT0(MAC0_RX, 14),
>>> +	TC9564_CLOCK_INIT0(MAC0_125M, 29),
>>> +	TC9564_CLOCK_INIT0(MAC0_312_5M, 30),
>> 
>> Are those really just providing the oscillator parent ?
>> That is what they will appear to do without a proper recalc_rate()
>
> They are fixed clocks that can be gated, but their
> rate cannot be changed.

It is not a problem if the rate cannot be changed but still
a consumer could call clk_get_rate() and change its behavior
based on the result, so it is better if it does reflect the
reality to some extent.

Just add fixed_factor clock elements on the path of clocks
where do know the output does not match the input osc

>
> Looking at __clk_core_init(), should I define a
> recalc_rate() callback that just returns the
> equivalent of get_rate()?
>
>> Their names suggest that maybe, it is not the osc coming out
>> of them ...
>
> We have requested a clock tree that explains exactly
> how these clock rates are derived from the 25 MHz
> oscillator.  They're all fixed rates, and although
> we could easily speculate how they're derived, we
> don't have the documentation.

If you know the input and output, you have enough to figure
out a fixed factor. If later on someone gets more information
than you, they'll just modify the clock tree.

If you no idea what the ouput rate is, at least clearly say
so in the comment so a future user or contributor can easily
understand the situation.

>>> +	TC9564_CLOCK_INIT0(MAC0_ALL, 31),

[...]

>>> +
>>> +	clk = devm_clk_get(dev, NULL);
>>> +	if (IS_ERR(clk))
>>> +		return dev_err_probe(dev, PTR_ERR(clk),
>>> +				     "failed to get input clock\n");
>> 
>> Nothing is using this. This is not how you set the parent. See above
>
> It will once I have the clocks get properly parented.

No it won't. You don't need a consumer clock reference. just drop it.

>
>>> +
>>> +	clocks = tc9564_clk_init(dev);
>>> +	if (IS_ERR(clocks))
>>> +		return dev_err_probe(dev, PTR_ERR(clocks),
>>> +				     "failed to initialize clocks\n");
>>> +
>>> +	/* Force all clocks to be initially disabled */
>>> +	tc9564_clock_disable_all(clocks);
>> 
>> Why is this needed ? In general a provider should never act the provided
>> clock on its own. Let the framework deal with the used clocks
>
> The intent was to start with everything disabled--a known
> state.  Sashiko pointed out this races with a user that
> could get the clock right away, so I intend to do this
> by initially disabling all the clocks before they're
> all registered.

We do not do that because (in general) there maybe devices already using
a clock provided by your device and setup at a prior stage (like the
bootloader). Doing so would break them.

Leave this alone, the framework will disable the unused clock for you
once the init is done and most devices have probed.

-- 
Jerome
