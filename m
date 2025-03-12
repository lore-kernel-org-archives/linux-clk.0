Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BCC245039
	for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778732; cv=none; b=OAf+ucIEhnW+Y64U/laWsxoLKMjESyDG1yq7h0KF2c3bn0vbvccSHNqEGAvXNfluuJChhNfGC0YbCuIUKT3JQrQAkd12tyj1Ys2qDozLHMW1iABjv0PcgFY6Mcm8D3DqVzyVBzyPpHNwTuskPJDw1XC7Sy9F13Tq27X2BCz1cII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778732; c=relaxed/simple;
	bh=1wvMq+p0b0LHsuXs2t0D9kgHbJ0JEDZN1CXO+LT+A8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnzPakUlfrO4iY63pXJ5be76lVnTOzQQvLQsxuUi/mjXUBhRgfG37UCa+YISe5rnZ5Z63sMZSILNziV+ya1cladls2tn6WlBqgrr65kK9hsPVdeU/xm7xGJlhDVEguzkhp/9uy8Pq5y89WP7vVl9xsO/FyUtXuSk6eiQBjPlRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xcwtAeGv; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xcwtAeGv"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6efe4e3d698so61917917b3.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778728; x=1742383528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dadpUZC9V5c7MYnunblVKwFOdnOlHudqlcLRPnjOYeA=;
        b=xcwtAeGvbeg29VdHPHF52EjNcGWPoR5CC9+YRm18s3q7zZx05h0nuhdSDn4PXwNQ36
         5AnU1v+RXDRuvZkw/Xie1Vqmug+Rml08kdNbIZMj6wn3cdZ+1loJQX17nIOr9rpuyFfi
         XNDuAPYl+b5bWJpTQJSlVhTTd2gV91T1WdxY7yy5vaIiePk5G56uIXnp/traCZSElQqi
         G5xFeCKjYIeynp1l7fqes58uKFQiDmxkoTTb8zOxTFk71+WPqmza8wTAl2BidF3nbVY+
         e38nuRQq7GEW3wX32WF8RYyaSvLLRvrigdRy7JbQeIEZlrrwq09gL7KvFYT0/3929tZp
         N6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778728; x=1742383528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dadpUZC9V5c7MYnunblVKwFOdnOlHudqlcLRPnjOYeA=;
        b=GKCDX+ZqhN2K3/Pw9GORd4xSmPq+VuyVzo69Qj7cXXSCNhABEn1ApKkB3GroKyPOIn
         RpkOP0cUgyojlohXekIniT1wtR36bLbMYOWWqlAGss4TyhjWadsMg2BcXlr4yBI6hTkC
         MSbYha0QglxQCH6RaX4wvJvwvE4pGfDc9LpMkla9P9cue/2PmswrGU7iHvp+Plkoq4sW
         K0GX8QqOUpCfANuXOgH4aDIn9sXjDWdEl+G5NrDuEKcAOJYLmVM+o6mkqL/EjfNejcSL
         5qOOhBfOMh1SJmichi7c/TDSasfc/VC5qNX3ZQAjh1T9s47E4EfTjZba99TEVhorDqzf
         bdZA==
X-Forwarded-Encrypted: i=1; AJvYcCVAYDKV5ntmRytlN9c3FbHCqYRslWbtaL6UsWhOLLnhQLk3WM1UOYVMssHr5HUKIDc5SyKRxRZJUys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+apac0wIVcBvzYoHlwUduZrrOXB02tV+MPjlFP7sM+qd3zTHn
	DZwAWrM2dTx7J7qJbBIqTdusMIhdGXsBfWTUXdXPH7lPrXF77jPmAoIt4h9hWOLK6caSZmJkHm0
	KRbP0VLRlzEtVxUpxhwl+5LqRaWA7o3ZjfsP7kQ==
X-Gm-Gg: ASbGnctfcH5g0yALzJ/nnTrYdpske4oSorVz6RkyQtTt8JO5cRPCFOwGyrnn0qNm4X8
	8/BwO/x2MkyEOI/kdoADAIY14SLXcecOt3ARuQ9FOtrK2PCmvBe9AvwIba0xM03Bz6M2KcqYrKX
	4YP8XXB2f+28Xdb/hFotOcnOdRgFI=
X-Google-Smtp-Source: AGHT+IEkegzJ/XAYlghTUeG+wVwA3ds93Wxe6yvoeV0jHqydpXmTqXQvt4bDvlouPz1OikUEEzcCwOPsAA9n/cL6aTA=
X-Received: by 2002:a05:690c:3802:b0:6fb:4c11:61cf with SMTP id
 00721157ae682-6febf2e67e6mr312924957b3.19.1741778728184; Wed, 12 Mar 2025
 04:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309055348.9299-1-ziyao@disroot.org> <20250309055348.9299-2-ziyao@disroot.org>
In-Reply-To: <20250309055348.9299-2-ziyao@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:52 +0100
X-Gm-Features: AQ5f1JoG4yNR3eqoseTNZhzIg7tVbmXvgNO4DfacKMnpZftoLIoMXOX2r6zD6_U
Message-ID: <CAPDyKFp2UzcxfFz=8sREkj3x4DvfkfxU3utc0+e+uPS78Tn-+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: rockchip-dw-mshc: Add compatible
 string for RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shresth Prasad <shresthprasad7@gmail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Mar 2025 at 06:54, Yao Zi <ziyao@disroot.org> wrote:
>
> Add RK3528 compatible string for SD/SDIO interface.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 06df1269f247..ea0feb733e32 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3328-dw-mshc
>                - rockchip,rk3368-dw-mshc
>                - rockchip,rk3399-dw-mshc
> +              - rockchip,rk3528-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
>                - rockchip,rv1108-dw-mshc
> --
> 2.48.1
>
