Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890902F657F;
	Fri, 21 Nov 2025 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702454; cv=none; b=Cb6Dc3gaUryw9InsV0gTICL9K1jNCxlMRxHCzVknDIY46vQS404PcKU8fk3hJVEmaPVJp+AX4kJbnn2AZVysrh3iDNgIVt7K/DqDVQiy65GB4kztCR5BACUO7p2mrW9jIyUovURKv0LzfksJlTrFsJ3/8HK3M23gYGY4FtIRUZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702454; c=relaxed/simple;
	bh=yusO0uQN14S6dK5wVmEdCIvoT5mDHm1dk9z9DY6DrPw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rTitOtuEQpbQtrVZMJD8wye40LZD3YfwNkigBeU5BlwvENO+2nOqE+MYw9k0PoyBWZEiU9ItqQnM1Q7pZ/yhvMQHt0Seeh2sw+ietvHth/evGi+NBtTXkySMR2LO/KdGaBeXBaMJYkB0EYBSIMm4CVjsORCqABl4MLFWPG14vpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7kch2yy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7kch2yy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17684C4CEFB;
	Fri, 21 Nov 2025 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702454;
	bh=yusO0uQN14S6dK5wVmEdCIvoT5mDHm1dk9z9DY6DrPw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j7kch2yyq1xSD0kBpihOVxhsx6tDSVaP/OlwJVyXJra4cjmV1SkWI/9eEir3y64QT
	 Xc7s50VgbQEjF2AMdydhZPcAA7rA9CgZAhsDfKfHRhezr4Wc3+ih0/EzmvxbhaLfr/
	 JXsOcu3BSsVZXFPAp9/owxJMSxq0SertMFTYKEJGHqjK7vlQGQBMtVfg+pyUWYkxTD
	 Ke9TR+sLbcuki54jNodw4/c38iCjNXkHVKRkQI53eoT6j8souvMpaEU5p9UMUfgl6o
	 8obFhCdt7hVCn+9DWYCZDRR5YO1qapPvEFvqyH3W0Ka1SJsY3GtB8YoBlwFkkbZfAF
	 Jpk7vlMW8GTBQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251117190329.1337250-1-cmirabil@redhat.com>
References: <20251117190329.1337250-1-cmirabil@redhat.com>
Subject: Re: [PATCH] clk: spacemit: fix UBSAN warning during probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, dlan@gentoo.org, heylenay@4d2.org, elder@riscstar.com, troy.mitchell@linux.spacemit.com, inochiama@outlook.com, Charles Mirabile <cmirabil@redhat.com>, Yanko Kaneti <yaneti@declera.com>
To: Charles Mirabile <cmirabil@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 20 Nov 2025 19:04:50 -0800
Message-ID: <176369429000.11952.15242492549872244422@localhost.localdomain>
User-Agent: alot/0.11

Quoting Charles Mirabile (2025-11-17 11:03:29)
> When booting with KASAN enabled the following splat is encountered during
> probe of the k1 clock driver:
>=20
> UBSAN: array-index-out-of-bounds in drivers/clk/spacemit/ccu-k1.c:1044:16
> index 0 is out of range for type 'clk_hw *[*]'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc5+ #1 PREEMPT(l=
azy)
> Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10space=
mit 10/01/2022
> Call Trace:
> [<ffffffff8002b628>] dump_backtrace+0x28/0x38
> [<ffffffff800027d2>] show_stack+0x3a/0x50
> [<ffffffff800220c2>] dump_stack_lvl+0x5a/0x80
> [<ffffffff80022100>] dump_stack+0x18/0x20
> [<ffffffff800164b8>] ubsan_epilogue+0x10/0x48
> [<ffffffff8099034e>] __ubsan_handle_out_of_bounds+0xa6/0xa8
> [<ffffffff80acbfa6>] k1_ccu_probe+0x37e/0x420
> [<ffffffff80b79e6e>] platform_probe+0x56/0x98
> [<ffffffff80b76a7e>] really_probe+0x9e/0x350
> [<ffffffff80b76db0>] __driver_probe_device+0x80/0x138
> [<ffffffff80b76f52>] driver_probe_device+0x3a/0xd0
> [<ffffffff80b771c4>] __driver_attach+0xac/0x1b8
> [<ffffffff80b742fc>] bus_for_each_dev+0x6c/0xc8
> [<ffffffff80b76296>] driver_attach+0x26/0x38
> [<ffffffff80b759ae>] bus_add_driver+0x13e/0x268
> [<ffffffff80b7836a>] driver_register+0x52/0x100
> [<ffffffff80b79a78>] __platform_driver_register+0x28/0x38
> [<ffffffff814585da>] k1_ccu_driver_init+0x22/0x38
> [<ffffffff80023a8a>] do_one_initcall+0x62/0x2a0
> [<ffffffff81401c60>] do_initcalls+0x170/0x1a8
> [<ffffffff81401e7a>] kernel_init_freeable+0x16a/0x1e0
> [<ffffffff811f7534>] kernel_init+0x2c/0x180
> [<ffffffff80025f56>] ret_from_fork_kernel+0x16/0x1d8
> [<ffffffff81205336>] ret_from_fork_kernel_asm+0x16/0x18
> ---[ end trace ]---

Applied to clk-next
