Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025C23778;
	Mon, 27 Nov 2023 17:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArVF/yJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B20C433C8;
	Mon, 27 Nov 2023 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106760;
	bh=cZVni5i/Ob43TnjoYqSrY6A6OIKEq/YnyMKIogXMCDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArVF/yJxdRduggKVVhfomhFAJXKGLID06BVAVR923G39naYYXYaKIeMWkTxU8JBPX
	 CXXH2aiC0wva6OJIyzEIM6OtVOBad07nA8EGcOiEVuvo8hdKyiqDNZko8ua2Z1U6mf
	 RwTA44u/MmXoEj+nMt55pIbSmH1PqVnCWO4wFHTufhndDbZ7EHsIZ2ceb1xKkYy8RK
	 SNMppAwszJp/PHSW2eCiBeCF0QotYpoAfIMeVIUaixXWUhhnAWK04vUPRmhc0sZGau
	 ZSnPeLBtgYwbxYxz/ZMWZ4HZgRka0RPFkT0aDfbCbGb+O/MXAxgWac3UkAvoYbi2B7
	 02g9u5uRWo19A==
Date: Mon, 27 Nov 2023 17:39:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, git@amd.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	michal.simek@amd.com
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: versal: Make alt_ref optional
Message-ID: <20231127-casino-cramp-0d780a05266b@spud>
References: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
 <20231127072204.25879-2-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vgrsQn/XqlfqY81N"
Content-Disposition: inline
In-Reply-To: <20231127072204.25879-2-shubhrajyoti.datta@amd.com>


--vgrsQn/XqlfqY81N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 12:52:03PM +0530, Shubhrajyoti Datta wrote:
> The alt_ref is present only in Versal-net devices.
> Other versal devices do not have it. Update the binding
> accordingly.

$subject is not accurate btw, "alt_ref" is not an option, its not
present on !versal-net devices. Could you rephrase that please?

Thanks,
Conor.

>=20
> Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock d=
river")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> ---
>=20
> Changes in v2:
> - Have specific constraints for versal and versal net.
>=20
>  .../bindings/clock/xlnx,versal-clk.yaml       | 31 +++++++++++++++----
>  1 file changed, 25 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index 1ba687d433b1..bef109d163a8 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -31,11 +31,11 @@ properties:
>    clocks:
>      description: List of clock specifiers which are external input
>        clocks to the given clock controller.
> -    minItems: 3
> +    minItems: 2
>      maxItems: 8
> =20
>    clock-names:
> -    minItems: 3
> +    minItems: 2
>      maxItems: 8
> =20
>  required:
> @@ -59,15 +59,34 @@ allOf:
>          clocks:
>            items:
>              - description: reference clock
> -            - description: alternate reference clock
>              - description: alternate reference clock for programmable lo=
gic
> =20
>          clock-names:
>            items:
>              - const: ref
> -            - const: alt_ref
>              - const: pl_alt_ref
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,versal-net-clk
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: reference clock
> +            - description: alternate reference clock for programmable lo=
gic
> +            - description: alternate reference clock
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: pl_alt_ref
> +            - const: alt_ref
> +
>    - if:
>        properties:
>          compatible:
> @@ -110,8 +129,8 @@ examples:
>          versal_clk: clock-controller {
>            #clock-cells =3D <1>;
>            compatible =3D "xlnx,versal-clk";
> -          clocks =3D <&ref>, <&alt_ref>, <&pl_alt_ref>;
> -          clock-names =3D "ref", "alt_ref", "pl_alt_ref";
> +          clocks =3D <&ref>,  <&pl_alt_ref>;
> +          clock-names =3D "ref", "pl_alt_ref";
>          };
>        };
>      };
> --=20
> 2.17.1
>=20

--vgrsQn/XqlfqY81N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWTUQwAKCRB4tDGHoIJi
0nAeAQDHhRRAEyS4HQPJuUh07J+gohIF6cS9Hfe3RGl78RpxDQD+O8mTXiK6zZHJ
RfTf86BXEXuHk2l3FW2E9u9GVNjCWgI=
=YDC+
-----END PGP SIGNATURE-----

--vgrsQn/XqlfqY81N--
