Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D730FC1D;
	Wed, 14 Oct 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981297; cv=none; b=H0PRCqT7B6CkvWz6AL/aqPD0B3gFk26oCj5PXUVOUmpcje7nmAOMlJMHibBv1cupizbKDiqNxFqzwUqZARW/m5Qb+fvt7Ki7CgJJ0L+fz+OlxsFf4GO8LETPmyGflMJczsnIMgTTIJKrKQZwWfm5ZEFzngjwREEX59+yZaVjRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981297; c=relaxed/simple;
	bh=BkH5B628eB/FqK62Fu1lrGCSkCsg3wb+PcE3wkF0Jnw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PdkVecSlCoUFwK3TLVCe0Xl0rnYLh83jzhQYGqtDh7mnhVGEMfaUleEQx6+urNVrqyvMNb29eFQJr2WVoyrMFw/QaUsUSgjaB90/A/8RByCKRf0tuOD0N00NRQ+z958r63sgyJ4pccJ4hLDNeSbqxiFabUUT5ks6eEue0BuGwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfBR1it8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfBR1it8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2801F000FF;
	Wed, 14 Oct 2026 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981296;
	bh=G/Hc0VXA1RO+NdYcDlU812L0P02U42dn9sV2KxuSbfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TfBR1it8KnGRP2n8bXjDAb9l+FFu7dzxMVutYOz8f1oGfvtaqgmZs/JVcfRZ1I+tY
	 RrAU01bQepckZalSQk9LV5QqlIiSHJUpx4yffJZChqMh3hwAK16K9qXMumxFLvZiwK
	 znkXzy8D/oq9xg7WaiH7XXx+pjjem64j1/7OsIdsYCfTPIfzoiSclclYXJkvM4zJW/
	 ZV2/DoLLTXQohIuGwuNduWGRykeh3AvN1lLLii6r6CXNXRN7JCzsanc4EEPBm0ImBo
	 jNzQdIMTrEUtGqP3k4T0+IQpMNbYI3BPolN+2ymDI07Py5c2e6XrG3IptdXbo2/iQL
	 fn17Bt3eYkmvg==
Message-ID: <sashiko-outbox-171284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:34:55 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] opp: permanent transition failure due to strict clock rate bounds =
check
- [High] opp: permanent fast-path breakage via clk_get_rate mismatch
--

commit 45860eb920070f15eb727913a22f9b1eb403210a
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

OPP: Retry failed default single-clock transitions

A failed OPP transition need not leave the clock at the last successful
OPP's frequency. If hardware changed before the error, the default
single-clock path can subsequently skip a necessary retry because its
cached OPP matches the request. It can also choose voltage and dependency
ordering relative to the wrong operating point.

> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 4ccce7b6afcb1..340911d2971e7 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1073,11 +1073,11 @@ _opp_config_clk_single(struct device *dev, struct=
 opp_table *opp_table,
>  	}
> =20
>  	ret =3D clk_set_rate(opp_table->clk, freq);
> +	opp_table->current_rate_single_clk =3D clk_get_rate(opp_table->clk);
>  	if (ret) {
> +		opp_table->config_dirty_single_clk =3D true;

[Severity: High]
Does this unconditionally replace the requested and rounded frequency with =
the
hardware readback?

If the clock driver's .recalc_rate (which drives clk_get_rate) differs even
slightly from .determine_rate (which drives clk_round_rate), the readback
will not strictly equal the requested freq.

>  		dev_err(dev, "%s: failed to set clock rate: %d\n", __func__,
>  			ret);
> -	} else {
> -		opp_table->current_rate_single_clk =3D freq;
>  	}
> =20
>  	return ret;

[ ... ]

> @@ -1297,20 +1319,40 @@ static int _disable_opp_table(struct device *dev,=
 struct opp_table *opp_table)
>  static int _set_opp(struct device *dev, struct opp_table *opp_table,
>  		    struct dev_pm_opp *opp, void *clk_data, bool forced)
>  {
> +	bool default_single =3D _opp_uses_default_single_clk(opp_table);
> +	struct dev_pm_opp *actual_opp __free(put_opp) =3D NULL;
>  	struct dev_pm_opp *old_opp;
>  	int scaling_down, ret;
> =20
> -	if (unlikely(!opp))
> -		return _disable_opp_table(dev, opp_table);
> +	if (unlikely(!opp)) {

[ ... ]

>  	/* Find the currently set OPP if we don't know already */
>  	if (unlikely(!opp_table->current_opp))
>  		_find_current_opp(dev, opp_table);
> =20
>  	old_opp =3D opp_table->current_opp;
> +	if (default_single && opp_table->config_dirty_single_clk) {
> +		actual_opp =3D _find_current_opp_strict(opp_table);
> +		if (IS_ERR(actual_opp))
> +			return PTR_ERR(actual_opp);

[Severity: High]
Does propagating this error directly cause a permanent transition failure?

If _find_current_opp_strict queries a gated clock (returning 0) or
a frequency that exceeds the highest registered OPP, it returns
ERR_PTR(-ERANGE).

Unlike the original _find_current_opp, this strict lookup lacks a fallback
and the -ERANGE error propagates here directly. This short-circuits the
hardware transition without clearing config_dirty_single_clk, permanently
sticking the OPP table in a dirty state where all future calls to
dev_pm_opp_set_rate instantly fail.

> +		old_opp =3D actual_opp;
> +	}
> =20
>  	/* Return early if nothing to do */
> -	if (!forced && old_opp =3D=3D opp && opp_table->enabled) {
> +	if (!forced && !opp_table->config_dirty_single_clk &&
> +	    old_opp =3D=3D opp && opp_table->enabled) {
>  		dev_dbg_ratelimited(dev, "%s: OPPs are same, nothing to do\n", __func_=
_);
>  		return 0;
>  	}

[ ... ]

> @@ -1460,7 +1513,8 @@ int dev_pm_opp_set_rate(struct device *dev, unsigne=
d long target_freq)
>  		 * value of the frequency. In such a case, do not abort but
>  		 * configure the hardware to the desired frequency forcefully.
>  		 */
> -		forced =3D opp_table->current_rate_single_clk !=3D freq;
> +		forced =3D opp_table->config_dirty_single_clk ||
> +			 opp_table->current_rate_single_clk !=3D freq;

[Severity: High]
If clk_get_rate diverges from freq as mentioned in _opp_config_clk_single,
will this fast-path condition evaluate to true permanently?

This fast-path relies on strict equality between the cached rate and the
newly rounded freq. If they differ, it bypasses the early return in _set_opp
and forces full hardware reconfigurations on every clock change.

>  	}
> =20
>  	return _set_opp(dev, opp_table, opp, &freq, forced);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D3
