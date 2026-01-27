Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDC521CC44
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 23:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557187; cv=pass; b=XoqLvwBht9xv6i9NGT9trPEUjKgWhlGvoBLKQZLox2gw4EG9WJHWub/JMvpHQSjm2YkCq2Mp8bE08BsNaxKJcdW5uzaja+f1V8rkklm7AplP6u/qPtZHHe0+RKSwgf8YkR17hgFooLWBYpJMzolP0QDggVtQuXdMlO/3ZZEO9GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557187; c=relaxed/simple;
	bh=gPUgnxSD/COAjPWxazc5+6dYIjSjUxVzMbhilrZJ3L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKZfWNMHpg4Ed5+6KLtneiHvbffnGO48QjPic2UWw4I2TD7GIIGJyGbBUN7IvNDOIQ/FqyDnkP4yDNAbsX+SpSmZVx64d47fCAtA/qkwdLQvkGtfTWdf6hBIsDWfMw/7BOzbFOjLfIPjK5E8efkIPtPpxoGSKXyjTgdgySxrpLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=PjqyaNLd; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="PjqyaNLd"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-790ac42fd00so64192357b3.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 15:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769557184; cv=none;
        d=google.com; s=arc-20240605;
        b=ZTOnrsLU5je6Si3JtxnPQjCiALY56xfUpxFaBdhSwyTWZVG/yWlhEhJ5O1L7eNzMwK
         WfU46k8CD6Jl6xLqw6KQ9YeBUOjY48WuJ+Pc/rxkExHi3O3+ctyhnUC18jVydAgDqNOl
         3FQ3b+BG5DrovO3mGsQ9uDSPXhENpU2jRhBRLGSdRCqbrfXqgBzMQpjXRW0NXrnhwX6t
         qUP6Y03X95s/WKptHGANwmgliN+l0wH8JCLu+/qvQ0rINGcmiDEa70lIWfeJDoZ6JPfH
         Y5x6zgU7uXkPjud+99KkXh2BwJZe9IbiDfG0VBxsOC6taOBj5FxhK4ta6Pcniz7kQDDU
         t1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HLfEbFRwaaXoEu5p3+t5bvDBAaOn+hEnCv527EKjzLg=;
        fh=BcYlKpqYv93yc6RceJpCsXePGUgNKlf9oWBs65I2qB8=;
        b=lZWvfwIOLn8yjKh9srryAqiqNm9zynwEzVt4xDIsekonUEXfvJFPT5O1sXJadb+QqV
         2p5rLdWEZlQI6wo3e1IMH4q6mj48SgQc2mVcsxFPN4FMQ5kOMFSks3wzeYNmt0krf9Ze
         4xlkc3cTmwLFqwo5YDLC+yR65OLtcGupCxzLHYn+d2vg82hybk2WLHcjRZvOCFuuKrwz
         icllu1rKMOiD+fuu+AzzpvvjMcO1eJO+4WSSlX9eE+I9dY22/qsHzWafeaOfEv7HFFUO
         n4XZTxqkC6joepbw8GWVrdfSU48TlBB2ZpGQkURzbAwmipqpWEKwKw9a4uPFAV+FXN5I
         6sMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769557184; x=1770161984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLfEbFRwaaXoEu5p3+t5bvDBAaOn+hEnCv527EKjzLg=;
        b=PjqyaNLdR1P6agYHzo+g2U4qdb5I85CCflsqRFdIWOE8luMRKkW8baXF0OewlmL78M
         8mmFdjt4jwhTztpju2EKX92sJxoqcRX5MDCZRQwKRUmVUp3HTa35lgkjeCkAJ9Sn0MHd
         gOvsXGWj9LxVGYsP0PMRtHBgLB233kb9k3v3K7JYn7hhhiW1+mMkFL7ejYWWIAWYa8Kb
         t6NsJq/Ys97Huzpzr3jUir/L69kmfGyRvVv/mfX1h3DMVUhoU0Gs9gUQzpoG1X0EEgSL
         s+SC600vuBmTXtM5qQORS28lIZ7kuyhlwdnnG9/h8ND2HPi2oSpL1GqniIHjkvRUIDc4
         ZVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557184; x=1770161984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLfEbFRwaaXoEu5p3+t5bvDBAaOn+hEnCv527EKjzLg=;
        b=QsJsVya/m5CSn5trUuvgYBnV7GAkVQBJ+KGDxzk/ckaxRrXDEcFb4QQHdITwHoLAPc
         DK0rpnRlt55f5lTiUawn5IK3mhLejdWiWvXqG1a9zHoYBwW3svVKUOl8b24Ux3IZ4mny
         x1aWf6N8imNsdfpoO79FM5I+IIM+nLMlq+lfpUY5MCyt+KamyXSQihsdNpyRNKus+/R8
         W7tlbIwk3ExsgnIVIMrXrCQdUvs7Gfz19hY/BmKsCcedXQ2WqsMq3/4VPjKqq158+ICF
         ILWGt+LKqeyuCZJ5t+5IUJvrwEwdtlf8os29eM4aTpms6ZBfMj6qOaewFzGYmF4dq7ZE
         pNPw==
