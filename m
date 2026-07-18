Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11E326924
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361090; cv=none; b=Tw5yaJZgJkMXKovCq6SMlECKKxYyllFCALEc7gLdgID8ngQ42RWz7kFrJjO/hQ5t3tQW/6XMDjet2x/4tr/Vpg/5Pgi0HsMS9KBdgmRdumIS7jpMc6+qa7TrzT4np/ZsnRuIc/VXn0zlYkz8Gc48zYWY01a+w77bQlKmm1Y+wbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361090; c=relaxed/simple;
	bh=KkJvQNCZGwOddPVe9RzKTm2kcHH0WR62mljAu8Kp48k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OkIlHmE2K6CHW6vOk/PgT7igDOhJG3FSryYzAXhuGf2IIhKX2fU15i0tJauTzTMaW3tsowSUW9CB3xRQ2X3V1x07fii3MoFQQKfo2lSVzhEV5kRWq2y6aLhrzYzxkeP0LDqh6IQFhWg38nQgrSsD1woBS8I+iUe6J1Yp6yJxU88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OytlHqZn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OytlHqZn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso7599835e9.0
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784361088; x=1784965888; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHuS2uW8Bo2nkF3eNBf80lun7nQgThoolW/PgIH06Nc=;
        b=OytlHqZnYEaR91vc4+WupKz28J9NWtTxXjgDOj6m9DhxF/6PpEZLYoWzxbY4HDnmbq
         wIRpFS2E/W/X0D86iRMV3WTj//LEGob2MH06u1v8umiSg9ytFMIBObCiJr7xd3q0N1/Q
         r+OVAuuRaTSds7SQw25jHJuwY90Ruk5Y2eXAJ1h3u5HntKeCGzKpziKE2Xf+pIPFZrtv
         Bemxj/sLdQw811iQ6olFFw2JyJtmupPpF6oGjYdmz2HdqpsFNs7fiDyzZj7kBnIOPrdd
         1P4hWe46Mam3S2CD7vCLY1V0VneqX2KVJxe2MMAa7fTRneGIVf/fgEpshazj6aSCSKfL
         0aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784361088; x=1784965888;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHuS2uW8Bo2nkF3eNBf80lun7nQgThoolW/PgIH06Nc=;
        b=IZpzE4yz+86jcnTo+oxv6RuHPFSBTEso9mMwGoOBTKtQ0H2A/PlUBnouAvaXPtP2+0
         CCAjE3YBKMwUUTJEBHggyXxLCyY8Pp+6pE7Zq5zdguC+kMOwdho2hnWEh+JBxlPFUBYY
         sPIBVi948Jx8pWwHqLIOACyI2iUcvTlkDq4PCGwa3/cbExqjX8rkMb5EeAjI/JbDZVHt
         tDjsJjD53gMM7CIrTIz0sSx4Szo8mHFN7bAa8BZGVQtNdrnKTn99EIBtxbhImVZEs1os
         db0yIp+fl8mJHntLjsXZE4GZ9UvH1VYIxG7isw6rL9tgOwXIv/WTIJlqaJO6/0pQjTfJ
         rqkA==
X-Forwarded-Encrypted: i=1; AHgh+RpqlXq8aTY6l9hPXGHS45/Y69sbmV2o7KKjHkXrrXxTwESx/Xq+H/Gizn3jyJOqdBZAo7YHdm+mf2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxajHxK8NeznlqGwBNoQS3dvy1Xe+HOWfQ9SsCzd6AF48twnVsG
	67xNslHIFIR2OWwQW0pDpP8G6a/tiR0L0/noM7k9qB2gql0TjFtrPEKZ
X-Gm-Gg: AfdE7cl9874VFxdPCEtNo/6wZ2O2TRdDqExPG9rrdvYKI9rp/LZxeVu4e/QuX+zEeh2
	ycUdoJdd7+9LCjWncuM0CTSBc9LqvLLavgpNSkc/TVbaz3Jj2q+YqLI8qqGROFbfy4SEJFoivzx
	COg8c3MnEceeX6ny7kcIu7jYWfRO5+5qUi1YlRs99DsBiikdmxT2Lq+GhP9dpltoc0WM5WH561R
	282plTBl3rgELTygL53QRSAHdXlXQB6nWesI0N2Ar5/4itBl5Vt4SlDFXP9zcyWYjZ7ZFOUaOEN
	Y2Ob5auIYXki+VqY3sm2XIW3/9TMTKpuiNI14zN84NKBN49AG6x6CMWbtmTW2J2tGGbm5BuoLsu
	f8p7PMpC2ekILTaQdc5cT2RruUR5Mc7iYrCVS68yxSuWaPMLcunXduQwIMJ9Vs+rSVLnYwtKbhn
	DHrl+jijSnaMEVZwngE9Ozcw==
