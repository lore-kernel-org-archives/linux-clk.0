Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6314215F4A
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119590; cv=none; b=TNtCsoxzfGlnWALtRD+sHAf1yYkxGSnvXL+yuzPw6OCrhfIVV66Lbz9uZ087s5iDz5EY3jhzOcxTTl1jd/9jje4i3QR5Pk/D87QDTGWf+b34YSIXdBRqHUY9222ljsePUnmBfVInI3dW/yFa5F3c4b3IPFtAX6+wGISz5GGPaqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119590; c=relaxed/simple;
	bh=RKaFL/f/x+BpU4Xk7oekVWLIrBOIODf0tIBd2+YRAto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0+3LthRa4nlJquBGNsa7IdHteLYpBE4P46zdoiGG+koNvDEoooGMGtPyrtzYpHjbo8fea/jxitGQ1/xd2Y8sm+wLlbvgRORVlSUg715urMVuLS+csIkkqnlBRCek+TcihQj0A5cPMxU7fL1w39qXSD2zv6YMyh/Iz78mmfUKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3UUbFRm; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3UUbFRm"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ea411f21bfdso2555923276.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119588; x=1758724388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjiYB/uowYFXiRivyJJw9KQxslDZjaml/1h2OkBzYY8=;
        b=C3UUbFRm3acP+0gd7vxBXz6Z3ef402pRo2XadWFzpB/mpXuKLW7vRWbB4zfivlFst8
         GoFZp1CMYZq2QABwCDUoiOSiBoZr10VhVEneXxJPE6qF7z8tJSamZikSv2lyZRwq34i8
         WnSbeTp9SjJ+zGRONoG3aiK0lATCddxAxq6ypvl9zWUwTUCTxj+IoJDZwAex5ACmyGdB
         l4aEfSz0+2npRMBWyEz7AHjfwhcvD/ioeyfpfBktFQE+sDh6dM/iNu3MIoCCXpmWOp5u
         BxOWT6HUdbUBzBO7QgWUWG6Pr3QtzNoSjAfRk+X7xQiUEo5bNCB3O9uYHiLHsg+AcmUJ
         FJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119588; x=1758724388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjiYB/uowYFXiRivyJJw9KQxslDZjaml/1h2OkBzYY8=;
        b=SINc+AkCvgW5JNmkyt6izfrlaXkNXpI//t2cxV3AInIbIAobEHhWSKNyOBsLAgwpp1
         cgCLisBOZVFNx/5jtUn+oYe1u6qB699nd95R/Lb25mlBlNl2qQhQlqwmody4mxp2yIl6
         7L+7hFEM7Wq6GH65F9qtBAu43zLsTX5G/l3QNfSQ2WcA6Tc4s8fBs7z79h5/Dl7Nbmcz
         5OAlO6UsbzZB+2K/SApvu1fvG/gBkf6Ln6ssB9XynMvUbGTT8NctdOL8PCc+u0H9O6xA
         kTQk3mnr9OfCNmalqawp3kC9bmBk/41ju3wMKgYqOq4f/B436AgTa/d8EnS2s94czX/7
         GkAw==
X-Forwarded-Encrypted: i=1; AJvYcCW9tcw5l5newwS1jVEAh+PUj9WPAbiGh+o6ncAbAwYf49i7urg5OGF6JJTmS9wWJcI3C5H2XlYSo5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+wqrtMNeTJFlvw7yQMlDT1R/K4+P1uBMJPE4RcLRvVLQ/mPf9
	L4nUbmx2AfRGIuyWKT5IN9rr+lvZegmb3t/JAGWz4E33kNT81S0KTaxUWHQVlEmdB1OWOyQ+KMi
	ZY2Cdho3p9PlM/0YoSuOV2tvoYyI4Yi8/i3gDZAlJCWqal8Fp4Aa3
