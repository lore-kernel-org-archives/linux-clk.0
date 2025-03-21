Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E7222582
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571976; cv=none; b=h62jq6EW+4lKfsqmVw2Frn81+Oe6wXQtg8hBp076LQBphQLhuRU44TLBiheQBD6tJ6jWn+phe74COHWeLspLW2oTKqNo9dOA229AW9JixAhifTQJXzXOWPwFzgfQBzgc5Knu5F5rem97yHzxK7iVdZeVafave7lG4VL3kB9WZsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571976; c=relaxed/simple;
	bh=PMbFL9w/T16MY1wFXjhG084gr8a/ScmrDwtmwbvle1E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R2OCt30J91rHIdShNuFZ4bCQF9WQsUL8j2iDdxeAlgjpB8pib/oDZj039/YixtDuwpboSD7j/gE/8MQorahqmXHyd0yJCliRr6vgcO++G4L/0Rgkqclho/egB8GeA50faPMfC9Oj/QS/UY3Em5+9186FQ78wOGdTNQKZhLLwkus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g3PZRZKt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g3PZRZKt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so10577335e9.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742571972; x=1743176772; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=;
        b=g3PZRZKtbxVmKNgoIVKCKQlYd3dc/BQUjzMhLOluavCUvyPAA5aFOuRHPhjUZYyp91
         XFtcGrP4lVlpDLsKcdEhBjPaK0u/BfcbZnWzISxrEpKiZiVmTBzoNOGTYk/mt0ltYDJN
         lL6qaurBVST+jG89DE6whDaaM0KX6sZEfv0cpwvIbiUr7KUwlAz/w/zBeYmhPkOvzutU
         BVm0ncggMPy9bUWidEoh4EZJavq64Rkr1/KfvZmsYUODKmZbJctSbIiuWc4LHzxl+qN3
         bkkz4BisudiDUknOjQr4H03nfVw16y7U8WlgWf1wBCbzaPjIsXuZlfEcnf9J6lEeat7n
         f/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742571972; x=1743176772;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=;
        b=ESgkBv7uCUk5n1otxDcGbSclzT+DH/LjSQIWaCA41TgOkzoHMXrsv3t4A8e2nkfm/j
         pJoyc0HojFJnIGo2GGT5/zcuYmy1B8MoN4/st3OZotkk+ObVrTReiD3Ni34LvceHyEwg
         k/S0PUDwh4ZZ9AWmTht1kanI162Zy4w+9m21pOs+lnydgng/50mcnjrgQ3E8V9H2vfAW
         9XxkTjZNjf5RXAdhhqAmpSFoQvouLwst2I4rIiiyzyxOsCwSuY3GGIrZAwa2ybHgjOl9
         yStg2WrPeqkXiRk2XyFIco6ZS2C0HkjZbzfW7RQfdMJxy/i2puF+t5gJsoG3RpY7KzU0
         oCiA==
X-Forwarded-Encrypted: i=1; AJvYcCUfeVqYUuVmOV4mHi+NSupvJICMIRjSOypp0jaEiBE/6UKzz4VBYxXBRtoqu699QN8jl9+kDZ18pDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0uqYHG8G6MX6l9MfvFEgsvN3Fd9fPEUJdkbgHJyu1uf1njgm
	ZBAFKYFGeNA1SaYwWJgzp4Lgi/eaeknrud3TejkaZGlu8BkxRyOu7cph4h7+cOM=
X-Gm-Gg: ASbGncv6JGwcaQy+ZjOpw0b1teUsVQRsrmmyXI0/sdlqToLQFdWOBAi5qJzhD963+Pe
	CPgu/mWD4h3F9ew5QHoA0s7isExX6+SJHMY6AlqJkDk10dnLbWQhx4gPd4dGriJjBmu/kdHm2xW
	L9buRldg3IMMo0Sc3iP6Cry2HFV/HyiEOK3q2cJKgBF+znMGeg9Bjz2sD6mU4fjLJDysUrtaFE8
	y7HtsLesAIH1qr3VP7TSmh4D/rpL6OfjLqb/wxyqI+jN3a8x9mnedJBIqPY6Db+olHZOUWdk3R2
	MJFNBO/Phfa16hvIulRfViputCVKyCEzxCXB1Hwa4y8M
