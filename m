Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AF2222D1
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740605446; cv=none; b=H4SaEvx92HiA640lrrXddEcjK2xFuBrGd7lBHiPT1GAcdl5bCd1mBmEFF5BDIJVG6rCyV9RV/YrmUcATi9xmXPHyGD8fPfa1iuEICy80gAXu58MYbfiR/OPO+N9WIrZyFw/Wl8RhWciCAS+hdy5z6/evDtrJybgrfgfFBfJ4HCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740605446; c=relaxed/simple;
	bh=SUGyhrxSVMFnfbeL2igPaj/oiGAxEeL7XtDqz9AUnnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skS1DpaKV8AePmo0FeZEThOTI4jUnadUsDekCfOpDkWZZbmd2CMnCnPlfYYFQJ+cjfntef9ybGPv6+QPS+bZ6/ujhI0H5s9GqYEkScsqLnYKUqMLYqJrZaePYFdhFeomvTKslVLz4ody5whAmeokDhA7qaLNWdUa/O6tS2iFm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ydanzjl1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ydanzjl1"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-546210287c1so187466e87.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 13:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740605443; x=1741210243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUGyhrxSVMFnfbeL2igPaj/oiGAxEeL7XtDqz9AUnnk=;
        b=Ydanzjl14hrygn91S8Nko4t/Lu6O+jHrxkLHwEUvVpQLrL27BW1krQWoOXnuIpMhcD
         /SCyOav0DKnLX3+CJqsN+yJkwcWvXzaD3AUkrBVlQo5QLPKSr7MFdSKsD4/M3B15RIrH
         KfxPZhNEI6gnTqPTq8IqmLhfmV5Xlf/WdeG1sr2jZB3qRusSGa/01jV6J74VMuZ4C8DB
         CE2blEc734i/ApojqloxUGTMjH6KtTB/8f4VNtupqKgzPYc56Y/fARkBT6vXoKjr6RTn
         CRYn6WMMxVunHXwNtKEVpa4JluLqxKpNEtrx1E4LVcWGMyG135R0cr2o97Nka2L0wcBe
         RxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740605443; x=1741210243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUGyhrxSVMFnfbeL2igPaj/oiGAxEeL7XtDqz9AUnnk=;
        b=aOSPac3kS4laERWF0K5x8NHJxInrlYDeVsEgLvoQfrnan5+S2VNTKMDjBfzfp3DTXQ
         poIiA4Q4ok/bCAIKkLsgyqbt5k6caC5y+uBIGQ287nYay54y93BuEBI9DkGrk1nqNH8p
         vLb1XaX6Xy6HoZSPhIlCDqNR9gXiq2r5LmQxQsU/jwpwTxW0aE1GsereSm3egPWMHF+e
         cMwMS9kF2Myusrlrgipv5uVQJGtCPSZulHSNWJoj4cP1lzgqkGh0xPkLwm/0ty9vXttt
         Qi8qIQbFct5VKpvEeft/VhD0krbQsYg7KgzAmyIxMflR7jdtoPYD/eN/5HhqfE6YXB5V
         JydA==
X-Forwarded-Encrypted: i=1; AJvYcCXcP4nbsMuU6wAm0OSs4c8MJPzgTBtoMYrpntItThkye9J82g4RrRogB1ZbD5I4WgkX0YvihsW+Tro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbF2AP5OXcqrGHsw106G/V6svCuh+NQhVTK3arRy69ppiYkiCO
	1ikm+0K2nWZULHq9qPdzXqjl2T36KRNYjK46YhlBnoAKDYAWbb51BeM8XKp5gMF2NJKOc1YWbs5
	43vL68KsY3Xu9QnWA/H/6ObDFJEaex/JuL5Ay0w==
X-Gm-Gg: ASbGncvxNzK/notDxh8scWutlj9yBZZ3n0JC36C/4jbCwgmRlO6lPE7cVzv3QaNiXnZ
	o2FBYn0Lc0BXAvIwDH43Z98So936bb+vsRbi4xMHmXfCJhVW1J01vtFnZNPkk51dG6KL5UBO79x
	MbfS4X8c0=
X-Google-Smtp-Source: AGHT+IE8+uZvHOPVlO4cJtPSuzroRvBR0aRjVwpJAshWI+BRIHeRYPen8jIF3ZZZVKAcoSrk/otZQzN4xJtaQL33NME=
X-Received: by 2002:a05:6512:2347:b0:545:27f0:7b6f with SMTP id
 2adb3069b0e04-5483912fc82mr10885628e87.11.1740605442695; Wed, 26 Feb 2025
 13:30:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org> <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2025 22:30:31 +0100
X-Gm-Features: AQ5f1JpA8TYnCxYWLh_Nsj3CaoL2jBGTRtip6jpMFprAlot5Cs6Ct5PvAxVIfSk
Message-ID: <CACRpkdaokrm1wLHGpP6aCTA9uQYAptVqt8J6+BQu1MmJsk9=Cw@mail.gmail.com>
Subject: Re: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:38=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> From: Dang Huynh <danct12@riseup.net>
>
> It looks like both 8917 and 8937 are the same except for one pin
> "wsa_reset".
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

This patch 4/10 applied to the pinctrl tree.

Yours,
Linus Walleij
