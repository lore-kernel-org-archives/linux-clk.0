Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C6313E07
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729638; cv=none; b=kw2Z0uZh//XDFxqrSoaHX25yy7BufHZyyY9cblWIEL5i7Oo1vRb8jZTUncSnY1lQNte5nsfptUMi3/E1BsJdtRehYjxFoZbk9xpW7A3VnhuZJgisRKHDivrnZWJ/TRHLZwgXA95zNwUdRitGO37RqtPBzXeyT2g4xh5NkUVCDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729638; c=relaxed/simple;
	bh=EzqOYSDHnxhTVVqSNHLim9jV2AkvqdmMs19BuE0MqXM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gdaHsCJGfkmwfzVp8D8Ym2FDX6zWWE1MXKviFgPtAFliuTb0jNK6ALC4Pw1dvYS3RiCVtc7RjoSNcH0BmYI+8MPHqKcw4xmdsnxczKELUnbLIDUgEEAYX/XxqrIYZpXcDDTBHA0AepNuAu+rK4RX3redJHQEXqZkCwCPvThcUWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wilVXdMV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wilVXdMV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso33685f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758729634; x=1759334434; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LIYU8qrKCG63qfESQqAYHq2vCT+r9zxfWJIkv0fUrK4=;
        b=wilVXdMVdq4ZV4sNBQsBkykwQP0JMH/It58wcyGBaXwpx9XY8fQXchSrTwtWk8/+s+
         KTrHiiIJnYm1VjNt1axhI2fBtgSc5GpzdVujVK1xHFidAEdTTLT59USZxnNMrQsZ2x05
         4IjpM5DdOAFwua0Q5eW4QB7UYj1+Mq5E+/VZsDA9hU/v+LO6MfgDXHVY2FC7bL/yEhPf
         Bt3De+nxoE5lCa0n+gown1FqmW291v4XRAzmOfPhyh9hwji0noqx5LcFxJhfaDmOmdb7
         /tmu//IwLeXtl6HxomYv+wbYn5xsvpr86tnm8nIydRdqYwz1bJzzETeJfrr84hv7/wV1
         Thsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729634; x=1759334434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIYU8qrKCG63qfESQqAYHq2vCT+r9zxfWJIkv0fUrK4=;
        b=wnWdDBRsBTeLvucws20m6TmICWf6DxMRdp7vZBFxvFekELObFzOt6L6ZbAG9G/V/32
         XQPYNqwLhAJw4TclUxNmBqPbNiS3y/BwMSBSOPuEq81+eYzoc9yc6QUctjxi6UJe0wHO
         FBUB0JhdLCjPoYT2iFXD/IybbvWb63/X/oIRdnh1Y5Mif+c7UjPb9/TbYnkRBvoIw16I
         rLIDjdw2TNOLJlarT/tP8adEYwz17/nnF4gAbsQLe4PQQpepYdmvk1A1duNyUQyNkXHn
         ylxDCj2Zp0z+r6kYnp+EZ6mOgeZlEYz+hJs8dLZIXqrf0OzxYkfPH4oysj0i6RUfnnCu
         vb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/7k8LjkuvbOWJCP7cqb66LdrQWP+PXATZcKQUq2EQGFSpbJO6GNgq8RGy5gjOi5e8djYxns4CebY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLSP7jvQ8808X11L6BLEPL58hHqf3rK9EGLeYv6X2o1mca1rhJ
	BZVTWNDTddp/tmIFSBZT0a+qBY0qfPQFBZ6Ds/xp0XOESGWMJytKTG1HUUXFKvgd+LM=
X-Gm-Gg: ASbGncvarIbEqPq5EnS4thagjv0X8aJix5CKvisq3tO5D8R+o+DeRTAvNHf7RJr3cqB
	xNLY3HklEbqbSV2zbYacV8O3j9vlYMHuorxwaQ+k9NuSv+Ops13AqUvOa49PB3tK3FlTLvgpFZE
	0MPf5qimG4w+lKHV2LLj8IVOFq18JQfATUvB0y+DNvScGlBt+GJErz/850qTEqIbv5iHlktNCiu
	P0GeXlpHD/+2ZM3QoodM4QV4yKDqQdYPWEsGKNDu19iTGNVXb7HIrGzxrUzgfHQUXIiPmx+dHzJ
	VC80YHJ5mgqgCWYspxhJzbot7zSaVcTMZCauEYxanojwk4G/tD/xdnyS7iUv91CU68rxb18CYfB
	7sodnZqmz1PTvGy99jJrmhSAebA==
X-Google-Smtp-Source: AGHT+IEr/xCPYlRIQOGy0m52/J9vkL4EaMZaXgIFMjJ6l8pxzmajhf9oWnQ5HbRALQAcj/6nHTpS4w==
X-Received: by 2002:a05:6000:1a85:b0:406:5e66:ae65 with SMTP id ffacd0b85a97d-40e4d9c9f20mr466144f8f.60.1758729633869;
        Wed, 24 Sep 2025 09:00:33 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32bf95f6sm549345e9.2.2025.09.24.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:00:33 -0700 (PDT)
Message-ID: <798600a43825818bcf828da7060f38105f7f3225.camel@linaro.org>
Subject: Re: [PATCH v5 4/5] clk: samsung: add Exynos ACPM clock driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
Date: Wed, 24 Sep 2025 17:00:31 +0100
In-Reply-To: <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
	 <20250924-acpm-clk-v5-4-4cca1fadd00d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Wed, 2025-09-24 at 15:11 +0000, Tudor Ambarus wrote:
> Add the Exynos ACPM clock driver. It provides support for clocks that
> are controlled by firmware that implements the ACPM interface.

[...]

> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acp=
m.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e8354168a63b1427c2f3faf1=
5e4e7955e924dc8
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Samsung Exynos ACPM protocol based clock driver.
> + *
> + * Copyright 2025 Linaro Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/device/devres.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +struct acpm_clk {
> +	u32 id;
> +	struct clk_hw hw;
> +	unsigned int mbox_chan_id;
> +	const struct acpm_handle *handle;
> +};
> +
> +struct acpm_clk_variant {
> +	const char *name;
> +};
> +
> +struct acpm_clk_driver_data {
> +	const struct acpm_clk_variant *clks;
> +	unsigned int nr_clks;
> +	unsigned int mbox_chan_id;
> +};
> +
> +#define to_acpm_clk(clk) container_of(clk, struct acpm_clk, hw)
> +
> +#define ACPM_CLK(cname)					\
> +	{						\
> +		.name		=3D cname,		\
> +	}
> +
> +static const struct acpm_clk_variant gs101_acpm_clks[] =3D {
> +	ACPM_CLK("mif"),
> +	ACPM_CLK("int"),
> +	ACPM_CLK("cpucl0"),
> +	ACPM_CLK("cpucl1"),
> +	ACPM_CLK("cpucl2"),
> +	ACPM_CLK("g3d"),
> +	ACPM_CLK("g3dl2"),
> +	ACPM_CLK("tpu"),
> +	ACPM_CLK("intcam"),
> +	ACPM_CLK("tnr"),
> +	ACPM_CLK("cam"),
> +	ACPM_CLK("mfc"),
> +	ACPM_CLK("disp"),
> +	ACPM_CLK("b0"),

The last one should be 'bo' (bigocean), not b0.

Cheers,
Andre'
