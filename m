Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840781A3164;
	Tue, 24 Mar 2026 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311409; cv=none; b=YgVIFHkGaL6R963IOUHp6Pl6xuntUm2FyVaBDRtGczmC022X24hM8NtW8y26g8pbdfTOQvxh0ny48vjgtPwtMKiI/M/wfU6VB3+2RCSCv+34FkRHPVsfiA6fwtDOo+MJDyOoMdxAnX+9ar7s47LkFqIGHxfmcBQO1bcuZ9eItuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311409; c=relaxed/simple;
	bh=Ca+PXClij+qvwk/WuyiLNKc08lqSZDwTDXPUsCLy57E=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ftj15+mBhQ+PmStqXEtzAzJzj0gjBLAf/8D+36N3hoV2+tozMMC407QAtyL3GVvTzGc2aLSCKqkdXcq7BDa78G8sHpUw/4iGMtChwVXSGgAi6wN8TXzb+Bff0fBZuigHjl7/BK2R09ufXrYQmFvBhwRSpqDCF/GNeXNipYIqFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOvI4V4q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOvI4V4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5955FC4CEF7;
	Tue, 24 Mar 2026 00:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311409;
	bh=Ca+PXClij+qvwk/WuyiLNKc08lqSZDwTDXPUsCLy57E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XOvI4V4qkxIdTExZZZVALnKWBsA25W/JxLBUxfIomay9KH7yWmekJevYbz795oeFa
	 U2H9FY+nguPFHlQo0X42MK1WYWq2MUxRzMiEHEfhODbvmQ8Gf82JljuR32/isQn5II
	 tKyIpHA4jmkA6PSkRmlP6tL5zGGcCi3MJrHQEIP42admb3AloWKGMT1zwXnlDqkGw/
	 lslzDl2K7Cex3OQc/O+4XkHAnptid5KHAPaP2Ej/60sCf1v82QF76tD0d8FMLkkaXc
	 UjHCtwU/9D8t0H7O4u0Tw6lgawwqPRIHf9aOF5a8E4wKQ5zojk1M/t2bf7JO3WPg8E
	 n1n/K5IFiSu5g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260320151854.3465248-1-arnd@kernel.org>
References: <20260320151854.3465248-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: qoriq: avoid formwat string warning
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
To: Arnd Bergmann <arnd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Scott Wood <scottwood@freescale.com>
Date: Mon, 23 Mar 2026 17:16:47 -0700
Message-ID: <177431140742.5403.6661881466462506675@lazor>
User-Agent: alot/0.12

Quoting Arnd Bergmann (2026-03-20 08:18:49)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> clang-22 warns about the use of non-variadic format arguments passed into
> snprintf():
>=20
> drivers/clk/clk-qoriq.c:925:39: error: diagnostic behavior may be improve=
d by adding the
>       'format(printf, 7, 8)' attribute to the declaration of 'create_mux_=
common' [-Werror,-Wmissing-format-attribute]
>   910 | static struct clk * __init create_mux_common(struct clockgen *cg,
>       | __attribute__((format(printf, 7, 8)))
>   911 |                                              struct mux_hwclock *=
hwc,
>   912 |                                              const struct clk_ops=
 *ops,
>   913 |                                              unsigned long min_ra=
te,
>   914 |                                              unsigned long max_ra=
te,
>   915 |                                              unsigned long pct80_=
rate,
>   916 |                                              const char *fmt, int=
 idx)
>   917 | {
>   918 |         struct clk_init_data init =3D {};
>   919 |         struct clk *clk;
>   920 |         const struct clockgen_pll_div *div;
>   921 |         const char *parent_names[NUM_MUX_PARENTS];
>   922 |         char name[32];
>   923 |         int i, j;
>   924 |
>   925 |         snprintf(name, sizeof(name), fmt, idx);
>       |                                              ^
> drivers/clk/clk-qoriq.c:910:28: note: 'create_mux_common' declared here
>   910 | static struct clk * __init create_mux_common(struct clockgen *cg,
>=20
> Rework this to pass the 'int idx' as a varargs argument, allowing the
> format string to be verified at the caller location.
>=20
> Fixes: 0dfc86b3173f ("clk: qoriq: Move chip-specific knowledge into drive=
r")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
