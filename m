Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A183AA182
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039633; cv=none; b=V9yvtq4wQdzpJTc/T+SM6p5QIIjLl76TBO/mVk72OfXhJ2N7WMfiQ8q07d8LZoAKu+caVkrUMbK77nOAMjGMT/YXOBxN/vpIbAv2iY+dCFcgiX6B1sQnDxCDh0L0F20FYpNSIDmMjR9FvnAUH4dzIs7Ugpqi1oRkUBfcTLYUyXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039633; c=relaxed/simple;
	bh=EfKOI1MhNdNCtFTETqtogGkGBGw70Ri4WZ28lvlLvrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdLXq+cl6inVnSBdC4Grf2Q2q/NDv2lfg1EJjqcEV8UeRLHK4k3XJEoTzp4svOYv6ScQ5DylPpCpjCnkav5hS0F8BABfgxpbLelDIuaJcqYgDlX9iCjMYkZxP9TLeWm42ZtZAn15B0WtGUOg2h6lc53mOXcboTfqko5zNs1SPxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5BhlVk5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5BhlVk5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so14471836e87.2
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780039628; x=1780644428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oelNQunsqm6lRn+BaGSQ+cqWJ81wjwxd4/AhjqK6NKM=;
        b=n5BhlVk5zhWeWuh3R2o/C02pta6AC0QnOmOKnaco/8gpMqpsRtLF4N2SjudetqFfYW
         AQsaYYeskjQ2SaksKSeGMof9EgBSHoMPk22xYzDvvzqpHBL9Be0XWzL0WokSmWdqnA1v
         Oe6WSBsmkfOQgMg9sgf4Z0sIqu7ErTZAX9NAEUndzGdYVuu1xXTvInOA+aoci1zWYttp
         x40nRVGP94AtKYZ+V3ZKjzjKl5bIykpYHpr8h+1hSVXRy3SkxIwpnn9B3/J0SDX6vSKk
         MGifpWy+cuov0t4+pQCHoLVH6BxiTHVrsGpezwbAk3oQtPa5Ei8JVzcMKSn64/6ECp+5
         RnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780039628; x=1780644428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oelNQunsqm6lRn+BaGSQ+cqWJ81wjwxd4/AhjqK6NKM=;
        b=baYNN7ihX+2lFh8Fyhj3YfF9vOPvKhPSuTASPgS34e7DNxKL8NvOBLqRQ0JaPGqbmy
         GRtn6zUtK4f77Ryaz6WczrbTrg1gq/XM0iZ2YHd9XiIYZWWvJzGrnn4I+0hA79NVBg/d
         xSanWWnyHxe2NTBk4FgJiJUfDga8sVJfFCKt+6EhoQxwTTIlE2zGR1uyPgQ6NCakSHgr
         SpqfqEbT258txNi0E4bNWXoiGw2B3HZ0+YzomCWMckYkMlWGH4o5KmdoWJSDqHFonpmR
         3SX9s7la+x+Z4PCmz7oTI3ZHsqvb1QFibjss2PPubtnDSlKhRb7PRRkSq15sDooRj2RM
         ZWsA==
X-Forwarded-Encrypted: i=1; AFNElJ8k3mE4gZA4KIQ9I1SjidAKbO9rJDHGuVw4X5GJDZ4wLtXFu74LQUdfugYLwOjPeutPo9Amwbkdf5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FrtLwHR0WzRiV2Ys3a6tQNoCiMbsq+sQCtVhkpvMX9RUtwQd
	3BFaUvBXJKepagZJbikEeYHM+aZ1wO2ophOJRLvcxEKXz0H/aRbtHiJN
X-Gm-Gg: Acq92OE9SgHr2LniUBQqqxnXkznvlqcaiiHKUvdb1GxJpk5EE0tBOZ+ohk9shVkoOxC
	a4kaQDULyHSOxUkQBjj6be4ovdy0vhTTrfVpUNxmn+St7wEmNYl+sQmrZ0Trf9PYzwoKz0IY4C8
	9229FlClvQ2bGhbyYuahLLHShBgQpLjsdmCdMEYf7bozOGV2JJckfSqJoZ4IpoSIDCxrX1U6c8c
	rLtaK/xrwbetxwHWxJGqq90xeyueeNXSornwucgt/T5gYK+1n+4oujxRNl5XOOqpFLgBIUdR+CD
	CU2H5xrqLwo+tkpd3nL1MSTdmlUPjb4auSroQdGRJAxsEX8f670rilCAxKgWJ/wEZSIjvZ9puB8
	wY6fweDewgVpfM4iaqpX1oMdIjhanRnh+10mhqK4m5ZjifewFXz6aW8wUInLcEs35hMpXc4C5dM
	fzbqUdHAInwwBACBtc/Pkyi888etFWvGRiSTZWFhzLHcZJi5NF+alybg==
X-Received: by 2002:a05:6512:3b1e:b0:5a8:950f:e92e with SMTP id 2adb3069b0e04-5aa594b1691mr463708e87.23.1780039627984;
        Fri, 29 May 2026 00:27:07 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b7921bfsm90535e87.70.2026.05.29.00.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:27:07 -0700 (PDT)
Message-ID: <2045debf-e518-4a7a-9509-e305cad4bd11@gmail.com>
Date: Fri, 29 May 2026 10:27:05 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/05/2026 13:29, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
