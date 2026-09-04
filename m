Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CD3C8C48;
	Fri,  4 Sep 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538713; cv=none; b=bDauT1vojBaTsFhHMDPCv1z9rsNc9nycPbSXwGkMwjnDgay/ONSR+QY5V9RYLxYwrBVPnnm23uzeScaLa4k3RTvukKMjOGjYfj/m17/6duhHgTVL2+7uAZAjmPR9UhIQgvJlVQ84vZLQRBvYT6pEYtxRu4A2vmoLPmqF77FlPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538713; c=relaxed/simple;
	bh=Bd0pItTSrVWAVYTgRxFjbEzbullvF9KeQTdlrdfZfYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l4Di1jV2ZflV4vko+j8lbLLDIG+M00ZC01jdM59ux3P0GXm+pdWI699R399uXnc/bG6ojKnsG+gFNby6/qyEuoh4sJZTOosHek+lvNgiOuEeRNiYdwe5+MfvBS8w/S5O2AyA2SndIqLeMXTT1tjTCY8O7cymqUUCYtnvleIshg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THQWGPFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THQWGPFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7B91F00A3E;
	Fri,  4 Sep 2026 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538711;
	bh=eoKlz4ggPt3Gzcra02wQE/0rn/SQD5TTds1c3k1Imsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THQWGPFGkX1VrdSnsMY4ngkxLzL9rqmbRf+2JGlFg/uMaoAXAs6z8AwYDOprx0bRf
	 K9sGjVg6vY6PIpA4ch3ZGUyEu6eF3jK1BUj4NxSpgK10YpZUnxasCC0KxIsyXCgTgF
	 prMVLWUK3rMmI6zOcLbiXy98Hk0vYtR4fABnB9siCdMbYjczgl3CKr+uFvp5lizwF0
	 uIqSfyfVPQmVuz71xRMsmRIHcUECb/j0fE6c6oXBB7GiLARP3p3Qk9BmO3kohccj+J
	 PHVWiqgvOytOkTMmvNKRLuGo6aHs592Yt6Z53DABPOjBB9Q+UjWpu/LRdLBnB8FxS8
	 7XP33jDoSX4KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/27] clk: mediatek: pllfh: clear state data in
 mtk_clk_cleanup_pllfhs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-17-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-17-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:18:30 +0000
Message-Id: <20260904161831.4C7B91F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Variables `pll_id` and `ssc_rate` are used uninitialized if device=
 tree property reads fail.
--

commit d96970ce40bb3dd0da1358d2ea7d97e33c5495ae
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pllfh: clear state data in mtk_clk_cleanup_pllfhs

Currently, fhctl_parse_dt function sets some state variables that are
never cleared in the unregister nominal path or register error one.
As they are stored in a static array variable, given as parameter from
the caller function, they retain their values until they are initialized
again by another fhctl_parse_dt call.

> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index 398edad2a69e6..ae56d4ad66dc8 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -244,6 +244,14 @@ static void mtk_clk_cleanup_pllfhs(void __iomem *iom=
em_base,
>  		clk_data->hws[pll->id] =3D ERR_PTR(-ENOENT);
>  	}
> =20
> +	for (i =3D 0; i < num_fhs; i++) {
> +		struct mtk_pllfh_data *pllfh =3D &pllfhs[i];
> +
> +		pllfh->state.fh_enable =3D 0;
> +		pllfh->state.ssc_rate =3D 0;

[Severity: High]
This isn't a bug introduced by this patch, but while we are clearing this
state data here, there appears to be an initialization issue in
fhctl_parse_dt() where pll_id and ssc_rate are populated:

drivers/clk/mediatek/clk-pllfh.c:fhctl_parse_dt() {
    ...
		of_property_read_u32_index(node, "clocks", offset + 1, &pll_id);
		of_property_read_u32_index(node,
					   "mediatek,hopping-ssc-percent",
					   i, &ssc_rate);

		pllfh =3D get_pllfh_by_id(pllfhs, num_fhs, pll_id);
    ...
}

Are these variables used uninitialized if the device tree property reads
fail?

If the clocks or mediatek,hopping-ssc-percent properties are missing or
malformed in the device tree, of_property_read_u32_index() will fail
silently and leave pll_id and ssc_rate unmodified.

On the first iteration, this could result in stack garbage being used to
look up a PLL ID and set its spread-spectrum clocking rate. On subsequent
iterations, the variables might incorrectly reuse values from the previous
clock, applying wrong configurations to the hardware.

Should we be checking the return values of of_property_read_u32_index()
to prevent unexpected PLL state configurations?

> +		pllfh->state.base =3D NULL;
> +	}
> +
>  	if (fhctl_base)
>  		iounmap(fhctl_base);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D17
