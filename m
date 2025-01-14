Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBAF13D600
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864069; cv=none; b=UXcbNKXdf/E4qgGWZCI9Wwm9gWbYZl2MvH+IHl+XkIrCAT/HNBXskKZuLmx5tQJGMWmD5yRgloEJ9p9UthAPtQpoznNESFrSm675mJOOFNbbIzmixwwdXrtzHcXbmN1gOhVd+B1mob3r82kU6GxAZTUzGJaIH2fyTiTkjJUSCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864069; c=relaxed/simple;
	bh=kb+N7KX0rT6TQGPdAoyZC4q4c2muk934hfkb7Zz1PYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTWOJKTSJ8mhyvDTyzayqjSd8qqBK1N1/qKwMdhSS5xQWixxYEbObMwal1Vmo7OmhT0BzXUV7tEpObtBV0P6WSEIloTj+BO08DIFwYXtwV7Q8soCr/DBvXVa6TIILzVA8/8QFp0UG1LSub03mljwNN8yzTj/1k1UbNxE/SL7Y34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQwo7w4A; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQwo7w4A"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so5494088e87.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736864066; x=1737468866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb+N7KX0rT6TQGPdAoyZC4q4c2muk934hfkb7Zz1PYk=;
        b=HQwo7w4Au6FKAwDGBLwwBdFLw/dJRQH4WnJvHHPxUHvpqpe3esDAhBJLm4oGkHav0K
         b35V32MSFWokv2mc7zfbyIXx6vyal33Yms3txIxI7oyasTbRp0DvJMV22rQX6Dn0Jod9
         S74LKAJ852hiIeWQA/rdMM+QIMyjs0H1W101J0dr1vOo6P6FgNrSHIJy3K53G8VFssT/
         0CC2SfeOnVn7wRmm0dLwacNoInM0KzLPobUTsBdOk+aRKXBrB/mdxGH9CUV4Tirozm87
         ZIWxTuPAatznJoe2hbJRSWS18U9JLutgn4hbEoZKFb5ZzKC+p7Yyq+AFsBQ3d5ZkKHbF
         9ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864066; x=1737468866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kb+N7KX0rT6TQGPdAoyZC4q4c2muk934hfkb7Zz1PYk=;
        b=G+AuSWPJVMJyuuGP1zXuc5BLgM339znm4nCGi+UrN5Iu7Dp3WyD2zRdnaa35+90/ea
         3Z5izycf1kpGm5vRxLBpfwwDiR3x/QURvrbU9abMYmSfDuJqlp8uTrqoSYFqnnOyhtIs
         r06swHxQG6a73xXo5HavMTMX7OPsMaHp5xjxVQ2drWKIB3dHeXoJImnoSJ1LXITgG7gs
         /K725xXtsFjNPdVb+p7AfoUcRmSOKsTjA//ugIhcz6EXt7k9Ul7KWARYWDTKl59AIJWj
         mcChHV8X1i4eIZU5RibjuMrAZ9aDaRigKt6Al2CVb4WIQGPs1KsrfjUNfu26Ij19+Sp3
         ovDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhd9E8lpOKwqFaxxez18nmakq8sBAZtor5GHGHXCHV9XQTOZNTFyVBF3kMOdmHXMO0dEM8ujLXC5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpunqDTG2KoIQEkBFsijyNHv+YaBDMI7bgucD3pBFtz3Lh/vx
	RMq3bKqjs17Qk1nosqAS701Vr4vUNxFYThcdjDe8NqrocFQPgE7ArI4RgowZ6ZDhLMwvnoe+1Vq
	bmvwxIc3t8EiiaqMhdb4D3pkNZ2vxMQuGLZyyMQ==
X-Gm-Gg: ASbGncsKvLMrM3NCu6wHFRd15TvtW2yx95vyRij0m2O6gX2iPrEo/lDnpLO4ffDJcHX
	9EoV/2dBi+TY1UsP3GMpQXCc4J3YrYSCe09NB
X-Google-Smtp-Source: AGHT+IGQT/qQTanY0VeTmw14H4V1Aaz+aOnG3UKuUwYfMTsXxCW542oDFqS8vWTFAvYHrASeV6/2sAbC1dUoPYmd1+8=
X-Received: by 2002:a05:6512:104b:b0:542:8d45:cb3e with SMTP id
 2adb3069b0e04-5428d45cce2mr7226522e87.18.1736864066034; Tue, 14 Jan 2025
 06:14:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com> <20250110123923.270626-4-szemzo.andras@gmail.com>
In-Reply-To: <20250110123923.270626-4-szemzo.andras@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:14:14 +0100
X-Gm-Features: AbW1kvZbpuLPblFhcOWb0pAf-vXkkjGwXrNgVmso7Oy8q5LSTsj10tRLuD4ySG4
Message-ID: <CACRpkdaz7ABO2QQwv1NFaPm1dOF_maO-bxWQdPNoYAmUXDKCDw@mail.gmail.com>
Subject: Re: [PATCH 03/12] pinctrl: sunxi: add driver for Allwinner V853.
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 1:39=E2=80=AFPM Andras Szemzo <szemzo.andras@gmail.=
com> wrote:

> The V853 family has multiple package variants, from BGA to QFN88.
> The latter has co-packaged DRAM and fewer pins, and less features (pin mu=
xes).
> All family members can be supported by a single driver, as the available =
pins
> with allowed muxes is the same across the devices.
>
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Looks good to me, waiting for a review of the bindings before applying,
but I see no problem with the patch as it's just using the core sunxi
infrastructure and any minor issues can be fixed in-tree.

Yours,
Linus Walleij
