Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABE46AD;
	Wed,  8 Nov 2023 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsWY3mQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3C1C433C7;
	Wed,  8 Nov 2023 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699444916;
	bh=kutHs17/gbiKysQ/W1InFavUEoGmwsEhseHr6fk22qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsWY3mQRJ//puz3e1Jo4bv+2xsysMMdkCggHX8mUQ/8RD88aMWeocjGRnLbTw2sg2
	 gS7IMEa6Gbl8M62fvq7nZpelfVky5GKL6AIgtYFYjdlp5majhoG8+5q5hSYw+nz4Un
	 PTX4A0sW0kE0ARqhLbo/jt0KOni6CB5bpEIU6PMeOWLhEIxkzTlkTqZyUHZpcNsdsH
	 vsq+gFptzmBxathMBXguyFSq8hav8hPEgl9e1rlVOXhjcH0XslAAMYNrrWWzqVbSab
	 1zl+NxgwQRqxgyH1ghE4CRGwosUgX7Yq+q8631ryj+PFxvAhp8tWeS2CShK2pgTB7L
	 v2BkLCMphNZ9A==
Date: Wed, 8 Nov 2023 12:01:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
	heiko@sntech.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
	andy.yan@rock-chips.com
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: rk3588: export PCLK_VO1GRF
 clk id
Message-ID: <20231108-donation-uncertain-c4d0f560c420@spud>
References: <20231108061822.4871-1-zhangqing@rock-chips.com>
 <20231108061822.4871-4-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iMx7EvP7YSPnohIE"
Content-Disposition: inline
In-Reply-To: <20231108061822.4871-4-zhangqing@rock-chips.com>


--iMx7EvP7YSPnohIE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 02:18:21PM +0800, Elaine Zhang wrote:
> export PCLK_VO1GRF for DT.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  include/dt-bindings/clock/rockchip,rk3588-cru.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt=
-bindings/clock/rockchip,rk3588-cru.h
> index 5790b1391201..50ba72980190 100644
> --- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
> +++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
> @@ -733,8 +733,9 @@
>  #define ACLK_AV1_PRE			718
>  #define PCLK_AV1_PRE			719
>  #define HCLK_SDIO_PRE			720
> +#define PCLK_VO1GRF			721
> =20

> -#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
> +#define CLK_NR_CLKS			(PCLK_VO1GRF + 1)

This definition is part of the ABI, if it is safe to change it, then it
is safe to delete it.

> =20
>  /* scmi-clocks indices */
> =20
> --=20
> 2.17.1
>=20
>=20

--iMx7EvP7YSPnohIE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUt4rwAKCRB4tDGHoIJi
0qX4AQCiaZUvu8Hjo9g0xzPpB6/puP40C/jatJp8HVIooO70JgD+NnBufAYVlNOR
UzY9jxnud216SsWfIFVq8L7Lq+cjEQA=
=rTEt
-----END PGP SIGNATURE-----

--iMx7EvP7YSPnohIE--