X-Received: by 2002:a05:600c:4585:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4954a3eeb63mr65163955e9.5.1784361087691;
        Sat, 18 Jul 2026 00:51:27 -0700 (PDT)
Received: from strix.localnet ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm61024895e9.1.2026.07.18.00.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:51:26 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject:
 Re: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy documentation
Date: Sat, 18 Jul 2026 10:50:46 +0300
Message-ID: <Jn1AVBXlRkmJ2q2cQbPFhA@gmail.com>
In-Reply-To: <20260717-uncovered-feathered-groundhog-eab16e@quoll>
References:
 <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
 <20260717-uncovered-feathered-groundhog-eab16e@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartTPGCLSSKQRu-pTqQQZ3W5g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartTPGCLSSKQRu-pTqQQZ3W5g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Sat, 18 Jul 2026 10:50:46 +0300
Message-ID: <Jn1AVBXlRkmJ2q2cQbPFhA@gmail.com>
In-Reply-To: <20260717-uncovered-feathered-groundhog-eab16e@quoll>
MIME-Version: 1.0

Am Freitag, 17. Juli 2026, 09:32:18 Ostafrikanische Zeit schrieb Krzysztof=
=20
Kozlowski:
> On Fri, Jul 17, 2026 at 12:35:37AM +0300, Stefan D=C3=B6singer wrote:

> > +  resets:
> > +    items:
> > +      - description: USB phy reset
> > +      - description: HSIC phy reset
>=20
> Why do you reference here resets from the parent? That's a clear signal
> you have one device, so one device node regardless of Linux phy core
> behavior.

This is a follow-up question for the PHY maintainers, if they notice the E-
Mail thread: I'm trying to resolve an apparent conflict between DT=20
expectations and a check in the PHY core:

device_set_of_node_from_dev(dev, dev->parent);
=2E..
devm_of_phy_provider_register(dev, xlate);

Passes the letter of the check in __of_phy_provider_register(), but I am no=
t=20
sure about the spirit.

"dev" here is a MFD child node without a DT node in accordance to DT's=20
writing-bindings instructions ("DON=E2=80=99T create nodes just for the sak=
e of=20
instantiating drivers"). The PHY core prohibits a child to register a phy=20
provider to its parent node. Why?

--nextPartTPGCLSSKQRu-pTqQQZ3W5g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpbMFYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi14UQALMgF2vE7gNXf/lwdBLJ
nrd5dP9Opm9ywvrBTVh/X7JslAvqmfG7p99UPAkVxM3fHwX3i6Ep1UwKoClaM3jR
lQWQhMJ9ceYI3ZtxDqV04raEtEYdD6iKTzqXVVLVySqFLFTy1M0SHAqN8I0hWY3X
98H0UePyNZEVEQmuUTb8uxsdAMFZ1BPEatKENp2fNrge+kF60oIqjTfDYImBYPIK
uZETnPzN7W0A6GvBjL4eMVYDRPyKSw3Yn58/hkkJCYuGGANNDy4D2mf5dvUbXhvu
sqdnkAe8ABEwd7pXowiebQUmNbB+tKPpvqTRmXlr9pElhmknV7SOGYUnQt/7PeQa
pIG+ksMvRKzFsmnoinzE04Gi4EqHf8XD8mDNEa5T6Nt/KvqpbpVufXu4t04zpJkN
NXnCC66jNUQxkMmrIjncjpBtD8yvUA0Wy3C3MYYHPP+V04YRZXOrY1cJia94+zeL
iqFQL6qHoeWjICo48CFvb++qor9eaQYHk7F4goql9o9XaroH+jXZsKkIV6hyFXZ3
rZfjVgEl1Y7QQdAMihLz8zCrgM1xWHCWdSWwNEmcq2A1eCKg7F1sfG9armUWwrjE
AR5fGoqdZ4x5KV/EgQOLNxsBEPnlUVA0Qz50jlNjlFRMlBFSNDJyHJft2qOXfeDd
1fgWAHDkZiT9th1kma3dY/PQ
=0ktk
-----END PGP SIGNATURE-----

--nextPartTPGCLSSKQRu-pTqQQZ3W5g--



