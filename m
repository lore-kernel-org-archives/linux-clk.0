Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D72F546D
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231731; cv=none; b=bIjTXa+H/2oMqPbfK9xw1/205wPPFzGvn2pkHlOmc2uREfpbIB18nhcxVPo5DSzNss4hUE9tCG2O+6zGfcZwMkbzC93OKRhSO02GGGQfLsbGZON9WLxnKMl/vhRAgXw3smhmzAACIOVTG8iVJ9Sum6M5TNBtpSCj6ELBdaaoQ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231731; c=relaxed/simple;
	bh=xTH5SRivTOjKCeZK/CQzkS1OrhVK53Hs5nd5Py0Ytbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohUdIZOXe6HHs9QtnDRMrhFb3Oha4kOc8A/S4LyIl5fM7to2IXU6MWXHPrTjZm5oUVKz/FtiQ+rluyZizgKr0qtY/GpCz5VLR1h39SMw4u+6UT8Bh9HQkQ+QNINgebmU/Mqxs8vGqjda5w9dHccA54KomkBFyWSlzP5smPo4kWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Q58FR6VM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Q58FR6VM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so50627035e9.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784231726; x=1784836526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFJ0EpzatP7/QvJCIqNNnPldKAnCwWETMXqW+7ClCHY=;
        b=Q58FR6VMHsD4Fg0Ya3aDFIisk7ZWa2+yoSJebEVVvSpd1C0x5Vgrkl8rK7+ZkydyZ5
         kHMcKYXGl/ej2po7pSODXahWNOzee5WrTYcRxhOZID6tj4TJ2oBdbPzpG2PrRn9CTxKj
         kuGxqhJsGJYwzqFE+LRy/TpXb5EiDu9kNMeXj8AzlIIKZMJgXjJLRYYUJck4k2wKtpaN
         /Y9Uvi/sEc/gV30gm7AAgrtsh4m9GWvfEeOE+ZL/lIufWNivGyzAWH0J5QGHOdHp22a3
         F8tHh/DfGJCsOV/G1/7EAHZATEE2ldMiASBfqezPjktUV53LDxHrNqZIx14uTW3FUAki
         F3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784231726; x=1784836526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFJ0EpzatP7/QvJCIqNNnPldKAnCwWETMXqW+7ClCHY=;
        b=aNy3JC2yb4hKhPN15HF5l10piLfAnMv7YReHd0hvxw/5XlNi1p2Ob9Ek3fgrSQr2BA
         hAqPiMM57IwVK7d6Ix0kNAcrNwURSDEjUXQxGmuVXx4wKQocyUQqk6cCAhmWqpegFlKt
         wJI7gu6Sh/2Gi+eOXaIiIh3tgsNstallh6w6F7BAnK8qa8SjR1qdmRzsOkzkWfF1B3/O
         XFDC+CKgbVQgpuB2Kqt0J8mq2an2dIcU4SMfQygPqvFuBmZ3UqPVmBuE0D0YwVEfEpzh
         vzyZ16CV/UP/SqDQV010UNnofD+2+EQHFJ7pBC/gtKCaly8aAzkiF8uIarwJ6dZSNzXY
         bCng==
X-Forwarded-Encrypted: i=1; AHgh+Rr/CZwOrR/cmpX5dZK/dM4yWlrA9Exd9dyMhuEIy7lR7k5Y9mJR8tjmVMxeM6cqEWA/W+4js7lEZMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0dG01gH3XyyDSB4jTC+kIXy/9XkBqc9dDoro/h56UCJ92LZQ2
	yj02n7Y17iFY7obpfCuApe8fiDDJUwnc1v3qPgp0Z4Ra56ZyUx7FGh5N7dC7Rg21WsY=
