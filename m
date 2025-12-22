Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA25311C14
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396398; cv=none; b=Gcb/qIlTKMVy4yDzUOE3BJNJxyjTpRtX0jA4Gw1aTLgndYRp8G9X07CRad90qqoMHI0G6Y0m5tGtS6qBe2qgUQskMwSPlggu96RP8Pb6rdsjrstMlFstc7a/4ElevyWNISavYAqxtapO/qX2/efXZaW0kGBRwFrsbgj2OoTn3eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396398; c=relaxed/simple;
	bh=N3xDxT4wRLdO9sVfi+qzznU4KwqN9oaA0Ye/urJkYm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlKvKnLzvQOPmq8XDPmcMIzS9qXmu/qRBBPMO4jjZagwOtztYPoicyfrOkfkj8biIzSWJGd+TUFBey7ifEfwjtnuArzpPLk/nePhiRCEQYpnvhIYg39vIcE5VrVFGeQ/MAV+tHKi59MfocPt9brMJCq6DBOddgh+opJmSIYnzBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFSuGGr2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFSuGGr2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso4259331a12.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 01:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766396395; x=1767001195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N3xDxT4wRLdO9sVfi+qzznU4KwqN9oaA0Ye/urJkYm0=;
        b=LFSuGGr2FIZ7cQtTf0GHtxVnLbpR3FR7EZANlDpurXGgfuzdAW8S8/j4XBce0E6xOG
         uhxDACUgY5npFUVXxA2P3KGVyBdmWgzn5/kMuLwMkVuqYa4Cw8U0MRqg4VKVTKgMjttA
         cjELqliCfjg6peCPmG+1OIcCunYLCFO0SK5spY4Hwfe1eH8gUB4P21voysm+R1HmC1aU
         HPMqcOnDWEC2p/ps7jxXrfC8xzLby1Zery6Q5EvheSG176iHn7fXW6sLOQ+l1XEJNGF8
         DILq+ZLUjhqoMtiyF1B3yptOcppcrZYn94tj8olOuka51q3YSWB+tzWIUWH5aG5r077e
         7XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396395; x=1767001195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3xDxT4wRLdO9sVfi+qzznU4KwqN9oaA0Ye/urJkYm0=;
        b=bzWZXjV5CEfdxd3FOHP1T7z10VZcv4pupMkYFHdUmjVgTlFcgfM22wg7lDEgIXVQRI
         C22OZpQcM5hYXc5GmPmgbmGjeEANw8wFS3s7PMV391UXavoDlO/2FZFLjWBE9KIo8Mak
         RiW+m4vsoikprvgT1vCRwxY2Z/EbYVTOW9YJIcMCf8KXZ5p0n1OxWJpJSonSP8EaLN8g
         06zim8llD3VLwuqXfKtFu0XISHQbOYMEqZLYxaMrOjzOkrK0JWVvXUKcMPRXcRdPdz9v
         8OiWc2lz1oQACPX+S3k4/rF7UPkEmdgJhO6ahPf3dbPFNgxHC5wjDj5+it/e6zLXlumv
         TzzA==
X-Forwarded-Encrypted: i=1; AJvYcCXpM4fxAVlKJIqkoQZR1Bco2o8Go5NQac4QSi9EEA5MMIhlW4NMXJePREQR/FDS+Nn5VbzMRGc+kFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKgHjTN0zMav7OHHzuyBklvkfqLCietDXO2DIRZLRfluTtEbU0
	RIhJYivXhphJcLjN/BYvMRvoPOp/NZx4qmZHmUF4GPxGHJlwGbbNT/PD2N3ddJMmM7eVcQ00Cdu
	YppvE8YO5VbynpEJ919so8IYmvR2Lpeu1WUEH1zdrbQ==
X-Gm-Gg: AY/fxX4oWq2O48ykRexIOgQzeFyrY9hvEcBDg75n4aogjU39Kv/GJtFCjyVjxoxMjcG
	Lw8gyH/L3XhJVC99PqcUdGtlBwl/Zr4Ym8tTcc60eRMkpV1lHxgAC6gf/42tENGRfh7ZYIxcaXh
	d81/AlQgb8BJj8nDtgRfLrfeMW12bTPKq2PswalxMwI7A7cRGLvtU+W921ESbcW3P693hiUYIpj
	Uf/uHz5fOM/6DfksaRTP8qFcmU03rOtMjPByNjOY57MQHxtDxcSIOngNUVfII4ge46frQ==
X-Google-Smtp-Source: AGHT+IGPSwnqIzk14b53jhsi0LLKrWwl4Jdj+i+v0Qtc8GexQDbm48IQKNXUeCL0o0600WDhojcpvCkUpASsKgmBQ8c=
X-Received: by 2002:a05:6402:1ed5:b0:64b:7885:c985 with SMTP id
 4fb4d7f45d1cf-64b8e93c197mr10800970a12.3.1766396395392; Mon, 22 Dec 2025
 01:39:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
 <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org> <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
In-Reply-To: <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 09:39:44 +0000
X-Gm-Features: AQt7F2p0LonyB7NCXdfWFQondzzQDwR97Lxzguv-wlpyW3em81jQv8hflpu1MCU
Message-ID: <CADrjBPoWcONhJJdCeovkwQ9Oha+t+dpHY_ohKPV7BQS1tougGw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 21 Dec 2025 at 13:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 20/12/2025 10:05, Peter Griffin wrote:
> > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> > The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> > bus components and MEMCLK gates the sram clock.
> >
> > Now the clock driver supports automatic clock mode, to fully enable dynamic
> > root clock gating it is required to configure these registers. Update the
> > bindings documentation so that all CMUs (with the exception of
> > gs101-cmu-top) have samsung,sysreg as a required property.
> >
> > Note this is NOT an ABI break, as if the property isn't specified the
> > clock driver will fallback to the current behaviour of not initializing
> > the registers. The system still boots, but bus components won't benefit
> > from dynamic root clock gating and dynamic power will be higher (which has
> > been the case until now anyway).
> >
> > Additionally update the DT example to included the correct CMU size as
> > registers in that region are used for automatic clock mode.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v5:
> > - Invert the test for google,gs101-cmu-top (Andre)
> >
>
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>

Apologies, your tag should have been added.... got kind of sidetracked
bisecting the linux-next regression with the serial console and then
forgot to apply it.

Peter.
