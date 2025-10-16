Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD1303A24
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602957; cv=none; b=CCQqKxBOS6T+viMhnrfJHSwMW/tzrAgaPGmZwd1acfHE3DVBylTNxYjb9UI+oClcpWFWyh+dAHTBXwEuR/bPb2kVVBnpi2gcdGZH+5GGLBh+QkrgBxbnAWrtpPkpNM2eDBox4GOHw8271mXk8jkX4SHIdgJGolw4YtS1zdYhD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602957; c=relaxed/simple;
	bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rn70PXO4x2nj0po1BYstIO0EShYejFnrS+m017p5x65yFaH+3CtWIniTFoEAv5VGBN3k3WtVxAxJKm5h++x8S6Daoz7+QKgO7xoP3ObqtUycxKaGsaPe9jtA4M2or59R6riucY7fY7QJd4sfmOR6UIXs1kDJUNrMX0SLea12Izc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGvMq1/X; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGvMq1/X"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso816119a12.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760602953; x=1761207753; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
        b=TGvMq1/XCQChBhpPqzrd6PHtUIoSTpJHbT4pAZkLpBnjTBVo0q4lIQwi1QVTocZ9Tn
         N39vYvf/QM64pftaErwX3GEDyhBmVpJ+1KeMvSF5Colrbsx82W99eWHlqjZlzvUHUa9k
         VN4fqFTFKvop1DUq5Gpe80HPx44cB+KgqRAAGyIpoWdY2w9B/rYOpmLLu3wVvd1ZWzaU
         a3TlUwJOHRh9EQvwl1lbX+1bdq7HDxPIHWNRQ3kHcPw8qHcpwTknAkniNzk6qVcZR0RB
         +RX/9vw9j6D4hjoN2fUtv9M3C95Ep7H7jJuaaZhiOIyVVjAh8A+EVZ8wyjYkI1/WL1ww
         Hw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602953; x=1761207753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
        b=K0wE7jP35ttvtHnaLA//OcDLLiTKp+VDv+ZR65/pu8dBI37wb/J/juc95gx70d2OVh
         NngJsheVItsE5qs4n3lpScataZi0zepRBNdJFNJAX/+CiTlzZ8qp3ImEF0A0wnzRwLu/
         UeNSTXrvaPv+WjicY/NoRWd/VCRgqhK+6zfPG6XWXUIGhDhz8vcTd7KBuMhOFO/Xro1C
         DDt5ttS55OHf2ZddtRX3tM8H5yiysw6w4VI4htqYGsU3wsWFENbg6aFqE0uLW8QQRfJf
         uOgqANXIVcPj1Ta8CXG6oIxUQz2gDFoEY/ThcfsI7xj/RxpvMxN/lD1kfhjCRbOcmevC
         7GtA==
X-Forwarded-Encrypted: i=1; AJvYcCUfoypW4jXjC/u1Qu3Da2Kw18Trss8vx5qu3FMHKEv4QU2A0rylGt0PATDGjoQMTD99XBhy7kEGmfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGl63lE5RjUPCifoRKeAia42iXwCmaD659S2Uvf6w3oAGSdDZ6
	wC90K4+q4sjZ50Kspx/UNPgpcwMhgEuEDcTOdmJWv+nZe6iMUICsLGS11pazwXQjOxM=
X-Gm-Gg: ASbGncsgDHAZZA2GsZrOhjngw7wj4PaELsjUhE7OEsoJfXQ5v/FmtRnYHpWuMEceGoE
	gySDYk7ROKrVPa4u+IHjRvJ/em6jRpaazxBJ8FkUmtV2AFL5QIKljUIDWArOMvB4iQxQP2QH4bY
	b6sIIz8/Jsf2zBJc+NIaG+SQ2yHlwr1icYXt8vrfsgCm8j4gFB407OKenSpNZlExvPNxMZ6W4o+
	SDhFCJtgRgR3YgWu68KZEmAJMCU2uagh5f0oBbT8BmDLYYOQYKFIyhOPImCIRRvaqV9xRjS+va4
	s4DBTevEl4cIQzika7G7prOWWH8JxWKw2XFpCb9NYMv+c/nn8xHXkYKqDtbQ47KcRZzwGrHr6Ha
	Gt0BAd+CyRly6wahjgjaeo6R1fHeHgTftLXrV6TInySpl5wlDwEYC+3q0nfSK+ZAUKz7wLUuqI7
	fvMMcMU+RFK6h5ZdMgaA==
X-Google-Smtp-Source: AGHT+IGSt650n9l8ivg1ZcCBjVV9spK1fxIgYVcQeuSemjU+fLA1qbxGFofJQsP8Vwjza4IFOhR66g==
X-Received: by 2002:a05:6402:84a:b0:62f:50cb:764c with SMTP id 4fb4d7f45d1cf-639d5c699efmr29854311a12.35.1760602952962;
        Thu, 16 Oct 2025 01:22:32 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63bea024febsm3932663a12.4.2025.10.16.01.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:22:32 -0700 (PDT)
Message-ID: <0ccec501bd01a4e3a2e5087a52fe7a9b32d97c75.camel@linaro.org>
Subject: Re: [PATCH 4/9] arm64: dts: exynos: gs101: fix clock module unit
 reg sizes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 09:22:31 +0100
In-Reply-To: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> The memory map lists each clock module unit as having a size of
> 0x10000. Additionally there are some undocumented registers in this regio=
n
> that need to be used for automatic clock gating mode. Some of those
> registers also need to be saved/restored on suspend & resume.
>=20
> Fixes: 86124c76683e ("arm64: dts: exynos: gs101: enable cmu-hsi2 clock co=
ntroller")
> Fixes: 4982a4a2092e ("arm64: dts: exynos: gs101: enable cmu-hsi0 clock co=
ntroller")
> Fixes: 7d66d98b5bf3 ("arm64: dts: exynos: gs101: enable cmu-peric1 clock =
controller")
> Fixes: e62c706f3aa0 ("arm64: dts: exynos: gs101: enable cmu-peric0 clock =
controller")
> Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs10=
1 SoC support")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