X-Gm-Gg: ASbGncsUnXKk8fP5UMwMhSOwg24Fx3p2ngEbopuIvfwiTFD/ZB4G1UOVsu2LCI51eI4
	3u9uZPgB7REmoaQSGpyfqni0Ky1X1AS1t6YIBDBYKb5YEFKRI7wOedKeZe0kCZPSXQ4PjlHuwE1
	bO2LZ4nAUJ6ETwQljkidRsaMAmM3FeoTI5WlzpErIwUGDT95KwqwFi2FfX0qANnLMLXg1JnBvB6
	p0oEyPq
X-Google-Smtp-Source: AGHT+IFQl4sxW4LUcoi3bIXsptHrliwBwP5f8RO+yo+IAgyckDyrm2VPVmx1uys1O5NAXNsLjZqsLa4xcMjhuXJl5zs=
X-Received: by 2002:a05:6902:3101:b0:ea4:6:9024 with SMTP id
 3f1490d57ef6-ea5c03aecffmr2119553276.8.1758119587602; Wed, 17 Sep 2025
 07:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 16:32:30 +0200
X-Gm-Features: AS18NWB4VWSVduLAS3dHprEYP38MnWvLvmP0MGgnFO0V0b-XHaevM6W4A6ssrDo
Message-ID: <CAPDyKFri+vsC9U7hhPukgWR2sRec5M0i8XtmyA7dVgJ-8Ewe_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Marvell PXA1908 power domains
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Sept 2025 at 23:16, Duje Mihanovi=C4=87 <dujemihanovic32@gmail.c=
om> wrote:
>
> Hello,
>
> This series implements support for the power domains found in Marvell's
> PXA1908 SoC. The domains control power for the graphics, video and image
> processors along with the DSI PHY.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
> Changes in v4:
> - Address maintainer comments
> - Rebase on v6.17-rc5
> - Link to v3: https://lore.kernel.org/r/20250829-pxa1908-genpd-v3-0-2aaca=
aaca271@dujemihanovic.xyz
>
> Changes in v3:
> - Move driver back to pmdomain subsystem
> - Instantiate using auxiliary bus
> - Small fixes and refactors
> - Rebase on v6.17-rc3
> - Link to v2: https://lore.kernel.org/r/20250821-pxa1908-genpd-v2-0-eba41=
3edd526@dujemihanovic.xyz
>
> Changes in v2:
> - Move driver to clk subsystem (domains are instantiated by clock
>   driver)
> - Drop power controller schema
> - Drop RFC prefix
> - Rebase on v6.17-rc2
> - Link to v1: https://lore.kernel.org/r/20250806-pxa1908-genpd-v1-0-16409=
309fc72@dujemihanovic.xyz
>
> ---
> Duje Mihanovi=C4=87 (4):
>       dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
>       pmdomain: marvell: Add PXA1908 power domains
>       clk: mmp: pxa1908: Instantiate power driver through auxiliary bus
>       arm64: dts: marvell: pxa1908: Add power domains
>
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml |  30 ++-
>  MAINTAINERS                                        |   4 +
>  .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   1 +
>  arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |   5 +-
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/mmp/Kconfig                            |  10 +
>  drivers/clk/mmp/Makefile                           |   5 +-
>  drivers/clk/mmp/clk-pxa1908-apmu.c                 |   7 +
>  drivers/pmdomain/Kconfig                           |   1 +
>  drivers/pmdomain/Makefile                          |   1 +
>  drivers/pmdomain/marvell/Kconfig                   |  18 ++
>  drivers/pmdomain/marvell/Makefile                  |   3 +
>  .../pmdomain/marvell/pxa1908-power-controller.c    | 274 +++++++++++++++=
++++++
>  include/dt-bindings/power/marvell,pxa1908-power.h  |  17 ++
>  14 files changed, 369 insertions(+), 8 deletions(-)
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20250803-pxa1908-genpd-15918db5260c
>
> Best regards,
> --
> Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Patch 1 -> 2 applied for next, thanks!

Note, the DT patch (patch 1) is available on the immutable dt branch
too for clock/soc maintainers to pull, if needed.

Kind regards
Uffe
