Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8C544D7C
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081611; cv=none; b=QGSsHVlf8/nwgKDSfcPpngEsWuvDky2FMIE4vtls1izno5HGas7v1GH6m0jhVxXWZaFJ5pXDiJXJg9jmGFPsCwJso5Ef9C2NV1ziSRQxA59YG1BbdG1aKP2/4vjRVwB4wy208BuG1WDCYRLnFp4Wv5TQlVWoUqVVu7EUipkT9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081611; c=relaxed/simple;
	bh=v4Ul7xXqzvPTm1KnAhXO58P90eD2KlGTNsegXWmzADU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eL85AJTQQMmWJvtM/u5ja0FH/KucpF0T6iBmmrdZEYvotWNWvq3/L8iyd7c3z0XyePx9tTz77dM+ZpdY6HI9oUnVNHI/M8cA90C5SyKd9IeqtCid7yKxmnG3UqU0bfOR9WSQ6wrVgwp1XwVVCyRZdrjRT7QieSWcjS9hqRCiRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YhybTcQE; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YhybTcQE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so1416405f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790081599; x=1790686399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UsAsHIO1y8RCUKiEPTTkY3IWmv6reNZonvZkfCzW3Ag=;
        b=YhybTcQEyKITrmRourFyhi61KkzUyB1QwEiSQUkUdZrWhni2DxJp7ta4BVBp9zNwRF
         y2I2IRbuSAEwaD27Ia+kB2jfwDci4L+rdlUS8iDjq4WZx5WmunC0XGR9eLRYI0L+G4rC
         rlXWSwCHXLPFWJpIjRKlLVxRYqkvp51ft5gaVj1mBca1fv5h5UcMeOuwdEpcGx26pdtS
         IvlINlotnj4BPFUg8Qc+oal3YsHg4Co+Nb0tHlX7GvLle9U+SBySrI+6eB9IRQ/L9RH5
         Pd/hU95ZC0LGje58BGN4gks3b3x5Q96FoAqLfWJNHXETdcg5n115ejuEhmxM57Nrnkft
         A7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081599; x=1790686399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsAsHIO1y8RCUKiEPTTkY3IWmv6reNZonvZkfCzW3Ag=;
        b=vorzj13Eg3l6WKiC7xNEBWqeppMxkX95sL3MGfekU0QkWINqbTy83CJLJANWkK7zQG
         gKAydAAFLCd9AF2ee1Q90qZgf7m05qF8lUI97EKfwB19Bpi6fDBxzqHUcRUC5laIxmTN
         3An5p1qlC2OfoHxutiZSst2gw9N2BX7XC/YM/+H1yEDi/flUulXHvcf5Fu/Xdpwtfk7O
         ilg+s5Q4uN4eMI/8YdYnGrOGmauYQH3E7X71I832fIp20cbgjtzKL334a9cvyChgOwM6
         HWBw0piLmyuew25wvqLivpXIsB4NNN8fzXvHLWIGK7i8bsPxGvu8AF8YJ4IyJk20WYoS
         uUhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpnr/z35WtNetKUSR5n/LJZyCmR3XWTgA9kEwSNe+sSocyE01irnjAjyQc/dqH1/GZsfudyOpQ5bo=@vger.kernel.org
X-Gm-Message-State: AFuF++nDygycvRr4eaK/oFJW+mf+ZHyevhaaC0cslPPPGOmTXIJyMyxk
	IwyiJ0ElS6MgrpH1yy04IRff3YKLuwjSL/ZFNYGinVs54GBRWA/9769Kw8wJ+ctjOOE=