X-Forwarded-Encrypted: i=1; AJvYcCU16MnKWSH4sqJEsYVNloNRBKQlY5j8UWDYt+6NYxwKKEckthjf3SjLVJyJQ5cc6ihiMwDAttDxq5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLv9inSCThWTuZzbXvLbmp3pfxQgwCYeexbYwl/3Sofwmf8m+c
	r9XYcUkNA+cYUNJ0E0x17/9iL2nWmjmKRHPl4Oyf9V0ND6Vnk7TC7ruKLgZIZBFE/0CN9AaBjAc
	gJwp/dd0TMde9XV2YGISDtBUimE9CFrVx9IfREiAhaQ==
X-Gm-Gg: AZuq6aI31vxAhpxrJoUx/phbFLXOR0n3U2bA1ncRy8jDgr81QNJW/Ll+fSl6uVN4sdl
	m8SqMyircW76GSmnnirLoHTExHLHPzJHSdm902XkJXBqS+X1hoknCremMMeDvjS9yFUyE0vXvdD
	Jf376hkHgR6DHeNjnPZwMO5Y1DwNgMxiB5IpiND+xehcLxroUfcK6NuR9rOltj1gOOpHxld5uyT
	5XE65cv//rObho+JeF8u4aI1DCfWjwbh+isABSHLMCE1NikNcv4sxmudaTC7nsoOeAZ7IVXa2/Z
	OPjbaqxHaFJkdmhk4kKqp3Dsa4cPMRoP9w3HgiHbgDsIT5F2fzIs9ubKhdqe
X-Received: by 2002:a05:690c:c384:b0:793:a2fa:b980 with SMTP id
 00721157ae682-7947ac02c85mr49512957b3.44.1769557184251; Tue, 27 Jan 2026
 15:39:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com> <20260127-mystify-carmaker-150aa3fcd6c6@spud>
In-Reply-To: <20260127-mystify-carmaker-150aa3fcd6c6@spud>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 27 Jan 2026 17:39:33 -0600
X-Gm-Features: AZwV_QgU-_hZ5EIV6MqaVF_pm5xoRa9QBwjZNyO1hs18RpJ3g9G6LAL8JmHvLPM
Message-ID: <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
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

On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrote:
> > Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> > and resets. This block is instantiated 4 times in the SoC.
> > This commit documents the clocks from the RCPU PRCM block.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 +++++++++++++=
+++
> >  MAINTAINERS                                        |   2 +
> >  .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++=
++++++++
> >  3 files changed, 187 insertions(+)
> >
> > +
> > +  tenstorrent,prcm-rcpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle reference to RCPU prcm, needed by other 3 prcms (PCIe, M=
M, HSIO)
> > +      as the control registers for the PLLs that drive these subsystem=
s are in
> > +      RCPU prcm's range
>
> This is pretty suspect sounding, if the PLLs for !rcpu are controlled in
> the rcpu register region, why is it not a clock parent for the !rcpu
> prcms?

I saw another clock driver doing it in the manner I did [1], and
thought that it would make writing the bindings and the clock driver
simpler. Each prcm node would have a single input clock (otherwise
there would be a differing number of input clocks for each prcm node).
This would also avoid having the clock tree in the driver contain
multiple entries for some of the PLLs (one in the rcpu subsystem where
it is defined and another where the same clock is referred with {
.index =3D 0 }) which could become confusing.

What would you suggest that I do?

[1] https://elixir.bootlin.com/linux/v6.18.2/source/Documentation/devicetre=
e/bindings/clock/spacemit,k1-pll.yaml#L22
