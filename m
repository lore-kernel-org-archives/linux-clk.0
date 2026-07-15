Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238543C1085;
	Wed, 15 Jul 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099795; cv=none; b=PwbAjWO/G6aIdrtsi531Lof3MQkYvhx7h1HIXKrlGc5foHJNdWZVY6XyftO0cMH7WhQTGo6NW3AiAPVkgqLpl7+saACyZBgW6hxjV8BgPblceuE6cFEQF50l29ftRjTwqHAg88/wsJqO+cYg59rkf8lIw64SKdS2oJRxnide1u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099795; c=relaxed/simple;
	bh=mUUXDzIcw0mcNGG4K9zCUUSQf+YSTow4/aQXUoBMo6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFhevAXc2u6u4XkQ+iaW4eCOuFe8w0/tkR754xKTHvOLNB1LpJLISQBR0R1NXKHfEw5agYM/EZoZmClRNIQL0E9bYuGcX08jC14vorAj8aVLhbXl+4oCgA3eoa+LYRbEws/ImjDhmZGh3epzYklQKueIAV9VvUP61TbQN4XqF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVj0U921; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVj0U921"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA7E1F000E9;
	Wed, 15 Jul 2026 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784099785;
	bh=jQ2rHGVHhZnI1VpFpJARPFPB2YSMCYGI+AO8GVUrX14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HVj0U921ej/t+5c6AGWCAJoX3hiPUwE/UzL5k3L9uziBpL4L9DqbCj2btZS2UDkj1
	 oG8CLHn/uT5bQ0o90s5YDyybwRF460d2FsN885DNr6uFm/BeGMRU5TbXWedrUk8yoS
	 4fll4CioTsNFvSZHLmtmFmNJB0j9Y91qZb7G5dwrOvp5ztxfFhIqlH5I7A3glRcGO6
	 6ZfmYQzo6M8Wyo7LBYxhMlNdF0HVBJIUSdBx3dzE7BLG+kUF0kgX/E7GM7pAou4uSc
	 hEivl/3/DgefFFbpla+gSEroB70OWLv+wli/DyB6v1zIw/Wh5c2pZ7TpYL0tZfVg7D
	 4I7j4dSe356ew==
Date: Wed, 15 Jul 2026 00:16:23 -0700
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
Subject: Re: [PATCHv2] clk: thead: allow COMPILE_TEST builds
Message-ID: <alczxxLUf11F97t8@x1>
References: <20260707005619.1229238-1-rosenp@gmail.com>
 <ak0T7zxwwSn_L57X@redhat.com>
 <ak8/8ixE7IS7kKdz@x1>
 <CABx5tqLynfd-uku+iLNHrnLu4k0rXn=yBi2oU6b2HNEZT=0vaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABx5tqLynfd-uku+iLNHrnLu4k0rXn=yBi2oU6b2HNEZT=0vaw@mail.gmail.com>

On Thu, Jul 09, 2026 at 08:05:40AM -0400, Brian Masney wrote:
> Hey Drew,
> 
> On Thu, Jul 9, 2026 at 2:30 AM Drew Fustini <fustini@kernel.org> wrote:
> > On Tue, Jul 07, 2026 at 10:57:51AM -0400, Brian Masney wrote:
> > > On Mon, Jul 06, 2026 at 05:56:19PM -0700, Rosen Penev wrote:
> > > > Follow the pattern of many other directories in this Makefile (sunxi-ng,
> > > > tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
> > > > select the driver without having CONFIG_ARCH_THEAD enabled
> > > >
> > > > Tested with:
> > > > make LLVM=1 ARCH=loongarch drivers/clk/thead/
> > > >
> > > > Assisted-by: Codex:GPT-5.5
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > >
> > > Reviewed-by: Brian Masney <bmasney@redhat.com>
> >
> > This doesn't apply to 7.2-rc or next for me due to the surrounding
> > context, but I agree with the change itself.
> >
> > Acked-by: Drew Fustini <fustini@kernel.org>
> >
> > Brian - do you think this should be routed through my thead-clk tree or
> > go through the main clk tree?
> 
> It'd be great if you could pick this up through the thead-clk tree.
> 
> Brian

I have applied this thead-clk-for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?id=b2ee00d0bf4cca5dd02702fc339d2b523191966f

If not problems in next, thne I'll create a v7.3 pull request for
thead-clk.

Thanks,
Drew
