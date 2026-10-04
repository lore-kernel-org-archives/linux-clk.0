Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5530D4A8A1F;
	Sun,  4 Oct 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147545; cv=none; b=c89F+Q/M3QPDGkE3TpjqOEm4Uso+fFsMCQRpqVlakdv6lj8TDrH0HqMgdPjtMA3IH4Zm6/7jmJkRS2tRxmfsZz+sSPXKl47y+cA5noimraQdex4LjwZLmXAjQDZttqFigfbX0hBRh6SLt9s1P272xzpFMBCGAZCAIW2kgtRcAkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147545; c=relaxed/simple;
	bh=XsnWuQORKU40aQdxkQeu0EuexaeFk/5iec9YxXP9chg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XoZYH7MF9sIHg4R1H71WnwQrA8lF2wGCmP2RvdEJAPugZpd0MGVC2miwXhY2LKbQ/qOpQWujSun8blGI7iEAJc7kU2z6snSfueUKnqliYRcP6f2IFmBefnpCDUVIaAE6Wu3Pc4Gs+rNfysQ4ZWkBoK8TRFHPcgVHECgwJ3aKFbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAdFBEiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAdFBEiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62F91F000FF;
	Sun,  4 Oct 2026 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791147544;
	bh=WO3r01epZVnVAEvmu1V/NJ0hmz8YF+vPuPSX4ge8HvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mAdFBEiS1UZ06dbN1UOyPeSAuNQ7L1T59bu7nsJ/nBulxCcxgMrD063z/a3IV6JA4
	 mGi2948o8yoDo7XN/+iWM43HTPsSRv5yPA6G56T5Go4NgW0I1Xja/evzOT7moBXISO
	 Zbw3+YvmmgYjkx34rr4kJN/EVM+YfvFAdtXj/IUA0zCJNlTxvdj7ob7Ko2R1BdpD7B
	 rGro3xRE152x1uI8sgyiAK2QLdp84JtajgfogOMDJC+GPGRJQgMtbJjm9ttOfXQyc/
	 bLkcKpgVwV/VHvYAcfowin5PjCd+9XmRMj/L5Q1RJsYmwWmIywAUGHFcXJHS1L4/uZ
	 rT/BPwptvGSpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 20:59:03 +0000
Message-Id: <20261004205903.E62F91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] clk: nuvoton: ABI breakage by removing HXT from provider's hws=
 array
--

commit 0466ee8e1824bb9d740e5cd18be8fe01b5d4fbe1
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible

This commit modifies the clock driver to retrieve the external HXT and LXT
clocks from the device tree instead of registering them directly. It falls
back to registering LXT for backward compatibility with older device trees.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index ceebcbd8c18b3..ed61a990870e4 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
[ ... ]
> @@ -240,12 +257,18 @@ static int ma35d1_clocks_probe(struct platform_devi=
ce *pdev)
>  		return -EINVAL;
>  	}
> =20
> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);

[Severity: Critical]
Does this unconditional removal break ABI compatibility with older device
trees?

Because HXT (index 0) is exported as a public ABI in the DT bindings,
removing its explicit registration leaves hws[HXT] as NULL in the provider's
clock array. If an existing downstream or older device tree consumer explic=
itly
references this clock via clocks =3D <&clk HXT>, won't the provider's
of_clk_hw_onecell_get() fail to resolve the clock and return an error?

> -	hws[HXT_GATE] =3D ma35d1_clk_gate(dev, "hxt_gate", "hxt",
> -					clk_base + REG_CLK_PWRCTL, 0);
> -	hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
> -	hws[LXT_GATE] =3D ma35d1_clk_gate(dev, "lxt_gate", "lxt",
> -					clk_base + REG_CLK_PWRCTL, 1);
> +	num_clks =3D of_clk_get_parent_count(clk_node);
> +	if (num_clks < 1 || num_clks > 2)
> +		return -EINVAL;
> +
> +	/* Old DTs do not describe the low-speed crystal */
> +	if (num_clks =3D=3D 1)
> +		hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-perso-ma35=
d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com?part=3D3
