Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E0272E63
	for <linux-clk@vger.kernel.org>; Mon,  3 Nov 2025 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762177807; cv=none; b=gGulwYcWH+GfFcvSb6iIOF5bk9m7j8OyUYraG2XdTkCDZsgOKFHT4fkT4RNOxRd6QUiStAmqNe9PYcX8fCslGvl4owZyS067bGPWYlunFkgB3sUC1MJSaNpaoOR1QqOVR9RI58DZlFJ7lFHKIXlFP4NXoSrljZ/kvXIbXLLhQWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762177807; c=relaxed/simple;
	bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmBIgqmWdiKnr+9E+34Rbj/dKKrcpE6G+S3dpvvHOukzFttJ9Js4ha41d/+SJ97zpDTglXGa5d1ngAvqXg8bAJ9LASyHnF3K62Dd+hB3tUgYqzRoY9p4lJ9Hjs0pXJ8KWndFa6kxEe18kQcQDyuA+QHeygK5fKTYjbw75yk2qJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=um5xxoi7; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="um5xxoi7"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3d70c5bb455so1562582fac.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Nov 2025 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762177805; x=1762782605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
        b=um5xxoi7PE4OhjtKGJvEvCeyYFBwGy1zApiTqqB7sKGLSYFl80c+2hH/3pAxUx8P6b
         8KV7THTdS77RGxeo1t0c6p3/IS1FPlve8AC7JbTl8OfbB4Hd5gbbIiborjTbTVXoFbak
         e8+QZPJU8kzlS80ytgNWEzWaxBUrhuWH9wWSjEN6H2Ilp9sMWWyIl5cDrxTHN0/cAPt4
         lG0Vms3mTpQ1fDfS58weNnwbbRQtygbrjvddSppLNkxsLTW+d/I8BBuIANRPwqm3Hti4
         C3ivvlXD6yNV/0V5sNVScc5/NQf8RBfF59Hl9SyZwBB5xWzczcTL7MxuLRrxvtm9U97/
         t+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762177805; x=1762782605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsvnfzRwsbf7wGlFzdjo71TLJrNDdp/a+dRwvaix3co=;
        b=Yf0Pga3V9b6m32Jc15pHpYA9eQWxjvCa/7sdQJPQ/IeWU/KVWuDZ9rWylwAUEQJurK
         O/IFJ+jNWyhEBFJLwFN6x2eDhQqbYh+2t9wjut0r/YumPT8BFbzRnhTp+Z2OWHDaMXXe
         v13KUhyR+c5hFVSdvEABRzci3cEPNL0xfJoOsOyqGiQ/QpzxApF2VQQ4gHjfPyjpJObk
         1FW81h0dYRPjA/vibszCWa9OzVHB+T971YnWBN/RPvqfzCcysMnDTO3hx+ByWpKweiig
         3Pi4nfdOuVzXqSEyQb564oGIPV8bDE8XTzLf/j1zMpQ0dGlbsUQ9H2Gtq0ZFswbO8DZJ
         Uk2g==
X-Forwarded-Encrypted: i=1; AJvYcCXwoJeVI9GZ/DwOel0MQ+AAAapy69sksfa+2sRmvqx8V+l9QImbK6QoMzf1uwKnPCn5KQWRg1x8MCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWhatsVMbWZk3BAvECesbZqd4jb6dQ01U+JBnnUbdZ/X6RUZ6h
	zYGkCVDEWTJLju6cWAJQz3p7WnmPMX0WfcYer1CHyz4HDWei8KFegRwb/rdSq1PFpAM2m7qbXen
	eyVzXh8D9QS8bbb1y0PSyi1pQjBPVhhx+vN/XcxUjlw==
X-Gm-Gg: ASbGncvvkrUqSSRvEJMn2pHioPug78M+QaX7vi6beb+3WPdVTEFmR8o6J07LXw6nkQz
	LTfuRxlh2B14rUTdGyCM0+1h9u4/KEhkvYFwB9A14lKOh3zuKIZQIL88uG4RcNFdjfcB1JdyqCr
	7Z/uQdogtIbnJJu4jlXigHscCQWI36LSjjK0zypBs+q6wbKtdvQEwRASQFsNZMJVTGH7dJDbfDz
	sHBBwp/g6yGTchuPl0aqIRikMP0RFky8AX0R5YMSXTopmMv3ciAQTZgaHoFZI0z6HWkYwnv
X-Google-Smtp-Source: AGHT+IEvvbnuEgVymC79WaE8covKlgmCh0NOsdeyracVXZX/SVCozVOiOeq8HhVtYvKE2fZAbBNornSKI+Cu+lra0Ak=
X-Received: by 2002:a05:6870:8e07:b0:337:74c4:8f18 with SMTP id
 586e51a60fabf-3dacc5d1f80mr5149154fac.6.1762177804047; Mon, 03 Nov 2025
 05:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
 <20251102-automatic-clocks-v3-1-ff10eafe61c8@linaro.org> <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
In-Reply-To: <20251103-smoky-rustling-bloodhound-7590ce@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 3 Nov 2025 13:49:53 +0000
X-Gm-Features: AWmQ_blfrAzZoKwokZQZXo0nzPx9hZ0JYCMuGx_l22LwSjR0d1KXfaSrBbDofEM
Message-ID: <CADrjBPpjX_qSehbNkaAG03f=whs09qFzzgNiY3sztk7v0QeCFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: google,gs101-clock: add
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

Thanks for the review feedback!

On Mon, 3 Nov 2025 at 09:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sun, Nov 02, 2025 at 08:27:14PM +0000, Peter Griffin wrote:
> > Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> > that contains the BUSCOMPONENT_DRCG_EN and MEMCLK registers.
> >
> > If present these registers need to be initialised
>
>
> ... for what exactly? What would happen if this was not initialized?

The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components. So it is related to the automatic clock gating feature
that is being enabled in this series. Things still work without
initializing this register, but the bus components won't be
automatically clock gated leading to increased dynamic power
consumption. Similarly the memclk register enables/disables sram clock
gate. Up until now we've not been initializing the registers as
everything from Linux PoV has been in manual clock gating mode and
until starting to implement this I wasn't aware there were some clock
related registers in the corresponding sysreg. Additionally with
Andre's work enabling power domains it has become clear we should be
saving/restoring these two sysreg clock registers when the power
domain is turned off and on.

> What is the exact justification for ABI break - wasn't this working
> before? Or new feature will not work (thus no ABI break allowed)?

No, automatic clocks and dynamic root clock gating were not working
prior to this series. Currently power domains and system wide
suspend/resume aren't enabled upstream either. As we work on enabling
these features we are finding some things that in an ideal world we
would have known about earlier. Unfortunately it's not so obvious just
from studying the downstream code either as they rely heavily on
CAL-IF layer that has peeks/pokes all over the memory map especially
for power/clock related functionality.

Whilst it is technically an ABI break, I've tried to implement it in a
backwards compatible way (i.e. an old DT without the samsung,sysreg
phandle specified) will just fallback to the current behavior of not
initializing these registers. Things will still work to the extent
they did prior to this series. With a new DT the registers will be
initialized, and dynamic power consumption will be better.

>
> You need to provide rationale and "driver needs to do something" is not
> enough, because everything could be justified that way.

Apologies for not being more verbose in the commit message on the
technical details, hopefully the above helps explain it better.

regards,

Peter
