Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334F54704D;
	Wed, 14 Oct 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981297; cv=none; b=A/DzXrzUcAoKgh1x80oeD5V8W2afDPptPOutpNzqy2e0TTh8iQb50+cYTkAIokxCQ1ikfnyXR2RYQmZjhQMD+1Jj+1fiXkJZBtI2FF+cirKuEMXg3LdCOj4Dtq8zcdxfv6vOTINAleyqQTujsCxIeK8dQxn9H0IVWpZ2sfZO2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981297; c=relaxed/simple;
	bh=s76aGJfqpPmSDiJlh8MG+88MugezhBBvHXNzPKrGfbE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=f0Alx1wm7DkpB83GyW0YB7a0Ai7ciJNFehbNF36n8mDKlTZ0zdwxY3RkaBKCP3rEsnd+A3cD7fGqo2oa0EzapwWplH82SBxjUa9/ntZsaxJfaspqi+40kxzX4FwKJrojBMW5QUu2hZpZRExhOGBQfG1R7xRD43WsKdd+PGhheS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZvLMcSd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZvLMcSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6A71F00893;
	Wed, 14 Oct 2026 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981296;
	bh=uTV/sAQ+iGUxAMzhUnkn6HZtHbZHKEQP4E9u69AvMFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GZvLMcSd6CxZRS+ued/DJGGHgXKK92WNuxx/TO/i5qNC6Hxl/Rs0I/cjmEi4GsLBP
	 uRQ4P4mlli8tdzIvIYRryoFeMDxGU/DgSn9Gjz+NiB4x/S/5VVSQIkXFqMKfvI3mvv
	 TOB8Juh+v+1gl5T3rqWRW6Q9OJJcDqIlVqkAvIpMkadcbcjC+fW483fRu4er3TYx9P
	 OI5UtQpuLWhmBO3kRTcpgadnTjKnYRhG7wot4L2/sdwLL3sHzTMoBl6RP104NJeISb
	 fX+PdJtQUakxWluMK0OQdHGvg4kCkKscsrK14sJF/M/ah90+UUW4mw3ly0sOdKN2wS
	 V7upgeyedBVJw==
Message-ID: <sashiko-outbox-171285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/16] clk: qcom: clk-alpha-pll: Vote for the PLL
 calibration frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-10-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-10-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:34:56 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: dvfs: qcom_clk_dvfs_prepare_rate() unwinds to 0 on fail=
ure, dropping votes
- [High] clk: qcom: alpha-pll: disable failure during calibration drops DVF=
S votes while PLL runs
--

commit 27077f9ef026973ca3f8e723a45854a856554ed2
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: clk: qcom: clk-alpha-pll: Vote for the PLL calibration frequency

This commit updates Lucid EVO PLL initialization to safely handle higher
calibration frequencies. It temporarily raises the DVFS vote to the
calibration rate during preparation and restores the nominal rate once
complete.

> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 5dc6b1adc9298..f6e73e2fbe768 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
[ ... ]
> @@ -2628,12 +2648,9 @@ static int _alpha_pll_lucid_evo_prepare(struct clk=
_hw *hw, bool reset)
>  		return -EINVAL;
> =20
>  	ret =3D alpha_pll_lucid_evo_enable(hw);
> -	if (ret)
> -		return ret;
> -
> -	_alpha_pll_lucid_evo_disable(hw, reset);
> +	cleanup_ret =3D alpha_pll_lucid_evo_disable_checked(hw, reset);
> =20
> -	return 0;
> +	return ret ?: cleanup_ret;
>  }

[Severity: High]
Is it safe to propagate the disable error here if it results in dropping th=
e=20
DVFS votes while the PLL is still running?

If alpha_pll_lucid_evo_enable() succeeds but alpha_pll_lucid_evo_disable_ch=
ecked()
fails (e.g., due to a regmap write failure), the error is propagated up to
alpha_pll_lucid_evo_dvfs_prepare().=20

The error handler there unconditionally calls qcom_clk_dvfs_unprepare() via=
 the
err_unprepare label, resetting all DVFS votes to 0. Because the hardware di=
sable
failed, the PLL is left physically enabled and actively running without the
necessary voltage votes.

[ ... ]
> @@ -2641,21 +2658,69 @@ static void alpha_pll_lucid_evo_disable(struct cl=
k_hw *hw)
>  	_alpha_pll_lucid_evo_disable(hw, false);
>  }
> =20
> -static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
> +/*
> + * Calibration runs at CAL_L * parent_rate, which may exceed the operati=
ng rate
> + * covered by the normal DVFS vote. Raise the vote temporarily to keep t=
he
> + * hardware in-spec during that step.
> + */
> +static int alpha_pll_lucid_evo_dvfs_prepare(struct clk_hw *hw, bool rese=
t)
>  {
[ ... ]
> +	ret =3D _alpha_pll_lucid_evo_prepare(hw, reset);
> +	if (ret)
> +		goto err_unprepare;
> +
> +	if (cal_rate > rate && qcom_clk_dvfs_prepare_rate(hw, rate))
> +		pr_warn("%s: failed to drop calibration DVFS vote\n",
> +			clk_hw_get_name(hw));
> =20
> +	return 0;

[Severity: High]
Can ignoring the error from qcom_clk_dvfs_prepare_rate() here leave the unw=
ound
power domains without voltage votes?

When down-voting from cal_rate to rate, if qcom_clk_dvfs_prepare_rate() fai=
ls
midway, its unwind path resets the successfully updated domains to 0:

drivers/clk/qcom/clk-dvfs.c:qcom_clk_dvfs_prepare_rate() {
	...
unwind:
	while (i--) {
		unsigned int pd_index =3D clock->data->pd_indices[i];

		qcom_clk_dvfs_replace_vote(&clock->rail_voters[pd_index],
					   &clock->votes[i], 0);
	}
	return ret;
}

Since the warning is caught but the error is deliberately ignored (returnin=
g 0),
the clock prepares and operates at the target rate but with missing DVFS vo=
tes
(vote =3D 0) on the unwound domains, which risks hardware brownouts or syst=
em
crashes.

> +
> +err_unprepare:
> +	qcom_clk_dvfs_unprepare(hw);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D10
