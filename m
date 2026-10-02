Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE53EF0A6;
	Fri,  2 Oct 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925040; cv=none; b=W5Nh0BuuqiMVJDZg3zeuwP0mB1tBbCZyX7xNMZPGoC4O7WitfNKK3tQNQ7zsSRn6wFlT7ody5mdnsfwSXg+L6tvthKlZQD9O0wvXmlYknYP8MOTNZHg3i4+iWztokm93cvODSyXRd3OnQ1jd3phOSU5RtBCiZgNI5BQOAe+oNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925040; c=relaxed/simple;
	bh=VYD/sp+oTggw3GRcUvWM/79scp8d42HXpaCNucveWPk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3O9kZJ76qpy+Os+xp06kgvCCG8o/3dtPfWDzeSazShaR2W4T/Y0uC38ECHwLFfCudtNZ2O8WevDLMSLDJMrZnQPc+TL5F0a0fHKvgHAgxPWX1yscug5ZcBPJ4vuifN53bmHRoD2f4Ab5cn0QVnckM9aQ7Bm0eShZKLT97WQTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=e8uLl42a; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="e8uLl42a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790925044; x=1822461044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYD/sp+oTggw3GRcUvWM/79scp8d42HXpaCNucveWPk=;
  b=e8uLl42aoXbbGv/PsLSPIvNNL6D+7o68Uvm2W1g0IDEj8p7sM0pbbU3N
   0rxUkrFuFAF9o3t/ZbwcFW9GgLQmRUenraf6DED7z2iCWDOn2zrwsNRrs
   /SAL7CIbSlgM2BF+/zPetu3xtnwyoGTL6kVibm9l6CB5rmGXoGbH9Uwq8
   8U6WJuWv6zJG5HnvLK3XhT8BWIbC/YlJHL1iuK9rtG9w3os13yojl9irc
   aOLRPPST75Ppzbd47w6jJWPzB3rbDDvWJaADN9sGsoRLdhzgtamhuHLtk
   hv06jBw4LxvQ1YMbAG7ZGgSGS+O+jFuC3UxAVtb8GaLDfoHbYn19KmK3M
   A==;
X-CSE-ConnectionGUID: y/3BfIYcTui6U+iUlaxtLw==
X-CSE-MsgGUID: v6Vcy4wpQ4ify09tT7cO+g==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="64482213"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:10:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 2 Oct 2026 00:10:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 00:10:28 -0700
Date: Fri, 2 Oct 2026 08:09:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Brian Masney <bmasney@redhat.com>, Yixun Lan
	<dlan@kernel.org>, <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261002-manpower-croon-26d578f57143@wendy>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xust6oqi6mFgyPu/"
Content-Disposition: inline
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>

--xust6oqi6mFgyPu/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 02:07:01PM +0800, Junhui Liu wrote:
> The external CAN and watchdog clock inputs are not routed on the MLKPAI
> FS01, the only board currently supported. Drop the two fixed-clock
> placeholders from the common dtsi, as fixed clocks require a valid
> clock-frequency property.
>=20
> Both clock muxes select their internal parent clocks after reset, so
> the CRU operates correctly without the external inputs. Keep only the
> required oscillator input to the CRU.
>=20
> A board using these external clocks should define them in its own
> board-level dts and override the clocks and clock-names properties of
> the CRU node.
>=20
> Reported-by: Yixun Lan <dlan@kernel.org>
> Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")

Uh, why is this in linux next?

Brian, please don't apply dts patches to the clock (or any other) driver
tree in the future.

Patch itself makes total sense,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
and because it's easier
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dt=
s/anlogic/dr1v90.dtsi
> index 574c6608aef0..fe85d01563ad 100644
> --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> @@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
>  	};
> =20
>  	clocks {
> -		can_ext: clock-ext-can {
> -			compatible =3D "fixed-clock";
> -			clock-output-names =3D "can_ext";
> -			#clock-cells =3D <0>;
> -		};
> -
>  		osc: clock-osc {
>  			compatible =3D "fixed-clock";
>  			clock-output-names =3D "osc";
>  			#clock-cells =3D <0>;
>  		};
> -
> -		wdt_ext: clock-ext-wdt {
> -			compatible =3D "fixed-clock";
> -			clock-output-names =3D "wdt_ext";
> -			#clock-cells =3D <0>;
> -		};
>  	};
> =20
>  	soc {
> @@ -128,8 +116,8 @@ uart1: serial@f8401000 {
>  		cru: clock-controller@f8801000 {
>  			compatible =3D "anlogic,dr1v90-cru";
>  			reg =3D <0x0 0xf8801000 0 0x400>;
> -			clocks =3D <&osc>, <&can_ext>, <&wdt_ext>;
> -			clock-names =3D "osc", "can_ext", "wdt_ext";
> +			clocks =3D <&osc>;
> +			clock-names =3D "osc";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  		};
>=20
> --=20
> 2.55.0
>=20

--xust6oqi6mFgyPu/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar9YiQAKCRB4tDGHoIJi
0oYFAQDls2b/qD2GTKOyDuH0hk4ZOJVlEskC8FgpGOTaACQiTQEAtdGfIoLq0kWc
iMi9yihSNBI11RNrHV7DJPv0TYoBEQA=
=88Ss
-----END PGP SIGNATURE-----

--xust6oqi6mFgyPu/--
