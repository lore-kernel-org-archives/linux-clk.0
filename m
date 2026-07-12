Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7E1367B89
	for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878900; cv=pass; b=iWxm3SBK6WPQH1z98xthzpFodul3z4+nj2lzU6GlqkvxmO/Qmj/o0Dpzc74t6YcEJkcCySu+I39rgZGd4GuXqk2dXOMBJhfSga4fqSMtTZItuPWV9zCSFVB+QIbM98zUqrX7xmpTSFTwwEqzdZJThIiF4OPHX3gq6kGF+gbE6KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878900; c=relaxed/simple;
	bh=fc+IpUQ3nxL/5ehuQHd+IPjoUpneuBJkM4s9M0NB2Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2cPe5oiA7vraIJ9OMsJjvelQX0TyYzvB9AsOESF/oxK04E0YsJfeiBdfbttF7W3idrQfnFWXB1v/8+2e+BwPO7puXt642hPTU2JMXNFBvhsBmM7zOe5g/HWF1SwtKDOSuYCDvZ5OQLNNWMqCHG6QDrSfhzozB0AzdktyWS26Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk9LW3Oz; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk9LW3Oz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacf197759so35657105ad.2
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 10:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783878898; cv=none;
        d=google.com; s=arc-20260327;
        b=cqEbdKTPRFBE2Kwb1Yjo23IqLLvG0Svns8eYTW6cy3LD/8aInB8jo7/SAL9DgSjQqi
         bukv7pfznrOT13P/e/z8bUVbNp80CddZ6Qoab11CoU271MqfkAKrNDtou2LMXtftlJ8T
         fkLh4fHDlplptuK5MSMtvsEs0eO90jszkdCVj8y1FoaiEYYMH58EamuzKifTtUCgZYa4
         Ply0KmTJnYA3g6/ZdlZsPT0Wa2OBzWS6wpdyZUpm51KSph3YMjwb03ziFv+FrD67t95E
         oUSqSxl9xpl4G7/NB80yq2hIzkq61SZpebV3xh9Rq6DyPu07f5ZRDAve5Iuymj5sos5o
         gOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=44M0iHbAGhfU0E5ExDjtW7aZAEv+cpa/Gl2E/ST/Kgo=;
        fh=AK+QlpK/iXXDctkfI0pGWi1DFe8XrB4t7BQwkb8/hYg=;
        b=pbyv0KbIZkpsZ3HjaXXNP2nHP/QSYXb+OH95ZQ96bY/OcTo5YVLEUhhJFDjF9A8E9I
         cZrFXdJrnpC/lWnZFSMTXJhat/wpSNcFJCL+3+/e8FSq6zvBPZSnPtqCmIkcQcFymj79
         fDQIFiwRxRZpTQI9SdNDFmMVbs+Ymbr68khRCzwVDIUukTHEM6OHoUK3rM5UWcAVJfJj
         poeywrUGe6IAxL5LNTO/v5EjMDzrlfBapdTTxA9pWWV6r/JgxT+DtS8JVo6jXeHac5ED
         BBMeI5LaRzHUwfKsNbl2DFNN9O1dMYwN57TQCqh7wlPS8QC1ns2GCKxiv+6RB8zblxzw
         o3rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783878898; x=1784483698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44M0iHbAGhfU0E5ExDjtW7aZAEv+cpa/Gl2E/ST/Kgo=;
        b=Xk9LW3OzvRruJ4VOuwqux1+NPk95JeqTGR466IFMnKnrJkBp17kHT1JkIBGVX0XUJO
         +zBeO+4M/Dab4Jzj2ODDxzOyudxoDFUoqLyMEteALSjk9zd/0g0Xh02DNn5IF3UZqyT6
         lm4X5AXiWqrPv8e84cHsgFq4UILDjmGZ5n/uRWjIZWbyhH1lRVOg347wI0k03Uqhi0S+
         QY7impInoaf0Yorchx32dYnwMbjXA5JkyotfDXJsrbBWb70mAuHXS9rTnSz4jRIhsNq+
         ALg0REAIuFX5519q7mupm+NajEBSI7sA5XvN0VYqVWbdXQ6mCasCz4mnsK61OCD9zYyY
         211A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878898; x=1784483698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=44M0iHbAGhfU0E5ExDjtW7aZAEv+cpa/Gl2E/ST/Kgo=;
        b=PMcEN5fd3D7PdSZRArG+oRZSdWT5gSWFmtes9QrdlIa2U3SHohoIilx4voh1ji7PiY
         pf43OV9WHmzZ4HYG4zwwMs2rmT8jr0QXBwqLvNyIdoVKPicBhLB0kvT3VHw5vNsSoeHR
         YXuxDa9aPQuSnVeVIqmrtrreL0hsUrcEcrHRtFeIE6a1cOlFCx4lkoiZ2yBuBICgPqY5
         XDUVkuA5p6noxYf4jSCj+rj9vl4HSvgUWf5zFQQJX5CQmoXYkrCeExp4xiZi8jFFIxdG
         HydCVj8wjdFABnMV/UbrluN42aacrA3f63D32hWY/Yq7GTshj4KTKiTNoQNPTOe7TwgS
         wPRg==
