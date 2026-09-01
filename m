Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065FC32A3E5
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 13:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267702; cv=none; b=ZL0GZPh/tSgwqV0FDILP3yp2WEOHZTpPqNfmwgK7l9u4Afur/aB4kU63XAm2OtS8NK+cCgn8SlIwtXD4JfRwBNZN1IsncSWj3ku+2HLuWP61t+qKH0RcFlRw6MJfeqCSYIHzLrpQPJ1CyDuRQltXUC7XwJlwid9SsfDuZfuUl5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267702; c=relaxed/simple;
	bh=LgxqvpZJ3ba9Hp2DNcf7FmY+Hx3BSq3J+4CnfdHAjP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TIoLkR9j2p8booB9cPm8edmTAIv3/mCIGILWt50B+Gt2451qwPOOY6oFq2MFGIemYucFh/TryrwpSSN/mZVil7IaEYKDDLgFTl/yt6g0uXnn/0/6CO4LktgrIDBv+IcQ1RL3GHVw3VzH62apUQZb8nMaidIlrhMgI/SWA6qFhjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBh0ZOBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBh0ZOBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878881F000E9;
	Tue,  1 Sep 2026 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267700;
	bh=WNA0/i7/fomC3oS4D0uPMc/JsTNBTsPkyqUj6BeRrBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBh0ZOBPF8DEjyHlYkEkD217k1ohsEdnc23AreEJM1L5BDEPPgVgMyFluq81yHswj
	 qqLwZnXPJnaj4kJmcB5ROfxOIBujrbt5sTVgM211RLoLYdYjgE26CxwsrYpq56vinZ
	 brWqgzcuHGIqJ4l6Y8mcq9VjyuMJuZjB2IM1AzfWUld+xEVyw6p39IFHSdsvfwMfPA
	 eC2ZDUuwNaQ4kB6BHsJLgwRABuBDdNneGL2wKfbTDZc9+bZl5jVLyJ7omZpr2HM2Zc
	 v3+2GfCE3EhRvJvJYK/TbD6aKLFYyqVnxC1KHkzecJD2NKndeK4LpNXEVzeo6MdU3S
	 Ta+5nmbfAnsBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: zynq: return -ETIMEDOUT if the PLL never locks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linkai Gong" <gonglinkai@kylinos.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
References: <20260901125323.1556551-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:01:40 +0000
Message-Id: <20260901130140.878881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing hardware state rollback on PLL lock timeout.
--

commit 91f1719daf95abfb29082ef831a0b53acd17a349
Author: Linkai Gong <gonglinkai@kylinos.cn>

clk: zynq: return -ETIMEDOUT if the PLL never locks

zynq_pll_enable() waits for lock under a spinlock with no timeout. Poll
with a 1ms bound and return the error.

> diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
> index fe90b50e1545d..4e3a1cb40be74 100644
> --- a/drivers/clk/zynq/pll.c
> +++ b/drivers/clk/zynq/pll.c
[ ... ]
> @@ -131,12 +133,12 @@ static int zynq_pll_enable(struct clk_hw *hw)
>  	reg =3D readl(clk->pll_ctrl);
>  	reg &=3D ~(PLLCTRL_RESET_MASK | PLLCTRL_PWRDWN_MASK);
>  	writel(reg, clk->pll_ctrl);
> -	while (!(readl(clk->pll_status) & (1 << clk->lockbit)))
> -		;
> +	ret =3D readl_poll_timeout_atomic(clk->pll_status, reg,
> +					reg & (1 << clk->lockbit), 10, 1000);
> =20
>  	spin_unlock_irqrestore(clk->lock, flags);
> =20
> -	return 0;
> +	return ret;

[Severity: High]
Does this leave the hardware state desynchronized if the PLL fails to lock?

If readl_poll_timeout_atomic() returns -ETIMEDOUT, the function returns the
error directly without restoring the PLLCTRL_RESET_MASK and
PLLCTRL_PWRDWN_MASK bits in the control register.

Because zynq_pll_is_enabled() checks those same bits to determine if the
PLL is enabled:

drivers/clk/zynq/pll.c:zynq_pll_is_enabled() {
    ...
	reg =3D readl(clk->pll_ctrl);
    ...
	return !(reg & (PLLCTRL_RESET_MASK | PLLCTRL_PWRDWN_MASK));
}

A subsequent call to zynq_pll_enable() will falsely succeed since
zynq_pll_is_enabled() will return true, hiding the lock failure. Should we
re-assert the reset and power-down bits in the error path before returning?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901125323.1556=
551-1-gonglinkai@kylinos.cn?part=3D1
