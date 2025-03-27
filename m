Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A7A20B211
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065808; cv=none; b=n5vQIAXbXvaArsmUptWcqsHMGaF7rgq2zz9pDGdi7WWboosGyl1wMP6g3i1xvgjYWkp+I3Ij7jkfw6IOfGb5IKRlneaFE3erh7LUxsxuheZCzgR9eEpdlbraiO13/Q//24Jg0kLS5wWDuDupF9ZQ3Npa7ezqVDpLIOReTIewPhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065808; c=relaxed/simple;
	bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYFubAK8DaxIswev430twVjbqRuNXGvdhthZ+xKu39rPCN682aKbxNWrOFzkQbdT8F1cH5skAUBHEHObwm7XWuNeVgkWt3JcwRI+UYR9KITkhLIUhGPn7Cl+LXGVYDCewIWZj5kcF4IEDQAw0UTRbD+V9z6FHDzHU1vsg4/yPl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f9EIa3z+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9EIa3z+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so581724f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743065804; x=1743670604; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
        b=f9EIa3z+WG3ihErGNo5scvrjbc3TWVbr1yXum03sHB5O1vlZwZJ2LWsWhi9c/Erpyz
         pDHBJrhhg/kl1JYkoUW2DvVwv5zXmNrBIpnoGDK7t3r0LErmLGK4mt+b9oDq6dR/ACbT
         h3yO8ewgkhjzo0ULTYzEeX8AMKfEHWN7uiMOQO2OBcBuoNEPW537c7kP9L0EFehXJC+w
         W6mFwVOxXIgUVd8FY1GafWAdg+kfCix8vS7Uk9nkAh/cjjiBIfLxT1r/4JL0eE02Uf9R
         pWb9MJag9OwNf9ymAFuL7xvWnOhlwPATHgmw4mihphDFXarzPumdjSnZ4nnOVPSwxr1s
         xpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065804; x=1743670604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
        b=UO1cdwJ4JRN126esdTWXLYURFJ+PnNE7Dh2IJUpfRSq+eSCwS5uDF0TZEon019rkO6
         bSpvdbebuakjpOin0NuWy/P5Mrvjwv1ESO6nfgrjvxI+RbovoBX1HK5RxbUGOfPAla5d
         BzwCYEULnjAQXR5vMiyOtluj2m7e0s7ywdUvZwEcrdLALLgPpqI6IDeMLpLyKnnx6/v4
         8q7EqUXlIurb7v8EmQ3I+o6aa+d6yciqx9DH9dhKO/8xDAhGdQL0KY9ZAU/XTOYX0T9l
         r/a4A18gAGH7ngcPN0egT2THmbhMIOZm7xzc4liPTqMb44Gh3y16uAfzWOrLIR4u6a6L
         ZN/A==
X-Forwarded-Encrypted: i=1; AJvYcCXIy5bmROKslSCT9uKL91X4NJfVY6sMfZ0ch0dKP16FugUp/tqycqnEiA66Qr+rBmGW63UL2/dQKG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38rKXVCEkf+aIYANR7i0P2aeKn/CnGa4MMUfhzy07EYKKq5DA
	cXFga6H01F1VlBW6G/xf26MtG3t1wkO0DTym3MFu+6IcHSNvSjsgnlPZJ2fWLww=
X-Gm-Gg: ASbGncu0DpSdBLNSykpF3qRjSY9p3rclgaT7P+LG+TXVAsC5LOgfes5mxDNhfR62UGN
	S91JsG2sDhUECcfI0Bp3qIht8vpmQ4VD3paC2/KVggtw4s2AG45ad2gi9zb88njlH+T5O7rFnS+
	E/n2682P8hQuLdV5oKR+Ge8fSQ0qg/tBtY2WqsRKVczFu93SnqgklM/mT89/tzPYMQrzi61aUjD
	S58+AIdWme/gtq+bzDguqliiU9B6Oy7IN0XWE4oMaKk3ps1oD7a1ko3as9ROAC79B+YgbwwY/Br
	VY1E+dJY2tZrs6yn42eozFOfYHLTQtui6rLjQFdVn7jfcmPVzw==
X-Google-Smtp-Source: AGHT+IFYnqDl6ib4NKqjPWss5rPeynt8Vendp/W2yLiXx4uK7gmEAWHDdxKjvkNq1tkjNGSpWl64yQ==
X-Received: by 2002:a5d:59a7:0:b0:38d:eb33:79c2 with SMTP id ffacd0b85a97d-39ad174e4famr1984580f8f.32.1743065803956;
        Thu, 27 Mar 2025 01:56:43 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f1bb80sm30629875e9.28.2025.03.27.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:56:43 -0700 (PDT)
Message-ID: <62bf00c37566964d6be794ed12a34cd057d9bb1d.camel@linaro.org>
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
Date: Thu, 27 Mar 2025 08:56:41 +0000
In-Reply-To: <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
	 <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:16 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > We are adding support for Samsung PMICs that aren't using I2C and
> > therefore had to rename the Kconfig symbol.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0arch/arm/configs/exynos_defconfig=C2=A0=C2=A0 | 2 +-
> > =C2=A0arch/arm/configs/multi_v7_defconfig | 2 +-
> > =C2=A0arch/arm/configs/pxa_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 =
+-
> > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> > =C2=A04 files changed, 4 insertions(+), 4 deletions(-)
> defconfigs go separate tree, so this must not be in the middle of the
> patchset. Bisectability, as for defconfig, is anyway broken in previous
> change, so no benefit of putting this in the middle anyway.

OK. Should it still be part of this series, e.g. at the start, after
the binding changes, or a completely separate stand-alone patch with
a reference to this series?

Cheers,
Andre'

