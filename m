Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06E34165B
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783152078; cv=none; b=g6SmbGefIcNgkRSMDTJNfI75i9tZdJYjrNxEHkknXBhYrpXwjpYxUxoRM1lkgYbCLF4z6GmMPWoc+AoXxUa9IzpANrI+BgnOTtG+E5ef084SEdbmQcmf3HJ4zWKFgaS+Nb7NjfbGWIdmpQcwUjPUfudrVdcDW/RpBsVPzaQrEg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783152078; c=relaxed/simple;
	bh=SctvXbSC+f9KU+QkTs2gdYCja0XbfsqxdtSg+QcAVZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAW9Im4OrrI25+KNylsMMmIxsV8qbveDh0YhPwuW4ADdm1XQXzfyLt7OlkKok+5raqm6gAHbXVwtr2fqB2huNpMcKIam3cnC4hPPbCxpp+A919hM2GhGEh2sqkZs1fRdzwL5Dl7AaSelTGTn8NvuP7KJg9MsVApYnc9qqXsFFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0CzszWW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0CzszWW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so8864555e9.3
        for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 01:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152068; x=1783756868; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdLWa/pjVt7wfAUfDu2zjOc8xJ+YFDbqtxyE/Db1k/o=;
        b=q0CzszWWRCsbhoCVSrInLTutD479R2cPkZLGWA+YmX4An8p5GsWCChs8VXllEV9sJ/
         iyl/7aY7q0XBWz9tlXdc4B8WVzuIAcgRIwL9yBTgufwv2OeFSphQ752rNdELj//+FjiJ
         SmbxxIYJgff9uvKZKt2l626zFasU8NCTX7+4lN2NrrV3+8azWSRqF63i1y961G7nwseT
         eqpKWodrk6vwYvBr15pR3a6E4Snc/fja4fajdIt3gSsFJ2Wd92CRbr2dNPSy4ed+VIyO
         z6XsScf3A5OI52fkGcB0IBVltbVolmDKKBysI98fJlEZkIM6km2o+TXALEyRjqyF+r+Y
         6Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152068; x=1783756868;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NdLWa/pjVt7wfAUfDu2zjOc8xJ+YFDbqtxyE/Db1k/o=;
        b=A+T9JQs7okMs49hcjPuk3recQlxq5NcSz7mYPiZdhN9CUS+a1VTw7ViqtbgGaWUncw
         NtyrPR+hmznW7KO+RkKNITxcFnpq4jUAHoHKhIEofYGmi++UkqLldCf2VhBYr2Ay8kPw
         5wazR4YNyNLnSIdn0BAZPu4Ah0Q1lr2eCeBPgk4EEsEZP4qWR3U2yAnLieghnRMhDdG3
         073Sh5aRmN9r1h+A5sIyrxKRe9RBAbm8HnISshfCUQArpsnHIDQrJA3WFs9ylOcunC6t
         2joCeQm/yBAio0BKENst2zdlsUphl3v2WzAUoKu/EHVI0gGk6ZmpYmFwKoxZ82WhCoYV
         qCuQ==
X-Gm-Message-State: AOJu0YwiYoZ/f0WXTZjjsgutr87Uuh9OESzBA7IoV/iIt/UAzIOq1DKi
	56r8rVGWSjNIGgUs5bRfYPERj+nTHwVj9+H7Q/9UDeylta5bznpjZvQh
X-Gm-Gg: AfdE7clf/Qb3h3OSQAZQ1vaQ4NT06nlAhudZkVdMia/rvLTkzPw/tP0kcK1atpao7B4
	IwVq2OaefhYwrlL6Ze7n3tNakCZrFocOqrsmoEYo0nkszExMQJR3rj9j9hIXdbf72NXfzyl6+5y
	AmZsoZ4jBuXgn8aSWhFziAl0Tt6Jfwgiajx5Xn05xT/1EuzshAVbAIpxXbLPjGOqQ7IAquwRrcc
	v+YOGCdQ/8QjXLE5z7nZtJhinO2rNF3j6vhvr9Krxq6dk+vX6yZe5utPr7/K3P1unl5FGBmBg0H
	PmTLAvdseLAdQJEzIu1nUcnKDuCC9BpASdEbeYMEBxDE/aruug4CM+xdL7DJtyxWYXLsp/+CPXs
	QvNHm+HtJ+pd8WyZC6ATQzNYC73wRVq6IfxxrboMnv6TBXc6Ni6aGE5O/jO3uqF0jzkIK2i56bE
	ilv73EuisXOd3KpgL6Sy6zUmjU
