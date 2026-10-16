Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F352565110;
	Fri, 16 Oct 2026 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171351; cv=none; b=PZP66cBHoXVeTM69I5/f1YXtrOpxAu+pCbc3A9ElREkUG4ZgyNnmle+jNBAJHf8d5+zqEMbi/R5pNoFjz7jKrcwIxxUpS5E72RrHL9mi2KvHZiKU8k4TPi2LkGHa1jatxdLRUMfW7+nZleNVSnMY7g+SvSX4EO9ijtUkfFps3mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171351; c=relaxed/simple;
	bh=ow7WTfAVksuVLAecIlyCWegUz6MklnUTnyuaTQljL+E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MH4D1JC+Ws0HJqTTpLuDpEFFUbT5tVfIo/wmwroVzeK69s19ph7ycOESgGRUHMi8iVtWXyIMEZERuh0LxN3Gd8f4ni/EWsZ75xicdwVblUIruLK+/twMzwbU3r9T4m/ux9t1iIypMFJx6oKX78uoaOsl8UrZcmCfksTxlug5vx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9ALJ6OL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9ALJ6OL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD22C1F000C7;
	Fri, 16 Oct 2026 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171349;
	bh=uuqtsfFc++j/vledyiZTdQ1mK8z1d8kouTyN96/Gd1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9ALJ6OLxRvBq/gucRGvdN7Y8DSAQ8ZT0/xon1C1CwiTcJ9gkk4lgJoz8D3CW3VmS
	 6/FsTmRPJ9OaeM/9oEL6dGlTdMcm1Zpyem51PXrsdLAjWIztXJvcRCB4ZtvyJwMMnK
	 b2q/V8BWw4BCO0in58SIkRGQse5bX/7wni51wsNXkKpfpQhEXH35p3y1xj+xhFc7zr
	 zXAEyuuAJ5jVu7BpsTBU+qeCsJmwt4jlSG5styoxhSjfeRdLh8NzqnAR9ZkTpAOOzR
	 FFJ7lp9gK8aTr6aVTYQfAKPkLBvVjEnQZ2Xq/sB4BVtcsYo1ftM832cjwuFpridxoM
	 Le703PC8M4moA==
Message-ID: <sashiko-outbox-174719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: camcc-sm8250: use icc-clk for camera
 NoC AXI clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 17:22:28 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: camcc-sm8250: premature icc_sync_state on old DT causes syste=
m hang
--

commit efec91c2d7f6b65bf67f582b282617ccb26d996e
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

clk: qcom: camcc-sm8250: use icc-clk for camera NoC AXI clock

CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
rate directly from each consumer means the last writer wins.

Register the clock as an icc-clk path through the common icc_hws
support, as gcc-ipq9574 does. The interconnect core aggregates all
requests and the clock runs at the highest requested rate.

Use the RCG rather than the branch: icc-clk enables the clock at
registration, when TITAN_TOP_GDSC is still off. Consumers enable the
branch themselves.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8=
250.c
> index 21e9423676216..84a91103e5bef 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c

[ ... ]

> @@ -2443,6 +2454,7 @@ static struct platform_driver cam_cc_sm8250_driver =
=3D {
>  	.driver =3D {
>  		.name =3D "cam_cc-sm8250",
>  		.of_match_table =3D cam_cc_sm8250_match_table,
> +		.sync_state =3D icc_sync_state,

[Severity: High]
Could this cause premature state synchronization when booting with an older
Device Tree?

On older DTs where the camcc node lacks the #interconnect-cells property,
the interconnect core skips counting it during initialization:

drivers/interconnect/core.c:of_count_icc_providers() {
	...
	if (of_property_present(child, "#interconnect-cells") &&
	    likely(!of_match_node(ignore_list, child)))
		count++;
	...
}

Because of this, providers_count only reflects the other interconnect
providers. However, since the driver unconditionally registers
icc_sync_state, the driver core will still execute it once the device
probes.

When this executes, the extra call increments the static count in
icc_sync_state without a corresponding +1 in providers_count:

drivers/interconnect/core.c:icc_sync_state() {
	...
	count++;

	if (count < providers_count)
		return;
	...
}

Will this cause the interconnect core to reach providers_count prematurely,
forcing synced_state to true and dropping bandwidth requests on all other
system interconnects before their consumers have probed?

>  	},
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016170701.1504=
338-1-atanas.filipov@oss.qualcomm.com?part=3D2
