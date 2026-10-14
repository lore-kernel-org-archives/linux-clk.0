Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD14E4C5C;
	Wed, 14 Oct 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981305; cv=none; b=kXDXsjmRUGJoQrJQkzKpyNtWb/buFMcKLjmBPCd9cH/uHENViXuc+2jVjCBO8/R/bQYnQQFKZpAWayR5+od7YouU/+8ZwPEhkMi4id0BbzbIRnVz+YQUxlm7pZhQ6jJh7mhgYKfrNckZkeADDkMbDSpdl0V4Gj/UIBHHV5fg4n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981305; c=relaxed/simple;
	bh=vk7Jgb/l1JHG3MoJm9nRR4miTWOnzA9y4tp/XSeq76g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Pe0HdOgHJEm/WUPYF27nYna3IZgOcDlHwGIBAFU4+KwzQtvN4a3/GRle435iBBW6A3rLXjEK2DasVUfk5yPk2S/keEG607uCq73MwZdJzNd0L7796WTA2JPPlsEAhLbIj13UyTwpIr2sRUbJuJutaZXi0Jvfai2KOAs4ZPGEc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bniRWKPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bniRWKPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670CF1F00893;
	Wed, 14 Oct 2026 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981302;
	bh=kyelXwy/YG1qvJ339hbRVM82IHDIwlQ18/r1BR4+Fiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bniRWKPh8wkrR5NUC+G23chcrZxX8BMfXPpjuGL63ASW7SzkIrygBD3bSl7RetHXc
	 3Ar3qN5Vd+9+88BeLtf+oTqq1r3lxktFmg0SFHqbzP2KUpeVHx9IFizLh1lM989DZo
	 56z+3UrEl/DgfyM7r8p//M82ON7w0VZ6xr6Nrs3NPWOStosdE+De96Vg2c4r54xrCZ
	 7HyKwkqy5lGM6uCRzGsPbWO4XNLrdvBHwsvskNKZx1ylI9uEKIoFcF3dbYRh0JGSI+
	 53QH2R9kmc8sivO8dNDfobjshEpZKkMKvmxqz4v5Z/QPFI+66KGEBHjWz+N6f/+hGb
	 F7tUjN2hZab7g==
Message-ID: <sashiko-outbox-171286@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/16] clk: Propagate rate programming failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:35:01 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: Undervoltage on partial rate change failure due to ABORT_RATE=
_CHANGE
--

commit 5ce89a94f0fcfcda3a335ff0e5689b0f216c3fd4
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: Propagate rate programming failures

This patch stops the clock rate-change walk at the first failure and
propagates the error back to the caller. It attempts to keep the topology,
temporary references, and terminal notifications consistent with the outcom=
e.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 4d2cc86bfbeb6..95669775f8cd1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c

[ ... ]

> @@ -2420,13 +2448,20 @@ static struct clk_core *clk_propagate_rate_change=
(struct clk_core *core,
>  						  unsigned long event)
>  {
>  	struct clk_core *child, *tmp_clk, *fail_clk =3D NULL;
> +	unsigned long old_rate =3D core->rate;
> +	unsigned long new_rate =3D core->new_rate;
>  	int ret =3D NOTIFY_DONE;
> =20
> -	if (core->rate =3D=3D core->new_rate)
> +	if (event !=3D PRE_RATE_CHANGE)
> +		old_rate =3D core->old_rate;
> +	if (event =3D=3D POST_RATE_CHANGE)
> +		new_rate =3D core->rate;
> +
> +	if (old_rate =3D=3D new_rate)
>  		return NULL;
> =20
>  	if (core->notifier_count) {
> -		ret =3D __clk_notify(core, event, core->rate, core->new_rate);
> +		ret =3D __clk_notify(core, event, old_rate, new_rate);

[Severity: High]
When ABORT_RATE_CHANGE is sent, this uses the original old_rate and new_rate
parameters. Will this cause consumers to revert their changes even if the
hardware rate already changed?

[ ... ]

> @@ -2474,53 +2509,83 @@ static void clk_change_rate(struct clk_core *core)
>  	if (!skip_set_rate && core->ops->set_rate)
> -		core->ops->set_rate(core->hw, core->new_rate, best_parent_rate);
> +		ret =3D core->ops->set_rate(core->hw, core->new_rate,
> +					  best_parent_rate);

[ ... ]

> -		clk_change_rate(child);
> +		ret =3D clk_change_rate(child);
> +		if (ret)
> +			goto runtime_put;

[Severity: High]
If the hardware rate is successfully changed for the parent here, but a
subsequent child failure aborts the walk, does the parent remain at the
new rate while the software aborts?

[ ... ]

> @@ -2613,7 +2686,14 @@ static int clk_core_set_rate_nolock(struct clk_cor=
e *core,
>  	}
> =20
>  	/* change the rates */
> -	clk_change_rate(top);
> +	ret =3D clk_change_rate(top);
> +	if (ret) {
> +		__clk_recalc_rates(top, true, 0);
> +		clk_propagate_rate_change(top, ABORT_RATE_CHANGE);
> +		goto err;
> +	}

[Severity: High]
If clk_change_rate() fails downstream after the parent hardware rate was
already increased, does broadcasting ABORT_RATE_CHANGE here result in
undervoltage?

For example, consumers like cpufreq or existing device notifiers might
receive the abort and revert their PRE_RATE_CHANGE voltage increases,
leaving the hardware running at the high new rate with the low old voltage.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D1
