Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCD333711E
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398861; cv=none; b=HYOZWuEx0TvtZYpMgWeRT9RwiAhHvHpjtBPkDJ9DGoQwlzN0q4jt+HQ2yd7PlRmJPOeR4CRYHCXfp5LGFwStehyW3vKlybpLxbmM4fixldWRmAv4c7LIw4dx+2SCyHN7AijyHx0zW1qCONws0Oz8th7KcKJHYqZ/LWlkC11Gh50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398861; c=relaxed/simple;
	bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQp5iqzb7oJhulNutTakwQ80tsYuTnP2kAUDFbytv40/p7C7usNlDaD2G4kMgvp+oxcJrE/YIgcJgFX7dLJxhO1N1866pKXo+J6g0b8cczfEcBcyozQcJgPbIg9Q80EZqk51WsyOQElziiUhu04cAGLojiW+q/iGjv/nPrm70l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kvqWK2FD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvqWK2FD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so6015811a12.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398856; x=1767003656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
        b=kvqWK2FDfzZwlzqSu9XTjeEQeRtlhaA68fxH25Wkr/AOOIf2VVveCACGTz17zCFqI1
         6OaqGEx7GFTGJ6N54o3ARZ3lPcMjBpR9guUxwZ7W/goBidIpEpohZYsB76OiJWTUgD0P
         ARO22ejTEeVQ3vVj3ow1RvogowjIpLgN+4OsDk9xaBDlY8VLD/UjKAl+5/qDM3+e8PsY
         hDJdfvZBIBg4EJ8C4rrC/UciiRebBhWI4IMI8DxEawMFIowOLUSRDxYcpnuQBXzyfBPY
         ZEWm6fyvkY/EU2Is6GxMbAkJYtKK2ueE/I5yfFhcKbRRI8I3/lKWhF5+ciZA4yNJrQj3
         khrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398857; x=1767003657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGX6q1EwizBQuQDLpaywg7mzFMLwjK5EiQRcSXh1QdI=;
        b=sCbqEWRsAMGRVD+Iih0GUmWDo+Uh/+25PoUc33XnQV19VR8dlZb4EZv/NHuvlhfiM8
         21Tmo+Fw/qOt2hasic8s5uGTQ2INdAUngDY1cMwbiwqkG2dA980b7ujFSK3OgpxUZPps
         O6R2E9qW2IjCIMUEtH5rNhSTcy7OKCZP/hnhbUkwbLuZDZsjaa3tqiyxvt6hgNFgToLl
         5sqSuQYZr7tpkmrxY74NJj5FZcoWmW8QSdWJuLwIQzrFOKRYjEUgr0Kz9e9HhRY00Zyb
         77Nfbh1KAyrqVLsjUzlqS0gqVeZiB3UU706LCZzChSMwQ687DEGZ01/m4+OGzp9tOTkx
         78lA==
X-Forwarded-Encrypted: i=1; AJvYcCW3dajdPMD3cjS6Vu99nxJsXsswC1bnEUcRU3onkQcW0/JHeQMCGt+ylziChJJ+HGUkD7zKvvbK0Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw344MXWPyTb8jjNf55xOD4ePpOv/v7pKPS7uDj/vkgZN25s4q5
	vYx/ACOUdUnfVDHnW9QdvlcyNB5LHhyOI8ZdxnxioEhfdcK3VNPu00O2Jx7N2iHKol99RlM3bP8
	iA6AKkt/0aSZXuwK/lpAPZJfzPKkaoSPvaN0cTYvgzw==
X-Gm-Gg: AY/fxX7zQZ5Cu5W+yqogGhY5NQNF8xRS3i2l3wpd729ElMsN47Df8M1xfb3qRP2E5+Q
	AIKRZXCXmR5Eiqq5D6iTohmZra3ihWT/dYIRtJNUZMcjjojrnrr3VmQXCZCt4b64sdtM3pRQqyo
	hc2rab3btalJ2/81w93oQHuayFGGX6io7sXxz4L5IaiK8GFokVoHAbbk+ZIQjpsBUBpt0TuWxtG
	XrawJuvMPq3wM+z/7eGPw1u0Dy9B0yjRlTztoOpY6jDHVZbBOeMplX5cgqMJkgyRZaoEA==
X-Google-Smtp-Source: AGHT+IEqXEGu9cvltqcnQjyMesMjaoRtKgOECBN5qmN3T1OJaLoUGgTcyks/ZkPJRdcjfHofOWpRzwLbozye182dWTE=
X-Received: by 2002:a05:6402:3591:b0:64c:69e6:ad64 with SMTP id
 4fb4d7f45d1cf-64c69e6b268mr7653426a12.24.1766398856513; Mon, 22 Dec 2025
 02:20:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
 <20251220-automatic-clocks-v6-1-36c2f276a135@linaro.org> <215eb434-683f-4cf2-9bcd-0860991ae23e@kernel.org>
 <CADrjBPoWcONhJJdCeovkwQ9Oha+t+dpHY_ohKPV7BQS1tougGw@mail.gmail.com> <d7a749e2-1d00-459f-adbb-0841190b7849@kernel.org>
In-Reply-To: <d7a749e2-1d00-459f-adbb-0841190b7849@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:20:44 +0000
X-Gm-Features: AQt7F2okhEmetfhP-OZXD27I-iFbBBEDggeAe_X29tbibS3bKuDBCabzrOTR_5o
Message-ID: <CADrjBPpv9OB5zjsE=+dUyZCz2xSs6XXWkpbK2qbFAdUyTaXXhQ@mail.gmail.com>
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

On Mon, 22 Dec 2025 at 09:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/12/2025 10:39, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > On Sun, 21 Dec 2025 at 13:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 20/12/2025 10:05, Peter Griffin wrote:
> >>> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> >>> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> >>> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> >>> bus components and MEMCLK gates the sram clock.
> >>>
> >>> Now the clock driver supports automatic clock mode, to fully enable dynamic
> >>> root clock gating it is required to configure these registers. Update the
> >>> bindings documentation so that all CMUs (with the exception of
> >>> gs101-cmu-top) have samsung,sysreg as a required property.
> >>>
> >>> Note this is NOT an ABI break, as if the property isn't specified the
> >>> clock driver will fallback to the current behaviour of not initializing
> >>> the registers. The system still boots, but bus components won't benefit
> >>> from dynamic root clock gating and dynamic power will be higher (which has
> >>> been the case until now anyway).
> >>>
> >>> Additionally update the DT example to included the correct CMU size as
> >>> registers in that region are used for automatic clock mode.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>> Changes in v5:
> >>> - Invert the test for google,gs101-cmu-top (Andre)
> >>>
> >>
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It looks like you received a tag and forgot to add it.
> >>
> >> If you do not know the process, here is a short explanation:
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> >> of patchset, under or above your Signed-off-by tag, unless patch changed
> >> significantly (e.g. new properties added to the DT bindings). Tag is
> >> "received", when provided in a message replied to you on the mailing
> >> list. Tools like b4 can help here. However, there's no need to repost
> >> patches *only* to add the tags. The upstream maintainer will do that for
> >> tags received on the version they apply.
> >>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
> >> </form letter>
> >
> > Apologies, your tag should have been added.... got kind of sidetracked
> > bisecting the linux-next regression with the serial console and then
> > forgot to apply it.
>
> I think it was more than one tag, so I decided not to look for them.
> Please send v7 with all tags collected.

Sure, will resend shortly.

Peter
