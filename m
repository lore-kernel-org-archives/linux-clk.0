Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69249359A9B;
	Sat, 26 Sep 2026 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418513; cv=none; b=iFqGmhQrgj/smhau1A7rGr4SaSzziIY97qEkWFaDuC532p1bB1IH08iUrFHx2IOnFnl/VzM7H8MPd3ljrxIFHD72UTMYOWvVh3NEBFoAfPMfh5RAo4KbRv+1tOTOawqskTy1TTAGFzPxaVJgDPqlY1hah7fEq0U/KV7GUFdWeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418513; c=relaxed/simple;
	bh=GO2cR0RpoClQ4WJScbxMQDjYbDKej/2O7ZhH3MwhzAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VO8cbHU3IxBF6eb/mnCsYS7mwrcKY/hx2DaEvPiXeEOuF4wKKbfEhWGKEfDFareMDA4qUCIfnAGgZBqoMeEqcuZzX/S44phR39v4cjINaucwray0e0X8+km6+C1QjfrLK+lkhyQKMoYOyn9dcaATz79y4tEr508kN5cZjKXsIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007Kk-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 75B67C09D2; Sat, 26 Sep 2026 11:32:00 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:32:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully
 initialized
Message-ID: <areRED8_2Nw7eCFu@alpha.franken.de>
References: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>

On Fri, Aug 21, 2026 at 12:05:15PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This patch is the MIPS subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
> ---
>  arch/mips/alchemy/common/clock.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
