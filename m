Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42553413230
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 21:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014603; cv=none; b=JvUiDhXycs/Ilr6Nam8aiIFjANFYTN+zYpluRUte15/8WToDwQ9TVmpMHePWsXYrh+f+PAfo31pkfUBtbah/j7hEPmwjn+XrvQdjQYUYzotJvkfmKCrAON19nb/SLeiBmpQNd+v+nN3XXLTVaqdqYDi+oBRejMxw1SgDM6zmj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014603; c=relaxed/simple;
	bh=5m8gmcJPfJEo+Xj/WVPQkBA6oxY16fLfxxTTJcTCHE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vFCivgnEggG2EnUDRf6uECn1I0LwLZb3CcfEvMHynZg5WjttmPCmnOdmBU7noBZz2/tNf9yAeiu5tHWreIriNfL/f2AU8IgldaPRpQxbK5YzkrEuz8rezLBzDOPIeJEambkAS3lYGlc7LKrzP/PhirnnLnnpymQOS2A6zb21a0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxSFItDf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxSFItDf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so37655945e9.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014599; x=1792619399; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JnSzh6uRY1DGm8qF/E1ET6S+smMFNdEHSczgKhtiNs=;
        b=VxSFItDf+1NqR3NwOWw6ZGZRSLuvEUTYkGVJHA/AF7y9GPNjWzRCzYLRizAwRyPPbX
         3XBxsiFNpxi5GE2Af039tLgWF2A8AI8Hpxy8RjnDsJwDq0d4g/OjF5CbmiL5i+z7WXbC
         5dI8Ncs/z+REp5hnMafFL3MKPC6m5EogVEoA8NkIy/GkIkyc91u1jV3MFGjqOK2hqypw
         3S1H5eOdV3rVJUrW+RbhzDWCx9ggqKIOeaU/4yCpY6l+CmZFB/POtwZnXmabTAHFHjoY
         4Ot761/5DBHYlaSHdGgKNSv+kYnyk86YNby9VzjNDz7sk9L1FLeA5n531KvWvjJd6x1h
         SrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014599; x=1792619399;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JnSzh6uRY1DGm8qF/E1ET6S+smMFNdEHSczgKhtiNs=;
        b=J3QoB7fbo5rdXBhi7dgDTujdKPXNG5ihbnMV0+B78+zms1+4nPDgsRuPAOkXXwzWxy
         1Omak71grl1aUSAKPsxpN306c0X7iS07SgJaUF/mkR1WJpgTWAvvs0Xp+Z9/7zfzMQ8n
         tiq87litQYscdoEn0JWW7XdYBN8AS7KQoqUGDkd5JIsAjFg8DVgEVlCCZvn0eA7flV6X
         T+4YTHu0nqdA8V/a0QprZUNVheM5P5z84Gl0nYVQ4C7VplSiiCazFCda8X1C6Xu+gzto
         udf489uisbZXXTahglnEI5Ow0Qwdd7zZU0f4KBqHspTf3ulcj8nYkb0y1TTpU6q2Y03J
         7u6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPNDYvkd0fMlfukeeglntZrdX9rzRXbncC2scDAztksvpgcqoop4aPGtbM/vJQlgcIKkVS9tvqPDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp49KfDgFrjYOXaikroBtI5WgNpGjbbQOWdRv8B7RDjj/nLNaZ
	/mkqoXwA8adv6HHic/TPKRXjXt0EpLHjUn29bRKUIt7AXWS92F8X06UX
X-Gm-Gg: AYBFou0v3wiHkKkKfpWG1QrTLqSxZaTloS6O4J5FfsHFDV48JD1sifnGx9XRBmwzrpK
	2QbmXKi+Wo05Co60S28BiHm7bW9f+2s3VkI0HrEwn68SobFrH95rPBaRaTYDnSVHlxtxXP8p1BC
	B7upWDI/Y3MyTm/SOE/BmuxaaH5A3A5CcYSepuKq+k6KiGD+1WmCfvIYAOlVwF8kFaTx7A7D+/6
	IJEnbnSpLHIYewe4NGE9FKObeUMjsXyxQysRa3/bg9eYNyesojUX4RFWDk4TUqXBskmCIirazgd
	nHoWFTKjrcEEP4bBLjH5zmRwyLbl9CcYz6tv0OfSKkPCkBIAzboFMbEq5wOKzS2HWOrTm7kdSl7
	vBjgSccm8Cmbz6unES1+WPp3hZnvu9lYBAhnAuzcesnQeBW5QyY2uGDDmYsIv6WyWxfvOpYzhG+
	6VvrfYsAHwGE56ttuWd3VqCvzVcD9f+pUvgFLs5HzolU3R/KMKmvEBSW7+53MrG/NqIvo49kZvA
	fJz4ryZ5H3iHhTFJfeBosMdOyHytHmrp6GFxtBr+f9QlL4Q/zM=
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr343979005e9.6.1792014599154;
        Wed, 14 Oct 2026 14:49:59 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbb4a30sm19614465e9.15.2026.10.14.14.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:49:58 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Wed, 14 Oct 2026 23:48:32 +0200
Message-ID: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
References:
 <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-5-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartKiOmKHBbRlSSdhbtK6AHkQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartKiOmKHBbRlSSdhbtK6AHkQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 23:48:32 +0200
Message-ID: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:44 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
> topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
> for child nodes inside topcrm.

This would be easier to review if it were split in 3 patches, one yaml per=
=20
patch. I'll try to comment on the details anyway.

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: zte,zx279128s-crm2
> +      - items:
> +          - const: zte,zx279128s-crm2
> +          - const: syscon

