Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E555C302;
	Tue, 22 Sep 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091660; cv=none; b=f9ld1OACBJgvELDW4weiK2O/Lk7G7XH04/A+GDG1bnGiH3PZucSoBsq4N9QgkIlhT96ZYeqh0gMXjyyn8PPTgLlhBFAjLlF7NQnOhl6KkSDH4l2ZohUXQ+FpsPUZmVRBjFNM3J4gs6IE4ccfQmVYxgo9WCA1Rs9P+3wBKt1EDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091660; c=relaxed/simple;
	bh=kDYZe9Isj9b+Ra826xLyXXDiqFYFL6qzd51Q/iK4iwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nlGfeLWe8En50yh71ooDJmDvD/8iUmPnmx4G6WMcblbLTUKFPLo/kKEsqmE5ZFKIq+j333OETQ/ILaAvdwEzg80h5jGIRpExY+MgesZL5G2H90e5RaY7QP2EB2d8lji0/XL/QkxYzMpPeQHJBhmissCv91hIwdFZxLbyd4zUxlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHza5Asm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHza5Asm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503E51F00893;
	Tue, 22 Sep 2026 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091659;
	bh=+2B/EQ/wbWwRcAHDyid8TCrXFHZDRjYn65gANyt3TGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CHza5AsmzDVFfK2IAGIueyeySQQwb0MAYP8E9izsRIUIEI8SoLqAVcUGoIZbV/jdQ
	 BLSF7zMM5ceKuRBnwkPOLrA6/3wCg0No0bgygAHGbNbr5NJq6NFW6MIkS0Na/7HEYp
	 vi6CsCi76KCrOUBDkcUcbzUOkPikmEplMUufj3KN36nxgeYd6mrDrYlXgVsVIpDE0M
	 Lpltsdh+qVAb9YBKylsyJeSASIUwA+qI2XyTW/CAZGjNguSTNq4sL8HvCPihs8or+9
	 aRfAiMa2TEZZuhpz43f2Rk6L4cE+bJGI6xOqJ18ECd0KZPwFN1z6zXu7icGnQhT2Gv
	 XpDFA6BrHijzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>
 <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 15:40:59 +0000
Message-Id: <20260922154059.503E51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: build failure due to undefined SUNXI_CCU_M_DATA_WITH_MUX_GATE_=
FEAT
--

commit 6bb15948b143075d4af5280b2df23bac3488c163
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add bus clock gates

This commit adds bus clock gates that control access to the devices'
register interface on the Allwinner A733 SoC. It also marks the ahb-store
and mbus-store clocks as critical.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 37e5fe1b327c0..1543c2d3f305b 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
[ ... ]
> @@ -497,9 +509,118 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk=
, "mbus", mbus_parents, 0x588
>  					   BIT(31),	/* gate */
>  					   CLK_IS_CRITICAL,
>  					   CCU_FEATURE_UPDATE_BIT);
> +static const struct clk_hw *mbus_hws[] =3D { &mbus_clk.common.hw };

[Severity: Low]
Is the SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT macro defined in the current
kernel tree? It looks like this definition for mbus_clk might cause a direct
compilation failure due to the macro being undefined.

[ ... ]
> @@ -734,6 +867,8 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram0_clk,=
 "dram0", dram_parents, 0xc
>  					   BIT(31),	/* gate */
>  					   CLK_IS_CRITICAL,
>  					   CCU_FEATURE_UPDATE_BIT);
> +static SUNXI_CCU_GATE_HWS(bus_dram0_clk, "bus-dram0", ahb_hws, 0xc0c,
> +			  BIT(0), CLK_IS_CRITICAL);

[Severity: Low]
Does this dram0_clk definition also rely on the missing macro? It appears
this location will also fail to compile for the same reason.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-a733-clk-v=
4-0-9c184ebe9ac1@pigmoral.tech?part=3D7
