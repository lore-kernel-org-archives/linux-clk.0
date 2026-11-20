Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213485;
	b=tfwSBHBks+6Hv70yBmLTKfqGzVocRk3l8pamlkYl4N8xuq0wZ35WIKYCEwkOHmWX9Cch
	 43/vVym2CNGlTHg5lWWpkc1oXabwOx4WmwXdpCbVPRE+S/+N9tVSo25YEhB4BkOYA5jhb
	 Cv25Md62S2vw1Q5SO9jH4sVbzxg5leOxsB0bs5EnXR/vpZvJ6Etp85H5CjJJig1/657/h
	 r2ojrf2oxheC2ZrUOxoX+kYyyudNB85tls5GtSoXGNObyOSR8cGh0ZJtnnish44rLVtPY
	 NemWV/b9ZvmZGXqrHzNiQrDtEIl2sIirJvD6P7/4RQTrjsKU8Tgrdre3UHBX7BUnTzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213485;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3XmUGkjOyRvuLj9PtUZN1ToBogPl9plhbQlubMbPinI=;
	b=j4vpFXHQ+kk3RtRp6gWA9bwKoDYQT7LAi/o/QO+ihIMmmozyeph/XoiAs7ds1oeABxh3
	 1qXfKyTK79v9A/fBJzNGFKHTtsBqrrjDy2sVdHn6IX0Lu8J3uMVca0DkDLt3HG5p6XiNB
	 DHwMHSSzrRZVk75Lf7lWQ+bc9z/xVqo07Dah2XDOeC41S6tLW3kC0AwWiAuTw00R9IjE7
	 ZQSPZ5s9fMbP1RxFcuGn4J1I9w+Tb9S82Sa7ReXLjRATk0JuPNq+PQSS5FgyTENsmudVH
	 lhJnVH8w+lefpFlmZZhqLi+baVtDb+WRyxOsKr6PXWhfSYDhtONSb/7iVKQ047ae6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fZCvfgB+;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF3606A6A4
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 22:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8DF3606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fZCvfgB+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3XmU
	GkjOyRvuLj9PtUZN1ToBogPl9plhbQlubMbPinI=; b=fZCvfgB+em+JhFUzYIOy
	xqn3PEbwjiQy1pbKak386u2dCg8jZvnDEWeJ/JGq/Lpy0GAeyNYmyO+SyHFPSU60
	jlCQz1Q8/2mQIh7Dh5VKdeOTwi5IPVExm+eubjczgOembB8T/pox3pi1al7uKKyB
	SV5MXTj8Z0aMLbP13fth8PVhIT4OE0vUixfQnOCh966BLcjU5Kimg7TAp/ZYQQ/O
	GNMjZzsrFLsMAU1LydJvg696f5UGO52LtoEVEAYpCwcdFSRa5DqCCWJ+nxDinhli
	OaUucKRLTN1XffGcUZciGOvu2gJORo8Z9yQvtU678wqiWapkGbb/0zHCS3u12S5y
	Rg==
Received: (qmail 1631389 invoked from network); 20 Nov 2026 23:24:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 23:24:41 +0100
X-UD-Smtp-Session: l3s3148p1@P4/JtbxgwNRtKXA1
Date: Fri, 20 Nov 2026 23:24:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awDIp5YYhxQM6bHo@shikoro>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
 <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="hT2CJ8U8MdgWhpNk"
Content-Disposition: inline
In-Reply-To: <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>

--hT2CJ8U8MdgWhpNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  struct r9a06g032_priv {
> +	struct reset_controller_dev rcdev;

Minor: I would put it last. Wrt cache lines, this member is not so
important.

>  	struct clk_onecell_data data;
>  	spinlock_t lock; /* protects concurrent access to gates */
>  	void __iomem *reg;
> +static const struct reset_control_ops r9a06g032_reset_ops = {
> +	.assert = r9a06g032_reset_assert,
> +	.deassert = r9a06g032_reset_deassert,
> +	.status = r9a06g032_reset_status,
> +};

How do we ensure now the 5us recommended delay for reset propagation?


--hT2CJ8U8MdgWhpNk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsAyKcACgkQFA3kzBSg
KbbnYw//dNkbQb5WbmyRl5r/Bsi7e7BuBaWEzJ9OgCednxJFHNX9A3u99/25mHju
eGhoV+oQKo/NdNI8K69WV50/HX3TcyRSpkhTEeU2g0MNdCd+EOF3YxHULCBL/Lc4
dnjqQLxSDSRdE4HWTddIfMmuZNVip3dAmIdSR5wpxLlrdlo0vdbLOW2LrMuU8yWJ
wluil5M0Hrvtid6PVHSyNVouQj5RF3LkxVBrdY8FVfDxT6QZ9emIplAZm8fKW0Pn
UuVATOkoxhg6+vG6GXQ/mMXcY+SXejGBfhDNBcEnW5+UXpkXvvyF901UCIYJH/vK
fXIuz5tGh1ZOFdv2wFwgyk55U+SYTjlWq24Ri4Etz5p75hrOPl6uAQP3xTDMEZpU
BuvrTyuBijiO/5qxCUZ84QwbOUkhcTAUSrj0nsdluM9ZsCuT4+ux5RPfPOBNrFBj
ulHOOvp68dmKcN9zgLfIixd6BRBJ73AFnEHNWLjCeiJzh8HdAt2XxMWkKsp04yxP
r/ynanucp0pUu8qgYseLhVzLSRMk+hf1xZPmKgQCWF6sS79cmGls807MNcvhL6G7
Slq7yPYJJKzCdVr2CJmeyCo1B1gIfh7cGnMy9PSyMC9c94QKIMc58e+fbQF6dQG1
NEKP4UJPk2eZPfDKLKH44Mkot6AFIljN64gX4o5PE1+zlsE87lA=
=RY4z
-----END PGP SIGNATURE-----

--hT2CJ8U8MdgWhpNk--