Afaiu this makes "syscon" optional. Why do you need syscon? Why might you n=
ot=20
need syscon?

The goal should be to avoid "syscon" as much as possible. The meaning of th=
e=20
syscon compatible is that a different driver will access these registers=20
directly instead of going through a properly exported interface like #clock-
cells. Is there anything in crm2 that is not a clock or reset?

> a/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
> b/Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml new

> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>

I think you should be the maintainer alone here, I don't have the hardware =
to=20
do proper testing of patches.

> +description: |
> +  Each of the two groups of low speed peripherals (LSP) has a peripheral
> clock +  module (LSP CRPM) of its own, fed by the top CRM.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - zte,zx279128s-lsp0crpm
> +      - zte,zx279128s-lsp1crpm

I think splitting those into different bindings is still a viable choice. Y=
eah,=20
ZTE gave them very similar names, but from what I can see the two controlle=
rs=20
have nothing in common.

> +patternProperties:
> +  "^phy@[01]$":
> +    type: object
> +    description: PCIe PHY child nodes

You can drop the phy child node and just add "#phy-cells=3D1". See https://
docs.kernel.org/devicetree/bindings/writing-bindings.html : "DON=E2=80=99T =
create=20
nodes just for the sake of instantiating drivers. Multi-function devices on=
ly=20
need child nodes when the child nodes have their own DT resources. A single=
=20
node can be multiple providers (e.g. clocks and resets)."

In practical terms, putting a child node into the DT makes this a public AB=
I=20
contract. The alternative is to split the device with an MFD driver or usin=
g=20
the aux bus. In the latter case, what components a device consists of is a=
=20
driver implementation detail that can easily be changed later.

The PHY subsystem has a quirk that devm_of_phy_provider_register wants the=
=20
device node to have a DT node, which is not the case if the device is an MF=
D=20
child. device_set_of_node_from_dev(dev, dev->parent); helps.

The other purpose of having a DT child node is if a sub-component is likely=
 to=20
be used in a different piece of hardware. syscon-reboot is a pretty generic=
=20
example of that.

> --- /dev/null
> +++ b/include/dt-bindings/clock/zte,zx279128s-crm.h

I'd suggest to rename clock/zte,zx279128s-crm.h to clock/zte,zx279128s-clk.=
h.=20
"CRM" implies clock-reset-manager, but the -reset.h header has the reset=20
handles, so the "crm.h" header won't have them.

> +#define ZX279128S_TOP_PLL_A9		0
> +#define ZX279128S_TOP_PLL_LSP		1
> +#define ZX279128S_TOP_CPU		2

Do they all need to be exported? You only need those that will be used for =
a=20
clock =3D <&topcrm ZX279128S_TOP_SOMETHING> handle. That could e.g. be the =
CPU=20
wclk and pclk, but the parent PLL itself can remain a driver detail. Most=20
likely all your device clocks have a gate somewhere. In my zx29 case I only=
=20
export gates from the clock driver, with the exception of the Cortex M0 mux=
 -=20
the Cortex M0 can't be turned off, so it has no gate.

I realize that a lot of devices may be missing from the DTSI in patch 23.

> +/* Low speed peripherals 0 */
> +#define ZX279128S_LSP0_UART0_WCLK	0
> +#define ZX279128S_LSP0_UART0_PCLK	1
> +#define ZX279128S_LSP0_UART1_WCLK	2
> +#define ZX279128S_LSP0_UART1_PCLK	3
> +#define ZX279128S_LSP0_SPI_WCLK		4
> +#define ZX279128S_LSP0_SPI_PCLK		5
> +#define ZX279128S_LSP0_GPIO_PCLK	6

E.g. exporting those intuitively makes sense.

--nextPartKiOmKHBbRlSSdhbtK6AHkQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP+LAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiZU8QAII3V/w/xVzGX/pRFfpS
42pGLIJGE3EDmanSGuj8ztdc4DUNBzuzuPpXp+xCmgIyDIUokzxLyrj5PQhehLNp
qaKehvOsvlckx/h5Z4ZFYW+rgjZtSLFD6/GmeeXzSdqUcfDUZr8BVKlxOcyIIeDe
pt0C8+bupAw+hTZxnf0V+/aN3OhFlhBuyv13tHzIApsOWl0W78iSfk8AFo/hpfrS
19VeqvlmLx9GuHDxHkkLZp2LcXANHQcW6/kuDBHY1D7N9CtJvaHS3d/uHwENVna+
U/HoZvfGY91niTHjClR5zWazHFN3ZNOXQ1SjwECfKmaBPXSiiPAEkQbDVuwFkdP5
Wcq+7vW8ERwBLyY0GtkuPIlrf09jXFodZE78h9Rz73dMEHLnhuSkCal8A7A0jWUe
7F7cIsQQtj/H4jaf0EtJHUmEzluvA1U/hzGqamP16b9mdKidERu7jeqF5DznAjJR
n1GFXS/4KXbGb0ae0VhlveMEEDOrE0vPc5pAbf0MbFvyEuB8c92LbEa+zcgE5RKL
RjMWm/ZylriszvK1pRqguVFyLauoQMxbPxYBMUzR4oW/42PFCscCHeq70yXlnbow
t3IZ2h9y6jIpnKti4YSwLe6vHqy1N57YVq1NxigFSGThA6wFfh/mnPts/8c/wHF0
OsHPbBD97iWsYrs78pXxUsGr
=Aaje
-----END PGP SIGNATURE-----

--nextPartKiOmKHBbRlSSdhbtK6AHkQ--



