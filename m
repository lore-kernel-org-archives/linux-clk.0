Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A584346A02
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136114; cv=none; b=RS+TACBysL8MYDihKe5dP5MRwvx4LHkuBdVcj61bYCvPCejCDFLcfICBH12tqBRMWinqITI7SA+POWcoWNEwLfSLwleS8h7qpGqAPOgbBI6YwjmUHX/9LoQaEiu9jFIBpaiewhQzLWsf/JIgJYglG4d0lgdG3C67tbFSJw8aYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136114; c=relaxed/simple;
	bh=KfrkmwEYcp0t/yQ7DslMKdgDKxQI2Aw/QCNqab0oIkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjtZTBALjiJDArba1zX/MHvX+GUjyP7Qoi8aa39BenPyH0dqZ47cMoVZvrJMT4f79unG9nwaYgQm5Ams4pfi7bYqNJGDtlqixv7wG8cZwbQWpVBMmKhl62wT52yLlEWzqNzbRnyGTU1Wb0oqvmA9QsxvQCAmaQcoIuET+EDiLAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IMJtL1e/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IMJtL1e/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954aff6088so38178945e9.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 13:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786136111; x=1786740911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9/O1JVdMIdtzlVv0nB5F/waAjRRKXc1DJxcx9UYBuE=;
        b=IMJtL1e/08dm3olngAfIblkIKw93s2OZXSH2WY3OYtLEp+HrC/bVe10X28DjmvCYlP
         OEduO8ONORsoGMLNwKB1n7nZFbVFhCZou5nlvBKBk4Ym4cj7yV1LXxIJ/7nz6Ssvfhm2
         ecpi6DQGuaSUbMjRCEfiRiL5f1XGV9bNAQf+8ayKBgq9StQMgHaHrTvyWoGdkD8MTuEr
         G/0co2HAxqehrNxqTcJMOG4XhfWBeU6qKR762GGEu28rJkDfZKy/k7/ZPiJbIKDhKmHY
         nvvTiABcs6xjHEVqtKF60rEFymGcMi08MnZDUXF6n+YELTtQ4PANYIuzuUUg6tZW5CW4
         3GPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136111; x=1786740911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9/O1JVdMIdtzlVv0nB5F/waAjRRKXc1DJxcx9UYBuE=;
        b=WBhewzc8tLsE4CtlZg0z9J1a0yaCkusS1wL++6TgrYS+jOt4tv2zUT7Zz6tuFWdmjo
         WVFDxzHMAqfrN/VNt9ZSO+tDf3TAo0B47w8SpZj3lRqlxOl1H+yNvgAmKuTFLND9t48N
         dUQAYzZnqzru7FKD+VsuVL7bVsrCu3/O7626mZxi1CDsy4Vcl4XuL7Sw7IR71qVYv17o
         f6AZ5JQw+qCo95CiXSO1BN0x31vInGj1g6dez2SNZf9mG1UU3rO0p5XVhwbhRgMYPrUF
         FQ+AzsaMnaBCZHeisNWf5w1kjbPBjZ/YRGxa6aFcDxr6W58uilsYZ02q4lgiCilV2Oi3
         D3hg==
X-Forwarded-Encrypted: i=1; AHgh+RqP1ebAgdiG+itXGauF1BLkW0UtC7wGWbAlFwKlD3GB4l9YD7F1z9lu3Gy4X3xPpT9B84DK6AYhYYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjquemoV/La/RAxAGe40KRisDRKFtoMmUO8QzNXx7/Yh5GDgA
	8oUEoSuao9/iRaDzn/VOdDsyMsJNZPxSVgMGyFiVB5I/j3g9Je5IJHLznVa/a7mk5fE=
