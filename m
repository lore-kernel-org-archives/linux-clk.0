Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115865;
	b=lr2gx6Q7jIIFwDVeGXEHibkFQS7rmueHanlLfXwcPYyci4gxYXfwmGKMClsn4zu20WGT
	 tgzDcF54OaKkzMLyfgQabFYH3qv1q2wfqviFDkSqoCTDeaMg8mAuUfJI2VsFeX+5MQWAh
	 VjZ9anIQk6FO8NOE9rFI4tTLClAEve1G77BnS9YnHL5celxcy6jx2h17XmbBlZY9paKS9
	 q/LHrggip8ugQs9790h7260gmy0P/0u6RIA7N5JGdhJG7gwEFqlRSIYZdg8rabSWA5et/
	 kDNs09j1BlszZTP8my1t93gmyhAzoKqTFaudl8e9ugI8KSNLcTZWBEpl5BYzg1SZyAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115865;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=/3rnoLfYxcukxNlke0yMZhAU9NOtyKWRIQRXPuMfwn8=;
	b=hRPZbWxrBTHbKL/w368uj0HkAANmsQYxYZe6AV5AB28LQjItcmJtGNJW3Utg+Fc14YYa
	 VumS5NTlTMj+O8FqysmcvK/rngw48z9RYlB9csIKrQREJ0PhmTs+ouduxmxFo02Lw4bvj
	 mfwe0R4Nv/ABfkuEkj9MTb+ex1At5cj/0N1wrDyQlACQbK+7Mv9Rb1VYGQwHjXl4uNae2
	 DfWCJA5SBV+lkg2KoplDgrfotONodJWR6jZzFaQKkohLMEubT0LUpXfDnfgp7NToaE6xf
	 jjdXcDJ5xJNMPv1ZqOCWMPKzPqUaJ7y1Io2EBPAI9DYA8/bc++1cgcDR0fX04dHl0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B7060A2623;
	Thu, 19 Nov 2026 19:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B7060A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F2FF19200BB; Thu, 19 Nov 2026 20:17:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EFF4192009D;
	Thu, 19 Nov 2026 19:17:40 +0000 (GMT)
Date: Thu, 19 Nov 2026 19:17:40 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= <zhouyanjie@wanyeetech.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
    Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
    Jerome Brunet <jbrunet+clk@baylibre.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
    hns@goldelico.com, paul@boddie.org.uk
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
In-Reply-To: <20261113190836.470937-4-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
References: <20261113190836.470937-1-f.fainelli@gmail.com> <20261113190836.470937-4-f.fainelli@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Nov 2026, Florian Fainelli wrote:

> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
> new file mode 100644
> index 000000000000..290e23c65707
> --- /dev/null
> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
> + * XBurst secondary CPU reset entry
> + */
> +
> +#include <asm/addrspace.h>
> +#include <asm/asm.h>
> +#include <asm/asmmacro.h>
> +#include <asm/cacheops.h>
> +#include <asm/mipsregs.h>
> +
> +#define CACHE_SIZE	(32 * 1024)
> +#define CACHE_LINESIZE	32
> +
> +	/* The CP0 REIM register only stores the upper 16 address bits. */
> +	.section .text.smp-entry, "ax"
> +	.balign 0x10000
> +	.set noreorder

 What's the point of making this code `noreorder'?  We want to avoid such 
code whenever possible.

  Maciej
