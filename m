Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF73E51D6;
	Mon,  6 Jul 2026 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369965; cv=none; b=lwjqDwzAn61wQGyD/OPo2DOCLIoHUiLjXTOugvg2nSdSv5XLM3r9h31Yjn6SNdaTvfs1DrSUDOjnukGfvmJhnh0Wl3hyKxV4gb8u2yqGetiqiTWVh9OLtSoDeZVYBCpo3kwWbOZxE3Jd9OiI7cky6VISoVRe1fIODyI7rQBfTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369965; c=relaxed/simple;
	bh=Ko08GvIsATD7W4fZ0bXn29Idi2JyZAYBxOkITh40uKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh55L6nbvmNhdVJjcWJSW5SvgCzJ7vraTgbsIfy7HQEaC6Pqd6qvZr5WkTX0YT6l0Rm+Xp4Gd9x64kYMHjrvgJp6AD+KCDxvwpCOSTdCArLP8M0ndChozWyEJBOXvNf3S2cXPLYhWBMkJC1WM7C9g0mDH1XIKpMCGmXq+akKe4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtlsOkBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtlsOkBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CAF1F000E9;
	Mon,  6 Jul 2026 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783369962;
	bh=tReoj6mgg/6ZWwSRpcfhoID6uqkN9iVnSNmWeWZLj6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MtlsOkBcbwaEzGOKx6glVk2Oxc6UkoOZWG4QHnn4QW87cklEJV0a8+VzCx/U1PiyI
	 /t6bP9iQNEUYYLoebd5oFk9y0GWGjc09cJOGL5/sHekwxmWqWoZunv8j949RTskHAX
	 XddQZZYhPq6Bk6t4bLjK1fJrvlbHfRnffPdtN5UJ8fOhNdAWSGxQHQjNlUWHehW0Hc
	 vSo+KxNeS72hE/1cT5JbvNoHA1NK9cau08aS84CqVSZwCkWJZjB+jeoMhgcVpoQwnC
	 who+NUvKm2CKS8da5xIZdYGu4q1/9F6KPwA8YXTHDwWdtbqiDwEVvBr1ws9WXMtAFS
	 BndNxoaCXQskw==
Date: Mon, 6 Jul 2026 13:32:41 -0700
From: Drew Fustini <fustini@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: thead: allow COMPILE_TEST builds
Message-ID: <akwQ6Tg2KR9wWXfx@x1>
References: <20260629032814.2344879-1-rosenp@gmail.com>
 <akvj9WXsHJw5-n2p@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akvj9WXsHJw5-n2p@redhat.com>

On Mon, Jul 06, 2026 at 01:20:53PM -0400, Brian Masney wrote:
> Hi Rosen,
> 
> On Sun, Jun 28, 2026 at 08:28:14PM -0700, Rosen Penev wrote:
> > CLK_THEAD_TH1520_AP already allows COMPILE_TEST, but the parent clock
> > Makefile only descends into drivers/clk/thead for ARCH_THEAD.  Use the
> > TH1520 AP clock symbol for the directory gate instead.
> > 
> > This lets the driver build on other 64-bit architectures selected for
> > compile testing without selecting the T-HEAD platform.
> > 
> > Tested with:
> > make LLVM=1 ARCH=loongarch drivers/clk/thead/
> > 
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/clk/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 68145ad91035..d651e4ed3462 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
> >  obj-y					+= sunxi-ng/
> >  obj-$(CONFIG_CLK_TEGRA)			+= tegra/
> >  obj-y					+= tenstorrent/
> > -obj-$(CONFIG_ARCH_THEAD)		+= thead/
> > +obj-$(CONFIG_CLK_THEAD_TH1520_AP)	+= thead/
> 
> Right now, CLK_THEAD_TH1520_AP is the only Kconfig defined in the thead
> subdirectory. What about when/if someone adds a second Kconfig, and
> that's the only one that's enabled?
> 
> Would it be better to have this as obj-y?
> 
> Brian

I think obj-y would make sense. AP is just one of several TH1520 SoC
subsystems with a clock controller. Support may some day be added for
the other controllers.

Thanks,
Drew
