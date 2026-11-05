Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888837;
	b=nN2WHrv05p2fA2m0Ir/1yrUljE1BFU4hbJXR0+f3O94unF/TbBuRabl9aR94nZNn9mEP
	 Ha09RRDm0lIMbOH5NJGgomGOwJrL9qtkv7TbwzmjhRQj/sF8ZOhJDJljFB4ZmE/UmXvw+
	 mMjtxsHHz98qChA5C1XD4aeMkJX5N4gTOZwyg2uPlPwVU1AOht2tSbsRBkmFs6CnP1jX0
	 sGMZLbwE2q26/bl0WbZmACw1qECNKlzAqhnOApDahDgFHzR0YUDUz5XznP5nxkR6JuN/N
	 1iIwntmA+A1UTtOAHCnUBBQAfbBA7HtwYRwHX801zvOOsRyP07zovnu4hbudkwlbjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PVN0ELGdMQ7giLb20G3NaioDb+tdO+OXxmlk7zkEwyw=;
	b=hdVdgh0Tl2GRiL7/ZOoTYjTrcra0Djl/rB5TLDi4moRbG4FQUQ2l2EWhekPralVryRNd
	 Y1sdKqyQy97C2DA6GhChBrFR1ZsoxH8JRetR4Jf4UltFdYitj0+8uftimPajR3x4ZozJm
	 TfDhbNHY2IVPb5MknnCzbvEBLKljjluqM7i/v9bdqpaw7WSwbTo9rYXhLuXV/ZjVAnx+g
	 zXrvuC7OnXxzVQf2eXsfbGOZmPQOnhA9V/6AUphEs+oclPK7HNQi5u1F9nUNqzLKzCP8m
	 WAZQWd38vS/bZJfx4Cs9GxuhFoWEs6qn28MY/E/5JvI/2yUP3KSPs8IBgpBB9ctkR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fYScbl4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEA606A326;
	Thu,  5 Nov 2026 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fYScbl4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1191F000C1;
	Thu,  5 Nov 2026 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888836;
	bh=PVN0ELGdMQ7giLb20G3NaioDb+tdO+OXxmlk7zkEwyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fYScbl4dzb1QovStScibOTtBy+bhwgpxHF5zQol7EmtxrvvgV33DyEpZWDUC+Djg0
	 CTaYXLyNJYoh7aznaf0IFjiXX05rBy2ryY3H0PpjMHh1IhaPAQct2duZZZSm9DB66t
	 CV3uCkYwdZrAYsHSpabwZr17XQfnwVRIVMvkrXzMa0aHBvatPbiuY1b7CwKE+TKRIa
	 tLwK/sAja7iNDV/Y1leHaz2OSScw2IxW478K00WcF7hETqGIvhOATYcxrzZqVX70xO
	 WE/JjKzwbyp4m4CNUlZxsLPv++2mJ6GBIH9toi6k4MozdH7K7EjKHZwjQiqNAEmXCj
	 T7qIX98swl8rg==
Message-ID: <sashiko-outbox-199240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Dahl" <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105110715.2486432-16-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:27:16 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ARM: dts: microchip: redundant otpc status in sam9x60_curiosity.=
dts
--

commit 3ab977663934498a6526ef5c90d107058dabd158
Author: Alexander Dahl <ada@thorsis.com>

ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller

This commit sets status =3D "okay" on the &otpc node in
at91-sam9x60_curiosity.dts to enable the OTP controller on the SAM9X60
Curiosity board.

> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arc=
h/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
> index b9ffd9e5faacc..c110a8e87568a 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
> @@ -252,6 +252,10 @@ ethernet-phy@0 {
>  	};
>  };
> =20
> +&otpc {
> +	status =3D "okay";
> +};

[Severity: Medium]
Is this status override needed, or is status =3D "disabled" missing from the
base otpc node in arch/arm/boot/dts/microchip/sam9x60.dtsi?

In arch/arm/boot/dts/microchip/sam9x60.dtsi (added in commit 35ed4513c16e),
the otpc node is defined without a status property:

		otpc: efuse@eff00000 {
			compatible =3D "microchip,sama7g5-otpc", "syscon";
			reg =3D <0xeff00000 0xec>;
			#address-cells =3D <1>;
			#size-cells =3D <1>;
			clocks =3D <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERI=
PHERAL 46>;
		};

Because __of_device_is_available() in drivers/of/base.c treats a node witho=
ut
a status property as enabled by default, the OTP controller is already
enabled on all boards that include sam9x60.dtsi (such as at91-sam9x60ek.dts=
).
When mchp_otpc_probe() in drivers/nvmem/microchip-otpc.c probes the node, it
calls devm_clk_bulk_get_all_enabled(), keeping SAM9X60_PMC_MAIN_RC and
peripheral clock 46 permanently enabled.

Should otpc in sam9x60.dtsi have status =3D "disabled" by default so indivi=
dual
boards opt in with status =3D "okay", or is this override in
at91-sam9x60_curiosity.dts redundant?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105110715.2486=
432-1-ada@thorsis.com?part=3D15
