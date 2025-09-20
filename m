Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A38634C
	for <linux-clk@vger.kernel.org>; Sat, 20 Sep 2025 04:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758344371; cv=none; b=H1S5RD4ljryZyCeJZPUqWyEAkA9A5c0tScWFCqejlWG4OZhMMW3YHhmDgWeVZUOrox2WS/Np29TWDTVPzpISVxj7NHQMjD+gL7hphSr50eH2Tv8DhZf1pnjygt9NlB8fhf7mq99EC7OHXj97IB5o1RLfv9K7dvHDd+eLD3fbPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758344371; c=relaxed/simple;
	bh=bZwm5S0mm6UMLKOrHzuuiC6Ew59OaikRwm6YhPA3rhk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=swPsrNJFLmhbrgPU3wzEKP3+7512ZfzYuDzIy98o0ykPAdyzghBCoI55C+EbEfCqTgygdcIPe+trsUcc2PwBL8451aQNYnGcs0twHtE7LGAjihENby7T0CR/W1hZH7y3EURfVLR2v3KxKKAKfToUsc4wJLkiYwrYtDWmL+os7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpnRi3YF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpnRi3YF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EB3C4CEEB;
	Sat, 20 Sep 2025 04:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758344371;
	bh=bZwm5S0mm6UMLKOrHzuuiC6Ew59OaikRwm6YhPA3rhk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LpnRi3YFym9rNPfNWPSQrdWW9DUIip1afdsGT/GIkVCzy47vxH7XT1jkxlMO3tCp1
	 t66piTOvhTy17f5uwGzHK9YhZ+b49yFeBhiS9WUHF/t5H7cfBiFLLPRUztUBG13/qA
	 by42+SclnHneA3ZkhRYgtY1S4upCEcxlFONot2yECUFtSRF/K39Wj6YolpVyqbUp1+
	 KRUfvARwPEX08keQX+4DNDJQvgl8ISsmUGE6SlIMIIwtffkc+AWGidHBNX9cx/OuOX
	 Ea4JV8dM055rFulfoiPbhD904F9/rl9gF83H0qDKI/D2Z4PyZms1BXJFjZuplm0Fx3
	 jDw2mwzuS5yzg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250918160601.3286872-1-m.szyprowski@samsung.com>
References: <CGME20250918160614eucas1p1657e57414f7db6a57828fc256e8111a6@eucas1p1.samsung.com> <20250918160601.3286872-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] clk: amlogic: fix recent code refactoring
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Date: Fri, 19 Sep 2025 21:59:30 -0700
Message-ID: <175834437006.4354.11933545174004616373@lazor>
User-Agent: alot/0.11

Quoting Marek Szyprowski (2025-09-18 09:06:01)
> Commit 4c4e17f27013 ("clk: amlogic: naming consistency alignment")
> refactored some internals in the g12a meson clock driver. Unfortunately
> it introduced a bug in the clock init data, which results in the
> following kernel panic:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
00000000000
> Mem abort info:
> ...
> Data abort info:
> ...
> [0000000000000000] user address but active_mm is swapper
> Internal error: Oops: 0000000096000004 [#1]  SMP
> Modules linked in:
> CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc1+ #11158 PREEM=
PT
> Hardware name: Hardkernel ODROID-N2 (DT)
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : __clk_register+0x60/0x92c
> lr : __clk_register+0x48/0x92c
> ...
> Call trace:
>  __clk_register+0x60/0x92c (P)
>  devm_clk_hw_register+0x5c/0xd8
>  meson_eeclkc_probe+0x74/0x110
>  g12a_clkc_probe+0x2c/0x58
>  platform_probe+0x5c/0xac
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0xdc/0x164
>  __driver_attach+0x9c/0x1ac
>  bus_for_each_dev+0x74/0xd0
>  driver_attach+0x24/0x30
>  bus_add_driver+0xe4/0x208
>  driver_register+0x60/0x128
>  __platform_driver_register+0x24/0x30
>  g12a_clkc_driver_init+0x1c/0x28
>  do_one_initcall+0x64/0x308
>  kernel_init_freeable+0x27c/0x4f8
>  kernel_init+0x20/0x1d8
>  ret_from_fork+0x10/0x20
> Code: 52800038 aa0003fc b9010018 52819801 (f9400260)
> ---[ end trace 0000000000000000 ]---

Applied to clk-next
