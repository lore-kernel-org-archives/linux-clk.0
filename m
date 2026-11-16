Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802056;
	b=fNN+nugd4k4b/gm42A/pR0blqu2H8GYGb48q1Y5RS2nuFFpTRR3meMLoL0DJijpTYJqQ
	 z7lrD6GmBlFOXSSOUZEv6YYI3auopuWOjN7XSgjluUlVPwjNs8RMxt1sId3d4js9LjTdK
	 TuXgd8ixiaBlB6j11CC2KTolqutxS3uK0Zr2HH5LBjJsROKv5nAdMEFq3ITpDA67gCZ9M
	 WAVQlVUXj+tImymYQCuq5biESBRDg1N+bVSNsPz7b0vVQiDxNWvAjds/Qb/7qsoXjRuPf
	 4lCaBI0sYBY0eBkILKw6eyevWeMhoNOh68wITaTURCsBD/2WuVkL6XuG6AlWRM8Fynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802056;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=POgJ0lr1p32tYYsOR7CFXhP4Km/ENY10BeM38jrQKX0=;
	b=oMvItPLt34ja8lYDvqm6T7DguZRnE6qvMW/TThHpLkLgeI+AewVpbas9WRQ00w7x0ekU
	 bSq3kL94vKZOT4S57it7GS/7iI2ovMWN32v41FzGeD4btG6C/evoiUqQBN9C/tBqpumKW
	 q3jft19OmRuwQNAXynDfRjkAPlGuaxzkTkx1XjNpbam2RDMVErGYVTv19fVBnL3Nt4w2c
	 ox6SbHb9X7FOvfe7fnwv1hNXbMthlZofHI934BwT+NZ25B53vnaUPIN90KLJETHAF+0kQ
	 4zonzXEekgHPI4nSyZgxeGA2tZEIBDqvUEAMK/7cJqdOtPALt2a2qLlEBp/04rNV1RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtnmeSOn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C1606A31F
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 04:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtnmeSOn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31CC1F000C4;
	Mon, 16 Nov 2026 04:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802056;
	bh=POgJ0lr1p32tYYsOR7CFXhP4Km/ENY10BeM38jrQKX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EtnmeSOnL8g4xe7KI+GvVJwnpEyqNe38NnjUdon3g6KIf4A0g7ofmNWwpqObKa2jE
	 3gW7fAziBaoh1cxL9LVpk8tKqAr1/TjgOlnBBJw2Gx4bkGgLwjx4ZEzl11xQ6J1vlx
	 6v6WYUhlmvHGoZgSlaxfISULpXy2/YtPO79ru6XgC8LhYvFFC7bv1vGRsvVJbpzrYb
	 QaM34BRjNEZ0mAkMsguaDvNk0+8MzL9ccsGf8W6vwlWoTMK8AEmKnpf1t54c1d/vk7
	 HnD4pXLydiWW2IvVrdwmyog8yEnGYRc7inkbIB5/URa9N0zKqfc0E5Lx5R6ZfHB2q7
	 Fa1rRzCil4zxw==
Message-ID: <sashiko-outbox-216161@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] mailbox: document direct synchronous transmit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anup Patel" <anup.patel@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261116040049.1795610-5-anup.patel@oss.qualcomm.com>
References: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
 <20261116040049.1795610-5-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 04:07:35 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] mailbox: doc: reference to missing
  drivers/mailbox/mailbox-sync-test.c
- [Low] mailbox: doc: unreachable busy check in my_send_data_sync()
  example
--

commit 4b8cb40412b27f0da57b15f1c45c7531d427eab2
Author: Jassi Brar <jassisinghbrar@gmail.com>

mailbox: document direct synchronous transmit

This commit documents the non-blocking queued, blocking queued, and direct
synchronous transmit models in the mailbox framework, along with controller
and client contracts and examples.

> diff --git a/Documentation/driver-api/mailbox.rst b/Documentation/driver-=
api/mailbox.rst
> index d46c60bd5df64..81d4710275391 100644
> --- a/Documentation/driver-api/mailbox.rst
> +++ b/Documentation/driver-api/mailbox.rst

[ ... ]

> @@ -35,14 +49,197 @@ The method in order of preference is IRQ -> Poll -> =
None, which
>  the controller driver should set via 'txdone_irq' or 'txdone_poll'
>  or neither.

[ ... ]

> +    static int my_send_data_sync(struct mbox_chan *chan, void *data)
> +    {
> +        struct my_chan *c =3D chan->con_priv;
> +        unsigned long flags;
> +        u32 status;
> +        int ret =3D 0;
> +
> +        /*
> +         * The framework does not serialize direct callers and does not
> +         * disable IRQs.  This controller shares one register block acro=
ss
> +         * all CPUs, so it uses its own IRQ-safe lock.
> +         */
> +        spin_lock_irqsave(&c->lock, flags);
> +        if (c->busy) {
> +            ret =3D -EBUSY;
> +            goto out;
> +        }
> +
> +        c->busy =3D true;
> +        writel(*(u32 *)data, c->tx_reg);
> +        if (readl_poll_timeout_atomic(c->tx_reg + MY_STATUS, status,
> +                                      status & MY_DONE, 1, 1000))
> +            ret =3D -ETIMEDOUT;
> +        c->busy =3D false;
> +    out:
> +        spin_unlock_irqrestore(&c->lock, flags);
> +        return ret;
> +    }

[Severity: Low]
Can the c->busy check in my_send_data_sync() ever be true?  c->busy is only
set and cleared while c->lock is held with local IRQs disabled, so every
other CPU waits at spin_lock_irqsave() until c->busy is false again.
Either c->busy can be dropped because c->lock already serializes the entire
transfer, or the example could use spin_trylock_irqsave() to return -EBUSY
on contention.

[ ... ]

> @@ -116,14 +313,125 @@ a message and a callback function to the API and r=
eturn immediately).

[ ... ]

> +The KUnit suite in ``drivers/mailbox/mailbox-sync-test.c`` exercises the
> +capability matrix, registration validation, per-call results, multi-CPU
> +concurrency, hardirq context, queued compatibility, and free/rebind.

[Severity: Low]
Does drivers/mailbox/mailbox-sync-test.c exist in the tree?  Referencing a
nonexistent file here will trip scripts/documentation-file-ref-check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116040049.1795=
610-1-anup.patel@oss.qualcomm.com?part=3D4
