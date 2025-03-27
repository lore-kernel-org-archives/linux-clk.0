Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB1158553
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070077; cv=none; b=AAa8pygf33PRhpI6Vezsl7GOtJWhZCXHRGIdCkiGYND2ao5ZwDtoQ3D0y3l+CuwZ+frGQSyAJQcb9JcTVJeAfbxrkYhWne4bjRJqYp/aeoTs4OdzHtzc97kCeOb7JmYzzJv7h2PZu3bjetQWqdP+kDC5hlx/l8Cr81sqijO+6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070077; c=relaxed/simple;
	bh=+VDQxqDVTwSC88WpzKDGggf7YvBj5O99RXKWmTw+D4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rnBFMwkZwh+pIIsWFomfkN6XCDB3U2VoxnEuNSmpKuSSLwnByfeFBSCVDtYw2meAepcp5Gy4a1bmzEI45kLyrsHQ2BwmWKI/xIFbxjZDydBgTJRTmf7x27uw6BATNE8Pi9SCseCzMFUYwmjj67yVm5OiSU/8Mglg1Jvz8XNe81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ojq5GRNT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ojq5GRNT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso3389855e9.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743070073; x=1743674873; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DA/Y2SrhYvb8JIGN8I8VFPVZFKVt4XN6zoT9arPV9I=;
        b=ojq5GRNTzTQkCtNXrfBd1LsWwvhDWcEy5kvETwH4omlxg8WNNlD9i3zvR63ii3jpYZ
         My/o/RYz8Rr3aWv8n+TpHPVsLqABJlggHYPCbZJnZv06xJLUjgb9yknbkyfWCMA1EWf5
         2vvSOiIqwdx6PnHjaA6cCD0vzlL/r6BPLp4FQPyrxD9cbX07tKC19LMKOBF0xo8G7NqV
         NmtxeS0TSeIbox0MoVj+JlTgCGkJbaV4OsOMHPApMpODgbrVhCALAqVN35nZ0n8Js32M
         efGMckIJf4AnhzGS9mRq7Z4UqIe5NKdNPpIQBapl9clb6ejUNi9qil6WtfNYrSbfVxDI
         r/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070073; x=1743674873;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DA/Y2SrhYvb8JIGN8I8VFPVZFKVt4XN6zoT9arPV9I=;
        b=k7lWSKPaN/EEwhhoXwrEgFokBmSOz0RxRPw3UJMNzH/PWkjtPww4FpoPsalaVoD2oL
         M363XjB24k3DAQLXMf8EcQPmL8p43Ce7tEf++rFF1C/aWM35t7rRdyF89vAtY04wXeyg
         PDmygsGuQc73EjU0OGhNNSwQFhcwysqRIBn4Tl0Akty6aa5OVuJrS/BK4NqQLoV4XCB5
         6CBlyqaQIUIMhF1i35OL4BKTYcZwneWOCPeN9vkc0kCbCBa0oyWsRYYGxbXowuti4Du9
         t1mWaqoh4LQmwMudA+4XsLEsOF4IPno+EQRLvpNk5+mx4sPygZElYGw6RkMV6W8sT3wi
         duiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdl6Th0r1AKp1KxXIu/t7iryiudjfQ5HkfaKkkLpLvjVWcLB8mX4vDzkkrQUHyn6jIx9uZ78Z+WFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3sX04GtYXNFPfe+hSq2KV+Uhprq7dQ22DM8+yFFyDEE8UQ1Zh
	5rR2AKuqieJtQ6OByIuFVIPyoNSMtzZUDgJjmMYW3/TVV3a3R8WGhXw0uYiQIos=
X-Gm-Gg: ASbGncuUGIOwNZ4QJbancFz+8QJGT0OMBjT941ITFxCdsdl3eZOx61+T+fNCsQWl+xa
	Ok+LDpwHQNOC/q1gmBfmokg8MlsVKC4WBLIDmgpWpNLuuPdTqB2nJGt/5cRv813tMiUwqwyfFRw
	IeU6RdUj9tbwlQatm9hoFEcaGinc5WJCvo7BfcTCG8WOmIvB0Y22W3D+FWvxJrmViYDB3cZuVSX
	P4quErcTtnulQ47wyJmRllRFKcNMnVkbl9ePTcC/iHH0nowb6S4U7SIPfBNgoKqaB2JMJDXoAT0
	ZqtG7dkv9o0XR1+bM142inNdFUGPjSB/jmBd4nmaU6pw2aqVIRQHs58=
