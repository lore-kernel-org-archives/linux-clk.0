Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461809;
	b=KVhTbzIG1BUpizILyuyRVx+WeUcz8/EFw0Da4H0MzgtEAcGsMouk9WHqwIjd3wa+8NtF
	 N5HDDoLqHvEQQLhJeUgOu11DDUe0AxyaH1iyV+L8HhMq5xX8w13+kclPOIk8d5JP7nH+4
	 CLxtVCH6Aarta4xJxG6vvXbl3+ZmZ1Ijw/lN6y7v/3wjsgakAH8lUH+IQcUPtp8buvJlt
	 fUDR3lR/MdnYVJLBLhG3lSNrcJetpeoiyt4tQ+nXS89aL4OI6IBeUqCJ/zVvlFQkYkiXV
	 FwPmaxMNlvYsY+jDBeZzi9pC3p/WyI27vqSWMRomZcUrV1PeH7rxMdU19luI4nXjq+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
	b=orD8HKUhQJ5G8mnTD1VuMLo24+UvrcwTjDbOa71f+a/bbskPVGhaBIa8Z0bpUvGlw7Xh
	 z/Qh2ouYvidsDOwwP7IyJcz/WhEiW8tWVXb9Kdf8gZXl+IBJHC1CnfWFVXTyi9oTFNj5T
	 U2AXrYmsEgvrBhp7nP1C6zpbQ5LBmIEPKDri1L8s5YKbHh/o5tkp7b+aTkESzgrNOWOP1
	 OUdcEfwMy0Q2vk9Bb7n4K3V3j2A7PGEk5dxF3BvZry7N6yBLQMX5pMiMRnQYrjldmS/G4
	 xlIB1z53k/t0BLLVajgA3v4+CgFa73YG2/CdS0bkzPFRVxAcQ7FU0jz9+P6G0+j54aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=U9qvPAlU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D4606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=U9qvPAlU
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4b9ba815bso20759547b3.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461807; cv=none;
        d=google.com; s=arc-20260327;
        b=EBhCAttYEkfoDca5n79RI40P5Z8S9X3Fy2fAEGMjkCi50ssEzvQj2XIx96AhsILgFP
         sC75tABWBd8zrkY5eCXJ4Im2A72BzurXKJoQ9NiZd5rytZ5owc0cpvLZKzzlC6/D9g3O
         xYToUmMY6cEAcnXqTwrcHqGDbGyamvD7TZb70pGNDWzmfndyYoJbINrPKDlhuA7MTYP6
         1xBGYo58dbY6wd8DbanIpSFCgtkqb0mk0J2BV23HIkIZLVHKJPTdyIVO5GzoQuYjoHel
         H1P+mFCIAkUdIE4z+FQjWb5kxMXxDELefqL5U+SFb/UE4dGk3bmt+Yv5KzdeX1GM6kte
         wAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        fh=BrLxmYl/oibDZZezVonGp+h/2xJzaYShg2DtnGd3RtA=;
        b=sumVxPFnSjsBNh7LRzGYtje9B8aeuV14+w8z0A1nE1qPEbpkL9LTaMkDNAbfy/wgED
         VE7EQOQLALJkDni/ZW2lQihpjtcmwcjK/qe/MQBdjenqqu+E3NlpiadCVkTATsSpPST9
         3i+L0ti+3GSr2gfUyGVHjVh9fdXwucpSn0v6PbtTN2yJ7Ox4Erpw3Su8jbRiwGcwAT4/
         RX+iMG0AzZkM2o/KQfs+/fD6V8FcXM6mDZ0CpBRuasY+pIwrH4+QiE5ZVCwT9iqTEldN
         H3ygK8a0xs+RuJ/W+attKned7pGLw5OwQx5QkPuiQGvWHCEFPUgYtYH93j0j3ARzopbP
         eq6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795461807; x=1796066607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        b=U9qvPAlUpHtmFneiecRFsim+TvMaWm4ZsmGwmpXG/Ehz+i0RIkTrHKownmbVxN7ntu
         ewHOXyDL/whyikpeAFOVehJ4UHeMw6uLqf114NMytXrCR/sb9KzCZbUXC/RleVV2Q8dd
         SS9m8kDNjm8igh1CW8i4HD/NOMSDg9/TVJbGvQiZUeqLAm0xR7in1WFJERYgQHNE89df
         qgWH6YaFnPFXgnpqtBUYZihFSSOiN5Dz1UND8bm5zxQl60sQTInzwS/J+S8KC8FI4aCF
         MBZKDNvWOLLCtuTQnLKb1/J8TxECZzFgYLblKHyVk4uAemVtHrJelnwLbBC2QNGu+aZq
         5Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461807; x=1796066607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        b=N4lo+7GcsbDIQiFdrU/4r6l0c25e+HPrthKsiDFuvzpsERzHdl1zd2brF30ucsvrUi
         Q60yPU4zuBcqECHZCAEDzhKC1CUh0k9DR0lAEtA1/5aCyA04yvrtKuiCUjtQQZUxtHVU
         4ytCPMvqRt1BncC6lNrfC49zs6kBEnXkJlwSiaRbYStGVF19jPO3tV5rkgehwL+qZgHW
         LS1XK+72rEL1TdE0FsCYjIouwbjiqyCssWkz8mOVK+GjFYi6ygbgyqfATYF+VXRckCGr
         ni6iE7UMLv86oY3I6N1ba2cpl7mpou1m3QROljBw2B2GRD7aZXvuMq335mlNAHkaiO3y
         iSHg==
