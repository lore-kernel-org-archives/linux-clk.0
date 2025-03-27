Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E501327456
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102032; cv=none; b=bKhWf8J8uqBwaVhQAXsQ2RSs8C9I3tKfio8ECoQAyBS9f3xRqIfOPT3uQzqmcNFEcE/ZZIWeqg9+IRbWefu33hUOOFs+t/xaJk8KocSrdiNk0REf81eBeH5BoDxllHH9hb1vuXGi7pShguwNLopmAZ/v8/m4fu7MFgQs+shPoHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102032; c=relaxed/simple;
	bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcBJILxBoX8LId2JmdZ21U9ZkDSYvEwcPBZikhoRA6MRwM0piavJsaZ18KBS3QYTDC5a4bkS/KGZ+ETxTllP0eoh/KMT4iZbNZ1BAjtXhexXsJq5uxbX/YZdS1Anxt9H4duYVXGEReL88A9VmyPdKmyyyVADEG83zHVqvFwLgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HX11PO3n; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HX11PO3n"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso10194375e9.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743102028; x=1743706828; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
        b=HX11PO3nBQGawmXvWlXH9KES6J7ZEfMsIf+vF+unJugBaXButx3DhLwINLQOV8kOkv
         a15PTjnqY99hr/nKMxXTMZorz1g6cpr/+WSP3U2CIkUJlIZbwJSg56if0q9YhGSn3oI3
         8Aw0F8YsD7tX9GdMZIr1IUoqgtxfLHOeVENDa7y5Afbpg1FGlOTxe6NvXYhzrG/37b/g
         mDsOVDr/3HpGMUsSM67RgLsimM4CfCUqa6D2+EFnZxyPI7GgPoVqiDKxGURJIbWPtcPy
         yOgqrrwS7TLp+6qxP3wtenR7mTl2Lmlmh8Z1rUMsRtIAB/qRo319FmgaMDF35zTAnHCz
         alUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102028; x=1743706828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
        b=qHtnvtMM0xq3XYqtH9Co/U6nfGJDSJuFDI6zq3M0HDQeI2G8wL/vPzSmkGYFoPKV7S
         vtPCR9uQfloTb85JRe/mtm/Pd5ARceTcRgbH4rBUPAXt96Bq+j4UtSmR6J8uPtg9g2me
         MryeptqU7VXZQxXlGggpOX3EEBmGoTM/Jtj7jQQcaJmBm64f1HXIhYWHRxaFZ4FyvXkf
         /crGtemnrTCGA72Jw2K5+rHfQO+YupiiqUDE9jC+NqZX80F494+kySTCbOSgy3SYN+P8
         he9lxearu4vc/UXWV3IVvzdWyPiKD4qKzEh+jJLo7YUafdF6JavVqEj9iamgRTEYvytr
         dXAg==
X-Forwarded-Encrypted: i=1; AJvYcCWtEgOQozEFOGaX6qqQfpeB6+wRNmT4J3N+9zJDYLRTGuNpExv+2h4XOKKkOq0kjBjX4Ga6N0Z/xb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFcMAPG1hwOPE/nkA80Vm9ygvDoD89Q2rX7LdG312vDhMhIEF6
	Cog7OS4rZw40aafB3PyCkpwAYgvO1cl4D6nTKQHvD71l/Hvffybhp+SGTbVR64w=
X-Gm-Gg: ASbGncvqb6TWs7l7vB9Uf2yVQDC9/TaufbzC7KTrLLjXI/YwsFsdqgL+moe0xedNUpc
	hvoOmds63IhVnGj+a50wR7Vyh3Ll8L3Zg6Ndnu/ZiK+XkAC4ly3RRyouQrjjfuBCZsVOp9cw5H4
	MnI3tYQqHFJjOf9P68pw7OumMA+9x3QqGDQ/D4C16zLOHw/kMCDQneE/DiOva1LP5ewlqwycqXd
	aC2pbJvWWsXzaH0fVOkJgTl4dnoFeLJ0XODNR20OJ0x07QZb/3A4RyNy1R+713VWKN7oRzcMD2U
	oPuGlFyf6zWzWWxmImdIcP6smC03MxI2NW2FnfEFZZZlEFyKEw==
X-Google-Smtp-Source: AGHT+IGnQpe3KSpRW8OcMy9ZOhvZKg6FTDTo/56rh7+F2u2OEQyun5MJVX1ptbNmngH24DTaiRQADw==
X-Received: by 2002:a5d:47a4:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39ad178a45amr4737166f8f.48.1743102028193;
        Thu, 27 Mar 2025 12:00:28 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8f404ac3sm4134315e9.0.2025.03.27.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:00:27 -0700 (PDT)
Message-ID: <c7169df63dfad34ecbda3554ec51631e5cc6a2ee.camel@linaro.org>
Subject: Re: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Thu, 27 Mar 2025 19:00:26 +0000
In-Reply-To: <fdb8ef9b-3053-4dbd-b3f0-e2fd512de770@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
	 <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
	 <62bf00c37566964d6be794ed12a34cd057d9bb1d.camel@linaro.org>
	 <fdb8ef9b-3053-4dbd-b3f0-e2fd512de770@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 17:57 +0100, Krzysztof Kozlowski wrote:
> On 27/03/2025 09:56, Andr=C3=A9 Draszik wrote:
> > On Wed, 2025-03-26 at 08:16 +0100, Krzysztof Kozlowski wrote:
> > > On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > > > We are adding support for Samsung PMICs that aren't using I2C and
> > > > therefore had to rename the Kconfig symbol.
> > > >=20
> > > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > > ---
> > > > =C2=A0arch/arm/configs/exynos_defconfig=C2=A0=C2=A0 | 2 +-
> > > > =C2=A0arch/arm/configs/multi_v7_defconfig | 2 +-
> > > > =C2=A0arch/arm/configs/pxa_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 2 +-
> > > > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > > > =C2=A04 files changed, 4 insertions(+), 4 deletions(-)
> > > defconfigs go separate tree, so this must not be in the middle of the
> > > patchset. Bisectability, as for defconfig, is anyway broken in previo=
us
> > > change, so no benefit of putting this in the middle anyway.
> >=20
> > OK. Should it still be part of this series, e.g. at the start, after
> > the binding changes, or a completely separate stand-alone patch with
> > a reference to this series?
> Hm, now as I am thinking, maybe we should just squash it with previous
> patch and take everything via MFD? defconfig could be mixed with the
> drivers, it's a kernel thing, not like DTS.

Happy to do that, and it would also ensure bisectability :-)

Cheers,
Andre'

