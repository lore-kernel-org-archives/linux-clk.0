Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD421ADC7E
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 22:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771368564; cv=pass; b=ZADgtIOS+WGJSluddOPK32JJwCzIyBtO6AHw9arzFiB8PGLuIwhAqQw2K7dc2OLu1Mx+DxErdRlPcoPp1qbyf7LIWigiDdYNIcw8WDCp25L+HuUhA/JMrRdAjFndy9rD3JuE8mV4lu2YKhmc11jDfxjdBpph5Rt6o8A1cIwDfW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771368564; c=relaxed/simple;
	bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s65FNK+GZstJLQF1NrV1bNezxvvd2KzlO28U7D+7TybzGT8DbXFKdp8a+6shXes+gsI4SqGWn1aGusihG+CMaI4sNJAULE8Bp1q/fcDzeTO8cV0vrYNThnZEiGiRP6jyptJ+ZWLNbMWxg00y65y2oYsmpl98nGcmzoNnhnNebHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=FTbCNC2i; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="FTbCNC2i"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649dbff9727so4303866d50.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 14:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771368560; cv=none;
        d=google.com; s=arc-20240605;
        b=Vr3P9AOPOaj6HH0oc481XaqpSN7U5rAF6D1K9zTTBvG1ChZ82+6CoV3OJQgF2MKTIT
         +CIcthu8P25xeGpZzycSkb55Ndh9GHAoqJkglqp8Z8sIHJzUzy9eMou3OEJ4UUQX7I7j
         O2h+Ttk+OaSyUEiN//B1uR3Z0L4pPhaVetRZN4TUvoKprgVmqQbCNHdOwD3i6yNrwSYD
         67PH7AhyBxoCkWRNukMHPCgIftlreEj1QN4yLtWTNJslUIA5+duysnGrkhHb/S0fPjv0
         cgaSPyT7ANkwCzxj4b7+G7c0FH96YFgvEwEVYq3UIkwOh93Zngn0Lq6LR4TFAZ2ZNUca
         DKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
        fh=Lvpg5g9+WW/QHqd7qclieZY86FwDO+yo4xquZpTLzQ0=;
        b=Ks55M0zWqOnptsJ3LRGhZsyVVuHVZv21m3TN0rHtnbbCld8+tj/VrHJtHIDDtXWcry
         vh7WJw8egPNEpBwanOnXaZ1yF/8pCLmbdzr1X+a2ExZhKuZRLGSoFgwbDSFohjVdfOY7
         yAeJ+o/WxZ6CL9ONTlCpLd/PIHALs/7CID2ojyHmodHdBZ86Vq/YE+ZRtgHeg80j+dDW
         s/BDB5ETEqu3VPHUYMF7l3G8CdMpdlwW+h3R8BJc93lMZK79LSSNKoJr8sOCBGbrS0HT
         Bfv3okiaNW+7xfJVEtFdJsXLTaSMmKLp73cQTnpd8i4y2L37edWjmKLTc5jttQ028GK7
         vBaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771368560; x=1771973360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
        b=FTbCNC2iAyTE8xl5QGlZjJTJhvgNud2veQJz/drkMVJ4jwvXRB4FLiEY1nDGYtSJNF
         dR/2mVQcHly52eDpRLbnHr4WcaxplpDCTXZeSG1KTwA54Uxy8Y8PoizA21+ln3yOoWDD
         L7xfYJoqxjH5caVWtV/LmVr6W5Ub77CJIfsusItb9Q8D6u0GR8hWXG04jtbaHKS5cKxH
         H4pOrk2P2uxEgd0a8e7KvqjPV2UjhXcUR52XFpiNNwc+Xi44ltkUY+pgMrkpkWYG/E7g
         BVjp/PtkbcczvLeCfloKMa1CcXuQVsZBxZndq5JcJFKFPz22OO+eQDi8Aj5k/n5QdZFM
         tQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771368560; x=1771973360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsna6x3edOZVDgHaZx8mdX2v6amo8aiMzBSafaXBTkc=;
        b=cKv+RAoq1tnxuIAirVJSQia/WDgs9bXqTlqRz2ZvD4e3sKFp86L2sJRWBH2tSE4llT
         I33acO+xrzfYcrTe7LKtnwWrPTFXQamCFoxwSCYDz+sbu7VIggHp9CqvS5ukehiA5b+y
         E0mpy5aznvy9uZalQSiYB/hMKWZ+clVA+DTIHn7LHU8mVfPV7U5JVJkQmpanSeYloXm0
         Rbn3/TypjXG8FRmaCO3xH5CBdgL4EfsEAo/Kitw8BX02z6ZUvQHxRiAogsz9E4V26SJI
         sQeL6V559TzsbI1oic67zJ29P3dp+8HGjtMoY3K+0WuexlH4sKiVAPRd2qHRrb4KTlUp
         D67w==