X-Gm-Gg: AfdE7cnKjE17rik1xPSWcNbzl1xB5oBC2veonKmGT3Ge3I1t+GiDjza1UuhVsNtbieA
	2zb+ZcocxJoku1cXD+8bdN9juxE1iV7/PGbukXHm0oSySMjppNx3w5GyPo8yGxkHe17RTcdYSCd
	/qEQo/GrOSrgBpb5j+BFJdTnXHQDiqjXispDbCF7YnEsXGUBeFmnjqQQ+QZnKbLY0l6oGW77ncs
	4F3tUdxOdqv7HK2ShzzOR9VxMXiJAj6gtLm0ktfEYmKL2+qVcTfUwcEVtBgZj5TLeAXlmra7hkM
	Rp9ht44cOl9qA2ide6BOHbpUj9pLV2LQl98/lJuTBtmHPNa4G+y5Ni6BLo42DKH6NoCcyz8Tlq1
	VY9xPCJSyam3LE+y4eHXHSnAm4rK/R1LNCHTdMh64hUvh3nYty928yVQP05iB0tP4u7q/HxdoQL
	2mVTTU1Vk=
X-Received: by 2002:a05:600c:8b6d:b0:495:3fc4:81b4 with SMTP id 5b1f17b1804b1-495403fcaadmr65609285e9.30.1784231726263;
        Thu, 16 Jul 2026 12:55:26 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49547988756sm14556025e9.6.2026.07.16.12.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:55:25 -0700 (PDT)
Date: Thu, 16 Jul 2026 21:55:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
Message-ID: <alk1--PeUJ7pKbvA@monoceros>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
 <alkt62x8pmKE2aKi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqkq77d6dtuu255e"
Content-Disposition: inline
In-Reply-To: <alkt62x8pmKE2aKi@redhat.com>


--dqkq77d6dtuu255e
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Brian,

On Thu, Jul 16, 2026 at 03:15:55PM -0400, Brian Masney wrote:
> On Thu, Jul 16, 2026 at 08:21:05PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > The only used symbol in these four drivers that is provided by
> > <linux/mod_devicetable.h> is of_device_id and this is also provided by
> > <linux/platform_device.h>.
>=20
> I don't see it defined in platform_device, unless I am missing
> something?
>=20
> It looks like the reason this compiles is because of this chain of
> includes:
>=20
> linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h

Well, the chain for <linux/platform_device.h> is:

	   <linux/platform_device.h>
	-> <linux/device.h>
	-> <linux/device/driver.h>
	-> <linux/device-id/of.h>

but the more relevant thing is: <linux/platform_device.h> makes use of
struct of_device_id and most consumer of that header (typically platform
drivers) need struct of_device_id. So it's very sensible that
<linux/platform_device.h> is enough to get that definition. The include
chain is just an implementation detail.
=20
> > So drop the unneeded include which brings us
> > one step closer to removing <linux/mod_devicetable.h>.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> With an updated commit message:
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>

Does this discussion convince you that the commit log is ok as is?

Thanks
Uwe

--dqkq77d6dtuu255e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZNykACgkQj4D7WH0S
/k6ljgf1H7m6MuWzdTL3PPS2CmQmF0zqeBZ7EYoM32dLL1e9Yr6O0gFZNZwnGWrr
tTXctZ1u1LJslAfnJ/6Dyc3meHNXlgpOFxJYuQz8G01n/eYKx2yCEq7k5MIRoVj/
qCTzcuywXdlsDwyVHYyiONlBfJjgVTdMrCENFPObWTjqs5lZkMgaajH74RlF4b6b
MbJBX1BmlzgPPw+8RTRDvqQUHl/LsXgriWDQb7pBqCsLuCMfVags1CbYsxDdfN1Y
8VxyKMELO2a1sj6odYEekuTUpZ6JLjwXgR1yne7k01KkyfXAbJyUBLTVInv2jvtr
k6tuCpT2Maqlu144x/WffOSo8CSQ
=XhNj
-----END PGP SIGNATURE-----

--dqkq77d6dtuu255e--
