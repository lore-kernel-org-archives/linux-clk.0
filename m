Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30E47D95F;
	Thu, 27 Aug 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849345; cv=none; b=CXmH6Gr09sj3xe4u03H7KEuQU81lH8zJCfUNWBL7W6bLhCXXSuEhZWCvKMkGw6uVS1ULjSL6Aof8iAktk1soNXzgon7Wd1M6CO5Lg6nhDEArhlIvKyyfW2ldf7rB/BOCUzfJYJCRYQLHYmw2AJ3CnTpem0x82xCZYNL9WusDQuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849345; c=relaxed/simple;
	bh=bdRpD/SNicCWyscM0zlGYrGsHNMoJW8tcupEZLTo/Qs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4oOv5ZuqAO+CMj7fPnnZfiZWgyl3DSJlRA3c2gqWXCgHfWlyH0aPgCHNy6H/nTzUm2soKxY8ySbSqftBg9ODBVDB44OaavjJ7jDHNQNCsLV4R0OhvKGGc/W6imPX3BJasERf7r9qgEABV2ETpljEUSlcOLczUqAdxR5iXBHMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak+klxCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ak+klxCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73D21F000E9;
	Thu, 27 Aug 2026 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849344;
	bh=RPbl9RTyAbIF9RIyLDur6Ybeb+BbGsN9alZUZEkesc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ak+klxCrtL1ZxmRriu0c0EER20S7pmYVhD8mzvcuMrY7qKaQ2jxOelkmPbzLaB/NP
	 Ig4TabQRuVfxxNTX3t1QEsbjMvSEV+cPARFu8z4JrvxRgxY5co4LQPL2clPpvUHN4N
	 87levQlASHueh0v2Dq/HdXpu7Ug2+nIAsvmVmfHWS1AZpiHNqYeuksN8WZdf/0WY64
	 LeW5MlUCTWgMLuO04e3wnwoZhLGmrYx8moFyM/Kxh+c70ME3telQUo33iEu8FdrjK3
	 M90MMoviNumzbHpF3RQrne1CZvshJs0OAJIXs6XTrjiPUKoYtLLG1Rmeuye3mEgNZU
	 oyP/rr9ZVQlMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260827-kuno-soc-support-v4-5-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
 <20260827-kuno-soc-support-v4-5-dd34f235fc1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 16:49:03 +0000
Message-Id: <20260827164903.A73D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but this patch adds =
new instances of static arrays (like `kuno_rpmh_clocks`) that are subjected=
 to the same corruption. Global static structures and arrays in clk-rpmh ar=
e permanently mutated during probe, leading to resource address corruption =
and dropped clocks across unbind/rebind or probe deferrals.
--

commit 05d4af4c482cb487c2654eee526d1d872c910869
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers.

> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index a224a94ae2733..ec8700b6186d8 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali=
 =3D {
>  	.num_clks =3D ARRAY_SIZE(kaanapali_rpmh_clocks),
>  };
> =20
> +static struct clk_hw *kuno_rpmh_clocks[] =3D {
> +	[RPMH_CXO_CLK]		=3D &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	=3D &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_RF_CLK1]		=3D &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	=3D &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_QPIC_CLK]		=3D &clk_rpmh_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		=3D &clk_rpmh_ipa.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_kuno =3D {
> +	.clks =3D kuno_rpmh_clocks,

[Severity: High]
This is a pre-existing issue, but adding this new array subjects it to a bug
in the clk-rpmh driver's probe path.

Will this statically allocated array and the clocks it points to be corrupt=
ed
during probe deferrals or driver unbind/rebind cycles?

In clk_rpmh_probe(), the globally shared static array and the structures it
references are permanently mutated:

drivers/clk/qcom/clk-rpmh.c:clk_rpmh_probe() {
    ...
		if (!has_state_changed && rpmh_clk->state) {
			hw_clks[i] =3D NULL;
			continue;
		}

		rpmh_clk->res_addr +=3D res_addr;
    ...
}

Because kuno_rpmh_clocks is a static array, hw_clks[i] =3D NULL permanently
drops the clock for all subsequent probe attempts.

Additionally, rpmh_clk->res_addr +=3D res_addr incorrectly accumulates the
hardware resource address multiple times across probes, which can cause the
driver to write to out-of-bounds addresses when sending RPMh commands.

> +	.num_clks =3D ARRAY_SIZE(kuno_rpmh_clocks),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-kuno-soc-s=
upport-v4-0-dd34f235fc1a@oss.qualcomm.com?part=3D5
