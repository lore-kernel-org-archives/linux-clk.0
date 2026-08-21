Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814133290D2;
	Fri, 21 Aug 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329287; cv=none; b=kEHMxbJYavPUuPgQO0BF4Faf649iukS2oVFXKpuPz18YeupPkGu7+xnIb7uqE2YuFQjVvqMj6s2oZgvw64VivClQdLoEDVz+NtiKTbZMzZUA4H9oVytPxjaPeKrdcrXU7HsJTeR1D7eGgnz9vVyhGFBW5/DeZo8PEEOsVfMCPes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329287; c=relaxed/simple;
	bh=wzCsiyYsJu+TgEpKsOc8sD7LcypFdV4TyZb2hbIm3Lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ltc20MYKS3593zT7hNZJv4kSmB64VZFPc66OQsCjvf0hkMdSgvSxObgJJ46hhjYPnVn0SrlNnpin8s7kgP539IZvJWaHJjtx2YZZzf0wjLINM3JXyfz1V+C1ttrv9MJRWHzD6DksG4xJIdph4adIdHRZjLFbTVtqs+pveM7mUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcrkP1F5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcrkP1F5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C6D1F000E9;
	Fri, 21 Aug 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329286;
	bh=gIjxxZGPTmuC61ihs3lfS9K2kmn/qnGa1FBCfZFJ5tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcrkP1F5wPXw4dOjXhAk5EBo6C+1RF0u33a92ebMd4TQ75yu4/a8oqwin1gXIbtoU
	 mJG5rlLTgxTZAQmHsHgrnRmtTwGb3lPQJ3frf/UJXo5aS+mKBYyPTezGJGqCFucUuR
	 rR9KWf6psA7YhCdtayYNihnkba2NbxFk0t8ODBK+k1rs1Uyr+4BCRNcCNszDIRqxu4
	 vzhDTEEzG7f+FdfZY0H+lR+8soDUbiLNNPAcbBLZ636lZ+1PhgcHl6NCxw4/WDx6xa
	 fFhobpNr+AGB4MPNS2F70Q81ANnDsvgqextULHOafA1fpWn0lP6UYPJcIx+waEP+LV
	 oMGrI68NoNo6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 16:21:25 +0000
Message-Id: <20260821162125.D4C6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe function mutates globally shared static state, causing accum=
ulative corruption on probe retry or unbind/bind.
--

--- Patch [5]: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno R=
PMh clocks ---
commit 6a55939d348aa54a2946c4b7160f00630d3c9710
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 6367b2a5a4e08..d8c3a6b12d4a4 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c

[ ... ]

> @@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali=
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

[Severity: High]
This is a pre-existing issue, but does adding this new clock array expose it
to state corruption during probe retries or unbind/bind sequences?

Looking at clk_rpmh_probe() in drivers/clk/qcom/clk-rpmh.c, if a clock
resource is missing or if probe fails transitorily and is retried, the
function mutates the statically allocated array:

drivers/clk/qcom/clk-rpmh.c:clk_rpmh_probe() {
    ...
    hw_clks[i] =3D NULL;
    ...
    rpmh_clk->res_addr +=3D res_addr;
    rpmh_clk->dev =3D &pdev->dev;
    ...
}

Since kuno_rpmh_clocks is a globally shared static structure, writing NULL =
here
permanently erases the clock definition for any future bindings.

Additionally, modifying res_addr accumulates the hardware address on subseq=
uent
probe attempts, leading to corrupted register offsets.

Could we avoid mutating these static clock structures by allocating a per-d=
evice
copy during probe, or isolating the runtime state from the static clock
descriptions?

> +
> +static const struct clk_rpmh_desc clk_rpmh_kuno =3D {
> +	.clks =3D kuno_rpmh_clocks,
> +	.num_clks =3D ARRAY_SIZE(kuno_rpmh_clocks),
> +};
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-kuno-soc-s=
upport-v3-0-196e2b306368@oss.qualcomm.com?part=3D5
