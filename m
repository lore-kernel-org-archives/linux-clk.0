Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D478830C378
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614979; cv=pass; b=sL8A7UcBj/VrbuGfMM91R2pdK245acCHySL5lK8haukUoB57mVcx1O4adJD0B42CcvfGlTcvg/qQcJ+BpIb44sbRDNu/KuwZJ0metLtbBP0nDYcQA8zr8SBVGNENk51cwjQM4FzYPrGKalK7Om/dVmH/PinzAJ17dyeNPwZiohI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614979; c=relaxed/simple;
	bh=yr7VieMCX6D3WLrE35b3fqXI7IBsFPaH+PdpaLXKVfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3F2eWpgX+sRtRe1E99MNRDQacfVI/f1d55l6V9xOMFvKy9PThz3wBZiaQcBaHAEHu1kMlB1L+13ILMZMvpWR2SYSvlvAQbx7QK0pxdzuV2PGVxQwPxxpNBInwoB4CKxSvhZlrbbvW1reBSsLT/oObDkTtyIZUFScVSxKUgV2uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=O0nuKrLR; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="O0nuKrLR"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6495d592b58so6154595d50.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 07:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769614974; cv=none;
        d=google.com; s=arc-20240605;
        b=aDnshopMIycTj6X3edwpsN9vQ59aK/iBQLwMzhbgEgdl1LnrOTeBRJ/RNc3GnpbGks
         HgEQ4i3Ie4vBxXK+luJHKyvRh4UWUJNeXyeso4Z8WzSqrWrBHL8ZNR0zq8w9KZjYN9RU
         Rxs+Ac+7k17j9CR584jiBHphkvCEDJJpeCRsweknm7sZUAjnCG4f8xgL8eQ71eu4Js4E
         esOnkPWqDYeW1Pug3JRbR7FXVsI/cj3ACqvdgnbqnR9Q5LxC5tM1l76nv8YQiEscYEV/
         FuoucCBrCysIj2RicyN/XuM/P3goWc0/aW7W8QUY/nQb1ORIgKl+giTjXb/M41Xprh/J
         qkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HL0HkET+dj1w35XFDXNOqZl3z1k2yF2PBoeKmcws1E=;
        fh=ZFWITOBC3vBrcKW6Lox7+ImVJ8ZKPpcS7Ht8z2GYqbg=;
        b=OksGq6T8ZAWzBYcke/snRrk1/iILxwxv68aBSSaK9VtOCucmCKmtATlVbo8OSqr7mH
         PU5lPWtg8c1gkghPWmIozNIBn0wCy870xDM2O+FoPMqoLJWhEMSZqBLBKpxlyiNEp7Ov
         MLRGL1XTk9VrjruHhTdSVd0C9Jas1d+Pvu5/fJzyAJqGwqKaKVG+F8DvCIkvGQ1KrVGF
         bFz8KC2rVmzh0R6oGUxPDbo5HyL5XQoL2ap43mEayvXTbuvvVp4KsTXZ+HFgsqWh3Wmg
         FK2qU14ZTZLzHjEKsBeOQjCiLAfSkeJ7mdgGGe2woZCtvf3DncqoAtlRefryGj1/wRY4
         CFxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769614974; x=1770219774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HL0HkET+dj1w35XFDXNOqZl3z1k2yF2PBoeKmcws1E=;
        b=O0nuKrLRTgMfQoXmwJaEAaxzjRyNfQtng/Xs/HNPZI2kjQnGIUmkO8NCpya0rark3i
         H5oZWqMJFx/450TONcR9JnwRc0B+ZLG1lpthsMKePSPaOLfA1RVORg/9U1kxu9nw240V
         OwY7atQGR6VkdtNXd4wAuOyw7lUYZ3GJjcbciYJIu1ZLp3BgK/FyS8K8Gto+jRyFZbY3
         ty4DoVhP04CgopcyLFarlijW1FWaW34fgeFAT+U0WQcAXIN5eGsp6QZpZoV2gOFGk49H
         H/dUKEc0aEX/nKiPQVqegzQ1NRBD63/SURisn9i0Yvc9yz1tY5QlfTYJ0kpZLT4qIi/6
         jXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614974; x=1770219774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HL0HkET+dj1w35XFDXNOqZl3z1k2yF2PBoeKmcws1E=;
        b=huFpZOV1MzSzLIYxOI8R+2mgoF7jXtushrjEAeyhYJ8OTIFNGGRu6mVpgldwivk+S3
         m6OsyTe6O2n5yOkpHT0kBkzDXAfgqmOiNHqKirb1rJC4xiTe4NyZVBFkXYNmLEM4XZiv
         u90P63R852ZK+a2qunJ16WRD7r95iTvI5I3DTV8g6vgiKP0NmrKOseRxyKMv4C2BLIJq
         KyJcS2uFr6p41598ZFazbTcSJX/6ILAcbGhON22dI52FatgLRQeGDB+pwFwhLtbTPme1
         6ob9vIlK/oeRiOsYEcQyF0IjkPD3lmksTzZZ89D7IBs2nHR+RMjdNoYiAcu5jPSNJdKQ
         hQgA==
