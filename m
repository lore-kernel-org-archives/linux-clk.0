Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A67B30CDAE
	for <linux-clk@vger.kernel.org>; Sat,  3 Jan 2026 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767466792; cv=none; b=LujRSsdMnMHI66C7lNcPPHMLDfjcZKx/e32ZUhuiQf87C95RlXX4PIhcBOWstSFKBLey0jvdVcI/4OKaRd8wleqXBV9tV+n1Afr/yVKGy2sUjNJy2znD1exE9jkSv/sAS6zv4Ri23PVx1mcnf3VGQan8ID56V6pw8deKY8RKK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767466792; c=relaxed/simple;
	bh=z5naIjjzqem8Gt6eFP4AFQdtacRW/20/q0OiKoTLyVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcdLQeeX15kwcriZKjtA+k1Q9UkbED2r/zoqCX+Kf3JT64SrTQ62xRrM4IhO/hwR5/DVtTJTWdK6PxWW6WJwAU9/QSul9xaDzg1eR7rW5mdZIpqT+C8UpWfywGTM27GS2MdrR27sew00AlT9VW6pU+8HdL03GotWenR3TFMikb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK2VWqM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK2VWqM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334CBC2BCB5
	for <linux-clk@vger.kernel.org>; Sat,  3 Jan 2026 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466792;
	bh=z5naIjjzqem8Gt6eFP4AFQdtacRW/20/q0OiKoTLyVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kK2VWqM9TgmVpfRqBjO7kP1ONDEaeuXvqyMuTA7K0uDKMnMuOCFiJnA3OtL/6pVf0
	 xZ29+K1J9GmaprjY96lZ+MrWIXn04TjLnA0oLwsBJOLlhpfiCbT28Nibk/Ls+Nx7Gs
	 OoNtzxI/B86ZPytuvVUlOnAJsJcbGx+Mej1LWlEBoxqxVY+B2qXFyDyyvmVT+ZlIk6
	 IXtiexfdOkrV0C4Wm+0GRP//mIp/fRhXWiTZpf8wLKUMAGv6AAVfjD4e/ecClmwWX5
	 yIRAcIWc1R6yp7gG89DOJ6DRtqu7OWaiPHNX5fm4EcF4Mq6rhcCjMis1Rkmf/tV2rR
	 ZeFcnqWPPF5cA==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64661975669so12394954d50.3
        for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 10:59:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDIJFx7PUqX8k79CJ7efz8SMp5ZHzoOSVBxt7d+lXgWrGk0NWgu1xyKG7F0Hp+dCpsnlm80rsfabA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzpDvT3CGrHP1h9u4GPfPkTwY6PkorjxksdXucKkKXwNi3ImXt
	Hczj3vW6wEvkI99b/EV7bStEYhUxZmS4yp/P5QUiuPK9ZyP3F3Eu150YdSyVBStZ3Xk+KPEL7Pl
	oW8hIalv0DjIi/S5o/2x+vag+4Kdce4A=
X-Google-Smtp-Source: AGHT+IFJDdFT5GmWOujX6I7HvoKgHNmIfLlcvsjReOSAffa5PrY0UzYGPSwQs24aov7n8F3K0QX4fBSvxKIPDafjia8=
X-Received: by 2002:a05:690e:4012:b0:645:68e5:11e0 with SMTP id
 956f58d0204a3-6466a87ec9dmr37191656d50.17.1767466791282; Sat, 03 Jan 2026
 10:59:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
 <20251223-eyeq6lplus-v2-6-cd1fd21d182c@bootlin.com> <CAD++jLnBMXQAv75a8k=mbEt8pAxS0UXhayQPz1YWCiLic9_+ig@mail.gmail.com>
 <20260102230322.29d2ea65@windsurf>
In-Reply-To: <20260102230322.29d2ea65@windsurf>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 19:59:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLkH3MK_GWE_HueDaRmM_xT4Ud3J6OXX_6X3XTD=fgn1sQ@mail.gmail.com>
X-Gm-Features: AQt7F2pBEfgRNvlTw2b-xqll0r-B6l-HChrU5K6wqZ7ooIBEaybIBpu147rixc0
Message-ID: <CAD++jLkH3MK_GWE_HueDaRmM_xT4Ud3J6OXX_6X3XTD=fgn1sQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 11:03=E2=80=AFPM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Fri, 2 Jan 2026 22:57:44 +0100
> Linus Walleij <linusw@kernel.org> wrote:
>
> > On Tue, Dec 23, 2025 at 11:02=E2=80=AFAM Beno=C3=AEt Monin <benoit.moni=
n@bootlin.com> wrote:
> >
> > >  static const struct of_device_id eq5p_match_table[] =3D {
> > >         { .compatible =3D "mobileye,eyeq5-olb", .data =3D &eq5p_eyeq5=
_data },
> > > +       { .compatible =3D "mobileye,eyeq6lplus-olb", .data =3D &eq5p_=
eyeq6lplus_data },
> >
> > Which patch can I find this new binding in? Or is it already upstream?
>
> In the same series, PATCH 02/13:
>
>   https://lore.kernel.org/all/20251223-eyeq6lplus-v2-2-cd1fd21d182c@bootl=
in.com/

Aha OK.

Once I know 02/13 is ACKed and will be merged, maybe I can merge the pinctr=
l
patches separately to the pinctrl tree? There doesn't seem to be any build-=
time
dependency?

Yours,
Linus Walleij
