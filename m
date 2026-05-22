Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3BC34CFAE;
	Fri, 22 May 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434731; cv=none; b=RS8qhmjCN5Rq2D5jkKDqFA7DbIIIRKavd0CGHNHfcdY9eA8fG5Nx4DWnDuEucXEmRr8XTqMXkdkWaci/qw0CZ8Cp+3UIoVQMUzR+/lTIJpaObQPJOMXyvoT4VObTI7oD4cw8AdPtq5YHFxINsvoXIikIdhEug3sSDaMWOOpFQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434731; c=relaxed/simple;
	bh=Me5QERVwlsG7DT9s02Fuc2SFcWwdDlykFZlBaHyZoZQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMuBhib7y+ZwnbUfH2tEwssSrvCEQFDbtKLZVTqbRSI6LHABg+X+16bNrDkBpzVfr/Qm5j/OxtlMbSeQCS94e9FG5j3WSjDisryC/7SJii5ohASgWHUSKDAEVIW8jY9lL5RvMRWQmppn3+JopPTBfloyNDdS/+eIc3ZPl6Vnopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=eGzsUWKO; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="eGzsUWKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779434730; x=1810970730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Me5QERVwlsG7DT9s02Fuc2SFcWwdDlykFZlBaHyZoZQ=;
  b=eGzsUWKOqEeCKZq5uAUtCZj+BgaY6/8uhB3oQaYFFDstiGss9S5cYbMe
   M1oPnt41mOi+s8Mtcjjj46TZ5Ig/KP7dbat6ZMiB70ufJ7U8xJcYjwhpY
   LGQM+1ZBzoCYBD7xLFd7Q+pnrIj9w+X5DEGvQO4j8zhcMEgqYsOxMo0kj
   YUDykQPZU/U8KDUQfy7alQbzhcoGwSSvc3nKluBtQFckUGNupKrqROCNE
   H9q+q84LudujyogT7t6cUJGn5p/sqdKAeRv640JQHLKh7hxe4qLrWfhnU
   51kxHkk9+1bE6E4TB7+GVbqWNJ6Gm0bllP8LtviqRCwzsscRCxGM2vmtG
   w==;
X-CSE-ConnectionGUID: tUmhS4AxTqWFWFOKBEQuGg==
X-CSE-MsgGUID: cVxBwvSETaew3tD63fdjJw==
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="asc'?scan'208";a="225146713"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 May 2026 00:25:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 22 May 2026 00:25:28 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 22 May 2026 00:25:25 -0700
Date: Fri, 22 May 2026 08:24:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xukai Wang <kingxukai@zohomail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Samuel
 Holland <samuel.holland@sifive.com>, Troy Mitchell
	<TroyMitchell988@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
References: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z/30xz3oQLOBJj/M"
Content-Disposition: inline
In-Reply-To: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>

--Z/30xz3oQLOBJj/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sat, Apr 25, 2026 at 05:29:30PM +0800, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> PLLs and an external pulse input, with the controller managing these
> sources and their derived clocks.
>=20
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].
>=20
> Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/a=
rch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
> Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8=
229DAA58E08@qq.com/ [2]
>=20
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

I applied this with the intent of sending a PR to Stephen, but lkp
reported some problems during randconfigs:
https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
These showed up on microblaze, but I think as they're all from sparse
you should be able to see them on riscv too.

Should all be pretty easy to fix, send a patch and I will squash them
in.

Cheers,
Conor.

--Z/30xz3oQLOBJj/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahAEugAKCRB4tDGHoIJi
0uGyAP9agbdCIhax2QTKY8ZBijDMko96YkubUzkb16tpoAg4fQEA6GxWZENh2En2
j3YHPCeNRSFrYYVr7fEXMxcbud00xQg=
=FzcN
-----END PGP SIGNATURE-----

--Z/30xz3oQLOBJj/M--