X-Gm-Gg: AYBFou0WYE+BUyd+8N3v+fJ/UJ05pw7RvULONRKdFdj7W9TJfzDdgyP0RbtuGkx+HgN
	CsN/6wbYqjhX980IrgNwBnzOvLM61o0QAWqlEMnKW8k7anU9mFsGV0ua09h+pveJMfD9VFtRLYv
	caFpVGQqaHSorreZYhOtNydtLjvpDxp7SEx6OxJNcnm246ts0Bq4dDmMRszOLEvQXxtnzqy0f4c
	dFznKOrDMcxDXthlE4qkdYM1MLOaDdfxpeiKMzskMVRRYnz22efvjfeWSs+XnwBT4F1Wsf36deo
	8NtBT8DxjpkRDA7+Pp8405O1OeflNHb34+3B/rTpLBZB9T8wKNwP9PIAy+bPaEnJaZl3OpTZFjQ
	YVNtn/LDtPKe9l1+uRn0dm1LbudC/Yd4tqwE1/mx16qEtsj2IVbgsCOUxccyfThJJpsKOacnibp
	bIw4gS49ItHmuD62LzGRd4mM+LC9ojq5knRGnIovX2SfE7PtmNJpTBCHktj9tmAxbhvH9MQdCVJ
	G01BlLKEkZvlcidK+zfpBT1zLGIFVC8Bmn2G4lfGWmDhpoPQ/fKVK+J6hG2ZA==
X-Received: by 2002:a05:6000:4608:b0:487:f31:857f with SMTP id ffacd0b85a97d-488610118bamr4476584f8f.15.1790081599025;
        Tue, 22 Sep 2026 05:53:19 -0700 (PDT)
Received: from localhost (p200300f65f19a9041d0e57515b2ea4c8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d0e:5751:5b2e:a4c8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48862731a53sm4931099f8f.4.2026.09.22.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:53:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:53:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, kees@kernel.org, 
	gustavoars@kernel.org, p.zabel@pengutronix.de, daniel@riscstar.com, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
Message-ID: <arJ5gQmthKh2ayGg@monoceros>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com>
 <arA1svdQzaj3VanR@monoceros>
 <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ztliwx3eij5ch7ku"
Content-Disposition: inline
In-Reply-To: <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>


--ztliwx3eij5ch7ku
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
MIME-Version: 1.0

Hello Alex,

On Tue, Sep 22, 2026 at 07:37:53AM -0500, Alex Elder wrote:
> On 9/20/26 2:39 PM, Uwe Kleine-K=F6nig wrote:
> > On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
> > > +#include <linux/bits.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/reset-controller.h>
> >=20
> > Please rely on linux/platform_device.h to provide of_device_id and drop
> > including <linux/mod_devicetable.h>. (If you want to go full iwyu,
> > include <linux/device-id/of.h> instead.)
>=20
> In general I would like to "go full iwyu" but have never heard
> it expressed that way.  Can you recommend a tool available that
> will help me do that?

There is `apt install iwyu`, but I only tried that shortly and didn't
manage to make it work nicely with-in the kernel.

> It looks like "mod_devicetable.h" doesn't help much unless I
> need struct_cpu_feature (which I do not), so I'll include "of.h".

Yeah, and for struct cpu_feature there is
https://lore.kernel.org/all/ef103a4b9e1cd7477fa52ee347c4ec301354fba9.178998=
8540.git.u.kleine-koenig@baylibre.com/
=2E
=20
> > > +static const struct of_device_id tc9564_clk_ids[] =3D {
> > > +	{ .compatible =3D "toshiba,tc9564-clock" },
> > > +	{ },
> > > +};
> >=20
> > Drop the trailing comma after the list terminator please.
>=20
> OK.  Only for the list terminator, right, because nothing
> will ever follow it?  Non-empty final initializer is OK
> to have a comma as far as you're concerned?

correct. A non-empty last item even should have a comma.

Best regards
Uwe

--ztliwx3eij5ch7ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqyejsACgkQj4D7WH0S
/k47Vgf+MRlVLPMGuXHor1vwVO9Aio3Q8yy+NUEK/fWTE+YEMTA1w+6YqsgeiJ18
k46MRbkEremJC2B/gZElmlpu4paEu99Qg+kif1t+k21ZaiC9Kl71V2ue+dNtbP93
U6/uxACp6gAw5u3yAf2GFlAOJhCXVBaeVd25LntVeVdhRYQb48cp6V5Uo2C2ukK5
WfEPetJwrAilKQUBpNladzLOIXT4/xVdzLTl1kQCTeJ+k+4f9ubiLI5C6cJOsf2j
MC4jBXoimClS2rp5jMK42D8blKcvVDH4Z4X87FPzl1sqRy8EI+nFftpZt0hSW/ai
gYSqxdYQ0cXLyu2XzCARC0BSUETt/g==
=zJTm
-----END PGP SIGNATURE-----

--ztliwx3eij5ch7ku--
