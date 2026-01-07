Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAEB32D0F9
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 14:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794982; cv=none; b=meYsVsQP4f0tOC82Ti8s/Xjxp0syGhYdCpGSvTEoxDnDcbbTd54uoGl8gJKM3RO6SB8qI846cXgElKNdaGZJgJY2nrHw4J7s4XymSLYOswbzSF4nDi+NfUtnlJLRzxSwQfGuBhkNgDfmoyHR2OLTqEWGPTxZeTic6KfNggbqnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794982; c=relaxed/simple;
	bh=e8rwtFUQUxqJFbG3O11kFAVcDgZHEDgTDWHmsZOo5jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVs/Xp2x77JSg1Qh9NqPNBKyRRsEXM8KWkJgG1aLM3N9GYx/PGIrhT6ZN4kOcAvvb99hzryajnP6FT6wb80Z2oq4EDi0XyOdDz5SI4S5Bees7rCeot3iJxqWiMgtoMJa720ukYDawf7mo2HhHANSK9K+EuQiB2lgnxnXom0ywFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b219b2242so488779e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794979; x=1768399779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pEKLjYKYbgGDORfYlp1Nej6aE1A32wXkvoWEkyhoA=;
        b=UithTGZN9wC1WV6EQxqdUz0H1NaK1MDALw8qrP3CCOp2EkySe0OUVFmrVv7HSr2Clx
         Fvt8tqgJ9rHOMhTnbFdEiBcZXib6hBdeqdesPY3z3kH4YY+xWnd1GpQPrSS9j/gihFZB
         oIiZGZJEhxboPJnLKrOq5oWq+2/wQw2NOX/7qDBcdHI7xlVeX4xhTdLM7HODx852DrAq
         B/jp+1dSpTQI/tLJK00GSjqoDbKyuXV7u1gQhJUbM6mPjuOW5CvagkVX1NqCNcFhZv/o
         nfQO48Xj/lcKc6JmpySWB9UmZ9MRSencs75zhAr8CQ4EWNwuPju0uYWK+y/LT7MoMOF7
         Z4wA==
X-Forwarded-Encrypted: i=1; AJvYcCUYparvuIneRBDGW/ly5irNVG8mxy3PPOB31+racCPaRXxici/SjiJIREQ1DeT/So+i4uwtGZP+YnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsM/bUTnagOcceok+TY5DjLrMtjmLW653Qb+Aze2g0YQev/6p
	hqeZ0JoUgATpCCmQqdMxRj9idtPCKsw2U7vVOnYduv4xjl6k7miFqjKfIp/pLN8X
X-Gm-Gg: AY/fxX5QtDadDeQSgXF7vzquO5Lro+wyt2/1xj5ql2YqarGUNOhgTQFbwcuFiXtKMA9
	XmRTkRBsGDKvNLGdDQLEPuNFd4TzaKpkeq4Pil7wBuptzJUMnKjouWe8nssSG4UOPc0nyFy/KsD
	QPd5wAnezVDhRtTcOWzUaBrrTdhBEjOKt74idZ08ZMRz8xr2+0yT1rFPRQ5Cye79Vx+LWMBLD4x
	nE6nl2tu0KPCrQhuuvpoIXK2/phWNiK0xgAvNLr06F8OZqipxF5/ywmgxg2/hBynIwncX//TyHy
	PG82SrZ/jgnS74RNde3DzUrvG51mtH4fQA5ySTfoNglFOcPKWEaBAwZDC+RW6jwy/hqA5KfF38D
	9IFyc6rJ7/8bOT5rMV4I6jPnWVTBQXCcLfvibRBbHG9kWl7n/E9nKyyT7jZ1UwP7HpmVZHmNxw4
	SNiuAi8jT6OfUQouSl9+JJZFHxs9dk2zbzw2WY1idMPu54Kd5+
X-Google-Smtp-Source: AGHT+IEH4/NDD97S9GmQu0K8eLnhcHK49sS/xs13QApdqCN5qyMn1ZhSi2DedhcnmaRwA9TDPaZMZg==
X-Received: by 2002:ac5:ccaf:0:b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-56339dbf03dmr1716347e0c.4.1767794979241;
        Wed, 07 Jan 2026 06:09:39 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a43fe52sm3075619e0c.20.2026.01.07.06.09.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:09:38 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93f63c8592cso499310241.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHcFCcHoCoZA7lgWUKbS6Hm151tYDcq5Cyc6EfPtrCavj2oc+RW/XbkpIqrIXUxXXB3Wo/x94mKDM=@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:5df:d4c5:15ee with SMTP id
 ada2fe7eead31-5ec755c7741mr2420114137.9.1767794978191; Wed, 07 Jan 2026
 06:09:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251127145654.3253992-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251127145654.3253992-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:09:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmqSev9wc+ERBaA+3gvckDgfqKdR=NbVZsZE1Y1SSW1w@mail.gmail.com>