X-Received: by 2002:a05:600c:3f0f:b0:493:c432:f48f with SMTP id 5b1f17b1804b1-493d11895c2mr27432545e9.0.1783152068303;
        Sat, 04 Jul 2026 01:01:08 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm6231470f8f.21.2026.07.04.01.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:01:07 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
Date: Fri, 03 Jul 2026 19:19:51 +0300
Message-ID: <AcQaacfOR3mtrGh-gPN30Q@gmail.com>
In-Reply-To: <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
References:
 <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
 <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartpcZktKqnRSCVt1wDyDWmmA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartpcZktKqnRSCVt1wDyDWmmA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
Date: Fri, 03 Jul 2026 19:19:51 +0300
Message-ID: <AcQaacfOR3mtrGh-gPN30Q@gmail.com>
In-Reply-To: <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
MIME-Version: 1.0

Hi,

Am Freitag, 3. Juli 2026, 12:16:09 Ostafrikanische Zeit schrieb Philipp Zab=
el:
> On Do, 2026-07-02 at 23:28 +0300, Stefan D=C3=B6singer wrote:

> > +	rst->map =3D device_node_to_regmap(of_node);
> > +	if (IS_ERR(rst->map))
> > +		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get=20
parent syscon
> > regmap\n");
> Does your parent even have to be a syscon?
>=20
> Could you just create the regmap in the MFD driver and use
> dev_get_regmap(pdev->dev.parent, NULL) here?

topcrm needs to be a syscon: It has control bits that the watchdog driver w=
ill=20
need to access

lspcrm no. I am convinced it only has clocks and resets

matrixcrm is yet to be decided. It is involved in the mailbox system to rea=
d=20
RAM properties together with the dedicated RAM controller, but I need to do=
=20
more investigation. I might drop the syscon depending on the outcome.

Afaiu device_node_to_regmap is supposed to work on on both syscon and non-
syscon nodes. Am I correct?

> MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);
>=20
> With that,
>=20
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks for the reviews and advice!

Cheers,
Stefan
--nextPartpcZktKqnRSCVt1wDyDWmmA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpH4ScbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiqAYP/0PSsCJlf1iqdfLjDzre
QaoR6ubCMLcjhUyly/jNCsev5VyfG/DKJEZNJuUN676osNwkvtuIc9JEtK3Tn2jS
PV3HfJ1CebGkpSsUJXGSMLcgzzlmpEZHh/SRwe84z1WE+DXhURLJJ0X+foIrAao0
q56lNk/EvCOOfurFn1G8kTrU0WeAb1Yl3uGTIB9RiEzmm1QvjlW8oIczLUJ3+CUk
Y9F2seldqqaOTYoVMvU6FC2PfIf7CrTS+1l9y7pmGDZyGiMJduldvEVq9nhadGEw
/bBzamiINBn8quw4RR3qFF8K982jGXCF9MWzRgFqWSwrCV0v03n02IYsBTekfSE/
YYTLTdW+1e66d7MUQ3yxYgv6hnzdXRLJFO31Z9TDCS7SFWlZ49Tzx2sH9YLnXQqZ
kNisSl3CqxpqsfcQ/3Io/PPTIuFV6f9Q3vrD47AdCZelgv07Wo2px3Xloc2oQt7n
HFL1bz6vBbES+xSTGPY1TlqtVOz0NSJ3sIKRjfmqZ77TUyaigFs3AzS9GW9559eR
aSBwKVwLbBJJziQAG09Ce04U5w7QHZ6l7lHer3luAwq1pQmoetuxPuOA2I714Zxs
grduqqB3KwvuOhsMRBeXbcD99otALxwXBP/ajR6zbuO11G0+yPwjMDau9Ym+3l9z
37C7wQ37BWNiCWRh6di8m4ab
=wt6K
-----END PGP SIGNATURE-----

--nextPartpcZktKqnRSCVt1wDyDWmmA--