X-Forwarded-Encrypted: i=1; AJvYcCVcNPDpmERt6enfluDxDvuYvNUp8MQpVcdJISN2hV4w4UxsqiA6mupOVHm6vMj3vF+Wrp09uNOe5Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2HbALP+CA5N2NokgnYZeGTG1iHjjWTOeE9+iMdR7xt5xTj4u
	ysnW8eEuwLmWs0Hmx0Wd8h2BNcOqkx+C0oGv1qMpHXh8ytAV43fccuK72B+g0QjELAZYQgwbRn9
	1lOZ+OkLwcmZ25uNXMuOP4PQsKQMjzeN18mqwlF9Spg==
X-Gm-Gg: AZuq6aK5b/IpI7wQf+xKnvoCYn07M5jTv5fdvFu1xZT9WBBAWIwoKI/TAabjBeKwm0L
	xt0EN7Mo6lyQ6sqeuuj8PEiK2m56rCjf9AFOz37NqX5N9JT6a0b09Wm5Zef6dtxIAMIAo8FSyMA
	p6mZCdqxubvPbXmA42ReypYNs3+KZXEzpUq9kVHbSRIFrYIr4o1BUxPlAayBMzX6lklUh/UhpWP
	G3K/3rKAhpJVftF+UuwzszuT8hQkZ9VDrEnNsC5u/ugPhNSwlVGJwLw5fyElTYf1ijKKPasFIY0
	7i9dWke3jgU6LuNLA5NlIi3nLA0VKdyIe3LBbo/dDeM403OQoeO/yDYh+7pk
X-Received: by 2002:a05:690e:1481:b0:647:108c:146 with SMTP id
 956f58d0204a3-6498fc469cdmr4118109d50.57.1769614973756; Wed, 28 Jan 2026
 07:42:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud> <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud>
In-Reply-To: <20260128-duckling-confess-88e64fabe752@spud>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 28 Jan 2026 09:42:42 -0600
X-Gm-Features: AZwV_Qi-uXOx5p8xPeM0zhwGXZ9arE9COUg5t7UOd-tNyeJsiugC1O9p5HwMOKM
Message-ID: <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Conor Dooley <conor@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Wed, Jan 28, 2026 at 9:02=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jan 27, 2026 at 05:39:33PM -0600, Anirudh Srinivasan wrote:
> > Hi Conor,
> >
> > On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrote:
> > > > Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> > > > and resets. This block is instantiated 4 times in the SoC.
> > > > This commit documents the clocks from the RCPU PRCM block.
> > > >
> > > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > > > ---
> > > This is pretty suspect sounding, if the PLLs for !rcpu are controlled=
 in
> > > the rcpu register region, why is it not a clock parent for the !rcpu
> > > prcms?
> >
> > I saw another clock driver doing it in the manner I did [1], and
>
> The example is using it just to check lock status, which I think is
> different than what you've got here? What you wrote implies that the
> whole configuration for these PLLs is in that register region.

Yes, it seems like that example actually needs one regmap for
configuring and another for checking lock status of the PLL, but in
our case only one is enough.

> > thought that it would make writing the bindings and the clock driver
> > simpler. Each prcm node would have a single input clock (otherwise
> > there would be a differing number of input clocks for each prcm node).
> >
> > What would you suggest that I do?
>
> I suggest that you model the clock tree correctly in devicetree, even if
> that makes things more complicated. One prcm node having more input
> clocks isn't something to be afraid of, it should be pretty
> straightforward to handle in both devicetree and driver, and is not any
> more complicated than having to deal with the syscon phandle that you
> use at the moment.

Understood.

>
> btw, where is the code for the !rcpu clock controllers? AFAICT, this
> series only has the rcpu portion and I can't find the code that actually
> uses the phandle. Why is the patch documenting stuff that has no user?

I haven't been able to completely test the clock driver for the other
subsystems yet, so that hasn't been posted yet. One of the comments on
the previous versions of this series was to document the complete
bindings, so I've tried to document all the 4 PRCMs.

>
> > This would also avoid having the clock tree in the driver contain
> > multiple entries for some of the PLLs (one in the rcpu subsystem where
> > it is defined and another where the same clock is referred with {
> > .index =3D 0 }) which could become confusing.
>
> I don't really understand what you mean by this. Can you elaborate?
> If you mean that multiple clocks produced by the prcm would all use
> index =3D 0 as their parent, that does not sound abnormal to me. Without
> being able to see the !rcpu driver implementations, I can't even make
> guesses as to what the clock tree looks like.

In the clock driver, you'd end up having something like this

static const struct clk_parent_data osc_24m_clk[] =3D {
        { .index =3D 0 },
 };
.
.
static const struct clk_parent_data pcie_pll[] =3D {
        { .index =3D 0 },
};

Both point to index 0, but one is for the rcpu prcm and another is for
the pcie prcm. To me, this felt like it might confuse someone looking
at the driver. But it doesn't affect functionality in any manner.
