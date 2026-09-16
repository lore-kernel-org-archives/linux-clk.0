Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AD282F3E;
	Wed, 16 Sep 2026 04:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532528; cv=none; b=Cr27WD9MYtYtI/HRdPnFA7Oc9I/RMHyQOYKzigm3BcM8CYPWvQ8fuUDm6Ae05MkC/GziKxKfM74e4xaBOk8+Mkr21CSlWTtX0K4JjcxmFkWZpsOD3CkkV4gWz53Jgps/+E2Adc7BDA49okwBLNXZqUHGjjlSq4SGpvdBJs2DTZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532528; c=relaxed/simple;
	bh=2ZoBvsMQEN8KuRfoMVufu+1iofZ9vprOYLkHLdZv1jI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JWMmRAtCiqwfkIgDthlMkaB4lF+4Jy1vATIi9hv1SdEARpvS9ql7HJEifKHXmRulBnD0Rszwxi+IVaEseIIcPO8Z7/YHlbnrklopo6CTC6XGxO0pYNra6iIegjOKwLjqBr6QgrX0/yQ7XoOmGLWiIu0uOQU9XyU7PtRsRBdLxL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCjfGEaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCjfGEaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16331F000FF;
	Wed, 16 Sep 2026 04:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789532527;
	bh=i2/6i6NjdLQPUhiAVCv9t/BFyq06klCfwy4wTgcrPU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCjfGEaQWC1ABR/NESptoa4vCxPjtpuYYe/Bpb60iBeNJjiYGmTaOuHHIMvSW86cl
	 V1a7PWok7xsNcLzzbQmqhRpZwqaPSD0d6FWj3uWfgEVZKfHDxQM/5gcsICsyH9GSjB
	 bhoewRSFiDvM3+z6EgMxlx3rOE7n7APuFRS5RYOw92w+V1tTnSiMzH3p4t2/Bf1LEP
	 esFss7u8FA/2RPuvv4IJfDjvjUds02J1SrG1ljkzhL0Kb6NtGxBXrPw3xMBLvusjbC
	 JqCv25xm4ekl/EJg9WYYB3+vC3q1BiFTis0kOiD2EVOBYKIVowjUkVRFUvsoXDTjyJ
	 kw09YEPuQUYYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_common: Replace ktime-dependent lock
 wait loop with udelay
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxhc3RhaXIgRCdTaWx2YQ==?= <alastair@d-silva.org>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260916041104.239999-1-alastair@d-silva.org>
References: <20260916041104.239999-1-alastair@d-silva.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 04:22:06 +0000
Message-Id: <20260916042206.D16331F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: sunxi-ng: custom udelay loop instead of readl_relaxed_poll_tim=
eout_atomic()
--

commit 303433ce9fcf08821cef4553ec1030effcdd3fb9
Author: Alastair D'Silva <alastair@d-silva.org>

    clk: sunxi-ng: ccu_common: Replace ktime-dependent lock wait loop with =
udelay

This commit replaces the use of readl_relaxed_poll_timeout() in the sunxi-ng
CCU driver with a custom udelay() loop. The goal is to avoid system freezes
caused by timekeeping suspensions during early boot or CPUfreq DVFS scaling
when waiting for PLLs to lock.

> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu=
_common.c
> index 43d8eca6abeed..00daedadb5c83 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c

[ ... ]

> @@ -35,7 +36,14 @@ void ccu_helper_wait_for_lock(struct ccu_common *commo=
n, u32 lock)
>  	else
>  		addr =3D common->base + common->reg;
> =20
> -	WARN_ON(readl_relaxed_poll_timeout(addr, reg, reg & lock, 100, 70000));
> +	for (i =3D 0; i < 100000; i++) {
> +		if (readl_relaxed(addr) & lock)
> +			return;
> +		udelay(1);
> +	}

[Severity: Low]
Does this custom busy-wait loop unnecessarily reinvent the kernel's standard
polling abstractions?

Since ccu_helper_wait_for_lock() executes whenever a PLL lock is waited upon
during clock configuration, such as early boot or CPUfreq transitions, avoi=
ding
ktime dependencies is definitely necessary. However, the kernel already nat=
ively
provides readl_relaxed_poll_timeout_atomic() in <linux/iopoll.h> which is
designed specifically to perform timekeeping-independent hardware polling.

Would it be better to use readl_relaxed_poll_timeout_atomic() here instead =
of
circumventing the standard I/O polling macros with a hand-rolled loop?

> +
> +	if (!(readl_relaxed(addr) & lock))
> +		pr_warn("%s: clock lock timeout\n", clk_hw_get_name(&common->hw));
>  }
>  EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, "SUNXI_CCU");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916041104.2399=
99-1-alastair@d-silva.org?part=3D1
