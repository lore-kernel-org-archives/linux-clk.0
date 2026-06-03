Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB53DD532
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519790; cv=none; b=H9LXtB/r4IlztWlU803LQ77s0wOhePGTOAZDjoSGfMVCHPARNU+thfH7iGPDeGVMzbSQW9aG9jX6axzHlOXXVg4ls617cobtMSCOqjXHd6udo3y9kfHTQIUtv/PuBjJxH7tI+v4pzD4Iz8astv6JdU/vf0q7eyQBEQjcIGOv0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519790; c=relaxed/simple;
	bh=jWkfKdewYYhpVaqdM3YRB41H8EaqffdOaBhBtnUxHB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQV3h5NIiucH/mMFDVA6U5TuvaWhpNTjldtEdzvMuow9KpX5lFrrBnYZRG4zS8NfQkk0jQL8tp9FrSLbGzOWM415TG/78nBdmjW4aqtxB732B5GWDBnRpxZhaKaFDpzxv02C+nCQPMtvOzULTssui5TMfjAb8oPEViPF1n4PoFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPHHIkQ4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPHHIkQ4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eee266c6cso5318319f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 13:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519788; x=1781124588; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=;
        b=EPHHIkQ4d45Jh2QfcM4y1dC0ZmyYSKqrn8zFYOxzzFLv88n5LZmv5aKCMeTfD7do02
         mtHvpzWeKUKrlwWTtAxdTGlDstYu3k6GBErc0hLrtq8KuX/sTkUq9iLRuuKWYvXeGCpm
         g4x1LIURbI0mt9/WsH6K62G3TbNBklQLKhpH7OQdm0vZx36Fp/iD5fNRkDPeIZpu0nsp
         5KJsYDiUWUcxDH03hYJcN5B2g1NHluokFtordKdf+mdLZhps11DtuIDHmOkeoSpJai7U
         Zp4VHpkQZ5nkz6nCfQySozfCuzoh92OCmgPM5TIXeL701ogfkZ4VLgMc/IOAuWYZKF+Q
         Tn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519788; x=1781124588;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dGbw/HligoRwXWmwyuEZ3eA9ohzHJBiYcKD6StczHo=;
        b=aQo7XN9S+KGJjUtOslDAhZVKoOQkjg9Z3n29tT1C0ggT/+pwBK1OB0JgeKFiIaam6O
         WhfmP0/dra2bNpA4taAjwmp7YwSJrOmpwKMy8OwHrtCoUY9kwyi/QJmYU55nY5eYRrFV
         zchG2FOvwD+T9yu8Z2LR+Nhmxah/mUaHu+UkitSSQVVd0k2XPnf1xSLKNa5OOgiU/IL3
         J1C2lrz4VQ6zQ8UdVsgA+7aayB/pqbeaLbCEzo6bHOKSQsixoQOzuawgSrYTIIPHtPKY
         fRFvOPWxXODgutazbRGsZz2qulQNVUvlq3M9GZ9KRYvhi2J3VMkWwZv3VJqVOxI/6fjQ
         r2eA==
X-Gm-Message-State: AOJu0YxUjFHBO9JGZqvqISFH/4y4iqqiWJ3n2dX1nVU42NoqGf1hIQbB
	mTzeXJcSL2PyiwjWXwxMPeHXue2XyblME4tEFPCwnDj1+C8KtEt4wBiN
X-Gm-Gg: Acq92OHFUaKSyuvAzHa0KXKFmEy/vmk8fbV4xotFPUj2vWXwU+dNLJ/7dZQu53+KWmB
	LWJ+aMA/ZHUuMfBKBbBWyG/U87NZQ4xNyjOwuu6mxgm1oThkd27SMZ8bKYX0m8oz5/IPGL7iXsi
	nG035j4XEaLoZGne/sAEqNIsA4/+ckb+UPI0neGXXfCNlGQttFPAio5NdLHkjoRJ92MNJqAerSB
	KQH7KrXIaGaceLZ4zcMSsQEUxaFnUxG5zs3BcwO7uFg7QrUphPQaN+H1FvQHe83k4uENR0wIjb3
	BS/ju9O4h5N/PaTown4UQiMFX+w2DOW6YNG1ckgcpeGSkkJDWE3X/LV0OPu4Kliex3soJREq1ns
	1zbfys4HXCadSPAXKXRVWbbEdyD1iY3eXR/qvs9lyko4yOEvRaNpl0WmV/R1Y0GoJh7YcbVVrc4
	mNUOcJHqCc2KG4GcswAzaX5dFTfoCo0rqXQifL2ZrXd9PxJPQ=