X-Forwarded-Encrypted: i=1; AL+hErFIpl1BdNudqVgDg5ZRLRY1NY2kFF3YfUC46dax8YG8LSl1TQ3BCyy61k3JgkqCnB/4AtEM0xUQ4b4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JDFxe5pd2W1AAitDDfDu8KB3Gev3qVwKlcJpkOuyII7bnVatM
	FkZbA8UNmTS9qUkim55b74LOA2ts0kSq+GlnnnkBL1tzIqdTPMcIUkM17Csz1qP3qSOv7+dCXHj
	Mj3a0QRwXWZBEz8aMpZkiCM2IuoeBBU0n777VHnmFVA==
X-Gm-Gg: AZFdTZdZqr4Z3b6IRNnXuu+oBR7LsSxD+zImpWUZwZwElg8V42KnTp2AEl3bP6LmtC5
	7OLFm+e0kmKsNzoKd+wichAnxqvcNH1u0uwRXOAje8/AATw2TwhuXMW/SfsLRvpJCmH6ns2m/1x
	ZxhirqVqkJWiSGJOjneTqjE7eb2p8CehXtFNBZEudk3nBvWaqUH9LqeJeUL30BM8Zzv8PpWQI30
	N8KhtCvqpX28oY8YxeHinbUOYGRcIldAqfWkFVmM5uEaoMBvcC8dG+1FjkV+6jLxXWotbBIyUdD
	Km9UlUd8TMEgIQIW9z3ax4aSOVx9OQsq9/FITjmm5GXMdw3SJ+oSYKlxJfT9k91/13u4cDGPiPU
	IxIwB56UhF0dngd1Mm2sz4LLNmfbQWRVpBcChs/noxK025quMqFLZvPiwyYSs4AjjWdoWA4OUxJ
	DGunul5YB9qZrtEWd9i7ulhYsJEA==
X-Received: by 2002:a05:690e:47c7:20b0:67d:bbf9:11d5 with SMTP id
 956f58d0204a3-67df443ce21mr4010766d50.55.1795461807055; Mon, 23 Nov 2026
 11:23:27 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-9-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-9-lee@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 23 Nov 2026 13:23:16 -0600
X-Gm-Features: Aa3M54rXx5AsI23DPhI8Gl_apOGxLaDoOy7tWbjmJE6RhLCtQ26K-zDZRMPyVoM
Message-ID: <CAEev2e8KMaN+Vw7usWTiQk=dyOcV5n9PEHB1o7K=cQw=fyoBZg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: tenstorrent: Poll atomically in atlantis_clk_pll_enable()
To: Lee Jones <lee@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Mon, Nov 23, 2026 at 10:49=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> The Common Clock Framework invokes .enable callbacks in atomic context
> with interrupts disabled and enable_lock held.  In atlantis_clk_pll_ops,
> atlantis_clk_pll_enable() is registered as the .enable callback yet
> waits for PLL lock using regmap_read_poll_timeout() with a 500 us sleep
> interval, triggering a sleep-in-atomic bug via usleep_range().
>
> Since the PRCM regmap is backed by MMIO, use
> regmap_read_poll_timeout_atomic() instead.
>
> Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller dri=
ver")
> Closes: https://sashiko.dev/#/bug/linux-980395a6-f282-478a-bf18-b5695a725=
735
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Thanks, I was able to reproduce the bug on the tt-atlantis qemu
machine by using a kernel built with CONFIG_DEBUG_ATOMIC_SLEEP=3Dy,
CONFIG_DEBUG_PREEMPT=3Dy,  CONFIG_PROVE_LOCKING=3Dy.

