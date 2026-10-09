Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDDB486415;
	Fri,  9 Oct 2026 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561751; cv=none; b=gr4ol9iTruX5UtFFibWlMytT7Lr8PcKTmVUTml53rMZS6elVg0Bchau3CRKMoO5S6xcMLZWeSwcvu8Qplt+D4CdA8IJpV8wFQQJrSefwC/ioOZO5SG1O9BU3qrthhOvRXQphQFLhc7L7J2XRqluEuGbZWbD9Av7FqBx8Xvm267o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561751; c=relaxed/simple;
	bh=hK4lqQjCxlvsA9V74V3pnUsp7f5f2xGamkYrMdykQh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCJV6PIPHQ+7wKv2rbXSC1Z7L5rlYBGEBM9XyjWeymm4UnX8LTO3TXyJrQSv5hvD3j3RWQR0/bsnv2f6xFevSPBuV1qazY7IA+ABF0xaqljs3+BolnFgY8z93PLcAmkBhhoJgDnvn7nJp+MgDNVwK3MjCLufeEVf6qIgDfmarTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5ejimyl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5ejimyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C821F000FF;
	Fri,  9 Oct 2026 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561750;
	bh=F1xs+bG4hxQ2W9Bfte2dsKt1lmKL+T0HavsJVl/e0Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5ejimyl2F8x1bxj7HlmbrkCreypkhCDAugCzxoxKlIVmOsqbGT1QHxI5vIfipc53
	 kX/lf/OXVd8t+zwPd0poWzcrOIMaALlDKqBdXitNmgrnb6rJyeCKYqlra8dSZnfFqD
	 vqXaxIYcNNFqpZIjJobTkyUJgLnih+76/xAzVjzeG7IdWfIfEF61DmKdTkhW3GuVBg
	 dtr/rPIcJHAD3y/jEMZC9C140WEpmC/1h5zQBIo2YwXPd1SsmLn6O00KhWS8AKIMsO
	 ys479OuIdnMCo+SZpVyQ36moj+FC4EGQLZCRUz7kKxKK1jATXTPr1+Gb9L6lXDdf+h
	 H6vZlaS37E1TA==
Date: Fri, 9 Oct 2026 18:02:25 +0200
From: Brian Masney <masneyb@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v7.4
Message-ID: <askQEd-TcJyNr-He@x1g10>
References: <20261009121936.1882361-1-abel.vesa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009121936.1882361-1-abel.vesa@oss.qualcomm.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 09, 2026 at 03:19:36PM +0300, Abel Vesa wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.4
> 
> for you to fetch changes up to 52d4d1b26a5bc64de95099d0a3dd8b90dba1f3a3:
> 
>   clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw() (2026-10-09 10:55:51 +0300)
> 
> ----------------------------------------------------------------
> i.MX clock changes for 7.4
> 
> - Propagate busy timeout errors from i.MX93 composite gate enable.
> - Add 350 MHz support to the fractional-N General-Purpose PLL for
>   i.MX93 display use cases.
> - Fix clock reference leaks in imx_get_clk_hw_by_name() and
>   imx_obtain_fixed_clock_hw().
> 
> ----------------------------------------------------------------
> Linkai Gong (1):
>       clk: imx: composite-93: return timeout from gate enable
> 
> Mikhail Vaniulin (1):
>       clk: imx: fracn-gppll: Add 350 MHz support
> 
> Wentao Liang (2):
>       clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
>       clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()
> 
>  drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
>  drivers/clk/imx/clk-fracn-gppll.c  |  1 +
>  drivers/clk/imx/clk.c              | 15 ++++++++++++---
>  3 files changed, 19 insertions(+), 8 deletions(-)

Merged into clk-next.

Brian
