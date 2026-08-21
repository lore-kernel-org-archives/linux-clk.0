Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4475B493620;
	Fri, 21 Aug 2026 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329560; cv=none; b=t2WcichjPShUR+1t4dWp8JouK9/rAHrNcJQkQvXrBJYewd+vd4WLlbffo8TqR1i1BXU2g1RtuzbcWeJcyjTt7/43n7ATdnXdG5F5xtX4UsaiJ2hAN4doyPaKLdKDo1whi3ZS8nEgX4nFgJbwNQHImQp+ppgmUgZAN5AZvNY+chM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329560; c=relaxed/simple;
	bh=VLN/aOBG8e+miyEg6lnfvGYV3cCiP5vEuX9s+I/crCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LabXJXPulL/Jf6ZTuzT6rhssKMn6UPh/Em1zsysVNl1k5lRpRtDTLKlv3XFht5STyVIIKlCpge20Zw6iMy8iOEwOT24j/MBn+/4FvKYiRf2i26W26ToLGmkQiJdHbkf5mtqMugo687gIkk8SXvOGZieTJ/CNQXpF9f3iZtFRP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEYhjx7a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEYhjx7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8067C1F000E9;
	Fri, 21 Aug 2026 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329558;
	bh=5t/N2WpM0FEpG2681rmsH6yAfTqKH8itqpwY7PnONeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eEYhjx7a92zTSN3MCzIf7vakkh5c0l0ujMcGNU67ioa4a3uAM1PX3s6x2Iv8dG22D
	 arU7rl0pG8dxwWHMrCRFcDfHB3k4pzzRlAfXkQyYj/Gyqi2pMOpETwS63QrV+CrRgN
	 3r2J0+9aVL6BWaTo7n8ctudXH90P2/1boHKX7AOmCpN4Aq0e9ql6nWQGOOYKt1DERQ
	 4YslK3zHphGBP9DQup2n7q6NyLLifvbVA1PV/CQ1HE1qKUXqAm6SQQyV6/SHwo8Il2
	 liMali9vgpUqvQikPKHSdwybRUyU8MLNbcEZHvIrS1ozLah58LjKCLGSglzI95voRs
	 IlOH+fGPmRQBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 16:25:58 +0000
Message-Id: <20260821162558.8067C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Local branch clocks like `gcc_usb20_master_clk` incorrectly use `B=
RANCH_HALT_VOTED` instead of `BRANCH_HALT`.
--

--- Patch [11]: [PATCH v3 11/15] clk: qcom: Add Global Clock Controller dri=
ver for Kuno ---
commit 87ef960371a78ac9a0bb9691a723f3b871043695
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: clk: qcom: Add Global Clock Controller driver for Kuno

Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
providing the PLLs, root clock generators, gate/branch clocks and resets
used by the peripheral devices.

> diff --git a/drivers/clk/qcom/gcc-kuno.c b/drivers/clk/qcom/gcc-kuno.c
> new file mode 100644
> index 0000000000000..f7401ae315dd0
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-kuno.c

[ ... ]

> +static struct clk_branch gcc_emac0_axi_clk =3D {
> +	.halt_reg =3D 0x71018,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.hwcg_reg =3D 0x71018,
> +	.hwcg_bit =3D 1,
> +	.clkr =3D {
> +		.enable_reg =3D 0x71018,
> +		.enable_mask =3D BIT(0),

[Severity: High]
Does this EMAC clock use the correct halt check? Since enable_reg and halt_=
reg
are the same (0x71018), this appears to be a local branch clock rather than=
 an
APCS voted clock.

Using BRANCH_HALT_VOTED bypasses the halt check entirely, which could allow
the kernel to return from clk_enable() before the clock has physically star=
ted,
potentially causing unclocked hardware accesses. Should this use BRANCH_HALT
instead?

[ ... ]

> +static struct clk_branch gcc_usb20_master_clk =3D {
> +	.halt_reg =3D 0x27018,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x27018,
> +		.enable_mask =3D BIT(0),

[Severity: High]
Similarly, does gcc_usb20_master_clk incorrectly use BRANCH_HALT_VOTED?

Its enable_reg is the same as halt_reg (0x27018), so bypassing the halt che=
ck
might lead to unclocked hardware accesses during device probe or power
management transitions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-kuno-soc-s=
upport-v3-0-196e2b306368@oss.qualcomm.com?part=3D11