X-Gm-Gg: AR+sD11ma66SAfAD5ZfgXAHxFS0vpF1xnV8LNm8q+PH1vIo6otyyqMLdsfJYnpbQF7M
	CZJ2UGHohW6+vgPR80nlu8pBZ+QTnIZsfdSr9ACNaQswW70c9zu7myLpMZOA6X12x63JNMyOsSF
	3M4gN4NTsT7U+Lpra5oG5kFoIgHytuBz5feFo/VBwXBFbGt5Q4EVUuao5/8git8CLqiJOvsYoW3
	yAGZe8sJBrTX6l7O5hIMZ/OaMig0qc/jwpveBS7mSWnmWyS1WogYoCRWd4h3DPJ8NBbgo8AnXmX
	ZaoP27e5k0HHKgnjr9qfWsV5cWoeHbr6xNdQHM4wy2aMYLVNudFjo2pkQ1iGmShlB9aaTHUmZxv
	7P7mOIDpL16QqfGBr5ATcV/VW4mgFarSjl3FUl92aTUaqXTx4NUg74XwCsHLM34XmO4fsVM0Cid
	Vis9kfYah/ljv3Zgm+LaGRLPH+APc1KcCLPqwsg0GFylCnpvAepqhy9X10/JhFIZAhuRU=
X-Received: by 2002:a05:600c:630c:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4994e74566bmr268092245e9.3.1786136110351;
        Fri, 07 Aug 2026 13:55:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995bb8b668sm68594735e9.0.2026.08.07.13.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:55:09 -0700 (PDT)
Date: Fri, 7 Aug 2026 22:55:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: bmasney@redhat.com, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v7 2/3] clk: cs2600: Add Fractional-N clock driver
Message-ID: <anZEtfI1tFz8Xc00@monoceros>
References: <20260807155406.752721-1-rf@opensource.cirrus.com>
 <20260807155406.752721-3-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xk6npk4zzon3kkwe"
Content-Disposition: inline
In-Reply-To: <20260807155406.752721-3-rf@opensource.cirrus.com>


--xk6npk4zzon3kkwe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 2/3] clk: cs2600: Add Fractional-N clock driver
MIME-Version: 1.0

On Fri, Aug 07, 2026 at 04:54:05PM +0100, Richard Fitzgerald wrote:
> +#include <dt-bindings/clock/cirrus,cs2600-clock.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/mod_devicetable.h>

Please drop <linux/mod_devicetable.h>. You can rely on <linux/i2c.h> to
provide struct i2c_device_id and of_device_id.

(Background of this request is that <linux/mod_devicetable.h> should go
away soon.)

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>
> +
> [...]
> +static const struct of_device_id cs2600_of_match[] = {
> +	{ .compatible = "cirrus,cs2600", },

No comma before a closing } in the same line please.

> +	{}

{ } is the most common way to write the terminator.

> +};
> +MODULE_DEVICE_TABLE(of, cs2600_of_match);
> +
> +static const struct i2c_device_id cs2600_id[] = {
> +	{ .name = "cs2600", },
> +	{}
> +};

Here the same please.

> +MODULE_DEVICE_TABLE(i2c, cs2600_id);
> +
> +static struct i2c_driver cs2600_driver = {
> +	.driver = {
> +		.name = "cs2600",
> +		.of_match_table = cs2600_of_match,
> +	},
> +	.probe		= cs2600_i2c_probe,
> +	.id_table	= cs2600_id,

I'm not a fan of aligning `=`s as it gets inconsistent over time. Here
it's wrong already from the start. Only 2 out of 3 members of the
i2c_driver use alignment and .driver doesn't. If you ask me, just use a
single space before each `=`.

> +};
> +
> +module_i2c_driver(cs2600_driver);

No empty line before module_i2c_driver() please.

> +
> +MODULE_DESCRIPTION("CS2600 clock driver");
> +MODULE_AUTHOR("Paul Handrigan <paulha@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");

--xk6npk4zzon3kkwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp2RigACgkQj4D7WH0S
/k58Dgf+MClFTxmS/qK0orwG1HB6xEl5A6Df4iMYUnOfblE7l7XB5JJJeO/A5XyB
zCNvQ5obXXkYh7UnOTBCOCqCXMOAhRFkMWL/71plvOo/xogZC9cICDs8LjElucLA
meOkRGqabSTG4YnkLr5mDOP3lFYEUxmAN0NIcMUCUTrOY833wpDDdbVqfioMqXb0
V0bh3jEEoSqc5S0VtSzmTWsXUl5j9JNUZd/9+vaZdpsEYov2U2UXVyv2mBqglfEM
zAdXsQoUF8qimawimqOhCcM/ll5LFxLwJwDUd5ccK1R3nocXeECwRPu9hh8PrHO+
nniM1hBbVlJjPOHVZz47EU46oOUTvQ==
=69FK
-----END PGP SIGNATURE-----

--xk6npk4zzon3kkwe--
