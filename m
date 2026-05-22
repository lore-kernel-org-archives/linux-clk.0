Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926637C101;
	Fri, 22 May 2026 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482372; cv=none; b=uV9cAsPa4AjLc8OvnyDyw+LpLPIY3cfyii5cFVFa8qllbj/2xiahuOsKv86Xq58uRmu4Ks9hN4RJyUBtdwD3Bs1SVm7ACqs6WxtN75OGkmbm4ksETpo0nzRykxrpuFrcBCRZn1eQlIVMhf8z4jT02fhY7R0NaKiQPTcw7VDN9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482372; c=relaxed/simple;
	bh=jzyuahkmJrkIfcmMx4CX9UsZ36wBGpvzYs+R4VQvaag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo7hu46dklNhvmXBBgGj/r39HJPuqXF8B2eD4Zf9E+MJlqrvJ/I7lFoIMYQOFyIZRt0Xlxqyvf/mvky8QX4uHwTm4bB8trN1+ZUzRifJ4ibKTRguFGtkMXASILZR9XWm0HILbEFjgpjZ4OC4EV5TTmgIY0qcF6yNB29b+qKdRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9eEG1/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9eEG1/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C6D1F000E9;
	Fri, 22 May 2026 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779482371;
	bh=jzyuahkmJrkIfcmMx4CX9UsZ36wBGpvzYs+R4VQvaag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9eEG1/WTyNg852Hc717laNEoKKcGetjNVIvMZJe0jRfjVNwR/rtIROUZKnvsGopP
	 UAsIwpCC55xZQz5WU4fJWt4UOjFxHIeki0sS4KRubt7IEFpIPxUlBVrWs6xKoBTxkl
	 Oynw85NLsHrVPPLjafi4rqd5IeVMmt3nKlOhHO8Aj7n1kC/8T2M5lTYMF6OliO5TvE
	 pyIwcZkYsvEccxYOjc9lSTfelbdPaWJhSO7jLJBmBo8qIuemIaFm1cvq8ZFLfa85sX
	 8c1n7UzmHUzSTbGvh6w50rU6o+datR4+aNBlgcgPbsT5ozgQuwlR31R1fimQ5d5HOc
	 NJvdmX5czQmZg==
Date: Fri, 22 May 2026 21:39:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
Message-ID: <20260522-removed-lyricism-7c879febc3b3@spud>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6w0P95clb1jZsxRa"
Content-Disposition: inline
In-Reply-To: <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>


--6w0P95clb1jZsxRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
> Fix all sparse warnings detected during LKP randconfig testing:
> - Replace plain integer 0 with NULL.
> - Add static modifier to k230_plls and k230_pll_divs.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@i=
ntel.com/
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

Forgot to reply earlier, but I went and squashed this in.

Cheers,
Conor.

--6w0P95clb1jZsxRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahC+/QAKCRB4tDGHoIJi
0hSIAQCWDWG3TSikZRlt68Uwd3kshWGbSzsv40UokBTQi61KAgD+LGC81U7fOT85
ukUFrT5pG/T/xAV/bsq/DJl2h1YafAk=
=tMpn
-----END PGP SIGNATURE-----

--6w0P95clb1jZsxRa--
