Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4267080D;
	Fri, 27 Dec 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321732; cv=none; b=Ouh8OiCTKXJCClKMrMkVkY2hCb/geUkqdaXQNRoJPeNhduPm4DJIKjCxyJ9vzk/KavONhlrtpZIp6TQV0vsdabOp93v3vXDGsmo1s86+lP8HrtvZEy90py1HhGEYigd3RlIahw84GxMFQ3h4IfAdMhWAWhVsdxYxrZF9sAalJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321732; c=relaxed/simple;
	bh=Gpp/+IUBDLZ9HXWJtheRXr3yudwHj26ifQkhR6iljgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IctALZA+8CF5wrLANBZ4fMhJhJsKWL21DNHlu4axiO4N0K2N27H3q4n5nlQk2xI3o3mN2ipojEJVhr+3aKLI5kiInr/hBTCCa0L131aWGZYnRbLeYgQ6l5c/+ksl4BSzfuyMLejXG5tujXqu0MQHaYTnd7DxXEzvsBws13vTEu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sj140oDF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sj140oDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBC8C4CED0;
	Fri, 27 Dec 2024 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321732;
	bh=Gpp/+IUBDLZ9HXWJtheRXr3yudwHj26ifQkhR6iljgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sj140oDFk5GBWYm4hwua6PH61Rd69ZHuoSOyRg5MQUXIvx6HRE2kVa7/nN0jZMK9g
	 Dne0GlXVAvK9Fc0akjfWv6Z3nIkrYHUMzFP/E3/+rRHQGtwuymbldVy7XZ5sPuaBeG
	 OlMSL9Q7qaRFrWw3p8vq7sjHE3gyye34C3Hb684joqacPWkQ3SaDZ0t71B2/hUIUgo
	 HReete7V2ZrwI6ksUwg5dfhAzdlKMwtvprnuGOjgnK4avH9uIdalDdD0Oo/R96M9pZ
	 WCJ1CN0pBfWyuEY5jxtg4cukVX2BrdMRbZAZX6kEauIlZdho/7JdL+joiZZlw69XoJ
	 16RMSVb4WWaLg==
Date: Fri, 27 Dec 2024 17:48:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <20241227-scenic-haziness-3806c50177cb@spud>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
 <20241219-lash-lather-31443ced0e0c@spud>
 <4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de>
 <20241225-untapped-flyover-47254d06d418@spud>
 <8a8f315b-9e6b-4c18-985e-5df4ecbe34da@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftb44cQFhFFMb4XF"
Content-Disposition: inline
In-Reply-To: <8a8f315b-9e6b-4c18-985e-5df4ecbe34da@pengutronix.de>


--ftb44cQFhFFMb4XF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 05:54:15PM +0100, Ahmad Fatoum wrote:
> Hi Conor,
>=20
> On 25.12.24 15:20, Conor Dooley wrote:
> > On Thu, Dec 19, 2024 at 09:14:10PM +0100, Ahmad Fatoum wrote:
> >> On 19.12.24 20:49, Conor Dooley wrote:
> >>> On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
> >> Theoretically, we could infer mode at runtime from VDD_SOC voltage,
> >> but we need to set up clocks to read out the PMIC and I want to
> >> apply the constraints as early as possible as I don't want the SoC
> >> to run outside of spec even for a short while.
> >=20
> > Apologies for the delay responding to you, doing it today cos I feel
> > guilty!
>=20
> I am fully aware that I needn't expect prompt review feedback so late in
> December. Thanks a lot for taking the time still.

I guess, but I /had/ replied to other things that came in after your
mail, which is where my guilt comes from!

> > I think what you've explained here is fine, but could you add a
> > bit more of that info to the commit message, explaining why one cannot
> > be default? With that,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks. I will await further review feedback and adjust this commit's
> message for v2 as requested.
>=20
> Wishing you nice holidays,

You too (or what's left of em at least).

--ftb44cQFhFFMb4XF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27ofgAKCRB4tDGHoIJi
0sQ/AQDOR3WXvsSsQFz+lLhiYbrYkjtuZAWDaLhBmi9uJKNtVQD/YB2Vbo249Q2C
KhJBej2Wm204JRHpcFQv2oe1TtQx8wA=
=pjOU
-----END PGP SIGNATURE-----

--ftb44cQFhFFMb4XF--
