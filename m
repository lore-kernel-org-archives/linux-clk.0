Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404D37B02A;
	Fri, 18 Sep 2026 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751877; cv=none; b=uT6ORkSDGucZdaLW2ibOZLvTXEynjcYFPZgFJfMUOHLod6ugj6rjkbyATfmIt64ILq+DPaacqGkoJtQDidBNRTlCaYzeOEdFicxg9gBRviR/t+2JkS/CfvmN3FCHb163jogxBzXc8CtHFBy/kmo+vbCSuYAgEbZ05p2ZwqIkZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751877; c=relaxed/simple;
	bh=OsGRBU3r1RiQb3s5pIH9fFttv4sN7pT/Kkek+JSmDrw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mxH4YoHKx14x+r0qBHl+WTYRgLbMV6n3yDgheLV8jRnqJ8V78gY0/uiUtO83XBbY+LotM2gGBYts5+oBERrWXuvF+nv4c5MVYuronuj7K5YDQZ+9vkfUey9I6B+fh0yvrt9Qfr3NYamyBCumeHGSBHIwdrz8wXCM8jSgMo8Q3YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJW77chg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJW77chg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9401F000FF;
	Fri, 18 Sep 2026 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751876;
	bh=lUL2BG2GRMVlt9I99FYx0S+3aSrKKk/iYBNDCLDBfQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJW77chgQAQ6HOaIessw8iWce9Ilcc8Tie9hmuer6VhZBHi8rxfPW/U4fM9fqjHXU
	 m7m84qxXL+P6ogOwG5Q8sJ4OxwlHk9PrZ3458Sj+npE9eK4xq822MPobEEEMrYwiL+
	 kgaF15SAETiqEigzD8Ee4F5rutkfB5q/iDNDknhqN3SeJtCxZkr1dr6eE14YuogviM
	 7w28m9YPKspmPs88yeP/8PFdYJobwsR84+PEy8+atAMZYyfpAgW/DXJTs37v7jgix8
	 wwaRVives8Q8sDKLcZ4RslGlqkzBqfgx7tyFBc4S055pmyz4acFOV477dDn1fNrJtA
	 Z4zOA2SRwUG9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] media: vsp1: Add device info entries for VSPD
 on X5H
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-9-dbe9236bfd22@ideasonboard.com>
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
 <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-9-dbe9236bfd22@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:17:55 +0000
Message-Id: <20260918171756.0A9401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: vsp1: missing FCP soft reset for VSPDB_GEN4 in vsp1_reset_w=
pf()
--

commit e44fed2186edca41909b450ebb5d732a1d4b0faa
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

media: vsp1: Add device info entries for VSPD on X5H

Add device info entries for the VSPD so that the driver can match on the
VSPD on the X5H and handle it slightly different hardware configuration.
On the X5H there are two variants, the VSPD (a) and VSPD (b).

> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index 5597595414fe7..627771e305661 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c

[ ... ]

> @@ -870,6 +881,17 @@ static const struct vsp1_device_info vsp1_device_inf=
os[] =3D {
>  		.uif_count =3D 2,
>  		.wpf_count =3D 1,
>  		.num_bru_inputs =3D 5,
> +	}, {
> +		.version =3D VI6_IP_VERSION_MODEL_VSPDB_GEN4,
> +		.model =3D "VSP2-D (b)",
> +		.soc =3D VI6_IP_VERSION_SOC_X5H,
> +		.gen =3D 4,
> +		.features =3D VSP1_HAS_BRU | VSP1_HAS_EXT_DL,
> +		.lif_count =3D 1,
> +		.rpf_count =3D 5,
> +		.uif_count =3D 1,
> +		.wpf_count =3D 1,
> +		.num_bru_inputs =3D 5,
>  	}, {

[Severity: High]
Does vsp1_reset_wpf() also need to be updated to handle this new hardware
variant?

Looking at vsp1_reset_wpf() earlier in this file, the explicit version check
bypasses the reset for VI6_IP_VERSION_MODEL_VSPDB_GEN4:

	if (version =3D=3D VI6_IP_VERSION_MODEL_VSPD_GEN3 ||
	    version =3D=3D VI6_IP_VERSION_MODEL_VSPD_GEN4)
		ret =3D rcar_fcp_soft_reset(vsp1->fcp);

This could leave the attached Frame Compression Processor (FCP) unreset dur=
ing
WPF resets.=20

Since vsp1_reset_wpf() is executed on driver probe and V4L2 stream start/st=
op,
could this cause state desynchronization between the VSP and FCP, leading to
pipeline stalls or failures during streaming operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-epaul-v7-3=
-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com?part=3D9
