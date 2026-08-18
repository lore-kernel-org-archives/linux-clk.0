Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8D44A701;
	Tue, 18 Aug 2026 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050166; cv=none; b=R1cAJrz8g+mkmAg8RhI+8xY2Tb+4gaPCYI0u+lo+1P9l79nBnzDca4G0sqBmGwXZPtKBEuDW35QxG3/h5DXGVmgZywvl3qt2/cME+Y4v4qw2zYAV94QXCJPVZNw/0qxXsv8Yz4kra0QQlzOKrZhzelBIy89RaqbU6IklPyOIMfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050166; c=relaxed/simple;
	bh=XCITr2NmfilPL6CGCQr/F1H6/zHrG1sh4IhzokTTZCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kh4+GLUn4DG2CbEyKqF645NoNGOPUZhfukaPRroSD4P4cRtXC6gTguSHysWE4fpS1//Xt8nUm7e/V2Ra7lprp61Zh3O1Rexv68qmVJn0OSHSnwTn1N6zFJVPx9HJE15e1CO/Nt7icO/tSSu6Z+vZiijqwYHSmtqpyrlArvLQOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqxuA0sI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqxuA0sI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3BF1F000E9;
	Tue, 18 Aug 2026 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050164;
	bh=gKHzUEY5XOtJsbVZO5Vd7G0tSDqT5QfVNdlBgJ4pg2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqxuA0sIVZYFnG/GDKASyFv/E+a2vvpawJeaApq/8ylm/bxUw4VJdtnV8fMPTT0IN
	 OiRqn0bB07iWAhJPVbusOQ+6Tkp+89Nmd6Fg/1bxilAw9OmNN/9w8/H02ujIdBRbdo
	 AvmYY5nt649iMixnW8zCqY8ozSVaigiIDITUEK0GhIiyUprLOffLrMVOBtsypGKpXb
	 lla1DeRKJaz4IXdJewcO4+jDuDh05Ji9DfgLi7/sXjgrsHPIracAbgrx7LgKrb6IZh
	 uQdCukpvCcLiPGikJ04rulfsASyXlHrtkn3BZUuiSdl7u1GmrdhO7O+/CsXCqpEOUr
	 Be80AxtjuD88w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260818-cv75-v5-v5-11-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-11-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:49:24 +0000
Message-Id: <20260818104924.7C3BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARCH_AMBARELLA incorrectly selects ARM32-specific config symbols AR=
M_PSCI and HAVE_ARM_ARCH_TIMER.
--

--- Patch [11]: [PATCH v5 11/12] arm64: ambarella: add ARCH_AMBARELLA and C=
V75 EVK DT ---
commit 6d6514ac64e30fc6200e81fab461334ff299c3d2
Author: Long Zhao <longzhao@ambarella.com>

arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT

This commit enables the ARCH_AMBARELLA platform in the arm64 Kconfig and ad=
ds
a minimal device tree for the CV75 SoC and EVK board for console bring-up.

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..cb05eff267a84 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -26,6 +26,14 @@ config ARCH_SUNXI
>  	help
>  	  This enables support for Allwinner sunxi based SoCs like the A64.
> =20
> +config ARCH_AMBARELLA
> +	bool "Ambarella SoC family"
> +	select ARM_PSCI
> +	select HAVE_ARM_ARCH_TIMER

[Severity: Low]
Is it necessary to select ARM_PSCI and HAVE_ARM_ARCH_TIMER for ARCH_AMBAREL=
LA
in arch/arm64/Kconfig.platforms? These config symbols appear to be
ARM32-specific and do not exist in the arm64 Kconfig tree.

> +	select PINCTRL
> +	help
> +	  This enables support for the ARM64 based Ambarella SoCs like CV75.
> +
>  config ARCH_ALPINE

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D11
