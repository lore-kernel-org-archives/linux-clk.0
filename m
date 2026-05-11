Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8396F4D8DAB
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535242; cv=none; b=UK+cQXhECoIRH/cjdhcB4n4TOCREYc74ykqhvSl21t7QPP2GWp5Kgju/jV2qhvsC+CP4U9fuoZbSxqPmc8oEN/zhoKnqzbXbvAhKDZC+fKtHZzwyM4IeSMmysBd1yQkkoPXUbvEHFVfxzAy7nVvo0zR9ERSvOY1CtgDHv/7JdIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535242; c=relaxed/simple;
	bh=eKTe9UA1sFB7G4aaisrbG6rqrZL6nXBpBLQ4EYBlnHo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jTqLJyEMzgwRekYXsmdlu/oKtv6Jigl9F9VaQroB1xWfFA6SgDYvOeaMwGYd0FeyUfxN46/MWLNonRvMCRl6f98yWZPY3mjoLNR/bP4lDErtVjZh9GkI37PP3RWul/qMW5DOR7dMEBSy2t8jBej54tZEC3JMha2f4QbxD/0z4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIZK3yGr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIZK3yGr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso37306875e9.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778535240; x=1779140040; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vv6Cf4mYgD1HTgqKQL+63OwI9Ewor3llwuPU7oW2eIk=;
        b=tIZK3yGr6OhNqs/i3F4Q8/TiCzFILhkM08tjtkHGIIry4l6i1hPUn8a0MhvDQpeTPU
         dfoFa4ddsaVTAP8GMQGEZ3O0nKc/u4hMxfjoSv3cnB/EGPLmdqU2Z8J/Fs16caWCfasb
         KODwk7NkwA5HZNiGWJ9nhHxEM5ajZCnrel8czhVCmwbzhGfhANHKSFkp1GK1ECojqPoe
         cFp4W5Le0/ptUcjaAS816o6AFLApdantuDdyNPFiIj2z2e10cwreKy1WGE74x0GRMEAN
         erIFdSAbqCEGiDOpl7PKpDX+iIgKzeXZdtxI5KqmS2L3ccorxrGrj8ydffcowK78CD9r
         24+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778535240; x=1779140040;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv6Cf4mYgD1HTgqKQL+63OwI9Ewor3llwuPU7oW2eIk=;
        b=BgVaTyconbSfV28+tEHOZTPb5eZJlpvPF7Gj5YdDDX+M2g70RnW5RJYVNwyaDa9Ade
         OKLKD7rlZaY9PUoBxcvY+LvhNRZ7Hg02dNSdMKOIwB21/wESKqisgApZruapmzl4v2wu
         Y/HbSRrniXA+WNp9/k2XLodJLKb0GsFXX14Hu8BUFn33s4WS+bXBpwpsbyX3q5MC7RKC
         l2SMJvtU6me3vgZSlCGYU0LdLm+mNt3CqfMZb5Ab5s1BjWjfWv/CykQXYlZ4jLb4YHvO
         /rahHLW3/KCLsq7e0qMZhcVFS8UTWLkdEUDhLvkJG+FAz6q1uSgqW7Tey2dLGSlMyikM
         Qt2A==
X-Forwarded-Encrypted: i=1; AFNElJ8b6TZ2nw3/wf8wJ/BVelVLsumhsgwIIS4SlZoi23DS0DXDG4RhbGhnjTVDjpkc38hZTb+D63eYFAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxpqoFqRCNhdQ+1oS7fNhyEr50rfAB2EjsLUqnxRO4ez0lqMP
	Ov2MozcrtEy41kZo/Ojjj/Nex9mitMKHsNVVgpdPVAodzBu4oquMzpNT
X-Gm-Gg: Acq92OEPJRahn1sz6UkjIeWX1qGLBgqTGF2MHID2UtxKTQLof79mJAEqvXOjg4mrwIQ
	B1mp+BVzx2TnrtEIvNhDYUi3XY+e9k8muVU2qsCuLi6lmiFlCQnvPsvYY+EAVaNZUfOZwF3U3aT
	cD2KrOUhu0n3jgi3FF+MCeDMKLB01gsnvMTJSxaMz+cPBtha97iIPMXCRXp0Aj8JbPN84ibiWNo
	snhVzfcO/qKWWibMoWrxyOdvlAOpnX5DJM8jWeKxNq/cE0mhfArsDNf1VglLO7BLT31asR5zag+
	ApXASUOIEJM7XQfvdbsFVbU+w6KFHg3Rg/MGCMB9LdLwJl0BGIdOX2pCDun2GLeHKO/C23Segpr
	I8E7npByvzdbByhk++zAhyGfom8LxaSFIVU82m6cEwoikAhyOr7eRwT5kWI4tfkDNaDU36SlwC6
	AInXCyituZ2NIkfQDn6ihhshdDSBotcgwzjBv0
