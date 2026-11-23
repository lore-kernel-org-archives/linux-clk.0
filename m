Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427651;
	b=rUsGwMQS7xrtsexUk/FEPTQSZ10/SKzSmqXbIlZlE7BEs2yq2Kw9n2w6omzZ3vxaZPeH
	 5OW77qRq0Xfe3gnGxbDPjYUjoSQsSg+C67S7mHlPhZNIpFlgGSp6JcntTUS9spfsL/6wy
	 nnv6RbPMhkbfvfnOVMDVVDPjms7lKwOeYsBInGmlT9iIz7M9kFGlG/FNdYDfm9J1xdAOm
	 d0uvcJgtUtVHC3Bdk0L42VwiP/yWldENBdGsvY9HSAHdQ8ZGSaYuKSIMdYOnz3eazXJsv
	 cM8ZTpFXIVRn9n0LUam4WyAxs3hO3FWIZhDhKVW07VLydShPCiZD+QEgjLo0giOBCkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427651;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gVlfHHEUqZRERxmYhHaGuD98Z2SfQm74q1NG7Z4SJtc=;
	b=aQiKRHBwqh2cbyunn17r1fW+EZFsNdruUC8SAKZ8hJYd8UbtVJq2LkjgxEnUZpwZPsPZ
	 a0JB+z4lD8WBJfqiD+xEfyWiho3OShmldOsPivKQ+EMWP20yao6s17bFKedcij9j7GEsG
	 oLdjTmHwc1h40dDaPG0Vk8zoxAP1kP3QOX8kMPGXl2Wy2cFv5DXjGX6JqBqqlC7rhM+RE
	 Qnlv70loab0/JvDH5YwoECuiJhMSNc04FMeDl2k80zbdD5TGxW5+m0IXrsq0LJ7qPEnQW
	 NCnFt3zWS8y/10Ut2Nlt3Ne5diof2pz7bR6BL5h9I7Ct63UtIwReQc+8H/RK+ydVG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RrpQHqk6;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB57606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 09:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RrpQHqk6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gVlf
	HHEUqZRERxmYhHaGuD98Z2SfQm74q1NG7Z4SJtc=; b=RrpQHqk6Qzmg9ppdBpLq
	LiU6chec/SmnwcvFmsItvB0h97GYcOBB6a7qa9arUEUapyI81UcYEG9h0e2u3gAZ
	oFv4DTk4vysEl4tcRK2KS6PzqvF28qJyz691SVeFegvv5Pt0Tk2s2ioeZukiYA0S
	9gsMJGnvLGY6FztqHeKLXNIyTCR5YwMnqvwI4gKbQJN3PDRRkbrsylz2w0qAiDL6
	RSguuUka4iSxDFImlZWbhFkmyGfFRtwRwhMyBY/q2b56XiOLmjs/nFeCkxo6otRv
	LnxVnO73kNkLm/WRB2oIH08WbAZ/Eei/MrpaFC4bR3GUVAet8OSzRrtRg/Eq9AWS
	zw==
Received: (qmail 2646670 invoked from network); 23 Nov 2026 10:54:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 10:54:00 +0100
X-UD-Smtp-Session: l3s3148p1@+Hmyku5gEIwujnsu
Date: Mon, 23 Nov 2026 10:53:59 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awQNNCw9nCyvmY8B@ninjato>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
 <20261120-rzn1-miic-resets-v2-1-f1cfa678615b@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="xU2HxjihksT/uuam"
Content-Disposition: inline
In-Reply-To: <20261120-rzn1-miic-resets-v2-1-f1cfa678615b@reliablecontrols.com>

--xU2HxjihksT/uuam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#define R9A06G032_RST_TS		1
> +#define R9A06G032_RST_MIIC		2

Given the Sashiko-review for patch 2, it might be easier to start from 0
after all.

Other than that, the rest looks good to me.


--xU2HxjihksT/uuam
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEDTQACgkQFA3kzBSg
Kbbqig/9Epv8XKajU+GJXbYWwmn+xW6rcy824Fm2da0KW5KQk9NTkCiCN8Ec6D+q
9EzjRPA8Iyk3ny8hCEjrFu926l4mO1drdXGWpGiSdYphYpvZWac1s/rtWy5cidye
TuO4KRID+MH1WgJmEvxFYHP806WJStAuaqLXgUgLMWr/TL9QXkEL5zY5PX0QPJGi
0ehY4/Z38at2PWy2vjrY2cmhnNWn6C9UQ2Ps0RFGAGNz5KTAgCSU0La1wx6VIdxe
GIhvlXNfMc0YPmXFydUwMU5BQ2TdhUe104SvISXBWx8KJ5VflxtXJqPDhnyJZ4Ms
Xy4GqMJipQJhEk3QTjNChH58ITUQI9hrZgKIH2r6BNbVbwMUrBwrTZWySpnKXo+b
RdIlVZILFAd+fjGK/mdznzkSgcbXLeMHIOqVcADmQINb/7K2Q14fpFdKK1gXadPs
1zydOnLEwMCd28d0Tewn+8bsbFNRISnUBJe95DcKtkRkGvwcGYyH8bHZA199aVea
mZEs2SgtBNycesEaTLnuG/8wOUDMHEyET6K3/T92NvI1ZnnOI/vs/Jr2IRs8RZK9
pcqlpyvqyDMhEIamspoMfWHGfjaG2PZEHZP4A7ssgaOHv41iPSqTGvLq+di3tIZY
CJ5KuRpHSCQvNZMMGBO+CFZypkVAjMXi3YgSZTxo4OCWNmAlnDo=
=We5d
-----END PGP SIGNATURE-----

--xU2HxjihksT/uuam--
