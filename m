Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261061DE884
	for <linux-clk@vger.kernel.org>; Mon, 31 Mar 2025 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414624; cv=none; b=TUws8uK9gtKSFmfvBgZrxsc4rR4kw1XJaaf6/LJSqEja9mmewHybBnPNI6RdgNSf8o3Tipkg3LnwUsNICevTuB533a/kjzeTXMCmE7A1DxaENutcHaomseQsWtYeVXaNgKvnc2wvc+Yzn1nnVHjfgomixMTKFArLGPOAXqf/nP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414624; c=relaxed/simple;
	bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBXhXjJiKciyZGnq08s8jQ03NMdPEzjGmESyLH0/FyeDkJC8iv4g+Jf/VkSrpLWDK+UWSiPsgbLGrtqRN9DhM0wK2weukCa44ig+0Vw9P/drAK1NcfJV3/k0XPYo32bTkq4yLnn+/q2ZIWC9noiG+GKOP+UYrSZXbklFy1EhOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUU6uazw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUU6uazw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39149bccb69so3804715f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 31 Mar 2025 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414621; x=1744019421; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=sUU6uazwkA8HHrSIhWW0uNQTB0VUfOY2iGiD1yr3zKrJq6Q5qz6eJD2ixgC6PhSW20
         h7JbOgEGrXvNmf4uwQJRL19QH+U/v6LzXmlbrM6dK/nO8rklxpZjjXk+OYy8vO/z7BwV
         qFijTuMGEE4MK22fGGoACtnhOObmOubIOMXev5K5lRIlkTzfnltNisDwVv1j1X5/qA3G
         EC/lTyZDPlKHNOCR0hZFl1CeUbBGsjILXNp+Qu5QcOEIuZzJNeLHUjcIClNURtbWaIX1
         DrGqTbzGSGgjWTKjZgYqSw7dJCGvPZNz6cT9xvUF0NfZcQOyx6qQdspn7zLxemIWAJav
         hFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414621; x=1744019421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfQTWTf6PwJHc84otuP/3Oag7lcNdI1Qagn5HFWHEVA=;
        b=n/BqbXEqjpSloGws4LrcQjoHe1KKmKofjJTHRIJuktIShPCg1l2vdmnmI01JYlvh5b
         7G73I9rxM5y9+ldBC15ZB5fdwFcpwhxKHfhFa105b5IvmENIJUi6p6tDnAVxGrX65qjD
         0Xytn794KBVJTL8CLGgBwa+fQyDCBfmQfinPqu2ckXtiOD916cpmw6y6jBQs5wPCSOlo
         h8/+Lh+9EhQU53jaomeN55VBhh6ZGiJjCRJcYje0UsQfrdenanbBASCp0dsomi908apb
         kU47Np9oPXqQmK9wbZh4hm65AHIupHPtmkcsTEAJ5NMtuVQDUdLP+zKL1qQbz51Y67u+
         woew==
X-Forwarded-Encrypted: i=1; AJvYcCXXBnyaIWnOrZznh7zJ+8nHcUMwNEuocI5LLirLCmzt4zW3ZTFdJcSLlLKLiY/MbApGtvYE5ZNLiV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gD3UOa9SPDEB0+CqIiITeNyoxd89MTcPnHy8Wh6vwJZOdqbB
	U/iIEweAIZNJVfZoYo4lB30tg4fFtx4EcfvZrCHoqGyfAnOJE2BBLwFlqhILlpw=
X-Gm-Gg: ASbGncts7AGGkbtMJmIuq+kOTFTBBPDCjErVsbERiS7/afcdAqiX3D8SoDLHoM7S90V
	1BiXA9h9QZmaXBFbKvNKXtz0OUjfnm3NjyGGtDluJlTTmxEKWgE8oKiZMbE3jBl2U4gU+gUGofD
	Y5jD20RRPQ672T4oBWoLWEp5uHunLByfHhGCgV8hf5wlXCBpW0tsTmfd2PqpjMLpmL1C3ML8LQm
	ygh8N6FZLUo5VafkS1WDnnpYzYfIUSXBJuWW/KtZZ4/nNdgp5eBd0L3udUiK25w9Nogg7r5/+8a
	sQ6D8uDbQxThPZ6mVag0fZyGgpfmei9QugcH93bge5bDSI4J
X-Google-Smtp-Source: AGHT+IF3CJoa5gLjBiJodD+/fcAKbJi9kK8EPGZgsz0yOn8C5Pq2tbjitNJRw36ftrGGInm9OE4Ezw==
X-Received: by 2002:a5d:47c5:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39c120dec24mr6778714f8f.13.1743414621425;
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff03715sm117091365e9.31.2025.03.31.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:50:21 -0700 (PDT)
Message-ID: <4d8d0d479a1ff19bc3e3a8f5832d924ab822f13a.camel@linaro.org>
Subject: Re: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 31 Mar 2025 10:50:19 +0100
In-Reply-To: <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
	 <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
	 <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2025-03-31 at 09:34 +0200, Krzysztof Kozlowski wrote:
> On Fri, Mar 28, 2025 at 01:28:47PM +0000, Andr=C3=A9 Draszik wrote:
> > =C2=A0allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: samsung,s2mpg10-pmic
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-acokb-groun=
d: false
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,s2mps11-wrstbi-grou=
nd: false
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - required: [interrupts-ext=
ended]
>=20
> Drop, you should require only interrupts.

As mentioned in the commit message comments, it doesn't work with
just interrupts. It appears that dtschema's fixups.py doesn't
handle this case. With just interrupts, DT validation will fail
if the DT uses interrupts-extended. There was at least one other
binding that specified interrupts in the same way, so I went with
the same approach.

> OTOH, why regulators subnode is not needed? Commit msg mentions they
> exist, so they should be required. Binding does not change because you
> added or did not add yet some driver support.

I wanted to avoid DT validation errors, because we haven't started
working on regulators yet, and it might take a little while until
everything is in place.

I'll make it required in the next version.

Thanks!

Andre'

