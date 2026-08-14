Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62833998;
	Fri, 14 Aug 2026 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786666059; cv=none; b=p5uat3ibwMeFGcumRHTVxU0tR83pR3fgv45OMJvCqx1pMuq7UMr4wa/cJoYgWs6DcXAPPsqPUFohQ5skr1M1Jr6ZGXEc240rZuZdxOQ8tHVJqIeUq/hwGyh0S421u/nvd8UJ0qp+ptBOp3wZhYc5g6C1w3XCQGOSbNEuHegvEoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786666059; c=relaxed/simple;
	bh=F9WN2jcgKH8OBpB3awsYRMXkl8iCX7optOKKQsJHUYQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fCCHx2/dDgeqXxtN3Ms130wC1vXdhFsecEO3tp/DMkECa6j8nhcn4XblQen5uI/EmrjpYXWsHvgrx2iZlCcTApzgdsMp7C/531QuzsNYesAzTRvhN1uCFJbXHMXY6BzysoPaVLExn1dTDEUFBcgtU94j72q1rlKRZtwwLfxDPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k++MjmEz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k++MjmEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF6B1F00A3A;
	Fri, 14 Aug 2026 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786666058;
	bh=kQR/D4f/M0kUr2tiIdmn5AytzPSBzP+a2mASFJEakYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k++MjmEzMmTntXRbL0VXF9t/l6O0PzzA8x1F4zrcMNTVZObvKzVpeq8Sa5fgGEivo
	 4mNAGtqsl6fDrQ92moV+kI6aPUNQF1HN7n8nlmgsmVDzqTmOZLWjMYBbyLpYIvtZHN
	 ntehyupwcmqcV9dWMRXD+Ygt6t7sc8yVH75Xw10n+8wq6/CYJrqsYC9zGAFNYVCbJK
	 UDSNiV/uNT3S0cUqDTsH0dHHJpzVp4xxmzMasUYbdVhdn+Z2cpm6hrGEP1gkrpTGWb
	 vazvvLtYBKsBdTDL3ieCi6E5NM5A3jL+VWXuil4ypgJkbQ7FfZwNgNaCy6AmbpGEqw
	 cbBwI6Oj9YJxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/10] mfd: rz-mtu3: use device-managed reset
 deassert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260410163530.383818-3-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260410163530.383818-3-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 00:07:37 +0000
Message-Id: <20260814000737.EDF6B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized.
- [Low] The newly renamed function `rz_mtu3_mfd_remove` includes the string=
 'mfd'.

Pre-existing issues:
- [High] Child drivers silently overwrite shared parent state (`ch->dev`), =
leading to incorrect PM runtime behavior and potential crashes if one sibli=
ng driver is unbound.
--

--- Patch [2]: [PATCH v2 02/10] mfd: rz-mtu3: use device-managed reset deas=
sert ---
commit 24acc3a25ff8c1834d9bfb7c89b33b5e39d1f472
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: use device-managed reset deassert

Replace devm_reset_control_get_exclusive() and the manual
reset_control_deassert()/reset_control_assert() with handling by
devm_reset_control_get_exclusive_deasserted().

> mfd: rz-mtu3: use device-managed reset deassert

[Severity: Low]
This isn't a bug, but should the description after the subsystem prefix be
capitalized? MFD guidelines typically prefer "mfd: <Driver>: <Capitalized
description>".

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 9cdfef610398f..6b9c6831dffa9 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
[ ... ]
> -static void rz_mtu3_reset_assert(void *data)
> +static void rz_mtu3_mfd_remove(void *data)
>  {
>  	mfd_remove_devices(data);
>  }

[Severity: Low]
This isn't a bug, but does this function name violate the MFD naming
conventions? The guidelines suggest avoiding the string "mfd" in driver,
struct, or device names to prevent hard-coding implementation details.

[Severity: High]
This is a pre-existing issue, but does this design allow child drivers to
silently overwrite shared parent state?

The parent MFD driver allocates a shared array of channels. Both pwm-rz-mtu3
and rz-mtu3-cnt drivers share access to channels 1, 2, and 3.

In drivers/pwm/pwm-rz-mtu3.c:rz_mtu3_pwm_probe(), the PWM child driver
unconditionally sets its own device pointer on the shared channel:

    rz_mtu3_pwm->channel_data[j].mtu->dev =3D dev;

In drivers/counter/rz-mtu3-cnt.c:rz_mtu3_cnt_probe(), the Counter child
driver also unconditionally sets its own device pointer on the same shared
channel:

    ch->dev =3D dev;

Whichever driver probes last will overwrite the pointer. If the surviving
driver calls pm_runtime_get_sync(ch->dev), it will inadvertently invoke PM
runtime on the other driver's device structure.

If that other driver is unbound via sysfs, its PM runtime is disabled,
causing pm_runtime_get_sync() to fail with -EACCES. The counter driver might
ignore this return value and proceed to access hardware registers without
being properly clocked or powered on.

Could this lead to a synchronous external abort or silent data corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260410163530.3838=
18-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D2
