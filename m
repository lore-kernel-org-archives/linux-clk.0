Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C931D381
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 21:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769634085; cv=pass; b=afqTK33xXr9hlthlwtOx+oEl6HQkbTAOQvStgymRUddIaq73/HCCNy4/lOytj8ieGKn1ChQogalB5UqeSAWZEuIh84XumEyhIl+9Q//BAhaaF+f9LcE2o9wXkIqm3Ys0C4Q5VZS1s4CKDtOWJ7J/usn8N/NNWYG/80jqjSoOFhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769634085; c=relaxed/simple;
	bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTnd8yCxrTq0vxJmiyBOIaXahmw/xG+QvD0JQXZMhm3p4uZr5yG7WlQyXBzWoVkofy2WyK6I9sD2RuVN0kWmPt6zuvS7JiI+sslNN0KT0iLO99R1ItCNUOhAM8fr3jgozDULiF8yLSrUE1+d4hE7ol8FSJFGuEV/UXgjs7mMFOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=e1BeNxbE; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="e1BeNxbE"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79273a294edso2778747b3.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 13:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769634083; cv=none;
        d=google.com; s=arc-20240605;
        b=MgRMmwEeDLUvI/zk0WjrVtRuSn0TNk2jmPjFqd4+6PDs1uXTWP27/LDV/QFsfgbEHA
         bmBpAzKtXDmNS4RTNgi5Wc+nxnHMpgqY1CVCZkIeVlNfWeuTBq696BB6WPuzgYQQeYCp
         kR/rKMm41umk3rFD052ErUEtXedon8BDy0Xmy+B1jNyJcEHCQx1EegoV01rpsdvk5+bo
         DnQleHOiElzJQhmZpSqYj7DvcBMsIDZe8wdACDGdI5MDEeqfUF6xRgcip9fUVrB3R7IR
         OUscgRMEoDNFKxlqn0OZHgmLv3dlhD5InMBvPh+Dfsof0e6HAMtlwzgsAZZGjgaaK5On
         JQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
        fh=XiWHuB7HmnaoM+YY1V8AsP/CTaJLt3n2ruJnXJ8eOz0=;
        b=ZwRSsoAsUG4v6w1AAPPS2nmHYmzNfzMEiS+xhUjaRu8NJ3saEM35FtqQyM9ygreAFQ
         Y+8pzfcVYVNpw+jFsoODDutRI+DN7izpfFUbwmOXgRyFQC3KApQ8WJmdY4lxA3JQSzal
         Rr6PR+JjbcklMQbFvjUl9qzfrbiODWf7Id2sRpC4h6Q9gF1bMcuoAl4sUuP1k06HmhPP
         i+7jWOLNHoSnJ5lKW1ya5ouNjdYSTTPNg9Sqne7st8HKMNAI1VT5hDAsmBlnsLmKZW4N
         mJzAU+qMDu+SMMm2VP0RhYw3wqusUtu4uNcIa2kNmA/1ZCdevd4/a40vVl23M94pkpGf
         T5jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769634083; x=1770238883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
        b=e1BeNxbEnFF7jWky50sCGNMplkmiWT0yNWkV9ages1z8Hl8ZUA+0Z+wmNb7uyRxzWs
         xEBfpV8z5lsGfC2fn1AhClS56Hxz4OPmwn2AUiT9CHVLV3hLpoO+vpxl6r12L/F+xZ/0
         3NtPsfHEliRgJ7suP1bUYwGhiQzFU37bw1GZOhL2FQneMFRgP57y6RNCiJj1TIkWfkgD
         mIHO/fOryrc8wQBx9sPArH3nZlMIhLG2vFIQbIFpiZOQxNGgDzuHGRxAJX8SgWnPxITI
         qMletHHtUCoHL0P2x5UMHX6tb3fukiQ3i76lFS1j9OxVU5/Je4TmdJnFSegTOoiD61xM
         QLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769634083; x=1770238883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q366hLe7gQaI5rjlaG/ooZDp0LuYfAPugWB8ysxyHwo=;
        b=p38vesf10FCrNE8qJXO9mAMumyj7VZkV9Yi0IZNA1ibccuqpejzVhdbEA3mr2vrZX/
         IFWT9XPOPmIdn6wpJK8jx74Ty9cor0wI7GBBpYVqnmk0QbFovmEV/9iL8lwZ3zrkmyXd
         9wUAn3K24McDds57OlZLxnk8Y4ng13ZY4A4JeaF23D1RoigEKwm8FSGxBFtsGmCp68aI
         lQ3a9ku1ZePbxs1AW8KLPZvQANyaUlOt6E/TNedRa1ldaDXLMuvIn0dkFxdJm5VA761Q
         QgL+K8lNHw7VQG/029D3+eJELFG1ArQwWMThPHrT8uolBityS7oX2G9g41TSfOta4VNw
         caCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuAr54cJ332pymCxiQ7d28reSYd41TqPg3kLNbJWqBy0/zPnSbtlOGxx6B4zatZrUwn2FJZeqfuNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTy/PuZsfu4g5RQWJZXK3Fn28Tklz///u6Sb/KPg+4BovPbOYM
	1mIVrGM31u3ktaUVJBApPtdREdD9atMhR0Xo95Bzky+ESywWRcUDU+L8461WTbMZO9bNvrJspEW
	gTWvw+ohIjCuFCIyYxlkNmWKkeEZpMr4doVdjBIWykA==
