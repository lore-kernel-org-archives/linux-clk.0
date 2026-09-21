Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517094A99D6
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005902; cv=pass; b=WPmktETSliYGR34IE5Qtv9QpRWTQQMV8N/A3CqWDvBrGynL8ujX0qXOfm/7CbYyYuuqr1xHI7KOyq3XwuMPJGA/gpe1JiYpyjeg1E7pwmXiOPI9JaGcckPPZYOd37ieTVPgYmYySiVsXRRRZ8aXShEcLPwOnDPlSmmjJC49jQcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005902; c=relaxed/simple;
	bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWKx4/VvtK4bepWhM6ze3W/zsv5No4rAPjCCGFd1crYK0KZODuflOVi5dUH7Cp4nsGB9UP1qu3dmDQ3tpXAYvDARMLRLYDAigh7rnpDIA1yMo++UX4HLG1mzn8wRaSZRzYbbtdRfQds++4UqAVEe1cAnsCL7owsLjpshbQzOFZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F1/VK4Mg; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F1/VK4Mg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so18160375e9.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 08:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790005895; cv=none;
        d=google.com; s=arc-20260327;
        b=nWp15pk8kWJRR3EhpkK0x37mxqHEWtoEXNK47rXSkJOi6gaahJl5DsREWIjIuUoOaT
         aD1+3W09DFfOSUXVwU7Gu6nVWxvPe7GeEixOLK6MtV+QRmtzWcqSVxKhM/CB42gzRqqm
         E6QEAiF1xh6RZIkPd/GkI4PXutBtkdhH5UtgoWw8NeA6IazGT/kMpiJdcgjbjkph1Den
         7OGIMT3b0XMSyo4yVntE2N0NCT092CuT4MikOfTZWXTO5OH+GA58ylITLYkcr2zowIcI
         2hB8mpsiijnwXG27AqHxSCPfGPAWuKZZQ/hVP45MB42fA88hdmmyXdwWSi1/x94Xx7yn
         jBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        fh=vqV/h7iWCKgO0y/ScVXSN1tKRUeU+e1Dp7o9GPKMc5k=;
        b=lOKtPc9kQp0BpVydcbRwmlO/gtPnURGG+2/7Xmg7OnNr2iFxvWRAvtUDmJzrsBcpXC
         3P4eQ8rgLmjJQC8SsqIGlVW91h1yus8opGyZtp/L4DrgwlHEVgSdXPYhyUwBMGzUNDpo
         cpceVVxXwXfyNORhG/0xPj7+hkT7RhN4lBu5vLk15tE/Px1g6BLdGzX42eQ4kkJ+fEuI
         J/V40OtH+yVS6/qyA0eYiuu6SD3z8M1OJyB0JabOhafA4O9CZCePMQIQJyQVqa4s+/nz
         jmBnZil1s/ulXne0VYZ4L9jNmL711JbgAqRTbohQZ9Dn7ylJHw64PwGd9kvPp7oc056M
         nMHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790005895; x=1790610695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        b=F1/VK4MgaZmDwKwdliXEQ2wCeHgpdPbdak60ZWI/JLhP4F/9ZV9xc2OldpG6QJJfdJ
         KTwTVCN4eV9go6x0QY/u+uAEJOPrtjy/wGkdp1SChfYn4OvsXm0K/XWASPIA57mK1qCk
         DRfMpYPjfFTM7+kQHIxeuCCXAdIdacDfl5KvoyhfgDEQMwYbM4M4kJJMsmwwE7za3KAq
         iZ4Bm0BYMuv5+hKWlCIL6YCL74ckJU9DsOwX/LMM323alQ2v2uVy3j0JfFQkSvVKH9vf
         9kkg4wyHowkQgDkPujDsI8vIJEk9MbHIEAzmzJtVi1a47gZ7MSF3l2PR/DpnTT5gKm2x
         iQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005895; x=1790610695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        b=m9ZQXUHOlV/bkkkcQ+J/Lf+VJZKhu1/BNKt83tsG5k1BDTVq+zy79Fmp8QrCCm65sV
         dcAPwziwHdiHSd63ZB2Dr/a4VfWRBi5b+ViJPMjYCBfL0GzPEJcdqc1OXGBztrIEVeyE
         ugl3WwqlJb9X0+onmKYbptIlf91B/rnxcXjcwTTaXSMawxb68jnYJJHynz1JnOQjCVwt
         WtE0KciccOfjmeD9oAW/h3L3LO99gLHkkbkP0NnBxoo21DcD5YrWG3I4GC+MdXrAFjur
         0QqTrO1z68QHeD88Hk3Y8k+xjYPY9PAfG3UYxIH7LeTahy2UzLWxP0cLnrlILVgDCEBM
         2jXw==
