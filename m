Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498134;
	b=kzV0Yiq8xjVzlVRfs4WsOV/aEHcLugkwQJpgEv2HYNjdRxXPg+BIWHfIxSrrA+zw8SjF
	 BFJrCrK+zZZcllkRS/6pJUODBE1Gh2FnrxavvmGP33nYzNwdyvhvo/jhMNIrzs+8Vl9Cd
	 s3zp0/ko+0eIj6IKbr7V0KIq1r2IMb9opdipqgIzp6vU9P1rUAxsUkOpcDn7FljkP/q+1
	 kFh/F8e6sM8EZiFPaFAJuLy3dbp2AtDOfvTub/4/SEubwjsczFxg4zEs+h701pEZ+Ttfo
	 8OivXUnBRuFDmCtbKNjfqGrjLNlVnFZCb3K9+xzyMVj57F5dwezfQBIuDhezax6Wffw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498134;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=Uh7fl6cs1PVEbR/PJH3BoDhrcr0LvPtMBzd8SabRK88=;
	b=Z0QmbezXHly7Q0cpyOtqfzC2Vx1nDZPupiHgRVfdykZHr1vC0b0wDM9bnig4QNr/k0bm
	 KZ8oYNyRd3Mtmz+F53yHuHFNRsn3CBdljephqOoz/uuzPcZQaCx9iVm51gNTou0mcB65l
	 3ar1sa3rEhvo2Bj/BUAE2VFPznYvIeLcNh7/y2hK3rwnDsf6qUTTNu7BmIugX4GAvgHfi
	 w67YUb8EvQlmFUkNiI6Z8PrfBJoakVH29e87H4yAJAHhe8vUAwZgjtlEhHnG0lP1gEhGV
	 1J33ka+IzQySDyOsS7f9ZrYhYI4eu/i/tBHCHlZYh+HzdG2eMaTSz7LCD0vufH2Cbqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fZmI4PSc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.123
Received: from sender6-pp-g123.zoho.com (sender6-pp-g123.zoho.com [165.173.180.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A3606A8AF;
	Thu, 12 Nov 2026 15:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6A3606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fZmI4PSc
ARC-Seal: i=1; a=rsa-sha256; t=1794498116; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ATbbiYPtQrCsYyhZI0s2tcM5OriqoQeUNrmIU0YaRmaHMe3OgbTe9q9Mk/qAXceZoyFZCLbf5BHfezHgE/vf2n85172I8vC0IepsqcPGqQ9mo/vwcnRT75hcdNlmXOexmMzyhZJHXFi624PCAAhfz6kjRqCS/tBkh0stMMF/Jks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794498116; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uh7fl6cs1PVEbR/PJH3BoDhrcr0LvPtMBzd8SabRK88=; 
	b=b64EHH7BupnnD5E4mwsor80la7EI7Jh7FQ5Qu2anYDPtXxjaqVnShinafrXeipd6YjBIY8gJthla26LY1fP6VkFBzXSxW45u1Fp+c0TxYskYCFYjuNhryKlTp5l1Yz6fWI/equx3uMBmZ32c7TdXIKhU8hY+0KI+zk3SrnPMWgU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=fZmI4PScS9/4+ZsEGKpxqhMRt8d/uSqQHp/8xJSH2D/En9cX/KMJBQ8uSvQc9AqEtcG4IwhPdjCpigXO67GwFDb5FE2uvF5pparaFV69K8RU0oMigKerZ/BCTaGYRPY9BXA8dvDDMxbSiFf6k2J8WNMDGx5h/qIzhvkSwT55ymY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Uh7fl6cs1PVEbR/PJH3BoDhrcr0LvPtMBzd8SabRK88=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794498113981703.0755610994747;
	Thu, 12 Nov 2026 07:41:53 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id E215C180BC0; Thu, 12 Nov 2026 16:41:49 +0100 (CET)
Date: Thu, 12 Nov 2026 16:41:49 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, 
	Maxime Coquelin <maxime.coquelin@st.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Michael Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: divider: Fix round-closest for rates above
 the parent rate
Message-ID: <avXdsS-uYDyTLjVF@venus>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-2-18f3bb888b0c@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="6btm4vxg26vgmuxm"
Content-Disposition: inline
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-2-18f3bb888b0c@baylibre.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.473.96
X-ZohoMailClient: External


--6btm4vxg26vgmuxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] clk: divider: Fix round-closest for rates above
 the parent rate
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 10:37:00AM +0100, Carlo Caione wrote:
> When the requested rate is above the parent rate, _div_round_closest()
> computes a down divider of 0 and divides the parent rate by it. Asking a
> CLK_DIVIDER_ROUND_CLOSEST divider without CLK_SET_RATE_PARENT for its
> maximum rate with clk_round_rate(clk, ULONG_MAX) then traps on x86.
>=20
> No divider goes above the parent rate, so the smallest one is the
> closest. Return it before dividing.
>=20
> Fixes: 26bac95aa88c ("clk: divider: fix selection of divider when roundin=
g to closest")
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/clk/clk-divider.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index c3f46f9ee451..ed60fa9b04fa 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -254,6 +254,11 @@ static int _div_round_closest(const struct clk_div_t=
able *table,
>  	int up, down;
>  	unsigned long up_rate, down_rate;
> =20
> +	/* No divider goes above the parent rate: the smallest one is the close=
st */
> +	if (rate >=3D parent_rate)
> +		return table && !(flags & CLK_DIVIDER_POWER_OF_TWO) ?
> +		       _get_table_mindiv(table) : 1;
> +
>  	up =3D _get_div_round_up(parent_rate, rate);
>  	down =3D parent_rate / rate;
> =20
>=20
> --=20
> 2.56.0
>=20

--6btm4vxg26vgmuxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr13j0ACgkQ2O7X88g7
+ppY8A//fE6Nh/xZTO3YsJsn0eANWgMNKG4ZBCX41Fu3hR/yIu5MhPGprF9ysAQi
Ncd9zgTtglUsGlmnqrRCIefbZ7YNOF1g8X7pk6Pec43IfJQxRpiFxCA83EP5RR+3
Kq8SOvGpcByjQfaP9Dvy9CyoMsT4zh6ByY2YCRwrx8jNOI6/e1I7yRLvgV41M/dP
spfBJ+9qyE6v6+qmBTqGECIWJkyiHVxUGibl2Oi4vjQnEXmkCImfzX3IO1g6seZs
KxoNerI5SufQKg3oT155hU4KMGk1YUMEn4jX0mOOcjJJLM4cUcTteQCHrvwHiHHD
dyF0hjqPIs+rAGZZRjzfbP8NGvxMA3rpv1vlMh02baXCO4MH3dpgjO9bvzUSA8oW
aEviSeYCG0s43hdTVsTlXHEF8Q+DOuSCT82yqh6xep9oxwqHzzJ8FDPaBdTaM7IM
2R8FBhUIjrkEb+IBltl4x9MGVPGEAVhTH6sCMeXAOB0Wo3SoW0Oot32MB+Wlf1j+
oBlvrZqlxTfLhXCQ/xjkqJRP0W6XK+KOjbaONmOBE+iQuAXYWQ5OoCPqGy48HDdU
z9SvcwJqVrad5dxbnsJ8AItpdt4Lgp2VhHBzb9S/Cf0Gqx6r2cMhB1FrZhMR4K+R
T3r3YPhZV/DtaViRdwo2A0zT+UcxJ5oL7ZCNAiC/TXWV4Kp58gI=
=OWAT
-----END PGP SIGNATURE-----

--6btm4vxg26vgmuxm--
