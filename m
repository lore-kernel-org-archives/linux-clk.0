Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971184E73A2;
	Wed, 14 Oct 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981458; cv=none; b=RQpiiGtxQrX2/+lUQmZ/Q2DdgOJNzWdhMByBTUXoYhyE5wxUVJXCswbJjCBBqSJbcuiCiIRsW9yZCcGa1RiOj71pUlkJCQ0L6bl5aHCV+EivTCJKiQejj401vDO8/LLeH5Pj587t2TraVoCoWkXWhjG+Pd9ZoJ9I4FNXzklCb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981458; c=relaxed/simple;
	bh=6ahJMiS3epiJ5kXtlIS5Y5dan2Om9qEd7QZfmEfFaYw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=h89Z78neuAWqw52/rqjL0W1cOUu8+mfkj3jdAwRP+q/byTk/gMboRCoJ/h3x3iP1TrlVk+q4OjkHVRBQ3VT9PC8ON1q2zbT9RaT9VWmxhc1dDH2gaqnfW0NNOI4WGBK7WDFNSuFHl8WNt5onfb8flsPGqgOsuk3HQAmpjN5fQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYZnpg3b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYZnpg3b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AAA1F000FF;
	Wed, 14 Oct 2026 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981457;
	bh=H8oQqrZSbG0XhrgRtDVzgHrXoqsF1d/BR6ngXOBjMek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYZnpg3bi/N4LPIn9fyffueghxhkrr8hqrbR2Y9p9KjFKj9DRn2zD1xCfL0KfGQoV
	 3HHiyeN2ecQHCLwldgfQ5ydgZteDk7y3UMXJdWz82XyNbHqdFGfVwbn+2sTVOqS9OX
	 Qj8ZMayc7/9NoOCMMsu3kBs0JpI6U4IA7pUbamrIiNaHfXuMlzm0f73y1mzkuOaOif
	 LM9NiPAJN1J/I5gu9L05zFc+3rUl5qn7CYyIYPYC9mlD5oHLgIM3IprgJXOsPBm8x9
	 2G560UdQEi+xrTZK8S3v5v5NDFH2t5ZNLQBkF7CPMbIRpOowaJiq3krHwx2l/5V+g+
	 LFs9B8pjz6tVQ==
Message-ID: <sashiko-outbox-171291@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/16] clk: qcom: dvfs: Add debugfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-8-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-8-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:37:36 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: qcom: dvfs: UAF in debugfs due to missing file cleanup on unb=
ind
- [Medium] cleanup: goto-based error handling mixed with __free() cleanup
--

commit 3f9e96971d4a45f08b00bd913e791d8aeb02fc13
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: qcom: dvfs: Add debugfs

It's really useful to be able to analyze the current set of votes and
what holds them. Add debugfs to expose that information.

> diff --git a/drivers/clk/qcom/clk-dvfs.c b/drivers/clk/qcom/clk-dvfs.c
> index e6490c4dab949..4af78eb0c78dd 100644
> --- a/drivers/clk/qcom/clk-dvfs.c
> +++ b/drivers/clk/qcom/clk-dvfs.c

[ ... ]

> @@ -293,6 +333,8 @@ int qcom_clk_dvfs_resource_acquire(struct clk_hw *hw,
>  	for (i =3D 0; i < dvfs_transition->num_votes; i++) {
>  		unsigned int pd_index =3D clock->data->pd_indices[i];
> =20
> +		dvfs_transition->votes[i].clock_name =3D clk_hw_get_name(hw);
> +		dvfs_transition->votes[i].transition =3D true;
>  		ret =3D qcom_clk_dvfs_add_vote(&clock->rail_voters[pd_index],
>  						  &dvfs_transition->votes[i], level);
>  		if (ret)

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanups in th=
is
function?

qcom_clk_dvfs_resource_acquire() declares `dvfs_transition` and `votes` with
`__free(kfree)`, but uses a `goto unwind;` label to perform a manual rollba=
ck
loop on error.

The kernel cleanup subsystem guidelines strictly prohibit mixing goto-based
error handling with scope-based `__free()` or `guard()` cleanups within the
same function. This pattern creates confusing ownership semantics and incre=
ases
the risk of double-free or resource leak bugs during future refactoring.

Should all resources in the function use either scope-based cleanup or manu=
al
goto-based cleanup, rather than both?

[ ... ]

> @@ -565,7 +609,20 @@ int qcom_clk_dvfs_register(struct device *dev,
> =20
>  	dev_set_drvdata(dev, dvfs);
> =20
> -	return devm_add_action_or_reset(dev, qcom_clk_dvfs_cleanup, dvfs);
> +	ret =3D devm_add_action_or_reset(dev, qcom_clk_dvfs_cleanup, dvfs);
> +	if (ret)
> +		return ret;
> +
> +	scoped_guard(mutex, &qcom_clk_dvfs_debugfs_lock) {
> +		if (!qcom_clk_dvfs_debugfs_root)
> +			qcom_clk_dvfs_debugfs_root =3D debugfs_create_dir("qcom_clk_dvfs", NU=
LL);
> +
> +		debugfs_create_devm_seqfile(dvfs->dev, dev_name(dvfs->dev),
> +					    qcom_clk_dvfs_debugfs_root,
> +					    qcom_clk_dvfs_debugfs_show);
> +	}
> +
> +	return 0;

[Severity: High]
Can this cause a Use-After-Free during device unbind?

The driver creates a debugfs file using debugfs_create_devm_seqfile() and
places it under the global static qcom_clk_dvfs_debugfs_root directory, whi=
ch
is never removed.

debugfs_create_devm_seqfile() allocates a private entry structure via
devm_kzalloc(), but does not register a devm action to remove the debugfs f=
ile
itself. It relies on the removal of the parent directory.

Upon device unbind, devres frees the private entry structure, but the debug=
fs
file remains accessible because its parent directory is not removed and the
driver's cleanup path (qcom_clk_dvfs_cleanup) does not manually remove it.

A subsequent read of the leaked debugfs file by a user will dereference the
freed entry structure in debugfs_devm_entry_open(), causing a Use-After-Fre=
e.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D8