[    1.895417] BUG: sleeping function called from invalid context at
drivers/clk/tenstorrent/atlantis-prcm.c:329
[    1.896093] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
1, name: swapper/0
[    1.896616] preempt_count: 1, expected: 0
[    1.896990] 3 locks held by swapper/0/1:
[    1.897251]  #0: ff600001808a7938 (&dev->mutex){....}-{4:4}, at:
__driver_attach+0x68/0x11e
[    1.898561]  #1: ffffffff81d70bb8 (prepare_lock){+.+.}-{4:4}, at:
clk_prepare_lock+0x1c/0x80
[    1.899134]  #2: ffffffff81d70b30 (enable_lock){....}-{3:3}, at:
clk_enable_lock+0xb0/0xd8
[    1.899750] irq event stamp: 25978
[    1.899968] hardirqs last  enabled at (25977): [<ffffffff80d12254>]
_raw_spin_unlock_irqrestore+0x4e/0x70
[    1.900552] hardirqs last disabled at (25978): [<ffffffff80767d00>]
clk_enable_lock+0xa0/0xd8
[    1.901195] softirqs last  enabled at (25724): [<ffffffff80053e72>]
handle_softirqs+0x54e/0x590
[    1.901798] softirqs last disabled at (25717): [<ffffffff80054132>]
__irq_exit_rcu+0x1f0/0x25c
[    1.902422] Preemption disabled at:
[    1.902447] [<ffffffff80767d10>] clk_enable_lock+0xb0/0xd8
[    1.903375] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.2.0-00071-g9a0518d4d70d #3 PREEMPTLAZY
[    1.903558] Hardware name: Tenstorrent Atlantis RISC-V Machine (DT)
[    1.903643] Call Trace:
[    1.903687] [<ffffffff8001927a>] dump_backtrace+0x1c/0x24
[    1.903718] [<ffffffff800024ba>] show_stack+0x28/0x34
[    1.903734] [<ffffffff80011262>] dump_stack_lvl+0x60/0x88
[    1.903750] [<ffffffff8001129e>] dump_stack+0x14/0x1c
[    1.903766] [<ffffffff80084b76>] __might_resched+0x23a/0x26c
[    1.903786] [<ffffffff80084be6>] __might_sleep+0x3e/0x62
[    1.903801] [<ffffffff8077fb02>] atlantis_clk_pll_enable+0xd0/0x1aa
[    1.903818] [<ffffffff8076d10a>] clk_core_enable+0x92/0x2fe
[    1.903835] [<ffffffff8076e130>] __clk_register+0x5c4/0x874
[    1.903851] [<ffffffff8076e558>] devm_clk_hw_register+0x44/0x96
[    1.903867] [<ffffffff8077f812>] atlantis_prcm_probe+0xbe/0x18c
[    1.903883] [<ffffffff80806eda>] platform_probe+0x46/0x78
[    1.903899] [<ffffffff80804946>] really_probe+0x86/0x234
[    1.903914] [<ffffffff80804b58>] __driver_probe_device+0x64/0x104
[    1.903930] [<ffffffff80804cba>] driver_probe_device+0x2c/0x98
[    1.903946] [<ffffffff80804e22>] __driver_attach+0x70/0x11e
[    1.903961] [<ffffffff80802908>] bus_for_each_dev+0x60/0xae
[    1.903976] [<ffffffff80804488>] driver_attach+0x1a/0x22
[    1.903991] [<ffffffff80803c36>] bus_add_driver+0xce/0x1d6
[    1.904006] [<ffffffff80805a5a>] driver_register+0x3e/0xd8
[    1.904022] [<ffffffff80806c0c>] __platform_driver_register+0x1e/0x26
[    1.904038] [<ffffffff80e31bc8>] atlantis_prcm_driver_init+0x22/0x2a
[    1.904057] [<ffffffff8001296e>] do_one_initcall+0x76/0x39a
[    1.904073] [<ffffffff80e01416>] kernel_init_freeable+0x2b4/0x33e
[    1.904088] [<ffffffff80d065d4>] kernel_init+0x1e/0x13a
[    1.904103] [<ffffffff8001440e>] ret_from_fork_kernel+0x20/0x3b0
[    1.904119] [<ffffffff80d13c22>] ret_from_fork_kernel_asm+0x16/0x18

This patch fixes the issue.

Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan
