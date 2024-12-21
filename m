Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C731FA82E
	for <linux-clk@vger.kernel.org>; Sat, 21 Dec 2024 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779375; cv=none; b=Ta7la7+9PJ+jpoajRZkwJk72k6kqwkwQCRy1ZM2QMXzmB53svvGSvi/iJFFC3RPWX9aKyJiH4a3veAVvLcRiMEYSjK20Or25WnZ9mNATaFAcZXtEpecCHIUpzC/jtPJN5UtYL7WZGp21exmKhmAzLKj1M+77wx4JDgylN9fVnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779375; c=relaxed/simple;
	bh=ut3qB2ICS0IH5zdfoWwgGQpd3sLfPTTET10UDZPTvds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c/lNeVnB6If43uObVgJ5I4kGcwQnZjg+R7IHXwbR8WaoXVlriw6e6IySYlbgA6oUxr8OepE6tpwWtln4SjlM17nTptclwyXvxeB9OKUpXCr79cWjxLSuQyS1GTbAIneHhM1HgnvRGQgeGgF7g5NWey7d8+Sl6+PV6hLz9lckLoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ur6Tzy3n; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ur6Tzy3n"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43622354a3eso18786355e9.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Dec 2024 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734779370; x=1735384170; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ebXcvEqpe5lwjoRn6x1zFE9H08K/qMa9HBHovY/qAic=;
        b=ur6Tzy3nfaZQGRYJVxTikd3H/tB6avn4ZYCg8E/YJF/PAkYU5OXLgbChS2F9/F7KF1
         /ec1BUMw0SQVTGRYO4mxggGbAOTkdLA9SdPmW+aR/3nHCDzqDI3vpcMpOBMZzmqCtpXX
         SawOAhJWB+mCrUFIAVNVuWsPTUPo86fNld7C4nHkAruz2G1lWGTFSzubD3NObQ35KS6l
         HGfQfxsiOF7y/tGGTyS5+NObqN/sL+uwdalsn6WugM8ifhohNWBEWG7rwELDr3+gIYo+
         W7rhOaCYF0xenM57PhGeNodIDoHfPneUNAeV4YsJ0eY6WghQh9Rz4KsGSESk/N07PWJU
         muZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734779370; x=1735384170;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebXcvEqpe5lwjoRn6x1zFE9H08K/qMa9HBHovY/qAic=;
        b=AwtJ1ugd5eflQQQ00VQyECjZqqfRg3eY0EuQVnxCEm6yBecZMqlKsI2V+DdKIV43WS
         RmlPnIDDwZBpLGQXji4srI6F09IiOKAX9vurycF3bkUEj75scnYei+47xwSU4Tz0eRbS
         /pVYL+3twJOVbgMzTA/KMWyM23p91k4Piyme6is6tVeBCyCBAAJamtExKrKGUBl9sBUR
         xVSU9J8Vje9lslZR3WVbyCVLBqbJVp84UWk2Fo4PEL4yv+19iFMcqyJsl+RyJJ9yQq+x
         wL93yuYJ/L8WuGaGCFQk+2bWydPwNRayMgSYYMoVG6TrJ2SBgiS2YGKBH3oqk4/udT78
         hEyg==
X-Forwarded-Encrypted: i=1; AJvYcCWiG/O3HIYl+JX+CxcEnP8CEytIAggJHF8clQF/l7CcELrdoXRcQfzTcjGDB7cbgFQKOaw3sktNDvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxu6wV71+B4D+QZxG5E6Zh/v01rM+KcqrVdpTP3fklUVNKQ9FC
	3jFiuDKBze0NaF+pcCND/ZzQmp6IoTikmu3lMzCHMKANeXms/RZt6HhHIViw+W8=
X-Gm-Gg: ASbGncsSUluSUtH8hYMlPShZvHNr4LHEmjoG9dUuC8KrZtzlug9KJjuwisQ/heKJiuC
	+TditKvxwdPSjIWpFCwmVp0KJJhSaWAHqzNd7lza1xtA3/VfTQH1mXZowC/cOIvVJKWldoH55Y0
	xw9Wkzn3E5DvOOfnqn8wm5IEFlGzGKopP7VRmmwL/5RNFXTKiQNLg1TTT7tZNkes25Lg2nHTdiU
	OxNE3VrfuiEz/PdC9WOR861MeOL1PjthAIal+zYiwjhJEY68ui95jpQ
