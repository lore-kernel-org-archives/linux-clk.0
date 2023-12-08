Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6ED20311;
	Fri,  8 Dec 2023 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIly/t4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D5DC433CB;
	Fri,  8 Dec 2023 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047742;
	bh=FYyAmF1FLZB0d+sYHpsbh3ZPGKkX6ZCON1fKf13O41A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIly/t4zsSSGjYhjmShXbOMup1HhkUBNtqsqpe1+vgxOzgoeU9shtrxIFhJ3/+jO6
	 zQKoX/0M/9cE5F8hhjQqXQbmhPlJQB8fEZ4Tblw5GT6spaL8rqXn+x5h7ro4WFm6NB
	 3wEimo7eIbT5uVSmnU0N1u8qO1bb7mgc9Ets+SMYWyjC8g1FRTbPodFH0kmWoHgrus
	 6C2ocJnqaAcmRvUvEWMS4JkVTMHv8z3R5yQgtZcALDt8UoTHnxvRxXq0l2ULMLJ/DA
	 nZgZWfeM7KBA10I3cs8fl6v2fV4dyMwjmSSAZ3QDGNQEoCeCwOzvAgmXDinyIXcdz/
	 EAr6k5k9TozDQ==
Date: Fri, 8 Dec 2023 15:02:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	qiujingbao.dlmu@gmail.com, dlan@gentoo.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add clock generator for
 Sophgo CV1800 series SoC
Message-ID: <20231208-overdue-reapprove-4b507f5f4262@spud>
References: <20231207-doze-spinster-0bfad3b1441a@spud>
 <IA1PR20MB4953889EA91BCA3514965E2ABB8AA@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H6wgxik8XqEwV3+C"
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953889EA91BCA3514965E2ABB8AA@IA1PR20MB4953.namprd20.prod.outlook.com>


--H6wgxik8XqEwV3+C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 09:13:34AM +0800, Inochi Amaoto wrote:
> >On Thu, Dec 07, 2023 at 01:52:16PM +0100, Krzysztof Kozlowski wrote:
> >> On 07/12/2023 10:42, Inochi Amaoto wrote:
> >>>>> +&clk {
> >>>>> +	compatible =3D "sophgo,cv1810-clk";
> >>>>> +};
> >>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/bo=
ot/dts/sophgo/cv18xx.dtsi
> >>>>> index 2d6f4a4b1e58..6ea1b2784db9 100644
> >>>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >>>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >>>>> @@ -53,6 +53,12 @@ soc {
> >>>>>  		dma-noncoherent;
> >>>>>  		ranges;
> >>>>>
> >>>>> +		clk: clock-controller@3002000 {
> >>>>> +			reg =3D <0x03002000 0x1000>;
> >>>>> +			clocks =3D <&osc>;
> >>>>> +			#clock-cells =3D <1>;
> >>>>
> >>>> I don't find such layout readable and maintainable. I did some parts
> >>>> like this long, long time ago for one of my SoCs (Exynos54xx), but I
> >>>> find it over time unmaintainable approach. I strongly suggest to have
> >>>> compatible and other properties in one place, so cv1800 and cv1812, =
even
> >>>> if it duplicates the code.
> >>>>
> >>>
> >>> Hi Krzysztof:
> >>>
> >>> Thanks for your advice, but I have a question about this: when I shou=
ld
> >>> use the DT override? The memory mapping of the CV1800 and CV1810 are
> >>> almost the same (the CV1810 have more peripheral and the future SG200X
> >>> have the same layout). IIRC, this is why conor suggested using DT ove=
rride
> >>> to make modification easier. But duplicating node seems to break thiS=
, so
> >>> I's pretty confused.
> >>
> >> Go with whatever your subarchitecture and architecture maintainers
> >> prefer, I just shared my opinion that I find such code difficult to re=
ad
> >> and maintain.
> >>
> >> Extending node with supplies, pinctrl or even clocks would be readable.
> >> But the compatible: no. The same applies when you need to delete
> >> property or subnode: not readable/maintainable IMHO.
> >
> >There are apparently 3 or 4 of these SoCs that are basically identical,
> >which is why the approach was taken. I do agree that it looks somewhat
> >messy because I was looking for device-specific compatibles for these
> >SoCs.
> >
>=20
> I agree that this may be messy. But it might still be acceptable if we
> limit the number of devices in this format.
>=20
> IIRC, only clint, plic, clk, maybe pinmux only needs different compatible.
> For more complex device, such as tpu and codec, I agree with duplicating
> nodes and make them SoC specific.

Okay. We will see how it goes. We are not stuck doing it one way, we can
revisit the decision later if things start to be confusing.

>=20
> As for this patch, I have already adjusted the order of clock to ensure
> the compatible among different SoCs. This will make the clock assignment
> easier.

--H6wgxik8XqEwV3+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXMv+AAKCRB4tDGHoIJi
0rHNAP40ibEG9PFiYJyQVknOajvwqEylPpHx444D6tFiSzWEzwD/a6cLF6ldVr95
5gVOtpUeO9FMgr+lYcECNfos9DTBBgQ=
=uY0H
-----END PGP SIGNATURE-----

--H6wgxik8XqEwV3+C--
