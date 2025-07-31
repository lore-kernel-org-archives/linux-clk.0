Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B85E1F4616
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957262; cv=none; b=medDfWB62s82WZjlzCVplKsV4W/JVAjMGNejthAYy1CfvM3kUnbF3sEKYowQDJBk8cDjuzlV3fnGr2fnL17Qc0pKcjK/Ush8aVbXNLcv1uJyfbYP+4GHge/VH8hFScGfY+b+aMtC5GfAHtyVn/GOs24Ukkctq3azBobBAnur+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957262; c=relaxed/simple;
	bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BdULhwTO5wy3Bnco0VKbd2rnCYpcz/qsF2ln2VQAULCOvjNZM+prk3zPXHYyRy3qa3qUjRziApnvCMIMQnR5u3KG02eUEcYR6w6umCPUZ+DFuhmSa3RbsrY7BF/iHFX+XfMOF/7kwWeLEaRDfbeX4RcdeDvRjhVpXR1TanYTbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdtIclw1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdtIclw1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7848df30cso1081718f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753957259; x=1754562059; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
        b=DdtIclw12SBilY5CAMUdd7ccs+qeIRvc729/Y/7UPBM7zvnOIkCTQa+PU+3MJJUsN9
         dG4R06mRsp1hbfYxL0kgmbOvYyVuNrNNosd+NSNRlaAT6OSliYUNJpvgFcnT1TOVWyt+
         8c7bL1pH+7uBj8YRe0k7lF/fsw8je13pwwN+jhYH1k+D1kuA/QwxHF9165P6WVWnYkpf
         hbRbRzV0eQiXOwOqcY8rEACSBKl2hBMWHJbBi0jH9aqO+Mu2UcuadTpkzcbfLpLlyNi4
         0i7yimw64ONL2CPFVzcT9ic3bY7oTJBjqUot7A2wNJVQ49S8+MMJ7NBSgzO7czvp7MsG
         YM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957259; x=1754562059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
        b=O8R3L/dzM56r9AVDfdlDdpMsnw1gAlIqw3sWTF55JzIAkULgU2K7OszPGKhZi4CJcD
         lhE+g2i+qG8Pzs9BD33VlZ/H99KMumOWjlNsjrvj4GOR4EygWQo8EoBFYyde7vbGquCp
         kQ7bQA/0jKmEZHZg4JywPwskN3vsLpGB12fKnRtKSzhtqe1g+VGkmQrOl7bQD0TuhvYl
         9xuyUdU4IskoYI68HqCrqTKSgchd1wBHw/YGEW+wrMiQQpw3DNQ5oGlcJNiNfZw1h8oY
         bTctVl5vMp6ftyjZzNaIs9SaB9p0KIQcVIIQgqLXNgkDX1AYR4tmgkQZStds5iY1R9jq
         jkMA==
X-Forwarded-Encrypted: i=1; AJvYcCWNni2TDH4FbL+GIDUQr1A5fzws6IMMFWoGi/1AMw0hF+OuLvJkJWEPfkCg5nKz+P9Ei4EcPLqf3ng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5b7LTi4jHvgcJnTBFfeNN6UpDYxB6Hh86jMp2Z0iJGAW0XQf
	Cj3j3Jnz585/A5PStsTw84bx8/QWZEL+3Y42Xzth1E1NX2LVavJzeJXLkH2Ojh19y0k=
X-Gm-Gg: ASbGncv6eKNOniP1AjZ0UQvn/fZcgeCdpAmpnyNfduFyoezu67p/vCT/RXHUlatXOow
	iPismkiEobQWFYpsQJBMW0ybwv2k9etSDx84TEbG1mggvldFu74xZiLNKa8nFs2yUp9j7aVG2Bk
	eI4b6I+FO0ottUmsXzIFYTu/2fuTqbw0ff7a3lV+tLHSFJviwigB6MaADbrtWaaeZGmkq6uy8c5
	BDfx3OmoZbGUbcglEnn0/UVHcKN5kfpXGeBZdZHfX7JT3kyd3ivUwXaWhK2NVROTd85GjGge+fQ
	goNlZVDGD9l5FEQq5/+Rb4DID9t3HC1L/bn1oF3F3417hzGsoCBRqlSB57fshECUwxyxJ+Rr4sP
	u54eWx20UdtPNzWVqFniIKh8pJg==
X-Google-Smtp-Source: AGHT+IFVEwLIcO4fNKnjyIY1mnWetXH6kHJKTnn/c6Wln21XoHb709OPThVEb0OesSZIKjx5gzja4Q==
X-Received: by 2002:a05:6000:22c8:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3b79d812bc8mr1195293f8f.25.1753957258867;
        Thu, 31 Jul 2025 03:20:58 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4588d89c50fsm60787795e9.0.2025.07.31.03.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:20:58 -0700 (PDT)
Message-ID: <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni	 <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>,  Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 31 Jul 2025 11:20:56 +0100
In-Reply-To: <20250730145100.GA6782@google.com>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
	 <20250730145100.GA6782@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-30 at 15:51 +0100, Lee Jones wrote:
> On Wed, 30 Jul 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Original cover letter further down.
> >=20
> > This is a resend of two patches from the original series that haven't
> > been merged yet. That series was merged except for the attached two
> > patches here. Other than rebasing against next-20250729 there are no
> > changes to them.
> >=20
> > Lee, I think Stephen's intention was to get these two merged via the
> > MFD tree please.
>=20
> Although I have no issue with this, it does seem a little odd now that
> the set consists of only Clk patches.=C2=A0 Let me know what you / Stephe=
n
> decide.

Thanks Lee.

I simply went by Stephen's ACK, which to me implies he wanted it merged
via a different tree (mfd). I guess at this stage it doesn't matter anymore=
,
since all the core changes are in already.

I'll defer to Stephen :-)


Cheers,
Andre'

