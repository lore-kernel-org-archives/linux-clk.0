Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E5675CD;
	Tue,  5 Dec 2023 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fh8Mf5MC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75421C433C7;
	Tue,  5 Dec 2023 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701793959;
	bh=7Xd0bOmFkvL1Xm4beaBl2rncR1EV0Oppge74zfAfREY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fh8Mf5MCDI9Bf/S2LS1zOdREXb6hQ7G7NtKrQqUDmPouWiiiV87ICHQ5IG5oUDf/t
	 jsvXuZxqjjY6lR1EEKMRqgrVAwlwdG5bRDhAvffkDG/PtB4PmgwAPRqeD82xoDwHjC
	 wv2FTKfKs9G/ihmOFCypY5TdB7TjZTTauwTNSQAIOl9y1PWD1eh+BJDYyVSTSIZLGo
	 aIEZ+AP/oxuUKQvdr77abhgyK6QW5OZ3ex7Vy2Z4z26zxwm+W8T7fo++gbKqVOqp0r
	 2necfwtFfkoW8L7jdwMnME+QIiovWCDV7ax9cOmji1sINtGKmsuW9us/tAt9Z8HZ+C
	 MKhcGCBoEHQ6Q==
Date: Tue, 5 Dec 2023 16:32:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com,
	dlan@gentoo.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sophgo: Add clock controller
 of CV1800 series SoC
Message-ID: <20231205-chump-ravage-2c5478289421@spud>
References: <IA1PR20MB49532E1A3D8BA71FDBB444BCBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49535CCEBCC36C864B949CF5BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y1dM/5FzzPQUk+3F"
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49535CCEBCC36C864B949CF5BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>


--y1dM/5FzzPQUk+3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 07:55:50PM +0800, Inochi Amaoto wrote:
> Add definition for the clock controller of the CV1800 series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/C=
V1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> ---
>  .../bindings/clock/sophgo,cv1800-clk.yaml     |  53 ++++++
>  include/dt-bindings/clock/sophgo,cv1800.h     | 174 ++++++++++++++++++
>  2 files changed, 227 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,cv1800=
-clk.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo,cv1800.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.ya=
ml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> new file mode 100644
> index 000000000000..388be5bfa163
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/sophgo,cv1800-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 Series Clock Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800-clk
> +      - sophgo,cv1810-clk

I'm not reading 1000s of lines of driver code to figure it out, what
differs in the programming model for these two devices? You should
mention in your commit message why the cv1810 has an incompatible
programming model if you are adding multiple devices in one commit
message.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Oscillator (25 MHz)

This could just be "maxItems: 1".

> +
> +  clock-names:
> +    items:
> +      - const: osc

You have one clock, why do you need a name?

Otherwise, this looks okay, thanks.

--y1dM/5FzzPQUk+3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9QogAKCRB4tDGHoIJi
0o9zAQCmOjmMPcxdu0nlCDz31Yb7QgwLZbyW5hjYhZ1s15DzuwEA9fvBJ4d6Kv7U
eqy0tSDErlKmjaG62DnG2yCeo+DUTQQ=
=bleb
-----END PGP SIGNATURE-----

--y1dM/5FzzPQUk+3F--
