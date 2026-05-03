Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616F378826;
	Sun,  3 May 2026 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831167; cv=none; b=Y5tp1RRSiTY5dirpJDBc3/3sJRVnos1yjLi/uG3iY7/NSiYnwf94BpYuBiWKP8N96EgmWYDYWnFVYHiIQgbEtgHkG7JMjYFOjLUrjuQBm5+F1f5ssUGc9s3hq/YjWRZBQj+AXda2Exf0NALA9HNj3KgaUbHZmaBqU65/0+vnCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831167; c=relaxed/simple;
	bh=V7NtC9da5pci0GATUEjHGjX1eH1+sSs6O7RY2S2mlzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7kCfWlehe7pKrUoiBKsn2eWHvaIlnjnaBGzYPKcT3RaHkmYCTRcdSPmSCSXbCjiE4oUmzBKc75isUxaxNhYSczCK0gWWUBt3Q4Kc8fumoC3jivZxYfEiXyYldTxeh9HQwCg6goCTooeE/ceskQOdc180RKNRGr0ddAxpKQM0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l61zVq3D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l61zVq3D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499DBC2BCB4;
	Sun,  3 May 2026 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831166;
	bh=V7NtC9da5pci0GATUEjHGjX1eH1+sSs6O7RY2S2mlzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l61zVq3DeuKczuKBRBq4ZywWYih7F08eteaPxDXC8HqdCrgLIuY12cCZpipfkQxC6
	 80y3acacZQytq2RHyLbS1hfOLZIfLiPOVX2sh+5hmkMcEPecbQwGgTs1sCxKaecY2Y
	 JvoMZXndmL1EH1QC1XrwiSHVA0OpJ4AOtBmL1EzPjchkC2aIl+hSi78yo8/GkYABHu
	 RcJa+7sPI+AJEsWxm9w7mmFeWbYY18QNTw6r/0V3/O1zb5UH6dG2b2NS7ECUZCkkbu
	 E8Y2pc5W6d8MQhOoPJANeE+OMdDA2059U+56w8uYF0x0Eaf1MCnsOkjgjg+iEf5NoZ
	 rBrqXdxzNqE0Q==
Date: Sun, 3 May 2026 18:59:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Message-ID: <20260503-cupped-feeble-5a12fd4ae263@spud>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
 <20260430-plug-bolt-8ff9137717fa@spud>
 <20260502113201-GKB3266396@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YQEsGXXZOZUQogqG"
Content-Disposition: inline
In-Reply-To: <20260502113201-GKB3266396@kernel.org>


--YQEsGXXZOZUQogqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2026 at 11:32:01AM +0000, Yixun Lan wrote:
> On 19:55 Thu 30 Apr     , Conor Dooley wrote:
> > On Thu, Apr 30, 2026 at 10:30:26AM +0000, Yixun Lan wrote:
> > > Add clock IDs of PCIe DBI (Data Bus Interface) clock.
> > >=20
> > > Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock suppo=
rt")
> >=20
> > Why is this a fix? As-is, this looks like you're abusing the Fixes tag
> > so that this gets backported alongside things that are a fix that depend
> > on it.
> Ok, will drop the Fixes tag, since the PCIe isn't actually activated yet

If you do need it as part of a backport, look at the stable docs for how
to specify dependencies for a fix.

--YQEsGXXZOZUQogqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeM+QAKCRB4tDGHoIJi
0mzWAQDqO536gtDVStLwRG6bUI1CWGx3BjHlTtvdgP4o4/Ki+wEA/Ii8Qtw1Uw8I
0Mi2/eCeT+1SnC2mWly9dwTfe2JiHA0=
=pIko
-----END PGP SIGNATURE-----

--YQEsGXXZOZUQogqG--
