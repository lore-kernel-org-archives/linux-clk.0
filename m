Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B4232D7F9
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 19:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766172770; cv=none; b=fxdThJ+6P1x8WgWN15zH9naVPW01Dz65fvKHwdkuCRqr/QCQi0SXSgP5K1njj6ZWUcJgBvmNRJM3ckK995/vovxj0NEpc87Xa93rtrMbIihiIah6oW0PqI/1R83KWt6brAJ3OsL+vdDY8B1PxYApLs1j0uTmpnQWFaNm01zSjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766172770; c=relaxed/simple;
	bh=3kIb5PaWJTv5Meiy1ecCsXsOoIrJW1HzqQZiofEH0Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=el1y7jyjPCHUN+JrAR3Rgy1/4U59/JkiDPwX1nwY4OicmzJaDi9dm0GHAYwtn5mzdI42C+eAPWr98WOcCK2EqD1J57OPELO2MlbntrdUTh7Sr3VlMmr+NKwdJONDw7vdzZfFoTSZRY0V8mfOY+qYnwGdvBGkGuNcCh0UNyOAJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ic1R47kb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEOjDYSY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ic1R47kb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEOjDYSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766172767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bsy3mdlm/wcMmAZZX12T2tp26u7IDK5gsFrOm+g9New=;
	b=Ic1R47kbPCjc91qdqAVNNG2ejq3VLlYpGJXTgaPQCbmf0DY9ilu35o+MuLgcrkp5dxwtKU
	zxjB6tDGt4SHsP3/fYYG8/XvYPL9QC3mNtdG+hvz0MJseGUOTzzRJfnGyU8Ll1qapMi48M
	Lpla/dHTHngqpJWLX8rUkbVKD6HUqgU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-AWIZtPCMNoKgmG5J9GtyIg-1; Fri, 19 Dec 2025 14:32:45 -0500
X-MC-Unique: AWIZtPCMNoKgmG5J9GtyIg-1
X-Mimecast-MFC-AGG-ID: AWIZtPCMNoKgmG5J9GtyIg_1766172765
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so669447585a.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 11:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766172765; x=1766777565; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bsy3mdlm/wcMmAZZX12T2tp26u7IDK5gsFrOm+g9New=;
        b=MEOjDYSYnTuVpy071RI6EZDZ0XPhMHoiWLYt0cETHT/qRsoeAIpM0au5cD4fsvhmdI
         Rsc7mMoiAk0hkGp9fcAyVonvbUHWUjh0e91rYeMVB1L9q8lLMBkR1UX5amTIDaFmOcFb
         1vuP6oEOjULx4HjrTAzBWSexYV1cCwhTCDuQHYQR8V5ZamTh3z44TTJw5016ZT5O5JQF
         20RoFG+CCZL8KYX8SXXgD6Ce4p/awkuw5q4YQLEkZ+4bb4gb1tWx2C5pTZ2T8xkTsYvh
         qdh3hvWh188RaenQ011Z1b9gmHnwlHoMbanPu+uY2dJngbWLzF5d/DTb5zJfCJS40kgN
         Hx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766172765; x=1766777565;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bsy3mdlm/wcMmAZZX12T2tp26u7IDK5gsFrOm+g9New=;
        b=J5ZBzraoKOUd34+3hbdUeRrxcalaPZccQwbpMDSfJRVanGzPvVJtyH6XXgZ9ip+C4n
         EDGrBXzu6axsb+V7TuZtmHARk8Ear3FCJc470MGx+BFPPRgbkEhA3o8E7YI0alLz6BT2
         M8f513EsyHog6mFDOvkD8DHx4zN+j9ppBVri9Y6rlryzYkb920QVAj1snk/dx701FnCE
         GyqQoK6AgMUUx9bpf7lhUBsL3+ctzFEfvZtzNea4tMTEPblWmNApk84H6/JWYZXOVYgm
         nQGv2S7ezuGQQFb8oDZOgwNjfnUlky37P86H6ETeLY9zTO7rfmPqjhnAk4ykw+vRD7mp
         5W+g==
