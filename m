Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178075;
	b=Dyqf//c5ijaqIb5s9wPf4mgiNmBRKevO9cSn/YHkUSoh0Dk298NpDbJE54f+3dUIsLFU
	 aU8sS733ZCC0CUVrtWyYhvF/KBOArSH2OL3sFrwxr5OPbEWwwnroBuoLqHbsNcqkek638
	 CF5LDK9BvPA4/xFYbNdIOK9y0omVn6gvLKwkk4E6vVTSVjiwP9bnxAweoR1GbuhQ1vo1D
	 526RTROLIXnh9DZ3Jlw5QET5xjYKJlsSnqYd+5ASNNHNCPhy86SnLsVLAN9j6RnlXCdNk
	 sdyRMOytRvcX1edjj2T80uhYcWZM40tfchQqQR/72CK08sWsvkJpg2VjCPvKJpUicIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tGD1n35qkTRVWRh5gYerhYExxHVVeHk+oltw3BhOOkE=;
	b=K+EWquYmUX7kQidlDXSk1balwHNw9FlM/IqGLwyga+KK9bpV1n7DGYTMfWNGjFRiBoyO
	 hZvxrHm1eNUWuEYTD7os9GGlzbF0/nHWDb1dqq/PYE7bNeJuK3Rch2rqbnU2xZ4c7sFxv
	 rAzgcJvgp2IkszMCVFmu08dY/AdbN8VxfIfVzA9y34d9i5sXc9wDMYfmppGQBFUwVHo6f
	 rIq22odED1Ne/VQyxZcqwW7uB6PXqaxnETjYgbcDuJWaDXlzVh0Y+FsKe8S3EDyF4YRIL
	 dvxA5SZUyPte+xfP9ljFn6axBcLFQwRkNu93srfs+zjLqIdz2w5taj5zj46YtZKFgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAeIBgmM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE8606A31C;
	Wed, 28 Oct 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAeIBgmM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A210C1F01829;
	Wed, 28 Oct 2026 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793178074;
	bh=tGD1n35qkTRVWRh5gYerhYExxHVVeHk+oltw3BhOOkE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NAeIBgmMi2cElXO3DkEB5l+YrMVdhDmHtHUzkWVcYmqXQJyYmTNYBuagNFa3AU1VP
	 yb/GdUoD5Kz34pByc4piqoQlZ4Kk+43KiBgN/O14vezgMiShB7WfXPXWLxxGn64h4c
	 Inz6g9EAp9ll7ZKwgUWrbzyVC5vstYmgljfAFxnDSoUtHdpj+GQH9bPfJZqrxl6vl2
	 0lnfRqULtEBAJ1y9UP3kOFLPVmy+RR/sbcP6F+TFwTGgdIZ8+OMceAczUKQWUHLT2a
	 UWdLtLS1j5y3eS2kTqIRQmI/TQVPMoH72MrZNId2fFJxSAhoPXSbYGZ8ZcSQwOhvXt
	 Bs4lmKl7ZAGVw==
Message-ID: <sashiko-outbox-187645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] firmware: tegra: bpmp: Add per-SoC EMC clock ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johnny Liu" <johnliu@nvidia.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028084900.1047287-5-johnliu@nvidia.com>
References: <20261028084900.1047287-1-johnliu@nvidia.com>
 <20261028084900.1047287-5-johnliu@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 09:01:14 +0000
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
- [Medium] firmware: tegra: bpmp: missing emc_clk_id for Tegra186 and Tegra=
194
--

commit 8799d4cd04239b801d1fa35e2045aaeae3d68e3e
Author: Johnny Liu <johnliu@nvidia.com>

firmware: tegra: bpmp: Add per-SoC EMC clock ID

This commit adds an emc_clk_id field to struct tegra_bpmp_soc and sets it
for Tegra234, Tegra238, and Tegra264 while leaving it unset for Tegra186
and Tegra194.

>     firmware: tegra: bpmp: Add per-SoC EMC clock ID
>    =20
>     The EMC clock ID differs per chip (TEGRA234_CLK_EMC=3D31,
>     TEGRA238_CLK_EMC=3D43, TEGRA264_CLK_EMC=3D290).
>    =20
>     Add an emc_clk_id field to struct tegra_bpmp_soc and set it for
>     Tegra234, Tegra238 and Tegra264. Tegra186 and Tegra194 have no EMC cl=
ock
>     ID and leave it unset.
>    =20
>     Signed-off-by: Johnny Liu <johnliu@nvidia.com>
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index beeb385870f59..06da888535dc0 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c

[ ... ]

> @@ -1158,14 +1162,17 @@ static const struct tegra_bpmp_soc tegra186_soc =
=3D {
> =20
>  static const struct tegra_bpmp_soc tegra234_soc =3D {
>  	TEGRA186_BPMP_SOC_COMMON,
> +	.emc_clk_id =3D TEGRA234_CLK_EMC,
>  };

[Severity: Medium]
Is it accurate that Tegra186 and Tegra194 have no EMC clock ID, and should
tegra186_soc (or a dedicated Tegra194 entry) also populate emc_clk_id?

The in-tree device tree bindings and device trees define and consume BPMP
EMC clocks on both SoCs:

include/dt-bindings/clock/tegra186-clock.h:
    #define TEGRA186_CLK_EMC 58

arch/arm64/boot/dts/nvidia/tegra186.dtsi:
    emc: external-memory-controller@2c60000 {
        ...
        clocks =3D <&bpmp TEGRA186_CLK_EMC>;

include/dt-bindings/clock/tegra194-clock.h:
    #define TEGRA194_CLK_EMC			31

arch/arm64/boot/dts/nvidia/tegra194.dtsi:
    emc: external-memory-controller@2c60000 {
        ...
        clocks =3D <&bpmp TEGRA194_CLK_EMC>;

In addition, drivers/memory/tegra/tegra194.c sets .icc_ops =3D &tegra_mc_ic=
c_ops,
which scales the EMC clock via BPMP MRQ_BWMGR_INT without clk_set_rate()
involvement, and drivers/memory/tegra/tegra186-emc.c uses
clk_set_rate_range(), clk_set_min_rate(), and clk_set_max_rate() on emc->clk
across Tegra186, Tegra194, Tegra234, and Tegra264.

With emc_clk_id left at 0 in tegra186_soc (which matches TEGRA186_CLK_FUSE
on Tegra186), consumers such as tegra_bpmp_clk_register() in commit
1346a33d1522 ("clk: tegra: bpmp: Do not cache the EMC clock rate") will not
identify the EMC clock on Tegra186 and Tegra194, continuing to return stale
cached EMC clock rates when BPMP scales the EMC frequency. Also, because
arch/arm64/boot/dts/nvidia/tegra194.dtsi matches compatible =3D "nvidia,teg=
ra186-bpmp"
and tegra_bpmp_match has no separate entry for Tegra194, both SoCs currently
share tegra186_soc despite having different EMC clock IDs (58 vs. 31).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028084900.1047=
287-1-johnliu@nvidia.com?part=3D4