X-Forwarded-Encrypted: i=1; AKwUvBy0xas5i+Io44k7XxdPdJKZq/wyq25/wQTlZeQYOkh5wGhpinXAoeX+JDzwY6Zz9YtEAa5dJoYwWAI=@vger.kernel.org
X-Gm-Message-State: AFuF++m92jzZNXrYVSVpeksXAqTE1rM80pgpddZdOjzSHCPlviH0PkRf
	tnUXYN56G2XEs7TKxTThlv9Rs4UBAQSJpvwMsVbe/VglYbODaVeVzQtgXY1xG+dg0vcFpfSNwxX
	uwQ2GUyIpa8ZOz5ocje3zEU7Tq/7YT559391OPKns
X-Gm-Gg: AYBFou3VX5YvkM5/loojL/N//0VuytVB25YepbCyBaPcHgJQzj2IqFOcvE8mZ2Ef8/D
	iyunb5tGb9pGGCx5mqci9P3zMuwqOyX7B3QIOG2LN15/iCcFCd/dCvGFIbUNzNDfC3XIrnkboPB
	4Ba0YjD9SVu82UsU+cci1FrPMpGQBBzvGH0/Tck2AdeCbgTWFOA0btPzPE1dhB+qvZT9lpPDJOl
	DqG3rdsl5q882sBCo07c5Gn3OFARDWwspZeajAqNkZqajy62FW6SihxgXltIgqgU4AzknDnMTw/
	6p4PEx5pzvSnbxyS8eJq9Te9+vZpXruPpezpcU4QuU3dyhOTZ3g/BydHJxdyclYJjKBpRAiChKv
	RxAMboJSkJrG4HGAQNvet
X-Received: by 2002:a05:600c:1382:b0:49d:1d7e:4085 with SMTP id
 5b1f17b1804b1-49fc5750e24mr144662275e9.22.1790005894477; Mon, 21 Sep 2026
 08:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com> <arFPKcA1RCecTfMD@redhat.com>
In-Reply-To: <arFPKcA1RCecTfMD@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Sep 2026 17:51:22 +0200
X-Gm-Features: AcwNN1WhcitqwBWirpcIjWt4rgRy9zn3sgw8vKnw5ksshoQqpBgQkPX-PXAUSZs
Message-ID: <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
To: Brian Masney <bmasney@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:37=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Thu, Sep 17, 2026 at 07:10:42PM +0100, Alexandre Courbot wrote:
> > On Tue Sep 8, 2026 at 11:56 PM BST, Georgios Androutsopoulos wrote:
> > > `Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
> > > argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
> > > checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
> > > each panics once its argument exceeds `c_ulong::MAX` divided by that
> > > factor. None of the three documents this. The panic occurs only at
> > > runtime, when the argument is not a constant expression.
> > >
> > > Add the missing `# Panics` sections stating the bound for each unit.
> > >
> > > Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
> > > Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >
> > As we just discussed at Kangrejos we might want to harden these a bit,
> > but meanwhile documenting the behavior is indeed a good idea.
> >
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Acked-by: Brian Masney <bmasney@redhat.com>
>
> I assume this will go through the rust tree? If not, I'm happy to take
> it through the clk tree, assuming the rust devs are happy with this.

My understanding is that the "default" way patches land is that the
subsystem also takes Rust patches related to the subsystem, and that
the rust tree is a fallback tree.

Alice
