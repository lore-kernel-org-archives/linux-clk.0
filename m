Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C819DF6A;
	Sat, 10 Oct 2026 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647695; cv=none; b=ex+b5nGOctiw5dbUoWxK1qI63lxckG79SxAV6aTblqOz0OIzTy5PoRZ+2yDwlHOnk2FZrL+phK15IcnGOYYigXgoWgA26ibvCfPgTyBiaWd9Fveyy4vvfn4bdbJZSla9rf6eL5gL/QYKPW5lYt6Y1zu7fwOprUYSG6ceOVj6mII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647695; c=relaxed/simple;
	bh=0WnTX6JFAKOwNBzueJdRfq3UFsWECoWcNzTd9e4Y7Rg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=br4xvSM6q19hW8OcaOCjRNG/Wzcu+1w+ubb2+8VWjXepTXFVdyEFe4POjY+TltUfE4OlFxuI5gawJzzo78362BTe+3M0LRwrYZXkqaMgAsgNcha6Nxra7fccfCVANukEx4IEIQ9ynIAhz1y5N/3tloFL6VcjU5mvMJR/vFCiu0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7XUcIsB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7XUcIsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA81F000FF;
	Sat, 10 Oct 2026 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791647693;
	bh=kag0Uy2qggUnzDfGrLenknHgY0Ukpn3ly0Z92YI9DdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X7XUcIsBAkomm7lMoox7C8ecbaXYKE4GRqCeLGVc8byA7/Lp7TVQxzCETpgxKo0gh
	 4+kwBXj0JLEpyM57FR511Ym2Dd2CKJLM5OL1zPZPiefW1osRpNPLvc/kCnAROUnJEx
	 zrGvlX/qi2j18y7o5BsN6KxgB7Cyq8FsQHbTDGJdV7RhxLYP84Vtn/aOMOkgv2UOxQ
	 uUkkrlYfnCFu1NJObfqswOKdmZXEO5KdOKg93+mOLgTMe1By0QG89MA8NG0CJAV8ZJ
	 ZVFDlyJgCNK91MFtMQ9Deett+6AMp/fUvo7Jw4nlw7hm4yBz6qaFGcUA6KKd2aqjBv
	 V70HaepaU9v+w==
Message-ID: <sashiko-outbox-166706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] clk: sunxi-ng: a733: Add bus clock gates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261009-a733-clk-v6-7-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-7-ae8178fce7e8@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 15:54:52 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: sunxi-ng: ahb_store_clk is missing CLK_IS_CRITICAL flag
--

commit f3ca9c131f39f726826090f6af6752e7b39c004c
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add bus clock gates

This commit adds bus clock gates that control access to the device register
interfaces on the Allwinner A733 SoC. It also intends to mark the ahb-store,
mbus-store, and ahb-cpus clocks as critical to prevent access breakage to
boot and storage devices.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[ ... ]

> +static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> +			  0x5c0, BIT(16), 0);
> +
> +/* This gate controls access to the storage controller MMIO registers. */
> +static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
> +			  0x5c0, BIT(24), 0);

[Severity: High]
The commit message notes that the ahb-store clock should be marked as
critical, but the definition of ahb_store_clk here uses 0 for its flags
parameter instead of CLK_IS_CRITICAL.

During late boot, the Common Clock Framework automatically disables any
clocks that have no active consumers holding a reference to them.

Could this omission allow the framework to inadvertently gate the storage
controller MMIO registers, leading to a system freeze or storage probe
failures?

> +static const struct clk_hw *ahb_store_hws[] =3D { &ahb_store_clk.common.=
hw };
> +
> +/* Keep enabled for access to the CPUS domain registers. */
> +static SUNXI_CCU_GATE_HWS(ahb_cpus_clk, "ahb-cpus", ahb_hws,
> +			  0x5c0, BIT(28), CLK_IS_CRITICAL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-a733-clk-v=
6-0-ae8178fce7e8@pigmoral.tech?part=3D7
