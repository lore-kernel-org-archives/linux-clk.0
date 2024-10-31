Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20113A869;
	Thu, 31 Oct 2024 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730379728; cv=none; b=VIt8oycvDKJh7vhQeUq1OI0HSkY0Q3NhUs7pRflqQslCtpUNCVgU/1VIHnfDnPMVdvDEU4kvCXcz1qIwlfVg/7w3igkZQn9KkeHPaNuHuppLCmbZiFPLSJnydYpC/zka45ccj8eHP/p8tW/EgQT3FBYboihJvAgNaG+4oakTPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730379728; c=relaxed/simple;
	bh=xdDOP8XDMU0WMjtRp5geiK1WaH7I1H742Dq0rUfn6kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcd/DhQZT42WqhIPmZaWvfAX6CxcpPbInC/EOrvJI1zneWALr5fi442Yjk5rvLRmYNQnaBHGPXgRNWKwuyKrraAeqX9J1wzg2cMxYbcJazh9cW+zjmsJH3V6I1wu6JuaeZ9rSOXu17uRbf/aXZVMS/pWUE8xpvZ/goUW5clQy4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/3AdS8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/3AdS8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F36BC4FF6B;
	Thu, 31 Oct 2024 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730379728;
	bh=xdDOP8XDMU0WMjtRp5geiK1WaH7I1H742Dq0rUfn6kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/3AdS8OoQv+xdoHidG1bZWd+VE3k+D6zFsafKnX9cRmM/QQJtNQ5gEtBInEcIyLl
	 p7G3GHWwaswNp/wYvDFnq5xE7TDpMqVaPhwsxFKg0vXO0nqaykDTw3uEJTwXnt+Ifp
	 ClUSCI+naGTIAbEqQmTdlk214CAVYi9rruZKh9DpO3XHdaGAQ0sD245+uD+9s2CoI5
	 vpKaFEN4Jv8dJx9EKJzjiqo2F/9dyjgacOkUCUNAQL30xO0mz+HIX1QJms0zJFZeyU
	 sPSdy07yMacNzJkPjSoNNerkHetxbOY+WDxCD9A0M2QlBOXUi1eaDnp3ZoJy3HdXWU
	 iZDdU+l3kJfPA==
Date: Thu, 31 Oct 2024 13:02:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
Message-ID: <20241031-saga-earache-2179dc30adaa@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
 <20241023-tucking-pacific-7360480bcb61@spud>
 <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>
 <20241024-wildfowl-pushiness-d5f46c9c538a@spud>
 <8b853ad3964cd2b7dafc225d4037ddbf11ebb2d3.camel@gmail.com>
 <20241025-numerate-quirk-b622c5acdacc@spud>
 <113e98edbff4501556e35698431080364e134233.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C3qVovVDD5k1QD0u"
Content-Disposition: inline
In-Reply-To: <113e98edbff4501556e35698431080364e134233.camel@gmail.com>


--C3qVovVDD5k1QD0u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 03:01:44PM +0100, Nuno S=E1 wrote:

> > > The assumption is that the axi clock is the last one in the phandle a=
rray. But
> > > your
> > > comment made me think a bit more about this and I do see a possible p=
roblem if we
> > > run
> > > old DTs against a kernel with this patch. We have two possibilities:
> > >=20
> > > 1) DT only with one parent clock;
> > > 2) DT with two parent clocks;
> > >=20
> > > 1) is "fine" as it would now fail to probe. 2) is more problematic as=
 we would
> > > assume
> > > the second parent to be the axi_bus clock so effectively not fixing a=
nything and
> > > silently probing with a broken setup.
> > >=20
> > > So yeah, I think I overthinked the backward compatibility thing. I me=
an, in
> > > theory,
> > > all old DTs are not correct and should be fixed by including the axi_=
clk. And if
> > > we
> > > now enforce clock-names we at least get probe errors right away makin=
g it clear
> > > (which is far better from silently breaking after probe).
> > >=20
> > > Given the above, it should be fine to just enforce clock-names now, r=
ight?
> >=20
> > I think you need to enforce clock-names in the binding and take
> > !clock-names and 2 clocks to mean that the second one is a clkin. I
> > think that's a better solution than failing to probe for all extant
> > devicestrees.
>=20
> Ok, so IIUC, you mean leaving old DTs as of today and relying on someone =
else to
> enable the axi clock (if it was not enabled they would have noticed by no=
w).

Yea. Obviously any old dts within reach (so those in-tree) should be
updated to have the missing third clock, but as we can't be sure we have
changed all users, so the driver must retain its current functionality
with the old devicetrees.

> And only
> take care of the bus clock when clock-names is provided?

Yup.


--C3qVovVDD5k1QD0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyN/zAAKCRB4tDGHoIJi
0gS2AP9KFusL2IYEvY+70gKNTizKWIsY+058Z+CwTI5kgDfYPAD+N9js+eOfwmAc
qkbffCHLfqHrpTiCkF2H2eHEdH0J0wM=
=WBhq
-----END PGP SIGNATURE-----

--C3qVovVDD5k1QD0u--
