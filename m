Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123939DBFD
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519785; cv=none; b=j7Ji2yqxExNdrlwGPyTtnR5yMi8mps7DsegHdx4sa50CoJCQlUgon5EPh8VTcsBphSk1y36xf7mV7KaZqWBi6FfLtES2CLISGKfDK3rpH8yMO5mwJatDubR+0jMtiiBGKxgxuKuUHzSrbMKQn3GLCRCLG2Vr5PIDeGlgWRhGvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519785; c=relaxed/simple;
	bh=/I9ASgw2HlTXRZT2HeWDU8sPW4vmzP40Y+zBADWnURc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPB50O+soKfa1yQaBUxbiZVY5U+czuOTKZD9XohjydWEfhsm2QlxzkyE+JUK7pXRQ5ANjC3jENL1msGDLaGjCCZaCT4OIeeQgHeJnyoGeMw7CuSOXXttSNgdPMO4OzftRsBU3B+DUu1zxwt9jxtLm2wFV6eQdJwuXltCQkKPLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNs+zagA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNs+zagA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so10861515e9.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519782; x=1781124582; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=;
        b=iNs+zagA5QKXpS8Eqv79w/PebQPG5BiHhMnaCXrvJXFDp41AQiYsag6AmFk9Af+E0/
         e7oZ1fQ5PpLNbJlGvWUS+XEs7Jcv6gnnBY52GZlFpWfh4GbGpMC9Dk/TP9e3KQSeeBzu
         JTEeUeYKopWEkCsyywq8GDfSVeHYube0NNu2r0g/FZ02Rd+l61bYoJCkXBgqk192wRI/
         ZAeJrwEtCppoo9j6KJh47YgxBOIZ3zUzftiqmUaVZV92mT+er1bP5zXVMR8vQYJk8Drv
         JOCZhnEcKV+yDgRf2tqTjBOfAiEykRTQHiaaZQ2nUkETp/OygABuVj+fCd0f7E0GQU+s
         lwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519782; x=1781124582;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=;
        b=P+fu7QSpDySMx1rftuBPqwcDwQu7Xibism2jG7OQBaukeBM62UZiWR9Fg7xKcl9oDx
         amY6Aek7ZSICcNcuki+zN3F04fcMMcNsctkV/6LAqO3fah3xUmtaseI0Eg2IDbYiDLee
         0r4wiPEFWP6LRu2KjxFsnQ1pDDWu2DWCcXhtN877nzKC6v2ptuPJ2YymHgbkyRwwRrin
         feLRiurLnVmLdj64CJW7mHsUn0Fgeo2fv0Q3osYRCg6QMEZdK/s+e6N/2AknYlE5p3bg
         1mvn8+Aalp6LtVRC8qZjUJM/12bORXAar3D6BdEsTP59QYPOS6Sv1LTWRgoTKROFGzdj
         fjvQ==
X-Gm-Message-State: AOJu0YwxcQ23rVpgz/sjtJ3+MwRmuuFrdUzu6832eHB3z7AFEjNt7DPt
	nyqMLiw9jPhBpe26ZMFCjYvaR8KMb629sPPDtGnv+AF2BdGZYNIF03FBSCzp26Benks=
X-Gm-Gg: Acq92OG+GbF1C6BXMQzDxK9ImPaeai8g+mtpdYhFywNL9wA5+Cbuprc4PmbkhCFzu8q
	YcqKWScFoMDJW+XMOsPCBPItjK2MYu3zGBXb371DfJmINoiJsz1cwRBJa8q23zholBuhGeXRbmz
	qgGz7nptydWdWEaa1Fr8/Zw1r9pibAIEaezgEO5ULyN9e7UMCI6XHsoLqMnRQcIZo0HiHWcGO/2
	Tpr/L8KwvJ/ZIo7rXPnSNDFy36JFsZwKdWZOnpUaWxcEWqxTMnTb3F1SbhGKMmM4/Iub9PWtiSZ
	kcKhq9qLAziDepwllFYEtCzG8EpPIpAUZcHe7/Drrsc2nJQ27v4KwF+sR8kw1SJ+4A6AjPDXg8Z
	nziGGns+rM3y1/Kvt4XxeM5i/JyG65t4yO7f8NVm6FGdtzkhCM1c0P7uVpnFfBcOJEi4H2ynF6q
	1FOSL7r2DbkfzcsOGxRVgg333zpiKloTIXNn4vngboGAomC+8+pUNeaOWYDA==
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr11734085e9.3.1780519782401;
        Wed, 03 Jun 2026 13:49:42 -0700 (PDT)
Received: from strix.localnet ([197.250.226.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm18512815e9.15.2026.06.03.13.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:49:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Wed, 03 Jun 2026 23:49:26 +0300
Message-ID: <2062167.PYKUYFuaPT@strix>
In-Reply-To: <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
References:
 <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23148593.EfDdHjke4D";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart23148593.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 03 Jun 2026 23:49:26 +0300
Message-ID: <2062167.PYKUYFuaPT@strix>
MIME-Version: 1.0

Hi Philipp,

Am Mittwoch, 3. Juni 2026, 11:50:14 Ostafrikanische Zeit schrieben Sie:
> When there is no interaction required when operating the clk/reset
> bits, I prefer the reset driver sitting in drivers/reset as an aux
> device, especially when register access can be abstracted via a shared
> regmap. Some of the reset drivers under drivers/clk just predate the
> aux bus.

There are two interactions:

The register lock because all LSP and at least one TOP register contains both 
clocks and resets.

Shared register definition: in the case of the LSP clocks breaking up the 
composite definition would sacrifice readability.

Neither of them are insurmountable and I can certainly arrange a separation if 
asked to - but my preference is to keep them together.

--nextPart23148593.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmogk1YbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiV0kP/jAXJ2XwCEk6Ov9f/83t
331cAIqbxbBmPnF9O4P3A0w41ADMtcz4NQVXn8vKymp2NdUgz85g6j9Dl21OvH5h
bOE3+Y3lJUNYN7g7Xq/bH0xgcpVRk3QPi0mDZ8k6RMYWIN8KMXpDyNyqUFbIomO9
8QVbtS8/oSAXydX/jkUWT0/YKKNDNAnFEZfTnKNe4y/HLxPsHi9Xulm94HWFmcR8
A4BMIyFKYFbEadZ/a61HdyM3QidwgnmEaMIbWB2zLEW+3X/GEfM8v2sc6qp9cPDX
mMQzi7d3ns3K4H8JD6VUveo2id2EhJX3IThs/RH9e4araNBdrM7f2huSt0GjNqeE
0JsQBTw/ypRHyzIgG74xlHRonnEZJZI67oDSe7IyLTa9KfTvqpwQH259eRvApZFh
zhdbljzFDiaaW+mGl+T5kXZHQxzIfpUaGDjYbYG8hDPmX2lUf+M6A6tPmvHgo1hD
VB733fUWH95J74asXaZqZKDegV6QF12zgDPIS2lFCOQSgw00FvIRnTvYJqVmFexI
4TR3b/Igs9FQ7VbDsk+mvFOKvOQZIRKi6TBho62Rs1KflnRQd0NlIKAD1Alqd7Wt
GZBVFaQNh/1L960YYzJvio1cuhVi5t1nlgzC5OYawX8+dKcBo2+gffcgBshm7pIx
51DdNXFu6LWbBbozN4tsiovJ
=zIPc
-----END PGP SIGNATURE-----

--nextPart23148593.EfDdHjke4D--



