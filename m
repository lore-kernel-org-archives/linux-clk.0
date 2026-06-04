Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7881A8F84
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559783; cv=none; b=EfJPSb2HI3pLS3DofYmdkCzSwBPktLmNgM+7Z+Xnk8t8YSdHz7dRAnEcJI4h3zr8xK35XiNeI1he4zq+JiDRAD8NdPVJoUmPbCj2y0VAoFowB6I37idA78W+9DelWHB8UfqCwNZzQqq9woGWu+rNL7PadiIG94KmO9RIZlCuEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559783; c=relaxed/simple;
	bh=OL32CLJ5nvjq/kYgIG+An4e4KDrch9ZQ2Nw7UZaXiQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxdIJsyvAU67D659C0Xv8QCBbyB8W1Bzp97fdMpYywhtc9iplQsJgcl4EkuoXuNCfqkr9HtWMPEloFnKSLun6tKqfP69Z1q7B8FAJ/wKUkoz8mC1WPWogWXPCkHLjPf/rZoong8cjD18UgKSHim1XybBRoXcpmqVCjaO3i+wf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68f1e28f258so674701a12.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 00:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559781; x=1781164581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/rC1fo+bW1nAFIVdIH1ju8UCCu+wCVbA2zMBO1aJME=;
        b=fG703OrbuFMv1uPYKW8ZL2UKqP6EBGZJCBMy40pcNdQ5CIypX4ISms6Q9GPjBbBlcF
         B4/t72Xe4M5GvN8zQgUTNRp3VsnuHHgk8FbU+GWN3piB+m7rmBytsMCw2c4lpRW4xPSQ
         YdM4I9LYiGhUx4Z+x4/NcP+C/vmRaeSkuAuO87j7XcmlNCBRt7q5xr+9T4n3pccfaRWh
         NeJd7htJa3Ul2P8eRNxjOEwgKSx8rrxvPCHqIlGUoKU6QQ5qosrPk4a7oBVD6/DbvH8s
         d4KbShxorykQoanQeSYa3Wvy/RTX1Yw8e/p/kbRxIIPmoFbTBUDVK+9HEPeWaRlQBjDs
         ahiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cHnFk2F9enhA3koXC1xoge9UqkZQ92/y7QGjBLFd0Ze9caH2qDA4HRBMvMsJSRWBmgfBzvdDChwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybZslLbSDoiekOOUqAK83uD5Etr/JkhrqkwNgRAYHBAmrSbCNV
	3MjyYRThxOA5kg5srhsU6ruLmFoekYx1wzwXOC5nvSsoHCEJZ0BnIvezJIsicy08KpU=
X-Gm-Gg: Acq92OFuQewj6H3eqTyx4BCthMYGW55m8n2iDEavZSBIVbETNjUuWCwfCyCpo8PosQB
	8gnFemT2MUbt7+flYtV7ktgvTBNHMdEu3sZ/IRdXyp60kN9gi3wkywLneGW2+JZqcT1WFBTLJcg
	Qjg6DKGyfsH2314F54ulWgQ6iYSOBvbTHZxbmiXBTeclzbP5fwuvRlQf86HomRlwsAPb8bX8YdP
	eB2p85EkTCw7bPDJaJKH1arCwqEgSnLd9R/RsxyOOujP5xeubKLXsqYnpN56u9J7Duzg9pArTxt
	sLfWs92O+/ls/Cgdn4XF10lAKfcGilY06NVitCVm2rRDCoDDkJUwgcdode7U71YLILAwf9RYlb9
	pHm0kmsj2bsrAAgUiC5bSWROWY50yhyXFt217GugQSfiIMTx/z/SVIETKkdETy2F2ySnzcm/grX
	s01IfNYgIa/yp8wlFqx1NzeIWM9QCT1v1IIqfPkl0gOrQ7hdZ8t3cMZZVXtMLgA4F/ImRbRY0=
X-Received: by 2002:a05:6402:2681:b0:689:b30c:4205 with SMTP id 4fb4d7f45d1cf-68e6b8cdd2amr3348860a12.0.1780559780753;
        Thu, 04 Jun 2026 00:56:20 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65868049sm2065573a12.24.2026.06.04.00.56.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 00:56:18 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so645246a12.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 00:56:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Bx8OiW1/OmV8O9SxC9BByw4NW7bAaC2/HAf9BpPGpJh5pkuLn/OOcl3y1thXy1fr5TuV3jSjbc8s=@vger.kernel.org
X-Received: by 2002:a17:907:7748:b0:bf1:8faf:d94e with SMTP id
 a640c23a62f3a-bf18fb047c0mr166351166b.40.1780559777705; Thu, 04 Jun 2026
 00:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603213726.1025094-1-heiko@sntech.de>
In-Reply-To: <20260603213726.1025094-1-heiko@sntech.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 09:56:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
X-Gm-Features: AVHnY4IvkoGavCb3kflRroLCR9W-9Zf0z8gdDvwCFWuBrY3WYcj_OOUKtkUAgL4
Message-ID: <CAMuHMdUAoUmCNMBVRGgZzSt9SbZqV6SVW2brkvsBKuHrfWHKvw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: don't COMPILE_TEST builds on M68K
To: Heiko Stuebner <heiko@sntech.de>
Cc: rosenp@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Heiko,

On Wed, 3 Jun 2026 at 23:37, Heiko Stuebner <heiko@sntech.de> wrote:
> Rockchip clock drivers use hash-tables with enums as inputs.
>
> M68K does interesting things in its __hash_32() implementation, casting
> that u32 input to an u16 and therefore triggering warnings like:
>
>    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
>      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (18720 becomes 8720)
>      arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (1e8e8 becomes e8e8)
>
> As M68K should never ever need Rockchip clock drivers, simply disable
> compile-tests for M68K.
>
> Fixes: 7edfb7fb58ee ("clk: rockchip: allow COMPILE_TEST builds")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Thanks for your patch!

> --- a/drivers/clk/rockchip/Kconfig
> +++ b/drivers/clk/rockchip/Kconfig
> @@ -4,6 +4,7 @@
>  config COMMON_CLK_ROCKCHIP
>         bool "Rockchip clock controller common support"
>         depends on ARCH_ROCKCHIP || COMPILE_TEST
> +       depends on !M68K
>         default ARCH_ROCKCHIP
>         help
>           Say y here to enable common clock controller for Rockchip platforms.

Obviously this is the wrong fix ;-)

I have sent a better one, fixing the issue for every user:
"[PATCH] m68k: hash: Use lower_16_bits() helper"
https://lore.kernel.org/b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
