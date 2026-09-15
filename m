Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3E343D8F
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478520; cv=none; b=rkydKAAXP+e/w+RbBeQLKwjmlu1tqwHV6FL2zGls7ZGPDnL/tR9TZdkc35hvfZYXeQzeczT+W+JLVMhDam8KTHtnprypiK6uakIFdum9gOi5IO2LHjKVh9A4AzRXDCr89EkSfseJVkJn1D3vmoyVJrR7XHac1TBC4AKy4ffkuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478520; c=relaxed/simple;
	bh=OvdX+GCwle6mk1tHG5XlLthd2sXZff6UiFjpvXObaoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r85oK4UWudy8KeQB/6O/ZQGe05Tp+Jbrz4sylxQYh4kaqmQ1o3ZqkQ0Kuys2firhpcchCTr7ovARcE5kJvLvKl805+MBdPJnW5axgrkQVWSZ4rMjoTgphTy/rVUyZsCU6rE1wvE65qiLLBtutL8HnqVHHf0cz4q8aBovC7j6AQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gWm0vXF0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gWm0vXF0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so211254f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789478516; x=1790083316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrHXsKtDyeL0xXLxdl4DlLJ2gOTBaJOBavzYzacJmVE=;
        b=gWm0vXF0WCiP4f/tVreLocIw8fwNa3XCyNIPXc6PiMETjolz69LN1avVnJij4jcwLO
         fBczVMzyuGS1qnupNpP+JIeHheBA0DOMHQkC0LV3k9r9jODs7Y1024DzZRCFs3ZXWAqn
         J3hBV9ikJsOuImIUWo90CCc5znsonANiNbzsSEjwUuuvrT+NfjOieyCpyfiYj3DFsLaH
         fFaiy15Mg5Nn2ERH3nxFX2KniRlO1LVOZ9a5tqLR/tqK9/LAgXUb7vSnh+jOgjfjKvZs
         rGczk/MXrkoVDmu1d0b4YvCyqUXL5mpeMnuXkrCkIhMxhA3nxu++jrhIKvQzG/K0JLZE
         KhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478516; x=1790083316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrHXsKtDyeL0xXLxdl4DlLJ2gOTBaJOBavzYzacJmVE=;
        b=Bhr/9rScKeugpwToEYRDJmxNKXzcR7Yu7duYUiTolSlUniF7JgjtY7gz2xWJKr4kWX
         EJ6EnaUbSIOviQBjQlS5SkNltDcZNzTzZW0fF2+GXh63tQ1lW+susXZQbqydN9vK9AOI
         DFSuKjelTPHldDIDmM7RdwBt6XZyNYMmxrmBN7X6v/3+7S1UOES43Q8eHE/JAkPxqgBi
         u7s6gsQtP/UT3lm0qQE+TLozLERrqz9rx14CbtEwEdGLjjIX8MJiF24VLdBY1yiAqYcV
         hyrZgwNPuqz7+weeuaAzdbzimEm8+Jo7bUevuT8PMdo/cZKoTuYJcvHC0gAhtd5AW7cI
         WOXg==
X-Forwarded-Encrypted: i=1; AKwUvBy3swcEg2UTQMiEClugJAQSbLyZF8pmu1fKsBDbcgtvylyId181g/MdBOXzUXVY/p4t7baG5AltzZU=@vger.kernel.org
X-Gm-Message-State: AFuF++mofaIHArouL9ph3ACjIlpEzlI5xjgDFF2XmK9mD6tTDY6knLZ8
	oF3qE6PjDsILu2sMuDPthC9ppdG66nOWTklOB6v2VXldvcPaL+MKepNy4LbHiijmwO23M9RKlqW
	iYRxq