X-Google-Smtp-Source: AGHT+IHA8cRGoAIkPVPFNmZnRzpsn7R6Bm6hI1qPItBl8eiyD+ALObZwrN5Smom3mHRzHmPrld4JMw==
X-Received: by 2002:a05:600c:1992:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43d50a553f2mr30247065e9.31.1742571971921;
        Fri, 21 Mar 2025 08:46:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2102:ce42:30c0:9b40])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd9e96bsm30814545e9.25.2025.03.21.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:46:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org> (Stephen
	Boyd's message of "Thu, 27 Feb 2025 14:55:00 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
	<1j4j205ark.fsf@starbuckisacylon.baylibre.com>
	<5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 16:46:10 +0100
Message-ID: <1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 27 Feb 2025 at 14:55, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-15 07:58:55)
>> 
>> I'd like to register controller init hook to apply on all the clocks of
>> a particular type. The reason to do that is to drop the big clk_regmap
>> table that are a pain to maintain (in addition to be ugly). I hoped it
>> would also save a bit of memory.
>> 
>> The solutions we've been discussing so far feels like we are moving
>> around the problem, recreating the memory saved somewhere else,
>> perhaps in a more complicated way. I'd like to find something more
>> convinient to use, which does not scale the memory used with the number
>> of clock registered. The point is not a different hook for clk_hw after
>> all.
>
> What are the goals?
>
>  1. Drop clk_regmap table

That my first goal

>  2. Reduce memory

Would be nice

>  3. ??
>
>> 
>> Here is an idea, how about list of hook identified by ops and controller ?
>> 
>> The node would look like this
>> 
>> struct clk_type_init_node {
>>        struct list_head         entry;
>>        
>>        struct device_node       *of_node;
>>        struct device            *dev;
>>        const struct clk_ops     *ops;
>> 
>>        int (*init_hook)(struct clk_hw *hw);
>> };
>> 
>> The change would be minimal in core CCF, just searching the list for a
>> match in clk_register. On most platform the list would be empty so there
>> is virtually no penalty when it is not used.
>> 
>> From the controller, the usage would be very simple, just calling a
>> function before registering the clocks, something like:
>> 
>> int clk_type_register_dev_hook(struct device *dev,
>>                                const struct clk_ops *ops,
>>                                int (*init_hook)(struct clk_hw *hw))
>> 
>> or the 'of_node' equivalent.
>
> Why can't we register the clk at the same time? I don't understand why
> we want to search a list to match something up to what could be another
> argument to the clk registration API. Isn't this the same as 
>
>  clk_hw_register_data(struct device *dev, struct clk_hw *hw, const struct clk_register_data *data)
>
> Why is that hard to maintain? Is that because the clk driver is
> registering various different types of clks and it wants to do different
> stuff depending on the type of clk?

Exactly

> Why wouldn't wrapping the clk_ops
> in another struct and then using container_of to find the custom clk_ops
> not work there?

For this particular problem, it still does not scale well. There is more
than 20 different ops (and counting) for that clock type. Those would
need to be duplicated for each different way to get the regmap. That's
really not ideal

Side note: That's very interesting idea for another topic I'd like
address someday - not having all clock as global, but the just static data.
That would be a nice way to attach an allocator.

>
>> 
>> I admit this is heavily inspired by how devres works :) but it does solve
>> the early clock controller problem and does not scale with the number of
>> clock registered.
>> 
>
> I don't know if devres is a good model. It's about tracking allocations
> and things to undo later, not really to track things to do when called
> initially.

My point was more the decoupling it allows.
Maybe it is me being too picky, but what I'm trying to do is related to the
clock type, so it bothers me when it scales with the number of instances
instead of the type.

More generally, something devres-like allows to register an attribute
and link it to a group. Then the group members come and just pick what
they need. Whatever manages the attribute does not have to track
them. That is pretty much aligned with what I'm trying to do.

-- 
Jerome
