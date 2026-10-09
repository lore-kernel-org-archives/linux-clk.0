Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27679397321;
	Fri,  9 Oct 2026 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561554; cv=none; b=qHJkzXJIoVBPjozX3KJugB4E2kxogc44qeKWJ5ngqzdwzY+ZT4X98ruFp4p6X0C94QUFhnaXhXZbZfOAjx/Q66wGVVGKRDOb086QsvL026KiNywq+39izqvtULi3rJuvKhUxG/pGoqyTrX7DhAmXU6pIpIJW99/4hKQA6j+WF3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561554; c=relaxed/simple;
	bh=wnaaT1nqO/Ii0l8aFb7o/PFEOMnVS+Ui+4CihCIIkGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf1I/EVFsl82+CV77EqYkhVaUxC9BU2a2vnQcN4lzn+gS5Vhrrtp4b6L3A7ChZ+fCixcljqg/VHmxpHgnG2uylZj8tF5S+cyPX53v104yFc34nb2N0cR0Qd+61PxgE0Jq4rvmWicqj6Yi8vWzGi9YXLOnhqPKpSA6xfdFT6PhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/oUPf8/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/oUPf8/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542351F000FF;
	Fri,  9 Oct 2026 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561551;
	bh=WfkXHdpcpLPKxJAFSi3EJTz5mjIUGnvIy8zdj94PVfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/oUPf8/UhNiR9fonQpaCJkjH2g0S3nU7rilibnrJa6zwwksFbp3Br4FusMFursCA
	 LwSxDZkXmRB3Z+KMKD2Ab8atR38BG0mQt8yze1hNq1M6LLPcbOhJi0wuWXFUBULjeJ
	 +pL6RU8y60/xBk4PghdJXi2hoVVrtz6+Np/RcS4VDSXkoghR7M99mkaCg3dijCdx4e
	 ROqAf5pqJ7PuL1c3fP1fjQSPWppKpdIMz0EJs0OxuHM/ZEMQ1cOkhKT9iMmoXZIyYP
	 qulXlC0vVWH0/naN2ZG4/jSe9RCaARnlcHBvEgAXK0RxnfONM5iZVppKdiZLoFZBVu
	 8jb0bPazWalXg==
Date: Fri, 9 Oct 2026 17:59:06 +0200
From: Brian Masney <masneyb@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner Clock Changes for 7.4
Message-ID: <askPSvFT1uDZ9sLm@x1g10>
References: <asZYyy4D2PkhjE3q@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZYyy4D2PkhjE3q@home.wens.tw>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Wed, Oct 07, 2026 at 10:35:55PM +0800, Chen-Yu Tsai wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-7.4
> 
> for you to fetch changes up to 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16:
> 
>   clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock (2026-09-20 17:32:54 +0800)
> 
> ----------------------------------------------------------------
> Allwinner Clock Changes for 7.4
> 
> Allwinner sunxi-ng clk library's single divider clk type gained support
> for the update bit, and various single divider clks in the A523 driver
> are converted to correctly use the single divider type.
> 
> The "wait for lock" helper is changed to use atomic MMIO polling, as it
> could be used when timekeeping is not available yet, and *sleep() doesn't
> work correctly
> 
> ----------------------------------------------------------------
> Alastair D'Silva (1):
>       clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock
> 
> Junhui Liu (4):
>       clk: sunxi-ng: div: Add feature support to M clock macro
>       clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU and DRAM
>       clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed timers
>       clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
> 
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 ++++-----
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 128 ++++++++++++++-----------------
>  drivers/clk/sunxi-ng/ccu_common.c        |   2 +-
>  drivers/clk/sunxi-ng/ccu_div.h           |  18 ++++-
>  4 files changed, 89 insertions(+), 96 deletions(-)

Merged into clk-next.

Brian