X-Gm-Gg: AYBFou32P84AX6S3SSf7em6SdyukUinMLijpwvjzmXxGWZfU+dU6ScWzK2QGMgYZ04f
	YbqVl1tg307vUp+HVuAZSkFvvdkJEQmVs+F//pe6cByCTGt/XVO+NEnQz2ZhkA4Ao3DuLIhgd3b
	WZXGhjYUJtxW2PfKdIHjE1L2g7vr3teAPGbHQoqrUVKeDjPDQkn0Czhuu5sXUi7Df8W+uQ8XPVy
	yUK9RszBJkX31BpP352WFw6i9shJE2N7U4mkn2FnbRvRBE4ZB9KLhkoE0qqTyA/kG/zufDUvGch
	PpA1ucX2QMGvJfLUlaxGL3kpuc4Qj0ghd+IeSGpxFt8BFa4xPfggluV8FCANYl/F5N067D7DGBa
	Dn9gnRBg4wHEJJDvfNioMZiKdB/NkwU4LvdLQYAxUahAb1zhd9lZM9iKyyrnOeIs2qhlNVoUScc
	pGtQPMmgXT+sbmB/G1zujvp/+jrjhCIunEYkacdcRtUsPcZMlyBijmSQ5xqaZha8iijKWpoMPKd
	hfWfWAA85uk1WqFC8FPZJbCZRjqWqsug0cp0WfuEtZ4qLXZXo99vzLG4YECSQ==
X-Received: by 2002:a05:600c:6215:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49e8228e0cemr16074715e9.25.1789478516214;
        Tue, 15 Sep 2026 06:21:56 -0700 (PDT)
Received: from localhost (p200300f65f19a904c2a77868dcbef2f0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c2a7:7868:dcbe:f2f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e7d28c734sm59282205e9.1.2026.09.15.06.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:55 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:21:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk
 driver
Message-ID: <aqlElGh5b1vUlMLT@monoceros>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eegyr2w6pguhtfb2"
Content-Disposition: inline
In-Reply-To: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>


--eegyr2w6pguhtfb2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk
 driver
MIME-Version: 1.0

Hello,

On Tue, Sep 15, 2026 at 12:05:42AM +0100, Alexey Klimov wrote:
> - added mod_devicetable.h as Tudor suggested, added trailer in the first
>   commit;

Argh, the reasoning in that suggestion was:

	you need to include linux/mod_devicetable.h for kernel_ulong_t.

(https://lore.kernel.org/all/1c41ecc9-d951-45df-b933-1934e1381663@linaro.org/).

This is wrong:

	$ git grep kernel_ulong_t v7.3-rc1:include/linux/mod_devicetable.h || echo void
	void

Please drop the inclusion of <linux/mod_devicetable.h> again, the only
effect of including is that you introduce a bunch of unneeded build
dependencies and I'm fighting to get rid of that file.

Also note that the driver is already using struct platform_device_id
which obviously has a member with type kernel_ulong_t. If you'd need an
additional header for kernel_ulong_t, the driver wouldn't have compiled
already before.

<linux/platform_device.h> already pulls in the definition of struct
platform_device_id and thus also kernel_ulong_t. Please rely on that or
if you want to go full iwyu include <linux/device-id/platformh.>

Best regards
Uwe

--eegyr2w6pguhtfb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqpRmcACgkQj4D7WH0S
/k4B7gf+OiEBmAT05HCEpzRR8SWLVbA+lNTuaWLCcpKXZWy8w38d0PCCcnuNRleA
PmV5TMEdio5KPpkThdIat31BuCsUtl2oOer+QqD72//eU8lnvyZjeiZu16nPI8VO
NCOMp9JBn2Zcoa7Sujo4pWCocVvizZi7YLq4LX9hA/O/rLkTWGo2yIYRhg2fpL7q
sNyofNlh4ius6v59bvJzcH94Am5afth7CMTWkmJhDDmc4lNUYBXC7JmGaShSYdRW
0zX/ZSCCLKFvcA+vR65WASE5v8nVyyk2Wwtz/kMlQpDWek55RV/VaRa6EE9oKjby
KT/gXesPxJjn53yJfdllia/wQNjg3Q==
=i6dZ
-----END PGP SIGNATURE-----

--eegyr2w6pguhtfb2--
