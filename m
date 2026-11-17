Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934987;
	b=m8UjUZRgrgGSpbwRsIbJfkdMzxWUReDTYwlsEwxLhP3RLPikGVfWcCLMQMyZVXYc5BR6
	 uOHeVSC0ewtcwn6d7/r5kt3N0GboZGKBArRl562Pcpdvkwbo1tMKP2b3hruXSp/RJC7Ke
	 T423m8XX1CboOd5aEKJWhNgXX4dR2Bnr1rtEKzYzVJR3zcCcUwJ5vrpt5IUMZ1A/he5+8
	 biBGnwcTl4gDufiZkJ38h1iYZTSg6ltK6BvLWMLZ60bIGhWtT/xuvIfxXAjIAowbVAt21
	 aVgPg3tm1TOB5QBIStlCcO+7tisJxfNYubEY+f+nzU409/ag38GXNmmu2HAE+EpT/3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934987;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=cIxOkuDgAt3nvVeZJWB6lTTqLbOQW10EnqjTlsgLwjk=;
	b=GQQKBSkdRGbEWOMFUpUlo1PKTow5SOULICXJUdOD4U2l4UzEYliyV3H8Dwq4DeWCqQJq
	 AKV9j9fYZKWMXLyD274eWQF1j7qmosVfWBtQlijRXn2tvgZpobMRFaB7J1IeychIWpDst
	 VvWV5jOy46vwUpE309MyQMg7SuzMKvAb2oTc3XjLoy0BSHIyBwLy+W+DHQOhOjqSNOKDy
	 jGEZghT92pgOs9z/hTFxOCG7eRGbMZeuimzhjFhEUa9KELAHsTaSDri2xrjNq9mobj0aT
	 yAq1f9rEpDfTAaYkJy8yzgawnX4T9br5Vp5g+sCkJaEDnYuEotwmoge8YkjpOdGJdXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E88C606A89B;
	Tue, 17 Nov 2026 17:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E88C606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GT-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 93FB4C05C3; Tue, 17 Nov 2026 17:59:51 +0100 (CET)
Date: Tue, 17 Nov 2026 17:59:51 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	hns@goldelico.com, paul@boddie.org.uk
Subject: Re: [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
Message-ID: <avyIB2SOZwjqnKNc@alpha.franken.de>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>

On Fri, Nov 13, 2026 at 11:08:32AM -0800, Florian Fainelli wrote:
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.
> 
> Changes in v6:
> 
> • Added missing Signed-off-by tag to patch #2
> 
> Changes in v5:
> 
> • Added changelog per-patch
> • Split the generic IPI setup check
> • Added comments explaining both need_resched()
> • Removed void Reviewed/Tested-by tags
> 
> Changes in v4:
> 
> • Enable the secondary CPU clock outside the raw spinlock
> • Mark enumerated CPUs present and assign hardware core IDs
> • Skip generic IPI allocation when the platform supplies both IPI callbacks
> • Fix generic 64-bit builds using CKSEG aliases and pointer-sized assembly macros
> • Reject unsupported CPU offlining with -EOPNOTSUPP
> • Restrict the XBurst SMP idle handler to multicore systems and recheck
>   pending interrupts after flushing the cache
> 
> Changes in v3:
> 
> • Align the second line of the readl_poll_timeout_atomic() per Brian's
>   feedback
> • Collected Paul's R-b and T-b tags
> 
> Changes in v2:
> 
> • Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
> • Renamed JZ4780-specific SMP symbols to XBurst names
> • Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
> • Changed mailbox IRQ allocation failure from panic to logging and returning
> • Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>   added Paul's R-b for patch #1
> • Updated the kernel baseline to include additional upstream fixes
> 
> Florian Fainelli (2):
>   clk: ingenic: Poll JZ4780 CPU1 power status atomically
>   MIPS: Skip generic IPI setup for platform-specific callbacks
> 
> 周琰杰 (Zhou Yanjie) (2):
>   MIPS: Ingenic: Add XBurst SMP support
>   MIPS: CI20: Enable SMP with two CPUs
> 
>  MAINTAINERS                           |   3 +-
>  arch/mips/Kbuild                      |   1 +
>  arch/mips/configs/ci20_defconfig      |   2 +
>  arch/mips/generic/init.c              |   3 +
>  arch/mips/include/asm/ingenic-smp.h   |  20 ++
>  arch/mips/ingenic/Kconfig             |   2 +
>  arch/mips/ingenic/Makefile            |   5 +
>  arch/mips/ingenic/ingenic-smp-entry.S |  54 ++++++
>  arch/mips/ingenic/ingenic-smp.c       | 260 ++++++++++++++++++++++++++
>  arch/mips/kernel/idle.c               |  31 ++-
>  arch/mips/kernel/smp.c                |   6 +-
>  drivers/clk/ingenic/jz4780-cgu.c      |   4 +-
>  12 files changed, 386 insertions(+), 5 deletions(-)
>  create mode 100644 arch/mips/include/asm/ingenic-smp.h
>  create mode 100644 arch/mips/ingenic/Makefile
>  create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
>  create mode 100644 arch/mips/ingenic/ingenic-smp.c
> 

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
