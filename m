Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A52DEA8C;
	Sun, 17 May 2026 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779051047; cv=none; b=FZ3SFiMbWI+cukDP8GCqU3AV7mQ8JS0mO3JT98YHMaFE+SwLG1FLx3VJE9bwc7To/ITVLfhcuLfNtX6Ykh4MmtMN8A7FwUsPQ2Pp5SZyKIH6Fp6V833SbtpmpaWGTbmrGiGACCVOIRYfRUxIjAS3VS2sFo/zbL3lRvfP/JTC8Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779051047; c=relaxed/simple;
	bh=u8JdFZ0rO4kGO2hGX9YZe7XVhfAXHCf+QnNU78+Tbqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kyy+yK3Gr69Ex91wkwBKRMRZF3LBrL+dbbjbZibtjYSieMtJDKTaFFWdA8RPCq0l7ZVsABh8o687anLer4Z94zrU7oz4XQKeeGlMk4vS4dSZvLPgZt/Yr1Ur9GaTrv+OGOj1eCZfucvOY8BPJy9s0iMgt9Gg5YyH0gtLLgfmn6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LatElBCm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LatElBCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2CCC2BCB8;
	Sun, 17 May 2026 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779051047;
	bh=u8JdFZ0rO4kGO2hGX9YZe7XVhfAXHCf+QnNU78+Tbqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LatElBCmpHtZM4AdYLaUsa2mljkWRi4u4ClSCWGDceUFbqgXSA6BE7SgoC2+Kmq3i
	 hh0EAIGJ+ooB5c93EVHgigpo2D/rTwPm4nLzjohnvOBCzHV/i4yiU9KU1iIXeM85au
	 ZUsgtLGR3MS+P7hlNECXFJAW+5Ftt6mvEjsX+AuNSUqSBMCC6Ws8mtvwN2crbYjoKE
	 CtD6mH0kS9h4XRXgb5wjCcKAdoDLaWOHmyZNWzQmSalW5JUhxSFSLEDCPEbXUPuwRT
	 GxA+QnkYrxXdRUyo3VknSOd858JOz7E6lT1G5qkr1igYtrx0//MXEz354vKTVymCKk
	 YkbdcioVdLCwA==
Date: Sun, 17 May 2026 21:50:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
Message-ID: <20260517-popper-rage-b675785e4d28@spud>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iyxVhW5sZYbyACeC"
Content-Disposition: inline
In-Reply-To: <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>


--iyxVhW5sZYbyACeC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 10:12:57PM +0800, Chuanhong Guo wrote:
> Add a binding doc for the top clock and reset module found on Siflower
> SF21 SoCs. This block provides the main PLLs, high-level clock
> controls, and some reset lines.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../bindings/clock/siflower,sf21-topcrm.yaml       | 69 ++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm=
=2Eyaml b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
> new file mode 100644
> index 000000000000..a013d48841f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/siflower,sf21-topcrm.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/siflower,sf21-topcrm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF21 toplevel clock and reset module
> +
> +maintainers:
> +  - Chuanhong Guo <gch981213@gmail.com>
> +
> +description: |
> +  The toplevel clock and reset module on Siflower SF21 SoCs manages
> +  the main PLLs, high-level clock muxes/dividers/gates, and some
> +  reset lines.
> +  Available clocks and resets are defined in:
> +  include/dt-bindings/clock/siflower,sf21-topcrm.h
> +
> +properties:
> +  compatible:
> +    const: siflower,sf21-topcrm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xin25m

Is a 25 MHz reference required on this SoC? If not, name here is
obviously problematic if it can be something else.
Not much value in clock-names anyway when you only have 1.

> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
> +    / {

Replace this / with "soc".

> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        xin25m: clock-25000000 {
> +            compatible =3D "fixed-clock";
> +            #clock-cells =3D <0>;
> +            clock-frequency =3D <25000000>;
> +        };

Delete this node, it's not needed in the example. The tooling will fill
it in.

Also, please test your bindings since this doesn't pass.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +        clock-controller@ce00400 {
> +            compatible =3D "siflower,sf21-topcrm";
> +            reg =3D <0x0ce00400 0x400>;
> +            clocks =3D <&xin25m>;
> +            clock-names =3D "xin25m";
> +            #clock-cells =3D <1>;
> +            #reset-cells =3D <1>;
> +        };
> +    };
>=20
> --=20
> 2.54.0
>=20

--iyxVhW5sZYbyACeC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagoqIQAKCRB4tDGHoIJi
0vIaAP0TQrieyv/BrgTDO0XUEBK3FhV+w1j+SVYKQIkyU405YAD/SRmhcEPQeuO2
5BDtXiwg6eEyUjfMQel5pEbyENR3iA4=
=s472
-----END PGP SIGNATURE-----

--iyxVhW5sZYbyACeC--