X-Forwarded-Encrypted: i=1; AJvYcCVhxqJd02UUw+VcVRCIyN5y0gAKonhO5ZfW+3nbe6secxdl+/4MkwaMdxBZg+IguhH/+PFwZy5VrXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8putLtUIIBl4n11XmgSckbgRMtWOVK9+aj0yC4gsv5CsFGGz
	wCt8GcqtKvOvO0Qq/Zmyz/vWM/WY+OVsQN4EwIpwnadUA3RqDV7ZI6vHrRlYXNZ5KyC62u3MWPs
	youDo5t8LVf/dShkFbB4DaYMrBTcpuJEYTRObUBYhycm6g7R/LhQ4
X-Gm-Gg: AZuq6aLdxOqWGhkRpIuzPDfFy/RvCRqIPFz1SMQmaZjvxUsiKBNohBPAUf5ZbMx0sIu
	6JjYjBZsyw674LQFtEVSbI0SulR03TRfjfqsdAAclTAbWFvcMgslSt50BdBddRjQXXhMdIv7yRm
	sUCEEYEqOCFvlBiXKiNWo3hxzY2mROJc5+BXcTTHyjWHi9ilMwJfVSWAOf0z7bVaHt0muMA5HDX
	uRITtOn79Ar/zjupepX/BQxcrz9FNOUSxKMySxRl4Fd981pOQoO9AfG8jrvMBNSSKChuqH7/dms
	lg9GokUDe1x5MYWbbUkh/Z+hVudtlp0z+w/su7z0dqJTZVeOLUySQk8Ah4FnfVvlb+pXtUzu
X-Received: by 2002:a05:690e:400a:b0:649:422e:a68a with SMTP id
 956f58d0204a3-64c21b18c69mr9328991d50.57.1771368560092; Tue, 17 Feb 2026
 14:49:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
 <20260216-atlantis-clocks-v6-2-cb46d6a59c73@oss.tenstorrent.com> <015b88b520db434fca21e83958c68cf6308f0f79.camel@pengutronix.de>
In-Reply-To: <015b88b520db434fca21e83958c68cf6308f0f79.camel@pengutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 17 Feb 2026 16:49:09 -0600
X-Gm-Features: AaiRm51UZzG8LJuJLKm629r92R1FdsrpU_nWD2avCGXRFaV4lXSvAPtvhubd62w
Message-ID: <CAEev2e-tHySkWQBE6qUNQq+zayc+P30DV0=0LJw09saSoh8fNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
	bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Helo Philipp,

On Tue, Feb 17, 2026 at 5:59=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mo, 2026-02-16 at 16:16 -0600, Anirudh Srinivasan wrote:
> > Adds Atlantis Reset Controller driver, which shares the same regmap as
> > prcm ( clock controller).
> >
> > This version of the reset controller driver covers resets from the RCPU
> > prcm.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> and
>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

You seem to have added a Rb and an Acked-By. Did you intend to add
both or just a Rb?

>
> to be merged via the clock tree, since this depends on patch 1.

We have a tenstorrent soc tree now and were thinking of taking this
series for 7.1 via that.

>
> regards
> Philipp