X-Forwarded-Encrypted: i=1; AJvYcCVHlfohzeikvTPZ/5ojxPDX6dkRHCfgUKgMP5eE2s0VcomI9lO+2a5PLvPZM1jtlYUkw8hUBiyo+IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwofQb2zyomuIm+/D2RHrfHelslqqMab1YYljC+tCDfDnqVprTf
	LbrOqjoGLGroyUtOgPgxExahYy1u4lx7AM1jxzEjG3nY2vC9LhVEL8Rl4AGXDXRLWzP59qpsJzV
	0vmlL+bt1D1POt7BAl4ptovGWc0VOJ74GkoBjke63uvtKe8/bT9ufDu8Fd1+9Jg==
X-Gm-Gg: AY/fxX6cEdU/l6f5z8q3RZ4cYP9hvFoYLebB1g2wycsCNJEFOsTttggVKEHaQ2ojAdc
	zgQHfc9Tb7LoYMyMk6BuZYwaiC4UxE9+VaeO2CT4maT2Ag+cHQDmw+5mgbmLQUxyAqDco3+MXQi
	bBzYIJomG+tSG456JhXKbFzBs766n/wKKnJsWgSh0V5ZEcUIWS/5iID80Kxz8TiGl/KKT7KZqRK
	tPpsVZRA2uqhti3L1XL80k74NRwi4efSCn+nFDdHXbT/vmwSqQ/vyb7YxE0cDYJbg5voddDoUY6
	EfJhiVuOTU32rEVKusL+FvsXW1jmRfRNFuoBiaZwe65lSsbcWfkNGE1M6zw8swX50V7Wre64AgC
	C5pzgm1aJ
X-Received: by 2002:a05:620a:28c6:b0:8b3:274c:d9f8 with SMTP id af79cd13be357-8c08fab5bf8mr659813085a.22.1766172764726;
        Fri, 19 Dec 2025 11:32:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6jXx/pJ6yJLMkL8SEFSwefUId8AraZsRhep9+Ucw+RTY73PJ4OfxckFz9DDiO4dvIadDlVw==
X-Received: by 2002:a05:620a:28c6:b0:8b3:274c:d9f8 with SMTP id af79cd13be357-8c08fab5bf8mr659809985a.22.1766172764311;
        Fri, 19 Dec 2025 11:32:44 -0800 (PST)
