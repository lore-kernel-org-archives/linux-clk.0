Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E733A9E2
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 19:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786475855; cv=none; b=NIJ7OpBDvcbKpW1MeYCMUDr4yel3fbbmJXo3Xczr4NZ3vCprV3OwztXST7L+HCPANkMBYLdwfRbhrWr16i7+w6MVwRKiN4XIdUIny7Q6I955nb7HGkHORCtFhREfc0h+EJNtaafzqMJ8tkiO9Ef4rvRHsrahums7tsL3yy+OdNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786475855; c=relaxed/simple;
	bh=zzevo50cVIr9tamtQeb1k/c9Z3opG7q4UdZc6Anl1GE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f3Fdw1z8wmLzmzbnCOZNnYmfv6a2qxyDfMJ3JOnDm9HL6tGIY+wJwSa3+sFKx4Bt6SoEhlqH0OnzIk7eEsbHd8JsXxuI70yAUqVa/Q8eoj81eIVlFazkyCllj1cMiZ9DRC6IU/g1AWt49N4faZ6TN4RuK57Q4fcoKydVYUmP70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEG11D7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEG11D7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9141F000E9;
	Tue, 11 Aug 2026 19:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786475853;
	bh=F69Keg8kKYc4zwwmnqUlykWPilgCePaF0bVdQbtC5xk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lEG11D7fIvEwHTpyNXPrlh9T0OsHtVnwYUtLk3sbtB1c63lNlz30fko5eRnkCgdW2
	 3k1VobostgAW39keWzzNe26OuVKRGwtJPWZCxYp5j70Rr+ZwKuljQHMnX6GSQv8r3g
	 24vxvzEej+qcXSjyxRAFankU9nB76BPa0hzMLhcRVuzGmBw1MIvFDXO3s/TYcmGjiY
	 bDnKbYQDr5oicULPahdZ0WBU2TncwJ3joZKMmcqz/HUkKP+azxD7sgf7xOHftnDV+k
	 vsO/snZgk6XPK5vKMeMVkVRj5sviDqryPnEJ9sTCegHyIscpDqSXCw4X8/k/aWdg77
	 YvjsGMzLwjk2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: davinci: guard da850-specific init data references
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260811190821.117485-1-rosenp@gmail.com>
References: <20260811190821.117485-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 19:17:33 +0000
Message-Id: <20260811191733.CF9141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch uses a non-existent Kconfig macro `CONFIG_COMMON_CLK_DAV=
INCI_DA850` to guard DA850-specific clock definitions, which will unconditi=
onally disable them.
--

--- Patch [1]: [PATCH] clk: davinci: guard da850-specific init data referen=
ces ---
commit 8310fd74805280b1ea31726bf5935e313dcdb916
Author: Rosen Penev <rosenp@gmail.com>

clk: davinci: guard da850-specific init data references

This commit attempts to fix undefined reference link errors in COMPILE_TEST
builds by wrapping DA850-specific clock data and declarations in a new
preprocessor guard.

Closes: https://lore.kernel.org/oe-kbuild-all/202608111912.YS4Vg7Jh-lkp@int=
el.com/

> diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
> index f73b0ac5d8a08..af95dc27f840d 100644
> --- a/drivers/clk/davinci/pll.c
> +++ b/drivers/clk/davinci/pll.c
> @@ -841,17 +841,23 @@ int of_davinci_pll_init(struct device *dev, struct =
device_node *node,
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850

[Severity: High]
Does the CONFIG_COMMON_CLK_DAVINCI_DA850 Kconfig option actually exist?

It appears this should be checking CONFIG_ARCH_DAVINCI_DA850 instead. As
currently written, this guard evaluates to false unconditionally. Will this
cause DA850 devices to fail to boot because their early clocks and match
tables (in both pll.c and psc.c) are no longer compiled in?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811190821.1174=
85-1-rosenp@gmail.com?part=3D1