X-Forwarded-Encrypted: i=1; AHgh+Rqhj4nBgFWYtIXCHN3O78efF//5wriMeIOK4YteJw+A5ty1KBje9QGzEFwRlBU3DfD1WChUNUep+Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUtRYjE2dZ+pm9xrfllJBwT5Ox21oU/67Ilyzq3qCYOEiUSxo
	/MwC4BjhWMvHAn3W8Stkwt0x4OWr08eT/DeiyzcCIzWXw2nrkuoaVAvJnwPAFfOJnZwE5b0YR72
	dhbmYsLw0VAhb/JXa9moTDgEg3Z3NF3Y=
X-Gm-Gg: AfdE7ckTx4nwJ8ivGtNdJRXbwrEVf82WaYp95jidAZGO6Dwco0wR7dZ1Nbc/Ei25Kvm
	6hrdfmmoelXUus1WuaR4wshC3H9GjvxZCwBbFG0Ug7pMnvQMBTGIDs23aKKCQ1pVDD/z7oVRxlz
	p+5yZNGT2/o+IBh4vlX0OmRV3Ibobtg1oSC1BOPmv5Mg2chfh8tB0+uI7sT4sPUQFaw8hGor5m1
	HvuJ/fm0m1l/nePEs2E5WNjGFdSmmNGw6O3qjwsOPlbWo5R5DgHG1OGi/5GP7ICg9Kw6W1+3p7a
	Ohn9HiW5ugPnOIw2Oh4dBdUVVHo5xrysUWRNpfA/AQ==
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id
 d9443c01a7336-2ce9ec0f113mr59165295ad.27.1783878898518; Sun, 12 Jul 2026
 10:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <043fc930caca4c436651e8fa77a1ae16a26d0a98.1782909323.git.mazziesaccount@gmail.com>
 <20260709104839.GG2045740@google.com>
In-Reply-To: <20260709104839.GG2045740@google.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 20:54:47 +0300
X-Gm-Features: AVVi8CcL95qrnKnAwDam6L3CmPNXOQrdJCc5kyQJraLZys2_Y9aFOne1g2IfMvw
Message-ID: <CANhJrGPJDjxv9xqXs9ZQ37O12yvUoxGxmL6chtteb__RdLrTPw@mail.gmail.com>
Subject: Re: [PATCH 3/8] mfd: Support for ROHM BD73800 PMIC core
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

to 9.7.2026 klo 13.48 Lee Jones (lee@kernel.org) kirjoitti:
>
> /* Sashiko Automation: Reviewed (0 Findings) */
>
> On Wed, 01 Jul 2026, Matti Vaittinen wrote:
>
> > From: Matti Vaittinen <mazziesaccount@gmail.com>
> >
> > The BD73800 integrates regulators, ADC (intended for accumulating current /
> > voltage / power values), a real-time clock (RTC), clock gate and GPIOs.
> >
> > Add core support for ROHM BD73800 Power Management IC.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---
> >  drivers/mfd/Kconfig              |  15 +-
> >  drivers/mfd/rohm-bd71828.c       | 145 ++++++++++++++-
> >  include/linux/mfd/rohm-bd73800.h | 307 +++++++++++++++++++++++++++++++
> >  include/linux/mfd/rohm-generic.h |   1 +
> >  4 files changed, 461 insertions(+), 7 deletions(-)
> >  create mode 100644 include/linux/mfd/rohm-bd73800.h
> >

Thank you Lee for review. I agree with your suggestions. I'll re-spin
this probably at early August.

Yours.
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