Received: from redhat.com ([2600:382:8519:53fe:9d9a:13fe:abf1:fb80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f880bsm241678085a.32.2025.12.19.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 11:32:43 -0800 (PST)
Date: Fri, 19 Dec 2025 14:32:41 -0500
From: Brian Masney <bmasney@redhat.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aUWoWbFS6S82CW6m@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <20251205-clk-microchip-fixes-v3-4-a02190705e47@redhat.com>
 <e632211c-7ea5-4b27-8a06-24c160b7e947@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e632211c-7ea5-4b27-8a06-24c160b7e947@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Claudiu,

Sorry about the delay writing back. I was at Linux Plumbers in Tokyo.

On Sat, Dec 06, 2025 at 04:28:31PM +0200, Claudiu Beznea wrote:
> On 12/5/25 21:46, Brian Masney wrote:
> > This driver currently only supports builds against a PIC32 target. To
> > avoid future breakage in the future, let's update the Kconfig and the
> > driver so that it can be built with CONFIG_COMPILE_TEST enabled.
> > 
> > Note that with the existing asm calls is not how I'd want to do this
> > today if this was a new driver, however I don't have access to this
> > hardware. To avoid any breakage, let's keep the existing behavior.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/microchip/Kconfig    |  2 +-
> >  drivers/clk/microchip/clk-core.c | 32 +++++++++++++++++++++++---------
> >  2 files changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> > index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
> > --- a/drivers/clk/microchip/Kconfig
> > +++ b/drivers/clk/microchip/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> >  config COMMON_CLK_PIC32
> > -	def_bool COMMON_CLK && MACH_PIC32
> > +	def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
> >  
> >  config MCHP_CLK_MPFS
> >  	bool "Clk driver for PolarFire SoC"
> > diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> > index f467d7bc28c87a50fb18dc527574f973c4b7e615..fad4b45d908310ffb59e4ed57c55ae4266253444 100644
> > --- a/drivers/clk/microchip/clk-core.c
> > +++ b/drivers/clk/microchip/clk-core.c
> > @@ -9,7 +9,15 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > +
> > +#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)
> 
> Can't we have something like:
> 
> #if defined(CONFIG_MATCH_PIC32)
> #include <asm/match-pic32/pic32.h>
> #else
> #define PIC32_CLR(_reg)		((_reg) + 0x04)
> #define PIC32_SET(_reg)		((_reg) + 0x08)
> #define PIC32_INV(_reg)		((_reg) + 0x0C)
> #define pic32_syskey_unlock()
> #endif

Yes, I agree that would be simpler.

> > +#define PIC32_CLR(_reg)		((_reg) + 0x04)
> > +#define PIC32_SET(_reg)		((_reg) + 0x08)
> > +#define PIC32_INV(_reg)		((_reg) + 0x0C)
> > +#define pic32_syskey_unlock()
> 
> On the other side, there are other drivers using these defines, maybe a
> unified approach would fit better? Maybe moving these to
> include/linux/platform_data ?

I agree that would be the better approach. Specifically:

- Move arch/mips/include/asm/mach-pic32/pic32.h to
  include/linux/platform_data
- Drop the unused include linux/io.h in pic32.h
- Check for CONFIG_MATCH_PIC32 for the pic32_syskey_unlock define. Make
  it a noop for all other architectures.

That would allow us to have the following in the drivers, with no #if's:

#include <linux/platform_data/pic32.h>

I initially wanted to go this route, and I feel that's the best
technical decision, however my only hesitation is that this is going to
touch at least 8 different subsystems. I could probably get the MIPS
folks to take all of this, however it's going to be a pain to collect
all of the ACKs from the different subsystems.

x1:~/src/linux/linus (master %)$ git grep pic32.h
arch/mips/pic32/common/reset.c:#include <asm/mach-pic32/pic32.h>
arch/mips/pic32/common/reset.c:static void pic32_halt(void)
arch/mips/pic32/common/reset.c: pic32_halt();
arch/mips/pic32/common/reset.c: pic32_halt();
arch/mips/pic32/pic32mzda/config.c:#include <asm/mach-pic32/pic32.h>
arch/mips/pic32/pic32mzda/early_clk.c:#include <asm/mach-pic32/pic32.h>
arch/mips/pic32/pic32mzda/early_console.c:#include <asm/mach-pic32/pic32.h>
arch/mips/pic32/pic32mzda/init.c:#include <linux/platform_data/sdhci-pic32.h>
drivers/clk/microchip/clk-core.c:#include <asm/mach-pic32/pic32.h>
drivers/irqchip/irq-pic32-evic.c:#include <asm/mach-pic32/pic32.h>
drivers/mmc/host/sdhci-pic32.c:#include <linux/platform_data/sdhci-pic32.h>
drivers/pinctrl/pinctrl-pic32.c:#include <asm/mach-pic32/pic32.h>
drivers/pinctrl/pinctrl-pic32.c:#include "pinctrl-pic32.h"
drivers/rtc/rtc-pic32.c:#include <asm/mach-pic32/pic32.h>
drivers/tty/serial/pic32_uart.c:#include <asm/mach-pic32/pic32.h>
drivers/watchdog/pic32-dmt.c:#include <asm/mach-pic32/pic32.h>
drivers/watchdog/pic32-wdt.c:#include <asm/mach-pic32/pic32.h>

Thoughts?

> > +#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)
> 
> Same here, can't we have:
> 
> #ifdef CONFIG_MATCH_PIC32
> #define cpu_nop5()			\
> 	do {					\
> 		__asm__ __volatile__("nop");	\
> 		__asm__ __volatile__("nop");	\
> 		__asm__ __volatile__("nop");	\
> 		__asm__ __volatile__("nop");	\
> 		__asm__ __volatile__("nop");	\
> 	} while (0)
> #else
> #define cpu_nop5()
> #endif

Yes that sounds good.

Brian

