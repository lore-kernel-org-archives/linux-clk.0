Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D6275870
	for <linux-clk@vger.kernel.org>; Fri, 28 Aug 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923428; cv=none; b=A+ZkqbkJmsSeovzkHPxMB5vJ2gk4ZqOOgjTKNnxgX533+udOta/VRFOO1BNQN/h+7fk38k2SGTziXGEPWLnUOBTxbW+WaTuzmu/Q97Uwfv3UB8q5n6g9RBykKRhHK8Z3U/ePolAJLIFjxsq1qfhDTV9qUr/zFxxNMJDug9Y5gCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923428; c=relaxed/simple;
	bh=v7YEdZNqO2mDkew4bb3svzN5OPVXaZ1JprLegsMZiwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kkEc5iDyrN0i89sPiyVfuJkNr4PM2EQweo3iJTYqQb+099xVLCK2os78BiQJ+iQLryFSOKot6By7i9zAsuh1zeQoFp3wnYoJt+HbIRv3Z7rY9sgSZ3whxDmls77icrNT5XIiX/dGQLz1b7XCaznq0skYeR7e+bsOOLeN9mtlUZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhlC9zTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhlC9zTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33271F000E9;
	Fri, 28 Aug 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787923427;
	bh=I5FlGuOFBXzKqU8FnOI3v1TxLJmc5E/vQODYAOD9pOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bhlC9zTdkkRvT+PuHiS4J7h6Q2WJr6v1gFRzCc+rTBgiSb+3cR53JJuun7NmoiKlw
	 V31wfom9cvd0OurTP6jhdidjs1u8zG9OXrEoKwipTtvoci7PcUdngsDdJLk4kI1NKF
	 hgR3vcNTcuW67hkyC3qY4nywW2X/RJharJxSlTieydHc8RDnVMZxg+FQ7heu6IOxER
	 ZQHQ3VVHVGCgclHeFw7vNTuBFcxEVOtxbiuwbIY5kCUi3TIDCLSm7KXP15EC1snxF5
	 FKsEDBqEABrJBe/4CjO7NkZV/AIFKVLMZ7EsfZ7XL9g+GvfqKacddcuWhfd/k9Tzgx
	 qX2XK9I0OJy/Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC/PATCH] clk: add lockdep_ignore_clk_prepare_lock cmdline
 option
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260828131409.962825-1-m.szyprowski@samsung.com>
References: <CGME20260828131428eucas1p2cc2d9767d5ed62b8297c2cff0295226d@eucas1p2.samsung.com>
 <20260828131409.962825-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:23:46 +0000
Message-Id: <20260828132346.E33271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The conditionally compiled `__setup` parameter leaks to the init p=
rocess when CONFIG_LOCKDEP is disabled, breaking systemd boots.
--

commit 85a755ef5489c876625f9877594712083467cf23
Author: Marek Szyprowski <m.szyprowski@samsung.com>

clk: add lockdep_ignore_clk_prepare_lock cmdline option

This commit introduces a new kernel command line parameter,
lockdep_ignore_clk_prepare_lock, to skip dependency tracking for the
prepare_lock class in the clock subsystem. This helps prevent lockdep
from turning itself off due to false positive circular dependencies.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d0..adf7d83c854a9 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -117,6 +117,17 @@ struct clk {
>  	struct hlist_node clks_node;
>  };
> =20
> +#ifdef CONFIG_LOCKDEP
> +static int __init lockdep_ignore_clk_prepare_lock_setup(char *__unused)
> +{
> +	lockdep_set_novalidate_class(&prepare_lock);
> +	pr_warn("lockdep: ignoring prepare_lock class in clock subsystem\n");
> +	return 1;
> +}
> +__setup("lockdep_ignore_clk_prepare_lock",
> +	lockdep_ignore_clk_prepare_lock_setup);
> +#endif

[Severity: High]
Will this break the boot process if a user passes the parameter on a kernel
built without CONFIG_LOCKDEP?

Because the __setup() macro is conditionally compiled inside the
#ifdef CONFIG_LOCKDEP block, the parameter handler is completely omitted wh=
en
lockdep is disabled.=20

When this happens, the kernel treats the unrecognized parameter as an unkno=
wn
positional argument and passes it to the init process.

Standard init systems like systemd strictly interpret unknown positional
arguments as the default boot target (for example, attempting to load
lockdep_ignore_clk_prepare_lock.target). Since this target does not exist,
the system will fail to boot and instead drop into an emergency shell.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828131409.9628=
25-1-m.szyprowski@samsung.com?part=3D1
