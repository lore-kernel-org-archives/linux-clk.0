Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D344C4FC
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561632; cv=none; b=qLhwJHYpvSFP/GIpDOIU04HMTYbj2I+rfiDiT9vl/r7YYlHE/+HObsC0zT1znojsBy7YsQt3GVYSspv7u1cks4R/oQsI6Q8nya1fkxvpKFNiDsbxFiYCmXSbl/sZoffuuz2gbSPaDMvxikJXGCit4V7TLBBXfa7vOSryvfpK8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561632; c=relaxed/simple;
	bh=kWI/GwkUHsURt/etdmD78k3BS42iR/PxS1Pmw2L32IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3JhFFsNONqJZOC7CscZGSOs5jFzYiQIN1p5kx8m1j5z/DMaCxRDJsFVWTrA8XCsMAkUbj9G6l89sfEdlJdlgnkXD8TncJ5yN2kVOU+BWrQDlpPB4DCQxgPApJBMuuyztpwab90LiafHkwRZnI8mXmtKvkGcT3oWBWgMTMMRBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maCEIYo8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maCEIYo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9308C1F000FF;
	Fri,  9 Oct 2026 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561630;
	bh=hWTenR5YC2YMjhDuvk9A2yXJnKk/ZQ56xcQyeGydI7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=maCEIYo8tzyianSQ6J7d2atk7rkqhW4hyyVxuAu4YgxODBI/YpM5kTDUUKXkfCfZP
	 /Zf3Ds/OMTpuECGVogXFQhN+EMgmUejivUtKLc/2gQJzcMqOvbtEpfvaeKrnSraNb7
	 LHMSUHQftEMKiBnQCB1wu2gxCmDjYqBXc5sJG6Bty1aA1hToHl/TEQrSm6JVG8uFI8
	 IVzB4UeWJ3klXI4nUJi6YMmBJl70XYYghnW8zC+njGx4ZwgckcaUiN/V2ol/SCmkyS
	 Zb/HdA/+ixouIFOo6I0vqGx6o1k5jzAa7jxgiSWf0NNP9TAjqzSwZY3Ap+/Pl0kAXv
	 0a7vTf7R2AdTA==
Date: Fri, 9 Oct 2026 18:00:26 +0200
From: Brian Masney <masneyb@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org, alexandre.belloni@bootlin.com,
	nicolas.ferre@microchip.com, conor@kernel.org
Subject: Re: [GIT PULL] Microchip clock updates for v7.4
Message-ID: <askPmqr8P0tLJpz2@x1g10>
References: <20261009061636.30104-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009061636.30104-1-claudiu.beznea@tuxon.dev>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 09, 2026 at 09:16:36AM +0300, Claudiu Beznea wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-7.4
> 
> for you to fetch changes up to 77cccf570d0de540d5062944f3555cade23b51f7:
> 
>   clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc() (2026-10-08 23:30:31 +0300)
> 
> ----------------------------------------------------------------
> Microchip clock updates for v7.4
> 
> This update includes:
> - a cleanup patch to drop unneeded cast
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc()
> 
>  drivers/clk/at91/clk-main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into clk-next.

Brian