X-Gm-Features: AQt7F2qoVMWYkGk7pUc_vae9K5a8DHzPmjw5pSS4p1G1bF06bJoFVxzAyNbudPE
Message-ID: <CAMuHMdWmqSev9wc+ERBaA+3gvckDgfqKdR=NbVZsZE1Y1SSW1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: handle RZ/T2H register layout
 in PM callbacks
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The register layout for RZ/T2H is not handled inside
> cpg_mssr_suspend_noirq() and cpg_mssr_resume_noirq(), causing a memory
> abort because the wrong code path is taken, as shown below.
>
> Explicitly handle the RZ/T2H register layout in cpg_mssr_suspend_noirq()
> and cpg_mssr_resume_noirq(), similar to how it is done inside
> cpg_mstp_clock_is_enabled() and cpg_mstp_clock_endisable().
>
> [   90.052296] Mem abort info:
> [   90.055420]   ESR = 0x0000000096000007
> [   90.059553]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   90.065697]   SET = 0, FnV = 0
> [   90.069211]   EA = 0, S1PTW = 0
> [   90.072834]   FSC = 0x07: level 3 translation fault
> [   90.078109] Data abort info:
> [   90.081405]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   90.087427]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   90.093169]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   90.099008] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000c60b4000
> [   90.106756] [ffff800082816318] pgd=0000000000000000, p4d=10000000c69ef003, pud=10000000c69f0003, pmd=100000024002b403, pte=0000000000000000
> [   90.120727] Internal error: Oops: 0000000096000007 [#1]  SMP
> [   90.127058] Modules linked in: sha256 cfg80211 spi_nor at24 renesas_usbhs bluetooth ecdh_generic ecc rfkill rzt2h_adc spi_rzv2h_rspi industrialio_adc gpio_keys fuse drm backlight ipv6
> [   90.145201] CPU: 0 UID: 0 PID: 307 Comm: sh Not tainted 6.18.0-rc1-next-20251016+ #47 PREEMPT
> [   90.155006] Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m44 (DT)
> [   90.163041] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   90.170777] pc : cpg_mssr_suspend_noirq+0x4c/0xc0
> [   90.175983] lr : device_suspend_noirq+0x6c/0x22c
> [   90.181309] sp : ffff8000838d3af0
> [   90.185026] x29: ffff8000838d3af0 x28: ffff8000825c016f x27: ffff8000825c01a0
> [   90.192973] x26: ffff8000809feeec x25: ffff8000827bebb8 x24: 0000000000000002
> [   90.200815] x23: ffff8000825c0190 x22: 0000000000000002 x21: 0000000000000000
> [   90.209058] x20: ffff8000827bebb8 x19: ffff000180128010 x18: ffff00033ef92a80
> [   90.217100] x17: ffff000180051700 x16: 0000000000000001 x15: ffff000187afc310
> [   90.224847] x14: 0000000000000254 x13: 0000000000000001 x12: 0000000000000001
> [   90.232793] x11: 00000000000000c0 x10: 0000000000000ab0 x9 : ffff8000838d38b0
> [   90.240540] x8 : ffff000186387410 x7 : 0000000000000001 x6 : 0000000000000000
> [   90.248600] x5 : ffff0001803240d4 x4 : 0000000000000003 x3 : ffff0001803240d0
> [   90.256460] x2 : ffff800082816318 x1 : 000000000000000c x0 : ffff000180324000
> [   90.264208] Call trace:
> [   90.267019]  cpg_mssr_suspend_noirq+0x4c/0xc0 (P)
> [   90.272450]  device_suspend_noirq+0x6c/0x22c
> [   90.277375]  dpm_noirq_suspend_devices+0x1a8/0x2a0
> [   90.282902]  dpm_suspend_noirq+0x24/0xa0
> [   90.287428]  suspend_devices_and_enter+0x310/0x590
> [   90.292790]  pm_suspend+0x1b4/0x200
> [   90.296811]  state_store+0x80/0xf4
> [   90.300676]  kobj_attr_store+0x18/0x34
> [   90.305002]  sysfs_kf_write+0x7c/0x94
> [   90.309232]  kernfs_fop_write_iter+0x12c/0x200
> [   90.314115]  vfs_write+0x240/0x380
> [   90.318041]  ksys_write+0x64/0x100
> [   90.321862]  __arm64_sys_write+0x18/0x24
> [   90.326013]  invoke_syscall.constprop.0+0x40/0xf0
> [   90.331445]  el0_svc_common.constprop.0+0xb8/0xd8
> [   90.336554]  do_el0_svc+0x1c/0x28
> [   90.340375]  el0_svc+0x34/0xe8
> [   90.343900]  el0t_64_sync_handler+0xa0/0xe4
> [   90.348426]  el0t_64_sync+0x198/0x19c
> [   90.352609] Code: 8b040042 b9409004 7100049f 54000240 (b9400042)
> [   90.359639] ---[ end trace 0000000000000000 ]---
>
> Fixes: 065fe720eec6 ("clk: renesas: Add support for R9A09G077 SoC")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