X-Google-Smtp-Source: AGHT+IFSA/Q3nPbkXJU+wAh3bQb1BmYag2bXoUf1GCR7HVRK1VC002s/eBPHjEc50vV5ysPbU7o5kA==
X-Received: by 2002:a05:600c:198b:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43d850a78d6mr28318015e9.11.1743070073134;
        Thu, 27 Mar 2025 03:07:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e348:e265:be1a:2d30])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d830f5f56sm32976245e9.26.2025.03.27.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:07:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock
 device or device_node
In-Reply-To: <4db0bf5937c6c2a480b89b11e841782c@kernel.org> (Stephen Boyd's
	message of "Tue, 25 Mar 2025 14:57:01 -0700")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	<20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
	<508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
	<1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
	<4db0bf5937c6c2a480b89b11e841782c@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 27 Mar 2025 11:07:51 +0100
Message-ID: <1jpli223d4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 25 Mar 2025 at 14:57, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-03-21 10:53:49)
>> On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> 
>> >> +static void clk_hw_get_of_node_test(struct kunit *test)
>> >> +{
>> >> +       struct device_node *np;
>> >> +       struct clk_hw *hw;
>> >> +
>> >> +       hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
>> >> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
>> >> +
>> >> +       np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
>> >> +       hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
>> >> +                                        &clk_dummy_rate_ops, 0);
>> >> +       of_node_put_kunit(test, np);
>> >> +
>> >> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
>> >
>> > The stuff before the expectation should likely go to the init function.
>> > Or it can use the genparams stuff so we can set some struct members to
>> > indicate if the pointer should be NULL or not and then twist through the
>> > code a couple times.
>> >
>> 
>> I'm trying to address all your comments but I'm starting to wonder if
>> this isn't going a bit too far ? The functions tested are one line
>> returns. Is it really worth all this ?
>> 
>> I do understand the idea for things that actually do something, such as
>> reparenting, setting rates or what not ... But this ? It feels like a
>> lot of test code for very little added value, don't you think ?
>> 
>
> Just so I understand, you're saying that this is always going to be a
> simple "getter" API that doesn't do much else? We're not _only_ testing
> the getter API, we're also testing the registration path that actually
> sets the device or of_node pointers for a clk. I'm not really thinking
> about the one line return functions here.

Oh, that was not clear to me. I assumed the registration path was
already tested to an appropriate level, so I did not consider this.
Makes sense.

>
> Writing tests is definitely a balancing act.

That's where my question came from actually. We are aligned on this :)

> I'd say we want to test the
> behavior of the API in relation to how a clk is registered and writing
> tests to show the intended usage is helpful to understand if we've
> thought of corner cases like the clk was registered with a device
> pointer that also has an of_node associated with it. (Did we remember to
> stash that of_node pointer too?) We have a bunch of clk registration
> APIs, and we want to make sure this getter API works with all of them.
> Note that we don't care about the clk flags or parent relation chains
> here, just that the device or of_node passed in to registration comes
> out the other side with the getter API.
>
> A little code duplication is OK, as long as the test is easy to
> understand. Maybe genparams stuff is going too far, I don't know, but at
> the least we want to make sure the clk registration APIs behave as
> expected when the getter API is used to get the device or of_node
> later.

Now that the goal is more clear (to me), I'll try to find a good balance.
I'll also split the helper from the tests, so I can progress on the driver
front while we refine the tests, if that's OK with you ? It is not overly
critical for both to land at the same time, is it ?

>
> I've found this google chapter[1] useful for unit testing best
> practices. I recommend reading it if you haven't already.
>
> [1] https://abseil.io/resources/swe-book/html/ch12.html

I will, thanks

-- 
Jerome
