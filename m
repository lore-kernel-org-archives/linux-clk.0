Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8109B2E8897;
	Thu, 27 Nov 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764264518; cv=none; b=fRU8pW4iWCaw0VinXvZp2ctnqd1/EnNNTOXNN9c7Sa1vBOLI7FpeWoLZD5kP9z6ZGGRZdG/q2JI3U+PSFU6OijkjzEVrLJUEhAw8BsRvU9RtNNhf4nJChfk+i2+ySqduk5K0HICenNQD2aPhhqGEqt/JPHSvb0MTpXxzfUrB8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764264518; c=relaxed/simple;
	bh=l3P5ZCfOP+eyjvDmOMYppYEmDowRq4xuEB/nR6g0sII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jigOm2F7K0Z2GmZLrft3Ek1MVIpxYGZHen2tc6Kg4W+8MlBNuxJMvheKBXCq3A/W9JtpFutXmJJUtxMKpLPQYqddCTEWL8URH7+B8xRyZo4BqTsTN/AVavsr2yfp2BHIDocguoZTA0ouwq4do45G8HxoT7ErqF94wCoovnxKwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1NZKKY0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1NZKKY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248B0C113D0;
	Thu, 27 Nov 2025 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764264518;
	bh=l3P5ZCfOP+eyjvDmOMYppYEmDowRq4xuEB/nR6g0sII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1NZKKY0Hk9XXuWqQ5waVtrtcKyk0CmWj7f/IDMm4vhUszh8UpQZRs3BUa2T74ajN
	 783XpZsSlnx3Ax+i0u24gUIj1BgdvNA/Hr0CGZTdO024s1bJ3DLKwv73HqKF1s+QX4
	 WcLx2GjkZMpmfBlkWhdwWZVa+1mpL2u3Upsz4xfEhQRjRBrr/gk6YgE7A8JDvYsEAU
	 KV5ICvvCQPbTVotYb1CM5BL11jr1gYCG/y5VE2w0L9FRafl8N7a8zmxmY/Xwl79Xxz
	 rESnn4IIiwUMk8iYTaPYBMF569tgsc+a6E8irdTBKlgBIAFEDYu3L83qkTPVCYangN
	 bhClzLltHrC7g==
Date: Thu, 27 Nov 2025 17:28:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <20251127-tapestry-wispy-f790520ae754@spud>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q2nfZtZoNiMOXgju"
Content-Disposition: inline
In-Reply-To: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>


--Q2nfZtZoNiMOXgju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 08:45:11PM +0800, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> PLLs and an external pulse input, with the controller managing these
> sources and their derived clocks.
>=20
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].

FWIW, I've had this on a branch since 6.9, waiting for the clock driver
to replace the fake apb-clk-clock:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic

I'm assuming Stephen will grab patches 1 & 2 if he is happy with what's
here, and then I'll pick up the dts patch after that.

--Q2nfZtZoNiMOXgju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSiKQAAKCRB4tDGHoIJi
0ggYAP9cwEIbbYEhMwhtCpNVRYaBj4jB3LGed5ICY187QRtTrAD/SVmchC+vps1S
oRSDqD76SHQoz+NAImzg2pRnuMHP0ws=
=8dOF
-----END PGP SIGNATURE-----

--Q2nfZtZoNiMOXgju--
