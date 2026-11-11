Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440347;
	b=U8y1b1auPx39TJ4MacPKolY9oQ6zL3dtYwNXNOUr2twqTnktRgfdXtXmDR6jUXLBXqKp
	 GnpppZCpoKzKtsSas5Pzmev/wKOjb+dhAyvSuMv7B8Dt6QgcfgJEew2DqS99xaLs+hNrw
	 JqCFS8WQNOL8gzpV3SRKXmJgRIZscccJCLeLWp33zE0JRc47CIpJ5KNDsOgbEdH/bIp/E
	 TvIHktHjuO3n7XgWWAGw2DPLdHMZuMt5QZznnJPBO/HBU0M0/85OYyLGKEK9r03FpHnzm
	 K/duAs7rpDnRw/0AnNhcTnmdL2zp6Wd/MBM1kiMtL+qMaA86NkKOzj7UNtjJ2iYfnjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440347;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=v4aTYN6KWcbyy4LejE+5XjoohkwS+74pAPjy5/qAZaE=;
	b=qoT3Kuv5YlW1BBZ8ibWlCgCxfD/APA5IjDDEPjgnRlKthHiVWsEjKfyJoklc8O1xccho
	 T25geptGL0Qg5jYRbj2B776Ansn0mCjsID6gFPMvqN0wJyHrEX67sfnJt2EzmSDMeJnHh
	 xAvkIVcV00GFeX1C6OBhcuf9y+RdujnqhON7jYN6shBYbNht4KNLMkChg5NCk16oL/qOU
	 6Q3feMmLSxMIayLGUf7OtixWUyqxq6f/+tbcoo/6H0UYm4mGWTQ+5m9kA/tInSz0G5VQk
	 x3zZx/C5cvjbTp+yR9YHhhMtMkyJDx8QLyjQfp3frpQPAsDyiF4DF7OhMTubXf3OW8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WzpIwtmN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A615E606A321;
	Wed, 11 Nov 2026 23:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A615E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WzpIwtmN
ARC-Seal: i=1; a=rsa-sha256; t=1794440334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AXvnTVFSS75o8JFg3puf5i27asXvDbgTHYw8aFL086iE9dnnYvJx1j1RCkc++GUJEO7RiTSwDtGkarASaR4WAh5x8yBtHThpnm4ugVD2QPJFk5u8BwhLCvrpirvSS+uX2JeUp40uzYchb012xjl+i/RJH8hd4wz/ExLzoyh6H+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794440334; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v4aTYN6KWcbyy4LejE+5XjoohkwS+74pAPjy5/qAZaE=; 
	b=clhPP/ZlOzWmU7a1Kakxj9kVnSchL9CKh4CnrdfeZSVtLGC7Y1AeCRs4asj1fK2kFKqLIh8110vqN9NPdASQcpBBpocDrVGGodjqThDsW2t6QwoNCEh6i2Qi1xJWmvvC8HtTYAjvSpW5vdYDRMqxEkQkUkxDXjhHrHbN8kMDdYQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=WzpIwtmNW9zoD4XIyX/OFuVMuquT6mz8wmDmBdSRvSVSfGHWbbxgRYbAdpoaTkOOllG69/HoO+Mvfi2NWqxqZ7t4IIqncxLUXq7goqEVvySiVSLJIFIHsnAwakhg8rWX6x1L81THIYpfWu8gNyk+HlslnP4ulZyUZUJn84wd9fY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=v4aTYN6KWcbyy4LejE+5XjoohkwS+74pAPjy5/qAZaE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794440331893354.20011173418516;
	Wed, 11 Nov 2026 15:38:51 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4103B180BC0; Thu, 12 Nov 2026 00:38:48 +0100 (CET)
Date: Thu, 12 Nov 2026 00:38:48 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, 
	Brian Norris <briannorris@chromium.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
Message-ID: <avT4jl9Ti52inFUN@venus>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
 <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
 <179382912410.620422.14715602424648962218.b4-review@b4>
 <179398031041.2573818.13317727784501684521.b4-reply@b4>
 <20261106180029.05452269@pumpkin>
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
	protocol="application/pgp-signature"; boundary="sctvdcw6tapq764a"
