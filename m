Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D565184
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969802; cv=none; b=Sz1AywGN4TX/orcFk+Cz/lK9mFNvCFi8/cKV56vaDjRE10i0migvZHESemUutA+oSehh7WMrggU4x4odk7CLM54bi5/M5mfXKdhvr83RYDgxMmMGyxCVZzZQ8ABYiLiWr2a05T1yrCCQEB52eOakDSize1U5Kr84QJtBMyCLCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969802; c=relaxed/simple;
	bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0gMxfqBW93oSALkWRZtUGLwZ3Shwbasv8hQFzvA0M5tTl2UOvZv10S9Ojx+BdZaPN+bGt60DJF/2qMz3i+8YJ7op0LbP7q23iwvn+VbhCe6v/63slWkxD9AOVPEJeCNksIjLpZgt8YzbctQCMAzoJ8OfZ+f5AiBi50GIj8KWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBTGnF0o; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBTGnF0o"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso3033628a12.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969800; x=1761574600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
        b=XBTGnF0oO/ykFeiHWuJ0sK2VjnSv4wGXIBjWTZs1XrUvxDNfd4zIo9fR/2IsN/WdyY
         iUrtBTUgTph8f6rphym+aR8PvqJSFg3FnpyHapNKiDysgEkBVyx8kQ66drEQh6P1S41j
         fnDWtQNJAKSCKJb5N7dz+3b9HX8UQJH6CC38MukZTCr7aSG6oYVAnwWJo1CCEZQWUSuG
         sIlYFzVGAVVFRZFP4Gyc/70vaZ0T/idGY2jQwPRYdSNYb1JseOUk+dxWMJfFfVWqScDc
         Jj3vpVJpzGi9XpjaAjvuIcG7bJUohanYbKWhXBQ50qnzLROZNvhKYmRqJvRvrucnVLuf
         8BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969800; x=1761574600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
        b=XJQUBRxqvX2X9dWCMXocqOJm3y2IFr4DG3b/ntSNaPtKA78MOjlYMKIwXO5MQOSilg
         PxLAKXv4LEEac2vvbQ0Q2b0BSQANeAXdz2o4nd6/wxI/FYYuELs1JNBZPLlyi64ip7ce
         vKOV91gvtnk+Qjp81mbyQlE94M5XxeDD3pYNL5cCKNTl1TrdhK+G4zDxfHFJ9p1/L4iI
         9xfZ5bVVtdfd0zOM3ARHl5NdFOKmTXqzxYZrYXIE1yYwn+w/H34WVCZN7dZ7VEjzjvbN
         io3Z55TJsJL5zs5hMlez59te807Iu/EFPOxCyTOtXnvVlJ15px8BvzYgf/EKDG+SMHZG
         fzAg==
X-Forwarded-Encrypted: i=1; AJvYcCXqYyhWNeZMbvDV22WQBWpxSZvIV+/SL8xuivKq3paLto6dpmzAhmQNy6NWgC+ukto0wFESG5943k0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdiEOfyZehhVLmWZL+3apv71yIVVX0OsIO5p0VymF0fg1o4H0x
	50gp9mFsfbq1jl18/ufNuP+VVIiIFTzGN50uxeanvGzJu0runey2S6v09kJzPPBYpMP6ELEo5WY
	cmoFIob+1z3FzJl0jrNfGO3P9UlMgug8=
X-Gm-Gg: ASbGnctJ4YSOU4U6u7ankurwrIBURx/IvN/7/MKQtrJ3/hk0dhwQU7sJQlhuGRGZENp
	MRHe4yHIE/3oJsSr8Hns76KIlDz7Le/zsAh5BbSeBBRGOWSFDUgvvPnid6q2dDtyKQwCnAuQ+WG
	ol4+HDuPwueMvVTzZPsrX8X5fX4/a7821VKfL8MP3X5WDTyOZ5LzOO0gMJ12xBGpKnOqSmNT54g
	rqVTUkET/KjAtjd0877Zed8QNoSYOQwSyqacSHkZDlKvpznbbSzb/9Yp/psWErr5tzxCQ++1UQj
	SPdNFcyC5bGqPBYy1SH6htP+
X-Google-Smtp-Source: AGHT+IF71shr5BTQv0oq5eLWvgxmXcOQ1nEZ8rFk3kgzINgGyypUZnjlZnnQfErZnclV+r8kM1yF7mXz80sc3mNjFCg=
X-Received: by 2002:a17:903:11ce:b0:290:9da8:f88c with SMTP id
 d9443c01a7336-290c9ca6b61mr160740585ad.17.1760969800070; Mon, 20 Oct 2025
 07:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-7-laurentiumihalcea111@gmail.com> <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
In-Reply-To: <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Oct 2025 17:18:59 +0300
X-Gm-Features: AS18NWBTX8pCKgoouBoSyxGFd8xpmwwpvcDYztextRp06KZCPCFp7jOkfhl48Co
Message-ID: <CAEnQRZBd1nadLPE0NSWOJLRNwFEnRhOTENv_vestHCLxe41Rbg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 5:57=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 17, 2025 at 04:20:23AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
> > which allow users to control the assertion and de-assertion of the
> > reset lines tied to some peripherals present in said subsystems. Some
> > examples of such SoCs include i.MX8MP with AUDIOMIX block control and
> > i.MX8ULP with SIM LPAV.
> >
> > Some of the aformentioned block control IPs exhibit a common pattern wi=
th
> > respect to the assertion and de-assertion of the reset lines. Namely, t=
he
> > user is able to control the state of the reset line by toggling a bit f=
rom
> > one of the IP's registers.
> >
> > Linux can take advantage of this pattern and, instead of having one dri=
ver
> > for each block control IP, a single, more generic driver could be used.
> >
> > To allow this to happen, the previous approach, in which a single reset
> > map is used, is replaced by a per-driver approach, in which each auxili=
ary
> > device driver holds a reference to a certain reset map.
>
> Can you shorter your commit message?, basically, you just add
> imx8mp_reset_info for difference auxiliary_device_id.

It is always preferred to have commit messages trying to explain the contex=
t.
I have never heard anyone complaining that the commit message is too long :=
D.

Daniel.
