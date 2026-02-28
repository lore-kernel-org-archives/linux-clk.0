Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36E25F78F;
	Sat, 28 Feb 2026 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281015; cv=none; b=u0E8r0LoYFmImpjzyQl4lR+wI/+li1N44Y5is+7/fUU8+jFJvx0o79EyC8yNZeg2SH8MNK4fYsSDN95E9rosSDGzdhFQ5mSw7tZWKQOQvBd32EBi2MiGoTfQbAi5Mk1jqisg0NPXdJ5RvvRwj1M9t0n9FbsN8QBAcvhdXe6X21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281015; c=relaxed/simple;
	bh=eKfWdtF1f8rgeMqH6Rg4gSPSLAuvp8Ejd2HbndMRVlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbEvZ/Pv/G59ub4TEEoxYaG97UBAfblubyz2Dz3HoadQxJfkY9FtTH804CILmnwit/giI6ZAyE0+MiWH558NUsBSPRqTjePBlIzWJPENfnNDKsIFeoXSobTAAQcnXRSFe2HnJ5c/Gw1VHHBYArHZLHXhhBNUtJqkXle44xB1KYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtbXngux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtbXngux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C73C116D0;
	Sat, 28 Feb 2026 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772281015;
	bh=eKfWdtF1f8rgeMqH6Rg4gSPSLAuvp8Ejd2HbndMRVlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtbXnguxTm7DWEOff7Ou0m+dXJUWhKOCdT4kpXC5lXnCi4e6zYNcevBrWR5OWbkpg
	 CTonEHikHwJbQATZFzSiBqbOAd8+dmUjmGIf85504Fa6UXDp3r1fE0ISg7eG7ohL+C
	 YET5Ul0ktj1UwePxGoKmG0l3YO9rjp+FMX1bzUOlw7FVkrwJYSfmJRm+xCJ6UKW9UD
	 sgeoKqWIqJalg3THL7Nkd0t+Z2IIZwlYRueqHaNnyA0DdR13WjORPREO5oYgx1erk/
	 Bx1SXrdevQr9TdAA6pfg6rP34NH6jHbj6FptTgtX9AgtAIbAGl8rrnI9zO8ZrpULaI
	 vw3tK06BNfF/Q==
Date: Sat, 28 Feb 2026 12:16:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Haiyue Wang <haiyuewa@163.com>
Cc: linux-aspeed@lists.ozlabs.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ast2600: Add reset definition
 for video
Message-ID: <20260228-entourage-awoke-92c61c5b1544@spud>
References: <20260227151602.829-1-haiyuewa@163.com>
 <20260227-smooth-carefully-f427e242ce58@spud>
 <16a430a2-fdc9-41eb-945c-0727feb7b9d6@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snTcT9PcFEKvQmUU"
Content-Disposition: inline
In-Reply-To: <16a430a2-fdc9-41eb-945c-0727feb7b9d6@163.com>


--snTcT9PcFEKvQmUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 09:20:56AM +0800, Haiyue Wang wrote:
>=20
>=20
> On 2/28/2026 1:33 AM, Conor Dooley wrote:
> > On Fri, Feb 27, 2026 at 11:13:14PM +0800, Haiyue Wang wrote:
> > > Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> > > header. It is required for proper reset control of the video on the
> > > AST2600 SoC for aspeed-video driver.
> > >=20
> > > Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
> >=20
> > How can a binding change be a fix for a driver one?
> >=20
>=20
> https://git.kernel.org/torvalds/c/9897831de614
>=20
> If squashed into one patch as v1 does, it will have patch format warning:
> ./scripts/checkpatch.pl ...patch
> WARNING: DT binding docs and includes should be a separate patch. See:
> Documentation/devicetree/bindings/submitting-patches.rst

Adding a fixes tag implies that the change you have here should have
been done in the patch you're citing. If you had done it in that patch,
you would get a checkpatch warning there too. This is a separate change
that is needed for your dts changes, but is not a fix for the driver
change.

>=20
> > > Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> > > ---
> > > v2:
> > >    - Fix checkpatch.pl warning, and send dt-bindings as single patch =
as
> > >      the submitting-patches guide.
> > > v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.c=
om/
> > > ---
> > >   include/dt-bindings/clock/ast2600-clock.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-b=
indings/clock/ast2600-clock.h
> > > index f60fff261130..7b9b80c38a8b 100644
> > > --- a/include/dt-bindings/clock/ast2600-clock.h
> > > +++ b/include/dt-bindings/clock/ast2600-clock.h
> > > @@ -124,6 +124,7 @@
> > >   #define ASPEED_RESET_PCIE_RC_OEN	18
> > >   #define ASPEED_RESET_MAC2		12
> > >   #define ASPEED_RESET_MAC1		11
> > > +#define ASPEED_RESET_VIDEO		6
> > >   #define ASPEED_RESET_PCI_DP		5
> > >   #define ASPEED_RESET_HACE		4
> > >   #define ASPEED_RESET_AHB		1
> > > --=20
> > > 2.53.0
> > >=20
>=20

--snTcT9PcFEKvQmUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaLcrgAKCRB4tDGHoIJi
0qIzAP0fCpQvHKxzjpBO3i3FwHRprWGH7sA7u2Vc1d8vbM7pAAD9Gas2h7A6tW3J
h4bNYkprIt1F73c2ydusMJO0tnEhwg0=
=kgT7
-----END PGP SIGNATURE-----

--snTcT9PcFEKvQmUU--
