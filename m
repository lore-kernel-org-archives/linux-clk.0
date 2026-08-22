Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107B1351C2D
	for <linux-clk@vger.kernel.org>; Sat, 22 Aug 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787393286; cv=none; b=P/nQXwXmktgw2sLmIqjpOoGQi4mDGTwChVHXJQY0Pas8cDdrE/6NzANQ1+7ziqzSu+zzAxsq0x6C5bpHuTgjLrm6i8M1PnhlsyNEJ33v7UgxSiscjtqLwD+SLcG7COUxyt8ldPlM65iiSzSqJUoHSa5KVpRi8t6MxCVjkXiwZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787393286; c=relaxed/simple;
	bh=eFn050gy/9rllf3csD5S8DPnIkx2aAoMjMyCL9y+Bsg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fQVlifGkDOkQN9U5ZW/y649nerPw2lku3mxSfX9nFhdiaBvCdF9g2VC9mMaz5yQqGTZJvGNmG8LRz8aBGc6E1P2gnxGtcYpM5rfWlx9HoT4e/vF+BaujHjjSE2go6nC1vmqaWiLTXnDVpVCkeFDcSeSJFnpobfadKX89xPbozJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwKPyYFW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwKPyYFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9961F000E9;
	Sat, 22 Aug 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787393284;
	bh=be5cKA1YghPdvtiqYO/6wGJ2/nWfF2lc+uo/0No6aws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XwKPyYFWRU2vTUnPtUNsKoTml791Houk8QmxFZ9kTe4ChAd4/rtzJWRGtOHsdIxu2
	 BsVyR2DFbjFY1xxzYQWntAvB14LaV+Hk/XrpOIib/BNYwwS/DXE4VVbBtyvFz0RVRl
	 vSRqd31ISgbSLyWxEbI9M5NjJbYGFkAJheD9q1trawo0vIQin6z1/77UHJu4YUuo5J
	 9aWxYs+Ip2rwOBrZlUyQ50sTCgCsCMpzwFeFQ6MU6mrqhPTiFNkvOS4/b3wwRXrPcY
	 sa8y84kg8lhd2mZSQrXdfkELr/4fACqYBJjgp0wMYhDe0MQc5HfSVvs/1ywj4jtitA
	 HdnavLtaBJzdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] net: macb: Make sure clk_init_data is
 fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
 <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 10:08:03 +0000
Message-Id: <20260822100804.3E9961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The TX error recovery task modifies TX ring pointers and state wit=
hout holding `queue->tx_ptr_lock`, racing with `macb_start_xmit`.
--

--- Patch [1]: [PATCH net-next 1/3] net: macb: Make sure clk_init_data is f=
ully initialized ---
commit 72f05b5fbec22828f860396d626f5a6bbaacd336
Author: Geert Uytterhoeven <geert+renesas@glider.be>

net: macb: Make sure clk_init_data is fully initialized

This commit initializes the clk_init_data structure to prevent issues with
uninitialized mutually-exclusive members when stack initialization patterns
are enabled.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ether=
net/cadence/macb_main.c
> index 1476bce77f34d..319e43098f57e 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing data
race between macb_tx_error_task() and macb_start_xmit() in this file.

Does macb_tx_error_task() race with macb_start_xmit() by modifying TX ring
pointers without holding queue->tx_ptr_lock?

In macb_tx_error_task(), the ring pointers are reset without a lock:

    queue->tx_head =3D 0;
    queue->tx_tail =3D 0;

Concurrently, macb_start_xmit() acquires the lock and updates tx_head:

    spin_lock_irqsave(&queue->tx_ptr_lock, flags);

Since netif_tx_stop_all_queues() only marks the queue as stopped but does n=
ot
wait for an already-executing ndo_start_xmit() to finish, could this race
corrupt the software TX ring pointers?=20

This might lead to out-of-bounds DMA or use-after-free when the
desynchronized ring is subsequently processed after a transmission error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240118.gi=
t.geert+renesas@glider.be?part=3D1