X-Google-Smtp-Source: AGHT+IHu149uAhUPHJpaT1OCWuyqQOS8jTVaD6srJBKVvvWQBN8J3K5SUrcTjL+zAGJJAbBoLYGa1w==
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-43668b783d0mr51917575e9.29.1734779370393;
        Sat, 21 Dec 2024 03:09:30 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:98ba:3af5:f499:255b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4471bsm106710285e9.44.2024.12.21.03.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 03:09:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> (Stephen
	Boyd's message of "Fri, 20 Dec 2024 16:12:03 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 21 Dec 2024 12:09:28 +0100
Message-ID: <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-12-20 09:17:43)
>> Remove the big clk_regmap tables that are used to populate the regmap
>> field of clk_regmap clocks at runtime. Instead of using tables, use devres
>> to allow the clocks to get the necessary regmap.
>> 
>> A simpler solution would have been to use dev_get_regmap() but this would
>> not work with syscon based controllers.
>
> Why not have two init functions, one that uses the syscon approach from
> the parent device?

That would duplicate all the ops and would not scale if anything else
comes along. It would also tie the controller quirks with
clock ops. I would like to keep to clock ops and controllers decoupled as
much as possible

> Is the typical path to not use a syscon anyway?
>

I sure hope there will be no new syscon based controller but, ATM, around
50% are syscon based in drivers/clk/meson. Those are here to stay and I
doubt we can do anything about it.

>> 
>> This rework save a bit memory and the result is less of a maintenance
>> burden.
>> 
>> Unfortunately meson8b is left out for now since it is an early clock
>> driver that does not have proper device support for now.
>
> We should add a clk_hw_get_of_node() function that returns
> hw->core->of_node. Then there can be a similar function that looks at
> the of_node of a clk registered with of_clk_hw_register() and tries to
> find the regmap either with
> syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
> node for the clk.

That's the thing. It means encoding the controller quirk of how to get
regmap in the clock ops. I would be prefer to avoid that.

With what you are suggesting I could make an ops that
* Try dev_get_regmap() first
* Try the syscon/of_node way next

I can make this "trial an error" approach work but I think it is pretty
nasty and encode controller stuff inside the clock driver.

>
> TL;DR: Don't use devres.

Using it makes thing nice and tidy. clk_regmap does not care were regmap
comes from. It just picks it up where it has been prepared

That approach could be extended to support controller with multiple
regmaps, with a name that does not depend on regmap_config and is local
to the clock controller. This will be useful when the name if defined
somewhere else (syscon, auxiliary device, etc ...)

>
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/meson/a1-peripherals.c | 165 +-------------
>>  drivers/clk/meson/a1-pll.c         |  18 +-
>>  drivers/clk/meson/axg-aoclk.c      |  22 --
>>  drivers/clk/meson/axg-audio.c      | 435 +------------------------------------
>>  drivers/clk/meson/axg.c            | 131 -----------
>>  drivers/clk/meson/c3-peripherals.c | 212 +-----------------
>>  drivers/clk/meson/c3-pll.c         |  34 +--
>>  drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
>>  drivers/clk/meson/clk-dualdiv.c    |   2 +
>>  drivers/clk/meson/clk-mpll.c       |   6 +
>>  drivers/clk/meson/clk-phase.c      |  11 +
>>  drivers/clk/meson/clk-pll.c        |   7 +
>>  drivers/clk/meson/clk-regmap.c     |  88 ++++++++
>>  drivers/clk/meson/clk-regmap.h     |   7 +
>>  drivers/clk/meson/g12a-aoclk.c     |  34 ---
>>  drivers/clk/meson/g12a.c           | 261 ----------------------
>>  drivers/clk/meson/gxbb-aoclk.c     |  19 --
>>  drivers/clk/meson/gxbb.c           | 393 ---------------------------------
>>  drivers/clk/meson/meson-aoclk.c    |   7 +-
>>  drivers/clk/meson/meson-aoclk.h    |   2 -
>>  drivers/clk/meson/meson-eeclk.c    |   6 +-
>>  drivers/clk/meson/meson-eeclk.h    |   2 -
>>  drivers/clk/meson/meson8-ddr.c     |  11 +-
>>  drivers/clk/meson/s4-peripherals.c | 231 +-------------------
>>  drivers/clk/meson/s4-pll.c         |  33 +--
>>  drivers/clk/meson/sclk-div.c       |   5 +
>>  drivers/clk/meson/vclk.c           |   2 +
>>  drivers/clk/meson/vid-pll-div.c    |   1 +
>>  28 files changed, 165 insertions(+), 1981 deletions(-)
>
> It would be more focused if you split the patch into two. One that
> installs the init clk_op and implements the logic to hook up the regmap
> and one that removes the arrays that are no longer used.

I should have done so indeed.


-- 
Jerome
