Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1D6284A73
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736847432; cv=none; b=l7Jlet5+BjcBppx+lrsyAE2ty7TlDi8JGsiX2IGfBscm2Xv1HZ2nhu3mdEIHfetggqHW8LGW+owETYCa7K7A7SMqOvbh984n7+r6GYxZEt32rpOq1+wQGmXYTjIVyK13lS74XfXov7HldI4XLKFpu+SKtZF1IM2o4f/5+Qmbt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736847432; c=relaxed/simple;
	bh=fqMjmyNb3Uwk54SDpRDPOEd/CFydxcRIzz9wq6VjFl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9qBWoULx3P6SLTK5eIOxZqq3e6CqGckc7bBEp/BFCkXrKo/hK4TdLP9tFGiEc0MOMXvJffNT/5lu40df8PNS5tyNyDtat/vMZw9wLx20QszH6sFu1R2C3K5dhVfqj1xbI98SEUSLfn9KvUZX6DaSmWRM6JqBXoUn0rNtG9cZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=X3tPFBtp; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="X3tPFBtp"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e54bd61e793so9169304276.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736847428; x=1737452228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=;
        b=X3tPFBtpUs1jSdIgaSrMP2IDWO/kFjfUtxDwgqIiHmqCmEfyOMkv1K21AO7seUvvb3
         iNigqwjJwhx/xrZtrMqn67ZQS+a8M78gITJpJc7lskgeZHm0IgF0Jga79UT2ERmDgbiN
         R+gHgM/mF8k9zAxcAx/1jZS7dBPlZRPlQRl/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847428; x=1737452228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=;
        b=mDLmUy9cHJ1JrC5LF4dvqZAdVn0gCP/6IjwvL8w+uphMSqauFQsPPDIAtd0TR+aULR
         OygV/ETpYIlCTKS9P0Jd0fX5S2nWUMhp5Yp/tvWkw0gTbzeYxjJfOIay/+P8g8LIXqDV
         Kj5GHMqCu+bS15un7VhOIIKm8MlgiEIvereox/HHeds/HtnBvFDww3Kq0QSjfYQ0MyGU
         q4piJpO4miyWOUv8gbXeXZ8lFckN7hiNCz0OLw0sLJx3e9nCMxuHYaTl4AC8rm3GkHJx
         G66W9Uik2iMNWX0vhtfPqzYngOWUGwu5IDq813/YmBi3YW1nDPKd4K7cZ3kJG+73xFn9
         TSBg==
X-Forwarded-Encrypted: i=1; AJvYcCUTJR0lTb456J1w/AUH4fa1hcrGX85RFO2qiRBx9GrkdTaVVEi037YqJ9OjTAPJN1QrxuORPhQdh94=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIzcBpw292mEW6pSmJjzVOh3ptNs26Pd29HH9QjTtkiIn9/yc
	9zu7JfTsBJDA+9p+RCiqtWv50RTabsrJmq0ZHZyvzr/fJ0f4OJ1a2naWiWTzPVrHyTY3dZ2WswS
	EMLVfmy/dlhN2rWKxlj4XNI13ZIRGRATzcaPtZw==
X-Gm-Gg: ASbGncsZaKObARWIUnTYmCYxVNiDor+B9etCrZMGxRRXMDvViAuQNaZ6s03CFOCU2ch
	+g9/dq4igPsREfDAd3O4GaykQ1DgrUFd+D5BA
X-Google-Smtp-Source: AGHT+IF6e2gulZmmKMZM/9qfdCNmIYsXwgatFmybYBzO3L6nSNvtxPxQhBPTkQU3rmXIGx0U/IzVq/5dxO9CIKDtZus=
X-Received: by 2002:a05:6902:12cd:b0:e57:2a07:a97b with SMTP id
 3f1490d57ef6-e572a07ab0bmr10989327276.19.1736847428039; Tue, 14 Jan 2025
 01:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com> <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
In-Reply-To: <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 10:36:57 +0100
X-Gm-Features: AbW1kvbHaMA7-gPSLKl8JCA0np6oyUkVl3x_8EI0Z9Yf3VmqaAgjofQDW5nCXfo
Message-ID: <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:29=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 14/01/2025 10:11, Dario Binacchi wrote:
> > The patch converts st,stm32-rcc.txt to the JSON schema, but it does mor=
e
> > than that. The old bindings, in fact, only covered the stm32f{4,7}
> > platforms and not the stm32h7. Therefore, to avoid patch submission tes=
ts
> > failing, it was necessary to add the corresponding compatible (i. e.
> > st,stm32h743-rcc) and specify that, in this case, 3 are the clocks inst=
ead
> > of the 2 required for the stm32f{4,7} platforms.
> > Additionally, the old bindings made no mention of the st,syscfg propert=
y,
> > which is used by both the stm32f{4,7} and the stm32h7 platforms.
> >
> > The patch also fixes the files referencing to the old st,stm32-rcc.txt.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>
> Drop the tag. It was conditional.
>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - enum:
> > +              - st,stm32f469-rcc
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - const: st,stm32f746-rcc
> > +          - const: st,stm32-rcc
>
> Nothing improved here.

In my humble opinion, there is nothing to improve. Any modification
made causes the tests to fail.

$ git grep st,stm32f746-rcc arch/
arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =3D
"st,stm32f746-rcc", "st,stm32-rcc";
arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =3D
"st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";

Or am I missing something?

Thanks and regards,
Dario
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
