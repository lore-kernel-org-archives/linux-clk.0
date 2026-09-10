Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE64915B7
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048429; cv=none; b=YkBa/UnOI3ENTM58x/0Ru2E046+wwf8WW/9O+uRg+oZCghGORBMPgEReNJEMoNhKYUfgObsnvMbuAaJRhBEnCtTwAUDcZbNTp9BlxKW21jg3NaQ7XzeotMHF2e2AJgBa+uvCbGTlYBYhaF7W/cG0CTjnp8F9YBCbx5a3dOuGAUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048429; c=relaxed/simple;
	bh=wHM1EmsZXsE+iqGhv72Rgo2yqKIyq8fK2oZ0dwoBraI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OvISCBWnQKpO2yCILS6BrkWebBzxTp2qnSmiHF0GB68NZ7k+kwqrMD8Ij/0GZGhAchE5PyhfolRql4/NQrwPPxd1ErHG06vqYMrkbRDR9JZvj/jSoYyMoj64OmGat7veecJdgE3v9qwnfxijK1X0NEV1KbLa8VROJ9qlbLVv7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZF2x+bj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZF2x+bj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA461F000FF;
	Thu, 10 Sep 2026 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048427;
	bh=SHKvDXvRTL62v3f8DZ187+uwSxBnJFZHJrMkCK6wJTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nZF2x+bj6xbvvYhQbhKgu2pHaFRQCjB+9ZQ6GobjGxsrqCa1Jkk1n/sgSxE129PiO
	 TUsN6iUx0EgynMi/+XdzwSDeRGimexUxvjG20KQp3lQrEuay1KBs69Jzb52Z3dmjTn
	 itKICU5hm/pXgF95qiCN/FSiFKso98Iz68ewoyuhqYCubifNE1dPmvZmXuJt4ZDkFP
	 ltEVgeqiMENnkZvHvNMEzD8hZbmQkQwckVO61Pv1P6GghH1rKuRpncZnktRSgTEbXA
	 u+17gYj0shRQMUDHC+isOV3qwZF4yEimZPV3iEXBGxfSwbUjTIrSxOKYGFqpSzddJt
	 FA4bWw4hzI40A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:53:46 +0000
Message-Id: <20260910135347.4AA461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `clk_smd_rpm_set_rate` silently ignores rate updates when the cloc=
k is disabled, leading to incorrect hardware state upon enable.
--

commit 8065b2a650b0e543b5eb4069b2bca8805e5bbb71
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

    clk: qcom: smd-rpm: Skip proxy votes on clocks for QCM2290
   =20
    clk_smd_rpm_handoff() votes both active and sleep RPM resource states f=
or
    every clock, keeping them non-zero until a consumer takes over. If there
    is no consumer, those clocks will remain active in the idle scenario as
    well, and the sleep vote is never cleared, blocking XO shutdown.
   =20
    Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
    keeping other targets unaffected.

> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 487d715ed5d21..b78c8cc730b59 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c

[ ... ]

> @@ -1358,13 +1360,15 @@ static int rpm_smd_clk_probe(struct platform_devi=
ce *pdev)
>  			goto err;
>  	}
> =20
> -	for (i =3D 0; i < num_clks; i++) {
> -		if (!rpm_smd_clks[i])
> -			continue;
> +	if (!desc->skip_clks_handoff) {
> +		for (i =3D 0; i < num_clks; i++) {
> +			if (!rpm_smd_clks[i])
> +				continue;
> =20
> -		ret =3D clk_smd_rpm_handoff(rpm_smd_clks[i]);
> -		if (ret)
> -			goto err;
> +			ret =3D clk_smd_rpm_handoff(rpm_smd_clks[i]);
> +			if (ret)
> +				goto err;
> +		}
>  	}
> =20

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential issue =
in
how rate updates are handled for disabled clocks. In clk_smd_rpm_set_rate():

drivers/clk/qcom/clk-smd-rpm.c:clk_smd_rpm_set_rate() {
	...
	if (!r->enabled)
		return 0;
	...
	r->rate =3D rate;

	return 0;
}

If a consumer calls clk_set_rate() on a disabled clock and then calls
clk_prepare_enable(), doesn't the early return in clk_smd_rpm_set_rate() sk=
ip
saving the requested rate?

Since r->rate =3D rate is bypassed, wouldn't the subsequent enable operation
transmit the stale initialization rate to the RPM hardware instead of the n=
ewly
requested rate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-clk-smd-rp=
m-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com?part=3D1
