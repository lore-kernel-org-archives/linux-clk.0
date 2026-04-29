Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05C5396579;
	Wed, 29 Apr 2026 03:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434435; cv=none; b=nojDTh00yhYJfJcKsFoMQklW1qpMctXFx3eIf0gwPdjvNf6G+Rz9zta0bcpmmSnAyeUpaoEkPyejzju+ONvLkD5YgPoMeCZ4yhErBlJPZgMLgWfZnLZoYl3q01lwCgTRHgZEYO1B64jCS4b2ULwOnAZi63Pqgx3tLSHFXAqMhiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434435; c=relaxed/simple;
	bh=K2gG5yjQH4fWSYLeetHFEaWArPtGrhUkgZ4dgoF5H+c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aa7QRMSU3h43tvohqk8P6DWqVdkVO/41R1E4e6JNO6vAOckub8ZWA2qQNb+mnW+QOBMQU7lfdHnWTa5HzssQj/JTPLucb2Bh+4swCHzwxGSy+p6dXuddtYAVPalLyllS6ZY4T8wa3W8xt/H98pefSyBIUFSpYPpSXiUK2mVcatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX72gcrC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX72gcrC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C40C19425;
	Wed, 29 Apr 2026 03:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434435;
	bh=K2gG5yjQH4fWSYLeetHFEaWArPtGrhUkgZ4dgoF5H+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HX72gcrCC9MxzBOQ4EnHlCXApl38euZq1aOK/E7oK254dBkbakGicDZ/KD5KNyOM7
	 qurPADq55gGpBgPS1UoT/jxIbCNqE9ZMJCWOheEFiwEtLZnyGEl7VpDRFoThPW50AA
	 2PjVfJxhB/KENkiat+cF8KSA0J1E2Rf26LHai1xAhTLGUWXY2PixG22aZF5m85USP5
	 W/kS/FzTZnQY+V4NaWKrZaqyBrcVgIJ66GWpzemvW3w0ujUrthJYzywsgtDFvgBm3r
	 S0JedxBvJSRg9IxBYbI929R8t9cO/GtlqvIP9v9CYm0S8M0VZjzIS2o23bbDOHiiLI
	 xk0t0LKh9RvSw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <acaGfUueAm7lb_2x@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com> <20260325-clk-docs-v2-1-bcf660e1ceb5@redhat.com> <acaGfUueAm7lb_2x@redhat.com>
Subject: Re: [PATCH v2 1/4] clk: move core flags into a new enum for kernel docs
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Shuah Khan <skhan@linuxfoundation.org>
Date: Tue, 28 Apr 2026 19:22:52 -0700
Message-ID: <177742937276.5403.14001615996131190445@localhost.localdomain>
User-Agent: alot/0.12

Quoting Brian Masney (2026-03-27 06:30:37)
> > +enum clk_core_flags {
> > +     CLK_SET_RATE_GATE               =3D BIT(0),
> > +     CLK_SET_PARENT_GATE             =3D BIT(1),
> > +     CLK_SET_RATE_PARENT             =3D BIT(2),
> > +     CLK_IGNORE_UNUSED               =3D BIT(3),
> > +     /* unused */
> > +     /* unused */
> > +     CLK_GET_RATE_NOCACHE            =3D BIT(6),
> > +     CLK_SET_RATE_NO_REPARENT        =3D BIT(7),
> > +     CLK_GET_ACCURACY_NOCACHE        =3D BIT(8),
> > +     CLK_RECALC_NEW_RATES            =3D BIT(9),
> > +     CLK_SET_RATE_UNGATE             =3D BIT(10),
> > +     CLK_IS_CRITICAL                 =3D BIT(11),
> > +     CLK_OPS_PARENT_ENABLE           =3D BIT(12),
> > +     CLK_DUTY_CYCLE_PARENT           =3D BIT(13),
> > +};
>=20
> I just checked Sashiko [1] for this series and it has this comment:
>=20
>     Could converting these unsigned long bitmasks to an enum create a sil=
ent
>     type-safety trap if flags ever reach BIT(31)?
>    =20
>     The flags fields in the clock framework are explicitly designed to be=
 64-bit
>     on 64-bit architectures (unsigned long). The BIT() macro evaluates to=
 an
>     unsigned long. When defined as macros, operations like clearing flags
>     produce a 64-bit inverted mask, perfectly preserving the upper 32 bit=
s.
>    =20
>     By moving these flags into an enum, their types are implicitly downgr=
aded to
>     int, since the current maximum flag BIT(13) fits in a 32-bit signed i=
nteger.
>     If the flags ever grow to include BIT(31), the enumerator value will =
overflow
>     a signed 32-bit int, causing the compiler to type it as an unsigned i=
nt.
>    =20
>     Applying a bitwise NOT to this unsigned int will produce an unsigned =
int.
>     When this is bitwise ANDed with the 64-bit unsigned long flags variab=
le,
>     the unsigned mask will zero-extend to 64 bits, silently clearing all =
upper
>     32 bits (bits 32-63) of the flags field.
>    =20
>     Would it be safer to keep them as #define macros and use a DOC: block
>     to properly document the flags using kernel-doc without breaking type=
 safety?
>=20

Don't break type safety. I hope we don't get to the point that we have
more than 32 flags, but you never know. Why do we need an enum? Just to
make it easier to grab in docs? Presumably a doc block would work just
as well and not put down a land mine to be discovered later.
