Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03C41323A;
	Fri, 27 Feb 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213612; cv=none; b=Aj6xf5tBnvzuRHaQkK4A2zuMhlb9kykwcJ18y1NqUcMZUynV8TNSQcBQXFj6wmhq31h/LDFxECoS83te2c4Z1HRAsF85UgWmeJ8BOnW3Qhuay727qah+npBEQSlekisoc/FA+4v82QYM6usZkwj41/sd78vs3hkHWol5OIu5iBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213612; c=relaxed/simple;
	bh=RWIw2XbMdqDRicGEL0YDWL0cD+Khc6u5UWrGRAKiQU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWo4s5+HfnjTltC/EB30vf/8KKBDA07xPBj+5SMbhR+7emfTXdTfFSWyQyLxaWcTw9eQTcQsjgFcxPwS9gl0x0uSN+YSK0CWDWro29oS1U6TUZJyAGo0zG6EgVrH/1GtvkYUlzT1Ci14nFsrDtOM+GoRuy3VLHwrn5jeeaExWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWFy41pT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWFy41pT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C973C116C6;
	Fri, 27 Feb 2026 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772213611;
	bh=RWIw2XbMdqDRicGEL0YDWL0cD+Khc6u5UWrGRAKiQU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWFy41pTOMD/9pJ517nQN5PTE0puGxWrnW1MFm0j0g9Lss2dfK/1U8XdJCfMJBnmX
	 jCgWj0Msb3BLjiNHfnf1u9bjKPnBzYg3dgHnDjlMG7OPHizjPZAYVV77McRu9Morv0
	 i5K8UmA7AoN8x6AdMHIzi8wQqBAWaugmrFnwFmNKnoLCBAvCM7Dy36z1OJ/8tbkZHS
	 vZvvUSu1flSeLNMN8UJWZEzpa1ON3I0Tiwu2AIehj2eC0MnCKJ0dZLEqDvv0PjqF/c
	 coEMNWEvZdTL0uS46TibvhXU18GjUghGYiG6/5DUhWaQd5avReNJeMM9jI9skkBmby
	 Q9Nkc73XwOcHg==
Date: Fri, 27 Feb 2026 17:33:27 +0000
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
Message-ID: <20260227-smooth-carefully-f427e242ce58@spud>
References: <20260227151602.829-1-haiyuewa@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/NuwEW3VcqbDOFRB"
Content-Disposition: inline
In-Reply-To: <20260227151602.829-1-haiyuewa@163.com>


--/NuwEW3VcqbDOFRB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 11:13:14PM +0800, Haiyue Wang wrote:
> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> header. It is required for proper reset control of the video on the
> AST2600 SoC for aspeed-video driver.
>=20
> Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")

How can a binding change be a fix for a driver one?

> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
> v2:
>   - Fix checkpatch.pl warning, and send dt-bindings as single patch as
>     the submitting-patches guide.
> v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindi=
ngs/clock/ast2600-clock.h
> index f60fff261130..7b9b80c38a8b 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -124,6 +124,7 @@
>  #define ASPEED_RESET_PCIE_RC_OEN	18
>  #define ASPEED_RESET_MAC2		12
>  #define ASPEED_RESET_MAC1		11
> +#define ASPEED_RESET_VIDEO		6
>  #define ASPEED_RESET_PCI_DP		5
>  #define ASPEED_RESET_HACE		4
>  #define ASPEED_RESET_AHB		1
> --=20
> 2.53.0
>=20

--/NuwEW3VcqbDOFRB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHVZwAKCRB4tDGHoIJi
0v8lAQCW2Ed+aChACjPUAODW7TWzNWwDP3rAPWm+A2fLCUB3DgEAik6lKaZxDq1I
c8ghmP/y1HVCuZ5bT0LrcmzClD0egQw=
=o4Ct
-----END PGP SIGNATURE-----

--/NuwEW3VcqbDOFRB--
