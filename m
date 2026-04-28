Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97461DF6C;
	Tue, 28 Apr 2026 01:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340477; cv=none; b=VqYJ6ydfE5FaDb+ge4/FILtKESgpIjdbC/zWtzMYtm87fHcUWy6Xt1tIBTZRq6xQrwnvTh0GFMD0FJTXim93GBsCyHfrMieZTfjiqSznUVcrfxRHB+ytNp6OozZTNgTEJMrFb1KiqxoMfudq+yHTceImvdrsM1eg5BzWathHyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340477; c=relaxed/simple;
	bh=Qirg9HtlKwgQkuFZC2c0wY82dvncnY8EFG+Hd58B11w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=J5NUP4JO87iAZgzWifQ+Lya/OXLt/OqqDwKmNakGxKcati0y/NYopapDS8W2fTke2lpErFmqjTMr/l5YJYXktk9KDUkZRcJ2LfdpcX3S9EKABvyDNVisFysbyxzf1OeoZgaSqAtk+NO4Z65/uF3KpEAfMjAwdaTlPA951KKpIBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcxhCKlB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcxhCKlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29F4C19425;
	Tue, 28 Apr 2026 01:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777340477;
	bh=Qirg9HtlKwgQkuFZC2c0wY82dvncnY8EFG+Hd58B11w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jcxhCKlBm3Ew03yvSBJq4UttFb7TAqZ29lTngr/O4jYdxYuBChEifCOQttAeOIg+6
	 tSOS9K0CwJA1W7wbqfKRfKW+ntMvlAzjugSom+4SiAxTwE1b5VVm/JL8zEOJ0zVUrK
	 1uwqMjv/dV/eblYC8OS2pYiYCT9XDXpScgKBkcsn78V6aaxWN60dqkKuqDLeHHqqZC
	 oWv/90yNPzzXhCnu809Pjd6mYNeP2qf0lbvYgV/OzmJs8T1ceYnDL9TxA/UIkI7N9F
	 EjXgOZFnKFEEELq9/wTL/muoLWbt/gXt/Fj2L114Tdt1M2reFku3Rfnpg1VSdOoAMo
	 u4NbAoX8vUKQQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com> <20260423091114.2326-1-dongxuyang@eswincomputing.com> <aeo8nn-eigzlojWx@redhat.com> <4e5c887.5a31.19dbf179fb6.Coremail.dongxuyang@eswincomputing.com> <CABx5tqK7p_XJHfXZ70gXhR88PzAteV7cVSFPoRzccgmjanADMw@mail.gmail.com>
Subject: Re: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, huangyifeng@eswincomputing.com, benoit.monin@bootlin.com, ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
To: Brian Masney <bmasney@redhat.com>, Xuyang Dong <dongxuyang@eswincomputing.com>
Date: Mon, 27 Apr 2026 17:21:48 -0700
Message-ID: <177733570840.5403.12558106273673899411@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-04-24 04:15:46)
> On Fri, Apr 24, 2026 at 6:45=E2=80=AFAM Xuyang Dong
> <dongxuyang@eswincomputing.com> wrote:
> > Thanks for the feedback. I did some research based on your comments.
> >
> > lock_ctx is a local variable declared inside the function body. It is n=
ot
> > in scope at the attribute site. The attribute expands to
> > __attribute__((acquire_capability(lock_ctx->lock))), and since lock_ctx
> > doesn't exist at the declaration point, clang's analysis cannot resolve=
 it
> > and silently drops the annotation. That's why you see no warnings from
> > make C=3D2 or -Wthread-safety.
> >
> > Why -Wthread-safety produces no output
> > Two reasons:
> >   1. The lock_ctx->lock expression is unresolvable at the attribute sit=
e,
> >   so clang drops the annotation silently =E2=80=94 no acquire/release t=
racking,
> >   no warnings.
> >   2. Even if the expression were resolvable, spinlock_t in this driver =
is
> >   a plain pointer field (spinlock_t *lock) accessed through a void *
> >   callback =E2=80=94 the analysis can't track lock state through that i=
ndirection.
> >
> > The closest correct expression would be:
> > __acquires(((struct eic7700_hsp_regmap_lock *)arg)->lock)
> > But that also won't work: arg is void *, and clang's thread-safety
> > analysis is type-based. It can't trace through a void pointer cast to
> > determine which spinlock_t instance is being acquired. The analysis
> > would still silently ignore it.
> >
> > For void * regmap callbacks, there is no clean way to make __acquires()
> > work, because the lock is always hidden behind the opaque pointer.
> > The annotations should be dropped.
> >
> > Based on the above analysis, I suggest removing the annotations entirel=
y.
> > However, I'd like to hear your thoughts on this approach.
>=20
> I agree to remove the annotations. Before you post a new version,
> let's let this series sit out on the list for a week or two, and see
> if anyone else replies with the proper way to do this.
>=20

Why not use a regmap instead? That would enforce locking on registers
and then you use the right regmap APIs to update the register under the
lock (like regmap_update_bits() or something).