Content-Disposition: inline
In-Reply-To: <20261106180029.05452269@pumpkin>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External


--sctvdcw6tapq764a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
MIME-Version: 1.0

Hi,

On Fri, Nov 06, 2026 at 06:00:29PM +0000, David Laight wrote:
> On Fri, 06 Nov 2026 16:51:50 +0100
> Jerome Brunet <jbrunet@baylibre.com> wrote:
>=20
> > On 2026-11-04 16:52:04-05:00, Brian Masney wrote:
> > > > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > > > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94=
 GHz
> > > > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > > >=20
> > > > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > > >=20
> > > > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when di=
viding large clock rates")
> > > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > Signed-off-by: Carlo Caione <ccaione@baylibre.com> =20
> > >=20
> > > Reviewed-by: Brian Masney <masneyb@kernel.org>
> > >=20
> > > Since this is a core change to the framework, I'd also like to see wh=
at
> > > Jerome thinks before we merge this. =20
> >=20
> > I've had not problem with the change initially but then the AI told me =
that
> > it brings back the overflow problem fixed by 9556f9dad8f5.
> >=20
> > At first I thought it was crazy because it would mean parent_rate + rat=
e is
> > more than 18 billion GHz ... BUT, a common way to ask for the maximum r=
ate a
> > clock supports is clk_round_rate(clk, ULONG_MAX). This could trigger th=
e overflow
> > and there are instance of this in the kernel right now.
> >=20
> > A way to make the calculation without the overflow could be:
> > parent_rate / rate + (parent_rate % rate ? 1 : 0)
> >=20
>=20
> You just want:
> 	parent_rate ? (parent_rate - 1) / rate + 1 : 0
> it is even likely here that you can assume parent_rate in non-zero.

Looks sensible. I suggest to just add this locally in
drivers/clk/clk-divider.c until another user turns up:

static unsigned long div_clk_round_up(unsigned long dividend, unsigned long=
 divisor)
{
    return dividend ? (dividend - 1) / divisor + 1 : 0;
}

-- Sebastian

--sctvdcw6tapq764a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr0/IQACgkQ2O7X88g7
+po5Lw//ZEu997VBm6qkvZEOERgck2sn53jy7omOSCl3v++0k1AYcYVgMiabffC4
SDQfgodz0jK5kCqe42G33VAQfOu+yq3CLqLM6MMzTb91qSZP7G8c3+Te4oINCKWl
fMwRxOsOX03a+jAsiB4VajF00VfkmA4cdYKRFkxteyw5EAavkJzg9okQrCFoPvS1
HX2nqDDXBQkjxEgTSVWwmRWcEYjg2XmtX4xNQgbs9gW2ay5hk1XJjYdIdvwtR+TC
y3QbSwRnhTaxKe6HgbSDzYRaYqrczCU7+SzcSf6yh3TrReVCVorz3D+F7F4zA7jx
IOD5Ej9ernAw6eBtbRPhENXKSR1WgTzmbqkKoxBLjA/xkB6tMSPbUqTrvRB8xKCA
3dnvORdeT+mgfn0xpMXapsQEAHSL/Kgv7tIrE1/1f/uyDrqIr0ZwUg/8ykJuE6Mp
uSaHZp6JCWi0KGkWrY+t5mkocuQO8AN5f2Fhkkl7qsm6h0pzVun4GAhXLomPftbz
SYBxAUo0JYiE/FAOCOS/yOkxYWisu14DjYq9TFxQ5lKzSfg4RjeUndlcEWlV0TMi
OW4gJ37i9G/+X8+rjFWBa1w2so+F6OOYMHHYLlgPh4nmleuAtZv5bjOQ3gRg06Fz
Jv6isqNb4f9mhHYZc3QMzQshHEIAWbLNfc04n7689Hc9XX1V5yo=
=Rojl
-----END PGP SIGNATURE-----

--sctvdcw6tapq764a--
