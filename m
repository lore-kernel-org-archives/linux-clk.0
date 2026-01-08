Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3B94A22E6
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869723; cv=none; b=PInUh7Gq8nFA/gvx0l4XKVnrVTA3DQDLssYEFMtx1oNs4FHaER8FZ42gaySRitWonDrJ+nno04y/awJW9gzzc9u8AxhTjiDOiy0JtWvlEIcgFn0WkMP0zaNAaOkHZzDhNr1KiPJJDs055g0Xg0YHNfRvSF9iLtaRm991U5foXos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869723; c=relaxed/simple;
	bh=1EcDxSiAG1moBRCzOCZJ8zXcRYQt9YQGzwc3QfezyV8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vc/76vB2JWhlKmGrzzdioXXoHl4Hk2mVHmBjfjEYMEDbfr0040GHMZXcR5eCLTJxDWjen1JIJnG9creVefhtAQirNRFjr825FxsrWDT6WIbfDi70HTloq0o3TIGbaXr6mGLePG0ZeKmm26D3g+sv2qVqs0WNOf/DvSnJeqxMWyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IulLOtog; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IulLOtog"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c24f867b75so302692385a.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 02:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767869710; x=1768474510; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=;
        b=IulLOtogqry/8kwuO67XPqp5pdFEowA6GHUKufqq2Zb66dfz4LueeKVDnrkwr5U1/Y
         cDnDqZ7r2eqvUCmYE3+EV31pVUWmHBfc4p+e4/yJ/tYmTSfh/aVl01mLKnBsmVxoRxSd
         Czly3hrALXQUKZa2ZGcpTzDUtm70D5zYE/hI6u3Sz1EBimnrjWbj4ySWZPcViLzE76XJ
         xUAB3LvMmrXVpSugFvS1a9bOAuz+PGC2+g8VgFIbBpBs009rj1uTqL63kMZ/8I7+Qd04
         mKNR8RjbMli/hfcDP5SgQ+K27oHniXLJXrnLFyMV8KzeAiP161eKN6hEfqdSi0nFTD/1
         ZVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869710; x=1768474510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp+jLnpi2PjqF/80J1/P3vKHgVtAc982+H+fWTmGZ9s=;
        b=SCrR7SmQIj8Ob/dnc8VwSRhxogNVMRB8vjTY1DdMW2DFakjCtk5yawvF0wJE+J6hwT
         POj9Tml2xRTBBzBtFbvzD8b13JnNEGLz+lpRZQHD2rhRIDTxH05xnWQ0aNRb/qoZkhUP
         zBPtSBVfv9TDpiLSZeUFVRmOfwjZUNbDxisqyoUE2vOvSAdqRGMD7x0hWxXSTo6OS2pb
         6Cp1hhFg65ZyGefy7CBW7OwB4m7e+KFBHaRMn4uzEeostvDz5WxAIbMBL8EF1t6a0fRb
         NZLiilaK94dibK5BpvLmQ0YcD0QugozXVFt/KuypKnhwsbRxKBdRoz9mwkSR4zdSyrZ9
         r/1A==
X-Forwarded-Encrypted: i=1; AJvYcCXtBBYLZIdrSnw+LbkFK378MwQ9AtKoMTyc/7o88PzzCGlLYBAVI2FauYdXM6oQjwCzZKni/99CyoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lwUg0weOUR4ip+APU53VsG17s4NBOK5KB/aWwit6yoFfh8AY
	rB26TtumhiFaqR+EKyNUL1NpWKcH2adW79qBL8Cty6mmtG1iIwoEgK5Wy6vVmqbAi50=
X-Gm-Gg: AY/fxX5By25FsncJrAYpYsLV+u5e+UX9pbUpE06qIhLkXshQw6y2Ls8TtmAZ+uCOdmP
	u0ypuWiy7pRO4P94NTFrFXyfLnm/xvXmQILRhbppEYyCG4HaMdBcexpD5Q2p/40LkMYEG5wlZdq
	SWtvcRKlt1jfERPqLyFnj/m5H380KNZGgjPtJUJvmNDZjkNoh2BZt2KZHrmYj0Lw6gyyt/s1Atg
	GBD+V09oGLR/volKEjULKEgHsAHjIdK+BEc5ZjgqUBWchUdZKEvsygBMdBwK5UyD5j7UNPJBbxi
	moGfECrw7TeygRvQgSu0Ebh1na3/9fzZLfJGsxI74XGUhd0fSfsfWBJmYYa6iKq4Ogaen7iiA/l
	aX7vGMoUjeiWNLvja0WiVJf9bmCAPm8uBgQmJgg4s/Q4mbsFbbAE2zZu2hLxAsf2oQxXzaUYZdO
	dJ+dYpZYWs1gYIiIvzWnOM50HN1zB2
X-Google-Smtp-Source: AGHT+IH+RaIZdxo2LBIZtEtzdVtnDlJ9INeZCwV1cPG9NK7uPV6RGwucuqTJ9BlmjvonRR2RJ30qBQ==
X-Received: by 2002:a05:620a:45a6:b0:892:8439:2efa with SMTP id af79cd13be357-8c38938d982mr647120085a.23.1767869710344;
        Thu, 08 Jan 2026 02:55:10 -0800 (PST)
Received: from draszik.lan ([212.129.74.168])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f400b59sm574557285a.0.2026.01.08.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:55:10 -0800 (PST)
Message-ID: <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Thu, 08 Jan 2026 10:55:45 +0000
In-Reply-To: <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
		<CGME20251222103019eucas1p2c60f033dc02adfef360b4fc69bd4021b@eucas1p2.samsung.com>
		<20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
	 <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marek,

On Thu, 2026-01-08 at 00:59 +0100, Marek Szyprowski wrote:
> > @@ -334,10 +456,20 @@ void samsung_clk_extended_sleep_init(void __iomem=
 *reg_base,
> > =C2=A0=C2=A0=C2=A0 * samsung_cmu_register_clocks() - Register all clock=
s provided in CMU object
> > =C2=A0=C2=A0=C2=A0 * @ctx: Clock provider object
> > =C2=A0=C2=A0=C2=A0 * @cmu: CMU object with clocks to register
> > + * @np:=C2=A0 CMU device tree node
> > =C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0 void __init samsung_cmu_register_clocks(struct samsung_clk=
_provider *ctx,
> > -					const struct samsung_cmu_info *cmu)
> > +					const struct samsung_cmu_info *cmu,
> > +					struct device_node *np)
> > =C2=A0=C2=A0 {
> > +	if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
> > +		ctx->auto_clock_gate =3D cmu->auto_clock_gate;
>=20
> Do we need to issue "incorrect res size for automatic clocks" warning=20
> for every legacy Exynos based board? The check above should be in=20
> reverse order:
>=20
> if (cmu->auto_clock_gates && amsung_is_auto_capable(np))
> 	ctx->auto_clock_gate =3D cmu->auto_clock_gate;

Good suggestion. I have one or two cleanups anyway, I'll add that as well.

Thanks for spotting this!

Cheers,
Andre'