X-Received: by 2002:a05:600c:4f46:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48e707fbb13mr187762585e9.25.1778535239802;
        Mon, 11 May 2026 14:33:59 -0700 (PDT)
Received: from smtpclient.apple ([197.250.227.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a9a9sm370272295e9.9.2026.05.11.14.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2026 14:33:58 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock
 and reset bindings.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260511-backstage-crewman-e44947ab6cfc@spud>
Date: Tue, 12 May 2026 00:33:42 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>
 <20260511-backstage-crewman-e44947ab6cfc@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Conor,

Thanks for your reply!

> Am 11.05.2026 um 19:07 schrieb Conor Dooley <conor@kernel.org>:
>=20
> How come the "matrixclk" has no constraints on clock properties?

Because I am not sure what the correct/preferred way to express the =
interface between top and matrix is - see the first question raised in =
my cover letter.

In short, matrix potentially consumes all clocks available on the top =
controller. There is no obvious interface between them, like there is =
between matrix and LSP. So I see two ways to handle this in the =
bindings:

1) List the top clk inputs, top clk PLL outputs and PLL fractionals as =
matrix input
2) Be quiet about it

It'd be about 20 clocks or so that I know are consumed. The bigger issue =
than the number of clocks is that my knowledge of the board is from =
reverse engineering, not proper datasheets, so I might find out that a =
clock is missing or wrong.

> Although, these two devices seem too different to be in the same
> dt-binding. Do they have anyhting in common other than the SoC they =
are
> part of?

No, they don't have anything in common, other than that their concerns =
are poorly separated in hardware.

I take it from your question that the preferred way is to have separate =
bindings for them in this case - I guess separate headers as well as =
separate yaml files. Is this correct?

The third clock controller - LSP - is nicely separated from the other =
two. I would not be surprised to see this subsystem of the board show up =
on a different ZTE board. If top and matrix should have different =
bindings, LSP certainly should as well.=

--Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoCSzYACgkQPRO8yFRP
GiJreA/+NGigL8m01fqUXyaZXJW5lLjWCmzMbFofI/RsTAhtteVvQK2IwcfN6iYG
KtWe+zgDbdjjhwLYy1VJqgUMfyYHaWVicYSnxJ0q8JvTcJeDclHifEV0sQjqsmQO
KWlolqcNVfSq9qLcYNyfygoKbBOSlIt//WqyiX591Rpkcar/mPVjrrSXqHciErrs
hE5eTYr0RoyE4CDc2o20I5oqZwtntKa1xbOav4GSD1tUNLbsTm0xWLFLf2Bh3uX9
3qS/GJDgNCTeTnEK/Pks7JNPk25kIq2OeTktMR8cv5SSs8ZQLaKtvQCX97QnfL8H
03YRzF/jbBXsCYO+IXWMrn1R+J26HkUR61lWOkiWykoj4Zda7mX2zGaTsFR/tcPL
u3rOSmbcqEaMMY2hD08I/vIrbXcPiZ26rxS0DgnwKwqN8kFem0ULhjw3L0UCURXO
3J9IHhKhkp++QmTZSclOOY8MWujAh3IRYoT8VwUtQkmmsEzDkTnmj+at0tf7CtOp
fQmC3jkuGPrRj0fZJeFvPze3EGxHWWTBHkHaoAqtjGs6ONVNRx58MuasigPKmueb
CN7jtmppAGpLlur53BXetZflBBdFfU+EpDmOszZJ989HOZtsg/zAu7ZuWfCYDMKH
FD+WtwfgX6fIqRrLs0/FD7rV1kHx/GagGhOfBey/j+iPqvcTgoU=
=XNGK
-----END PGP SIGNATURE-----

--Apple-Mail=_86F8E9FE-3936-42D2-92C0-780617216CA2--