X-Received: by 2002:a05:6000:2990:20b0:460:e2e:6e25 with SMTP id ffacd0b85a97d-460219363dbmr5503550f8f.21.1780519788018;
        Wed, 03 Jun 2026 13:49:48 -0700 (PDT)
Received: from strix.localnet ([197.250.226.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm11286220f8f.35.2026.06.03.13.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:49:47 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3 top clocks
 and resets.
Date: Wed, 03 Jun 2026 23:49:41 +0300
Message-ID: <7973709.EvYhyI6sBW@strix>
In-Reply-To: <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
References:
 <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
 <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3972897.kQq0lBPeGt";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3972897.kQq0lBPeGt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 03 Jun 2026 23:49:41 +0300
Message-ID: <7973709.EvYhyI6sBW@strix>
MIME-Version: 1.0

Hi,

Thanks for the comments!

Am Mittwoch, 3. Juni 2026, 12:14:21 Ostafrikanische Zeit schrieb Philipp 
Zabel:

> Is this delay long enough for all potential users of reset_control_reset()?
> Are there actually any at all?

You mean drivers that are in use on this SoC that call reset_control_reset? 
Afaics not, they all call reset_assert/reset_deassert, or only ever deassert a 
reset that is set on boot. It isn't called at runtime and the only driver 
calling it that is in use on zx297520v3 is stmmac, which only calls it if 
assert/deassert aren't available.

I implemented the reset() callback because other drivers had it and grabbed 
the magic usleep(100) from ZTE's USB code. It looks like I should just /dev/
null it.

> I'd move the spinlock in here ...
> 
> > ```
> 
> +	/* This is a special case used only by USB reset */
> +	if (data->resets[id].wait_mask) {
> +		return readl_poll_timeout(data->resets[id].reg + 4, val,
> +					  val & data-
>resets[id].wait_mask, 1, 100);
> ```
> 
> 
> ... because this might sleep.

Ack

> +	return val & data->resets[id].mask;
> ```
> 
> 
> This will return a negative value for bit BIT(31), I'd wrap this with a
> double negation.

Sounds good

--nextPart3972897.kQq0lBPeGt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmogk2UbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoig7IP/0VOIVlPzWqCbTORa8Ag
o4V6xlbD01NZlIPog4nma5eaAeHlu186bslT26PX+RvCITgO9h6jVYMMw/x0ENgL
zx08FDGRm/yjN3a8OStSgVEIZszr+wJcVdT8m2ODHG+yxLRwAJOBMEpL8oHJ8K3V
FcbhrWzibd5kcCqcE3iODoIzs0yE1seUWsNOPRT9cgrzDekdYufZd7Ytj5doT2Vw
FJwnjvxCpoULJP2OqbZaKu2eAuyBnhd/o96l2SMkz8l/d6AIgnv2cw1RdqmxiUsj
4KDDmNcutHqS5HSg4SowO4pLX/b6vlMzNGjZrjpKgnPLOCqLgCSNLkBWRSA/xRwB
VVthQxmH+JmO6s0h7MxiPEdYD9DCQznvxKW5GNpHFi8KotZtFUOaG6ACCK7o/zwA
VXAr8LA1EMZY7M2ar+Z/Lu0YC73I8OACijBtuDP4/O9olftuXDamnZcumL+j2wZv
L6Q6/RiJBPG588d+5PY+FsSfX9COQbOpL4IzvT6g8LvjF4wkR2m+2zwzLZlSkj/v
p86aL5HDAlRInf/kTP3tt6hz6ksWJN0PdozFM8hLVGBRDG5lFZ/gF6O7Fdxg+0Bv
hyceItcgi/00qhno/ZOXr0I3pqHCfMjVBO5lzeY+X16VfUVCiY8bIcAbVu0SllEg
CtjIia7y5d3THiUTfJ7sfbEs
=x7MD
-----END PGP SIGNATURE-----

--nextPart3972897.kQq0lBPeGt--