X-Gm-Gg: AZuq6aL/rc35UXyQtLs3Fe4Q89e5dhSazQsbLNAxMUUEor8pVwJJZbbvfndcBbteFSh
	bQhmVURtOcxqFN07W6s9g3yPKLQNUPtjwg71pK1l41bLNU0hzhuIW+p6sL9zoy9ipTys8InEfgd
	kRnN7AzQBwMGyHWDF3OqD/TxkYjFEMm4Gv6tcyTw9H3BEXChl0J4Js+nVhnpa4sQ9gMQ6FhItNU
	ZGDm06gC8/Y+eMBKobqv78CuXMlfeuIPbBNlHzMdxyzZjANjRKByeMR9fFCL/nw/1R1vOJXerrD
	aMBMAAvn503yYCJjkNQxFpCWtfLEUZ6uAvovcJ8PTz/50Uwu5t9orN804h4=
X-Received: by 2002:a05:690e:1901:b0:641:e6aa:583f with SMTP id
 956f58d0204a3-6498fbd7285mr5173079d50.15.1769634082636; Wed, 28 Jan 2026
 13:01:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud> <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud> <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
 <20260128-nappy-repaint-e464d9964134@spud>
In-Reply-To: <20260128-nappy-repaint-e464d9964134@spud>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 28 Jan 2026 15:01:11 -0600
X-Gm-Features: AZwV_QgfoguDQdOLdwSNveH96jgRmNQg1sP19SgMVUtC9BAJsQ6YIqpThUYUpUM
Message-ID: <CAEev2e9onS-ogepaTugmGSc4-p6H0ZL54n1yd3bofTWTnLRM-Q@mail.gmail.com>
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

On Wed, Jan 28, 2026 at 11:32=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Jan 28, 2026 at 09:42:42AM -0600, Anirudh Srinivasan wrote:
> > Hi Conor,
> >
> > On Wed, Jan 28, 2026 at 9:02=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Tue, Jan 27, 2026 at 05:39:33PM -0600, Anirudh Srinivasan wrote:
> > > > Hi Conor,
> > > >
> > > > On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> > > > >
> > > > > On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrot=
e:
> > > > > > Document bindings for Tenstorrent Atlantis PRCM that manages cl=
ocks
> > > > > > and resets. This block is instantiated 4 times in the SoC.
> > > > > > This commit documents the clocks from the RCPU PRCM block.
> > > > > >
> > > > > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.=
com>
> > > > > > ---
> > > > > This is pretty suspect sounding, if the PLLs for !rcpu are contro=
lled in
> > > > > the rcpu register region, why is it not a clock parent for the !r=
cpu
> > > > > prcms?
> > > >

> Right. Looking at the mail from Krzysztof, I suspect he meant to
> completely document and explain the rcpu prcm, not all of the prcms (he
> couldn't really know they existed, based on your v1, right?).
> I'd suggest you drop the !rcpu stuff for now, and submit it when you
> have the driver for them ready to go. That's typically what's done to
> avoid introducing bindings that need to be changed once the driver
> actually turns up, since as you say you've not actually tested the
> driver for those prcms.

Okay, thank you for clarifying that. I think I interpreted the
original comments as "once you add bindings, you cannot change them
later". I guess the changes I have wouldn't break backward
compatibility, so they'd probably be fine. I will do this the way you
suggest.

> If you think it is going to be confusing, then move the bits common to
> !rcpu and rcpu prcms to a file, with the unique bits in dedicated files
> perhaps? It seems like they'd be fairly different even with your current
> scheme and keeping them apart would aid readability of the driver in
> either case?
> You can do this extraction as part of adding the !rcpu code, that
> doesn't need to be done for the rcpu stuff since the concept of "common"
> wouldn't exist in upstream until the !rcpu stuff arrives.

Okay, something to figure out for when I add the !rcpu code later.

>
> Cheers,
> Conor.
