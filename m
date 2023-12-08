Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132143218B;
	Fri,  8 Dec 2023 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0oVgX50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8482FC433C7;
	Fri,  8 Dec 2023 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702052799;
	bh=G8h5liRHQQqCxuXBWadFReEljM9UB62vGfdTtJ5lYjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0oVgX50j5K/ss45F9MCZpW/LcE/NZOB8Gpm0AkD4aHeUyTM2QFO4NfFjx1tDxb08
	 Xg0En8GH0at2otoby9PBikB1ZsV0jvZ/taKOOVT8Y5Mj1JNInVF0aJFkb/qFz92izx
	 LpmmnYBdHMmljM0rj5AO1DXoTmQfWkE00vE04jmNLbghq+IkI5Z2saFONcBkRUqnBm
	 vWU5FeWzFmAicaNFi5UCMy/pmh4U0Zhmrre6uTixHhM9ZnIhakUeEfZgYQ+UQQMOup
	 RQtURAwjVodTF0h6QHkDP4YHGAVWR41314ff/HkVPmjkyBhk8YZBbJxHhDMyGsd4z4
	 WBXbyShprkK5g==
Date: Fri, 8 Dec 2023 16:26:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: clock: sophgo: support SG2042
Message-ID: <20231208-italics-deceiver-e3673e693ae1@spud>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
 <6f456da5355f451309de0b1b420433ed65dab3c3.1701997033.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jlu8l0PhkNXRV65X"
Content-Disposition: inline
In-Reply-To: <6f456da5355f451309de0b1b420433ed65dab3c3.1701997033.git.unicorn_wang@outlook.com>


--Jlu8l0PhkNXRV65X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 09:14:02AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Add bindings for the clock generator on the SG2042 RISC-V SoC.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Jlu8l0PhkNXRV65X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXNDuQAKCRB4tDGHoIJi
0prvAP0S9gqVqTbYieWB4Kd4oyhZ0s0ohe8f5cP9iuF4DZcpkgD6AgNQjxtNAZhO
P111VONeHPdlK/o+LaSyQO/Ymf3ZaQU=
=5XXN
-----END PGP SIGNATURE-----

--Jlu8l0PhkNXRV65X--
