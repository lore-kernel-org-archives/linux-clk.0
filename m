Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94132D43C;
	Mon, 24 Aug 2026 12:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574180; cv=none; b=LofD7JPWi4kfawoaMbkq2tI1W2+60L2IUfrjg6BrFTSRBLfy06lgc2WuW6zR95omiAsYmkLihWS7wOnq3Hd68HF41SmCKQoR9+AT89oWUf19YMdSkJlxp6p+yzSnEC4WlWUKiHrJ5d9yfI8GY6ei5qADLQunyuoQGw+W/aBZJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574180; c=relaxed/simple;
	bh=7mq0C7+TGqk/zOniKrXQ1rc7LNWzQoSvkDfFL2+GcmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ORSL4HERtQtRtr77cHdV7ELJD0Unis7nfs4Pf9R8C5wpoChhKbM9E35YPOogCb/HF9B5KLpTP+vd+kYIs8uFFJfHF4Y3tjFU8sZiOa1MzzxpvibLNn1cJEg9mRobhqOX0DJjOdFBfKWnYoXFA1XSFz/LWT3okgjZVHBpk2M0oAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiOAI+Pe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiOAI+Pe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6AE1F000E9;
	Mon, 24 Aug 2026 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574179;
	bh=NtIq8a1zKhN4EUTnwvqgYGJBj6ph7t29n4AUB3eFSsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LiOAI+PewM/z11TTT1ll574l/HQBsvRrkdtbZBc3n6SoV6oJfVVl8VwkuydbJo+xu
	 XuUbEhDQmfDvNTm5q5z7einojHOnDPWVkXiGr2H1y1IXFSKL5ILGjhccWEVxYODwJM
	 gMRIqWKZTdF1EFjaNtgbHxqq0r4yLrjn0H+xusMpy/sp9ekIVGBhpf8ve4gaHU0ot1
	 2cYYeQjfJ4AN/EVVf8Z8/mMB+2ljwVF+Ewk2lQ7dCBGo7YQz/mhpkfR4A7Ncta8CWe
	 1I1CA8X6bERWsB7aJ4lQ/ebs+au4pnAQclYxJfFWwfNQi1b0j3Qrnp1z0wegLq2YzQ
	 BOD8EfUODSj9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 23/47] clk: qcom: gcc-sm6350: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-23-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-23-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:22:58 +0000
Message-Id: <20260824122259.0A6AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The GCC controller will never enter runtime suspend, preventing =
the CX power domain from powering down at runtime as intended due to critic=
al clocks.
--

--- Patch [23]: [PATCH v3 23/47] clk: qcom: gcc-sm6350: Tie the CX power do=
main to controller ---
commit 5be3761ba3c42a260ccac2e7a6451b101d998dad
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm6350: Tie the CX power domain to controller

This commit sets use_rpm =3D true in the gcc_sm6350_desc struct to enable
runtime PM for the GCC controller. The stated intent is to allow the CX
power domain to be powered down once all consumers have released their
clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index a4d6dff9d0f7f..b99a5bc530483 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2545,6 +2545,7 @@ static const struct qcom_cc_desc gcc_sm6350_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sm6350_resets),
>  	.gdscs =3D gcc_sm6350_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm6350_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Will this actually allow the GCC controller to enter runtime suspend?

Looking at drivers/clk/qcom/gcc-sm6350.c, there are multiple clocks
registered with the CLK_IS_CRITICAL flag, such as gcc_camera_ahb_clk.

When use_rpm is set to true, the clock core takes a runtime PM reference on
the GCC device during clock preparation. Since critical clocks are prepared
during initialization and never unprepared, their runtime PM references are
never dropped.

Won't the usage counter permanently stay above zero, preventing the CX power
domain from ever powering down?

>  };
> =20
>  static const struct of_device_id gcc_sm6350_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D23
