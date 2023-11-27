Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0043717F;
	Mon, 27 Nov 2023 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPMmZFKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77947C433C8;
	Mon, 27 Nov 2023 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106650;
	bh=udyqodeQY7dG2USztpBamyiMqW0Qrn9CHodNMS0ROAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPMmZFKTeOMpYwixQjWLfzdytLYDXCa70OY3iATENP5j6UW3tYvuwjFKRXQ4Gw0Jh
	 C3ir2Ms91vqg1QWSodpMifezIoANy6IcimwwZAvYry2Ky0YW/S68zFp9Ea5sJg4N18
	 8w2zrnLBYLpRNjjxkNjV1/CI6KZXYxXDjgK0yfbXTNiKdIk1rK/0mxWWJue3o4VbJf
	 JLv6o2Z7/NldiHhSkdSigP1j2TX358iIX8KMduG2IMP1drk8niLKFYKnvPYhvIMC36
	 njBi6lmBYBEvI2p6aG46wuDGzaFBk3CCziMJ1w9mS4i20TNwX2aFPTnVhfwvsFlcla
	 s3zk9j49BY2rQ==
Date: Mon, 27 Nov 2023 17:37:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, git@amd.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	michal.simek@amd.com
Subject: Re: [PATCH v2 2/2] dt-bindings: firmware: Remove alt_ref from versal
 example
Message-ID: <20231127-linguist-fog-4d88fc8a1bd4@spud>
References: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
 <20231127072204.25879-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NJA6qtkPUnL26MGL"
Content-Disposition: inline
In-Reply-To: <20231127072204.25879-3-shubhrajyoti.datta@amd.com>


--NJA6qtkPUnL26MGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 12:52:04PM +0530, Shubhrajyoti Datta wrote:
> In the previous commit (dt-bindings: clock: versal: Make alt_ref
> optional) the alt_ref is removed from the veral-clk. Update the example
> accordingly.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

TBH, I'd rather you squashed this into patch one than introduced a
warning in one patch, only to remove it in another.

> ---
>=20
> Changes in v2:
> new patch addition
>=20
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqm=
p-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zy=
nqmp-firmware.yaml
> index 822864488dcb..8e584857ddd4 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmw=
are.yaml
> @@ -95,8 +95,8 @@ examples:
>        versal_clk: clock-controller {
>          #clock-cells =3D <1>;
>          compatible =3D "xlnx,versal-clk";
> -        clocks =3D <&ref>, <&alt_ref>, <&pl_alt_ref>;
> -        clock-names =3D "ref", "alt_ref", "pl_alt_ref";
> +        clocks =3D <&ref>, <&pl_alt_ref>;
> +        clock-names =3D "ref", "pl_alt_ref";
>        };
>      };
> =20
> --=20
> 2.17.1
>=20

--NJA6qtkPUnL26MGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWTT1gAKCRB4tDGHoIJi
0m6RAPwPcBNfzYPa4+0ITKX8eg9e5wpdxXkYTV5o3nEZxY0a/wD6Az1aTxbs8W6F
4at+/zn97HBE8+k6cHCbXiCdXnIdRQI=
=Nnw4
-----END PGP SIGNATURE-----

--NJA6qtkPUnL26MGL--
