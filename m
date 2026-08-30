Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC13B3BEF;
	Sun, 30 Aug 2026 17:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110722; cv=none; b=q4FRvRsegkaWIe+wk1Dd96FcM3y7+S0Lz59JdIq3JP6Z7aAFQbIqTutgODLdP+L2gOS9yXlLe/z3svSIG76C0rWP4gCW5F95xss3v0Bdb2vLBW5Cbr1zSJ9pzRzOou0gyV0fk5ksVcpgDd1Uslvv6yWpfUj/kgvIUfwwuhRGsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110722; c=relaxed/simple;
	bh=7Kcxt4n4z1wUxpiPg8IIO3Kpa7/+jVPmblGMAR1TAAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6xazcc6JT/jCWRSuKOtNShFkL9nGCQ1WEVORFdPsGBlEKm1ZlZyL5+qVYkJS72LI0ucgGEKE5/1eS7yQ9rV5W/tstlUj/noF76vmw7wQJTqJW7/BsXvF912xI1vAsCev+VWhs7C8lxtAyzxUwb4Y8YUFZ+jJaaO2LUjbQ1zP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=GAo4sAYp; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="GAo4sAYp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=QQV/uWRS7tgfezg/sawm+VTmjnW6NBkrHD0CZvG0/go=; b=GAo4sAYpo7eX+8qk04GvnaEk2z
	dbpNKa9EoHp7mQBVIhlLLlmUa0NwEBc1NxubyY67SeWjNyitZcQEUV/9hT9aUOt5Grh9l7qFn7cwh
	1Gs6b+DS7TTczjg1kkWSozcp1/upncYkp1siitfK9BbGgE4MqEmdpJKAGHpRofd3PhsJia4kHTyL2
	e3tkOjG/vRbllxlYen5j2JFJrK4QpjK1CBNnRs8pHNCXsrK49IfeOZYI6+iTUYovjP0/8jfqKeDRU
	DI+w7pWD98ZT49yqwjpwnQBfWakzDgsk4oMpQj350IMPq+uMeXT7m4YciFKgvdpqtqlAF0CgmWpv2
	RxSz7S2w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0jHF-0000000ACVU-0Zvn;
	Sun, 30 Aug 2026 19:25:05 +0200
Date: Sun, 30 Aug 2026 19:25:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
Message-ID: <apRncBmtm7w0Emwf@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Troy,

On 2026-08-10 16:46, Troy Mitchell wrote:
> K3 boot firmware configures the C2 and C3 CPU clock domains at
> 1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
> currently contain only the 2 GHz overclocking operating point.
> 
> Add the nominal 1.8 GHz configuration as the first entry in both
> tables. This lets determine_rate() and set_rate() select the firmware
> operating point while retaining 2 GHz as a supported overclocking rate.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> The related U-Boot change is available at:
> https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b5a1b3e5cbbee223faf352
> ---
> Changes in v2:
> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>   will be handled in a separate series.
> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>   patch.
> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com

This make sense and looks good:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>

I wonder if it should be backported to stable, as users will deploy 
newer firmware.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
