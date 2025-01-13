Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F7240222
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783373; cv=none; b=mbi7yadvr9lVugBNWKkaKaufR+JwPGh08DGEy+D42sGVLTLZYFGe19jGhk+cUecCZJOeGntwjvrXUnjyB3Y2q4l0s+USanxab33eU6cCpAk9bGGWvSXRMki05pqWo/pH5//imLDAovFGwKPVxgu3EeOqipy6qG9fsLwQZQsssa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783373; c=relaxed/simple;
	bh=3VhlJqBzJtTxj7R+P2y2L58fGrc1aTNM5AMML5uiVZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V5wsUlRLvYUIGgSDskG7fxbA+n7f4qyOrEp/b2AhTP8sVGNe6kRBx4F/oJdjIdOFZBagVulm8d8zMETc93LdsFCSMURN1skH6Jrzey+HJJTVcylJDYKMpuVvcC3Xxe6fNLHGP0NYH0VqCOhTV3JV/nDI4qf9jmHiSxPCekyqN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ug6xIeiX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ug6xIeiX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3863494591bso2396063f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 07:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736783370; x=1737388170; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Azq+DaVA//EhU0oOCgPNA2FLamSCcJm54Ub5++OHsas=;
        b=ug6xIeiXm4LKSCcRbW/gwcbdku3kXjXuNiuCUe1ha/2mDUXTYqo9ErmTJSKckldbFn
         AEGfjTFx/ups5OyfR9f7hMtlIvaAlYC8BtOTBsyx8P0ZP5tGvKB+I4fL2YTy/i3bnivD
         itVKgKHLLgrHUyehEk4t7iWHvlNXxyvYSnYWx3it4uQbOoQGkYQpQXL1AyE9Jefh3hLv
         nxMcbFMfM/+o0iYstSLm9OqjOCvkXA6Rs9jSHySbh3hl35IiY897bHcoobdRlgozwDyU
         YhIpQFoqmIHEYgPf5PAVYvdnPYWNtmH7KzIOO9Lh/kHjs5YF1l5eTT86/IlO3COk7Sxp
         EWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783370; x=1737388170;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Azq+DaVA//EhU0oOCgPNA2FLamSCcJm54Ub5++OHsas=;
        b=lWoT0BFAhaF5x/AbZwmQc0UTQZijvJ8eJj3AZpsLPWjau7+NelMi8Owc74zNnQq+Cj
         /YeIdlSfbY1V4eB+m68wgB6B9ImsFl3rYmInzPggUbU1JLfRf55cO7bMkeGHIeDYn7v0
         MQU9DtiZNZFPDOtpJJnSFmFa7Zvw9ZX/13Q34kRpLK9FfiidPdGayxSk3t7kZ+ZHQUZ8
         nCDA+tuaFkbteIGZNmbfnVe47CpiLRUF3Y1c5WkpqhCq6e4EKrDk4AhWUeltDc9GRHYV
         0U2uZw3wWjZ3hVIpZnNyTzkbF5/TvW9BUuLLR/dx5hiifPWansYWfYMe2a+QAYIBwsah
         yFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqGyTdbPd6nzSiYOElJwdTnx6nbPAJsUrrZHVaqsiQ+jxJdXxm1Jgj8u+ETknWWiTeFbwHK1x/fuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys29K22y3fZheUCH4kmetnT53CUw8CxnVoLwuyDrHc5mZzqD44
	n0j25qaSnRuQQKLbNW73wzRX+YPcQ6L1wgbA/DttAC8wAcDBtGFuzmJf+eMdJtA=
X-Gm-Gg: ASbGnct6yhchB9nIt3BIFiCJnR1AuZnhaY1G+4RgDYYJWhr0TQzNqHmNim7TYX2QRAL
	eVdhflIyCtXjEUhSM7nwO9B6rx6uBkh/ulJVY99SFJDWfjgutpTwSu6gtkKu3/QsxAtR21VmS6U
	uAJ5scOLYkWacXpRvv5SVdvnysERDslkYyl6v2HtVJXfmgshgWFEDbhuAdOAeDqm3Aidmyl1y1z
	t8DiiA5GnNiLFu8T+OSH3nqRDk3yKBuyXfM+7jciQtwM6xxZlyNAsyT
X-Google-Smtp-Source: AGHT+IF09k926b51tgNC96zHwr2fNP9lLjmS+3CaIX3Evh6rq9eXJgioLCN7Rbq+LYTF7EgYPM9XXg==
X-Received: by 2002:a05:6000:1446:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38a872dec76mr17354805f8f.17.1736783369675;
        Mon, 13 Jan 2025 07:49:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e384054sm12552709f8f.36.2025.01.13.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 07:49:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Chuan Liu via B4 Relay
 <devnull+chuan.liu.amlogic.com@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
In-Reply-To: <af501f2e-2dd6-4182-872d-76260edba973@linaro.org> (Neil
	Armstrong's message of "Mon, 13 Jan 2025 15:46:39 +0100")
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
	<20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
	<1j34hqai39.fsf@starbuckisacylon.baylibre.com>
	<2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
	<1jr05693nn.fsf@starbuckisacylon.baylibre.com>
	<af501f2e-2dd6-4182-872d-76260edba973@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 16:49:28 +0100
Message-ID: <1ja5bu90jb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 13 Jan 2025 at 15:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:

>>>
>>> I think that the clock configuration exceeding the timing constraints
>>> is a hidden danger that all chips have and face, but this hidden danger
>>> is not easy to be exposed?
>>>
>>> For instance, if the routing of a clock network is close to the clock
>>> or data bus of other modules, and this clock network is wrongly
>>> configured to a frequency beyond the constraints, causing crosstalk
>>> that affects the normal operation of other modules. If such a situation
>>> occurs, it will be very difficult to troubleshoot. How should this
>>> situation be handled more reasonably?
>> Fix your consumers drivers if you need to. Set range if you must.
>> Those are not clock provider constraints. Those are use-case ones. It
>> does belong here and CCF already provides the necessary infra to deal
>> with ranges.
>
> I kind of disagree here, if the vendor has the data and is willing to share
> the range for each clock path of the system, I think it should be welcome!
>
> Usually those ranges are not disclosed, so we don't set them, but CCF will
> certainly use all those range to make an even better decision on the lock
> routing.

I did not say you should not use them, I say that a platform
use-case, which is what this is, should not be hard coded within the
clock provider driver.

This is no different than an assigned-rate, and like any other platform
description, it belong in DT.

We've already seen how these ranges may depend on what else you choose
to do on the system or even what package a particular SoC variant is
using.

>
> Neil
>
>> 
