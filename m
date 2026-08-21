Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7625237D131
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309985; cv=none; b=pNuTW0PdR9knX7p8Xm8vHZy0ulTSgLpzTo7LcW0vspBFmHpNrnIrV+koy/ATJ+P8Uf/0JAFmGyJufB5JHnkqCgHBjWEmblKqbMG8swtwSA/ryvKuI38IEl9JuUnCLEI8U2S6BwiIZMYmjQlkKHvbrOzE42ZPzo0o7KLqN415w9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309985; c=relaxed/simple;
	bh=18vtLRzZ/1AiNuoaGkYSc9RUHIiM1aUgGl3jXeV3I1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIaLDL8iwcOGb6KLDlmhuP5/LxufAVIfh2RV0KH5jVOOlunNyXRhMa2Lza9YR8tAINXAhsEvgZYfXPfKBmqoGxga/KlSFhPG79UX71rgqusxrcEVAV0rDm1sy4CSayQn/t1lT0kHQoNJOgj62cK1fdU6C32dKkbCN1Pwm1L/+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QzebzRyl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QzebzRyl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2023422C8
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:59:40 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C08B83F66F
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787309984; bh=18vtLRzZ/1AiNuoaGkYSc9RUHIiM1aUgGl3jXeV3I1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzebzRylj8ihqniUoJdGahAd5nV/ey+ZZ8mXmnhD7KJXCrkFCTyjYIfHiNVULRbf9
	 2hwqF/Em4Ba56/1hpM+i+TMz/Qj+8sc66HG6OCeVqdWLyGFfw4NqdEQf0wlEVabtvo
	 WTREMGIj43vKjeO7yGSauKgzYpmO8wkzDm8Cw7lo=
Date: Fri, 21 Aug 2026 11:59:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: versatile: clock: Make sure clk_init_data is
 fully initialized
Message-ID: <aogvlFKhqzwyEwhY@e142607>
References: <cover.1787239869.git.geert+renesas@glider.be>
 <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>

On Fri, Aug 21, 2026 at 10:52:24AM +0200, Geert Uytterhoeven wrote:
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Compile-tested only.
> ---
>  arch/arm/mach-versatile/spc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
> index 7c3191aa3e12d1f3..d3f84819532fa498 100644
> --- a/arch/arm/mach-versatile/spc.c
> +++ b/arch/arm/mach-versatile/spc.c
> @@ -522,7 +522,7 @@ static struct clk_ops clk_spc_ops = {
>  
>  static struct clk *ve_spc_clk_register(struct device *cpu_dev)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	struct clk_spc *spc;
>  
>  	spc = kzalloc_obj(*spc);
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
