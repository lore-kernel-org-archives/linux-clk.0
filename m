Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6D568FCA;
	Tue, 29 Sep 2026 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711807; cv=none; b=bys39bDEiJmCN7zucUGs/KUYGtEjeo0GZXgPiDjCzgeoXOHYr6CIGD2FIgQkK20IqQ3WyLsfupMgQlX7LGolpf4vuvarvh61h+i6SfpVo69OiSuqDmSONbBS2+/dtg5hmERxqlmdXIKWjVlyPvpzS5Ryo2fE2PbQzP8DHz6zpNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711807; c=relaxed/simple;
	bh=FVhwdiqVdgD2NrGBTPyzyZ//0RAvThbV6/LmcvgRGFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMwVfUsKeYHNnMW0LGWF8hXAbCGrFQSNewyz8kyg/i4S8MyivKuPbVASokyxTl1SfmQ+jU/ObxJWQK/e6V1saTY9OocyBJtyDM2Jujnyyo/DfkJyxW71mdLMVa/4Xr6ZwoiEdalG5BWnqFzdVE3GYM0MYzhYA7SDc/qWMF7dP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9rkNtyX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9rkNtyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7E21F000FF;
	Tue, 29 Sep 2026 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711806;
	bh=9vXn/nJiT5LKKdyToAfStxMmLBFCxAvb6D9CfPyFgbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9rkNtyXPHFrNp6kSwmo6AgDL0sdzrW+21KTEpUcf/kNZGJqbE0m4mOCt+zRzSP8w
	 EAfLbY1Yu0MHVuaCKlZf7NYyNt04j2VzsTn10UwUYOGAUH72W4g4JwiS66rhqnJDXL
	 TVZeaq2Op9ALi0v+XPc8GV1QkfxuzLRrawsNC546cnP5zZ9zxsJVeBEN224EQYUJrx
	 ukemXUiCb3u0UGC8NCil3gjT3UFgmsiO3baj8kAtcxer9EBlhJjNMzo5Sd0gSKH0GA
	 VXerm/1pRrnw9GSAVwxbGn1ydzWA/HLo97cp6hMwIF08GO5zWbslcJsFQKLUDu9T09
	 kopAzkKn3oDhg==
Date: Tue, 29 Sep 2026 12:56:45 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney@redhat.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
Message-ID: <arwX/SguNGK3FhFm@x1>
References: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
 <arXX3RkaFvEwTySN@thelio>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arXX3RkaFvEwTySN@thelio>

On Thu, Sep 24, 2026 at 07:09:33PM -0700, Drew Fustini wrote:
> On Thu, Sep 24, 2026 at 10:31:51AM -0500, Anirudh Srinivasan wrote:
> > atlantis_clk_gate_shared_enable() increments the refcount for the number
> > of clks requesting the shared gate clk to be enabled always. It should
> > only do this when the enable for the gate took effect in hardware. It's
> > possible to end up in a situation where the gate enable failed, but the
> > refcount is incremented anyway, so subsequent requests by other clks
> > that share the same refcount get ignored and the gate enable is never
> > retried.
> > 
> > Update this function so that the refcount is not incremented when the
> > gate clk enable fails in hardware.
> > 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
> > Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
> 
> I will apply this to tenstorrent-clk-for-next.

Applied to tenstorrent-clk-for-next:

  3f0655b51eb0 clk: tenstorrent: Fix refcount leak on shared gate clk enable failure

Thanks,
Drew
