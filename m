Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551774;
	b=etdppWilaV7Cq1ELWHOVVBPFQ5L7bzT6QdlLGqbeNH8ZDHK7WWimp2zitvfSZpwCthie
	 bE2rwdOr2oT7vU/eowzFLf8im2jDqVD9FAcqvTcJNTGeoNt1mR/iep5k4RZABL3MGJapR
	 8fd0EKxw4XwMAtotL5qGgKHOU8bYmv/g0dF31unDiuphIeO0LGwiwvvwjIEWI+yy0CNp5
	 /Sqfv4vI1hmQypCNdHBCnhmA7shp+FOlfxbnDUfZlORy8f9pdv8AXNaCuNK6zFl50Y/Tm
	 +T2654deR8UVG7Pm5MJIvmJuCKaIHjiNS/TTr0mnbKpGXMfAS6yFyw6IfiJmWw3y1fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
	b=VOr7mhMTJaVzgFPdrKEYklqjGkTPk1DYVEhHKtn6tkHyh90Fqruw+NrrRyINHkKLwVKJ
	 AY+fn3r3Y/2x/tQ84Bh7g9nv6sB/F7nPstiuC3p+V/C0HAdoVC+EjAfv57zEav2oQ+gTh
	 uPcu+8Bq3dPYOrYlgS2lkoI4tdcWggd//uNVBslQyqA1gx8gTC5vFjk05czSA1U0yc0GQ
	 7SRbh3smF+cZpbPLgfz1AFwpYae9/P5Jx7DgYaB24OxvfWsgRNVfkGZB0k2nH79R0+pWJ
	 0b8LsaW3I3DJ1LT21aCdhlPHAWU8NCKwoW5XyiTH5lebUoPGMgSV6Ngkes3JqsFP1hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0pKQlVL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72B606A327
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF72B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0pKQlVL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso3326085e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 22:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551772; x=1795156572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=p0pKQlVL7CG9eGWvQln57Smu0NN9pCnm1mnPUVAj/UmTklt/UszoRYj8hQfYXlIrwy
         kMzdLKYUHpFQl3S6frWGST7Pc62GUmKnHPK+NGidwzvBivn0sP6oXJTN9orf5ia2OGgV
         p7fpHcuUr44iI9GaSCGsEKXjElFSFsxUNFnGREj5vxDFrRTtjKIGfXuDdnqZX3tYJDhh
         afc2UFp+4Nur21wZHEuEZ3AiJtdaxUQl8G8wR3Au5J2FZ0l3fgjd0y/MbOuwgoZgkaNQ
         TTtJ04biYuEeePTRzatAs6scDzVrAAfHAK1S/E2uS61rBZxF14AQxTNdJo5tfJ+3fp02
         DuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551772; x=1795156572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=MqVVKsnALXCKOByXQVIDkWLmRfycAHtdt+YlAgJnUXblXse1N3AHx5tFWI7Hj3TjyF
         OxfOTTv603eCM36JMxm2v6fSySb8Rn4SJUVeNFZyi7R8haoxmaZDI6YJQNTwK//vKTzO
         rgFme66HgMDmmPYVEvVi11yNQVMv5jJmH+KwUPF6ouuujhK3YSikjbMWbiGngJfVNNc8
         km+OdBgnv59FMIwehJdXsM1Uj+xfpMjeJJln+sH48jz98h1bZc+WjbKeNuWxuySootQi
         R7DyCHg6Key5tW+gKhCGeatZulXY+f2eR+jV+03MyrwxgMR8RRSmrVwY/y/bFvP2wmwL
         h2Lg==
X-Forwarded-Encrypted: i=1; AL+hErGzpZ9q6ze0R0wWILQYh06cqSTAFNp6Mx92tn6WFBmTHTuOQcxqwY70DterOCce7akNE0Hr6ee20yQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87DE0lCeQoePSFKg7a8el5nhfc6Yu3eVZaJ29/GaNW0wMxY2UL
	USUMgwvodE8Hzgw7Lcdiqq1s0Xzv9p+e/p87mwCS/7lUTXB8239V02Zn+rzMJ9BhjlA=
X-Gm-Gg: AYBFou05ok1oya/lPKNGTcKUYaADP6m0KfcUQfbgVIWhwuuqxvwvmPTdsMr29YKACJn
	mc8OFpsC+n87gzFAtEnx3oi6bo1zYWNggG/rrZuZzrxC751Oh44Andv361VwbhMvgMsHlnMpky/
	OSEiAoYZK9GLpcCjCffQlfW0q9cf5djVqY+1hJg52l0J7USUTY26bNAE3FU5gtPc7nQCoBKWwJu
	ESS8USTgx+UNWJtiNCjIHIYw3ldE6Rj+eYfoTzTGDLQ3T0kmTfQNg7b3z1Q69rdsYN5fH2hnv8O
	pXAlAWIU85DNuUYAKkAjEfAqyhXD3N2YfCU8f0lfkrp6gsFHwGg4VgBmZ8Vt89HWluwICffcqcG
	nL+gLkz5oj7qw+dvPGYuNd+NWnR6koL3bdX9eeAG3ZmCxeArg9XWd7nFLk9DXaAkGzoaj5irbeD
	zpp/Km/8nDRKupq/oBHD2xwDrkuTr8NgFchtG6wzZfypSdsfaIhxQdRwG7zgLkRhtkVf+/C3rnc
	/N9L5hm6IqbcCD80NU6DvYGhm69kXZ7wq9P6mCCwUYeC1gSSvPSeNLV2sWGsF4hF4bGjUCH3Ug1
	+eC2vcn8hFgywt19InxdO/YOaxO0VHpm3A==
X-Received: by 2002:a05:600c:a00d:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4bb55aa854dmr30515515e9.33.1794551772311;
        Thu, 12 Nov 2026 22:36:12 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c8d286480sm4583537f8f.7.2026.11.12.22.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:36:11 -0800 (PST)
Date: Fri, 13 Nov 2026 07:36:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avavgGbj8WupEstn@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkwqr7dnu5cjjahz"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>


--gkwqr7dnu5cjjahz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 02:10:23PM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> introduces a lot of unneeded build
dependencies and <linux/platform_device.h> already provides
of_device_id. So please just drop the former.

Best regards
Uwe

--gkwqr7dnu5cjjahz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2r9YACgkQj4D7WH0S
/k550Af/ViscKIb63+PVQx/zXwL2fH1N+c0J0B6+Wy1MxiLTwJFXkjS0mu9bkBlw
CLifRBkJubxD6KiW9nuvesALuaWyKACFL64L/M8rnUTgMEQtIzbxaJP1/fdakEdU
NGqid7VZx3OLkHgHRSws9AOsMV6rJAKvG29HF2mjA7Sr100t/T7kfAskHU60dDRT
oooiNIkRAXDZzowGQREV0WePP+KhHjYDXNY8XL8kp5fc5oxRJxUcSTCFZCWxxgT7
Y7FkmxVSxQA07Pn07yy0KF4rBoj6O+JrpsfW1vJ25VKLi4BaW4Iyl/EMLXHhi+rS
IiIDqmj4rco9HRt+45lVPGX7qe4gPA==
=gLbT
-----END PGP SIGNATURE-----

--gkwqr7dnu5cjjahz--
