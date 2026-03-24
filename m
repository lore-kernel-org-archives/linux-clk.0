Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB73E558C
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334562; cv=pass; b=QmeZkw9hMj6DSecBwPlXu/6gwXEkuq1f1eNOs2Lj0nnsUTH+cPrHEF7LtHtqMx/b29sRxrB8kxAoIzDDLYtyL6tlC0ndkjJCvG5vNy9WS5DwzjHv1Qm4+nYFtxFMW6hx625Es+xjXYhr/nqd3UEPnbc89T9Yo3hTMbWJ3game2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334562; c=relaxed/simple;
	bh=pfBvUOdS3L0k+70ikBYfESRf7kE/vFfSaz/vCBw39yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTfU/U6jfQnzsWjKPTYOR22K+nKMQinDsC7IhOezocAhauKtVF2XhC+1K46oId9GGOgBHzQf7XA7PuLwTfy+/NS+rmLC08GhQpi05ZT3Qxel64dBFguqnnZga1Tk7AAu6e70VrVNTydnnFswl49+wBbzh+SEMuoSS94VscpySFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWNUX6kc; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWNUX6kc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso125824866b.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 23:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774334550; cv=none;
        d=google.com; s=arc-20240605;
        b=QAIu5w0XsDaMdww4FWG22GmAqeS+dn7IboLoHbcmJsuRn5rrPREY1zwQS1io2neGgA
         dUfcroHhYgU5jUzvWSrk1DcUW7l5MJG5bODx2TPlK9yDRFIlKjygKWk0bA1I1izu7WyH
         qs5eHQ7XvG/kMNNMYvuLrtLxG5rbUVGUbtYRVWKwHSX9j5Q7s6fj+8PcY87yt0/nI4Fk
         CrWIUVCnnLe3Bi2XDLe8Qp1rtmZ8IlQg58nTlsVat53Xls9EKbkBciYY243wETBW1xGB
         baEgrOA3MzrmRuX04GfmCibRqqfMpWXy81T0j8o5HqPbxWWlnALlc4hyjuuFXD+GDY3K
         /Uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugpJxAclVCmtKcWDm9x8ki1L9JFRH3AsCD5hq5XlnHw=;
        fh=JlluId47p5uq/IZc/yEKx/KWCb2Nxq9GGXzRo+uVJYk=;
        b=PB52WDmI7C6aiO6ZCIvJkEbOtwZFGABCZbtFFrjkjIl1Cw3019lW9nZWerfSPtNUk3
         MTkLVJ8wAhMftJRZQXtlOQBNNLzU1rslbcbvcmW2Ly+SHcsFgsYAyjCQLpphBwsuSQC8
         SYbmApSsqx/8dOZTlGJltuALbg4idsVgPm3Mf7ypb3Rvhi+dD9yhaMfHoNisFaI5L5WW
         jmXv6AVSV3c0uPlBhkaM066EB+CIfqY7oZ1W3V+V3j7I/JXU6PNaQJAk6BYau+ljvkhj
         UWmBSnbqLfcM8j6ZLbgxn+gIKQDbDW/cHX0anZ03L+N9QH9RuxASOzZnjU41HDGAnrMf
         mDyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334550; x=1774939350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugpJxAclVCmtKcWDm9x8ki1L9JFRH3AsCD5hq5XlnHw=;
        b=BWNUX6kcF6gd9RYxmcpaaNevmHMw2ZXOlV4In9kM9Bok9gMX5xWZUVvX1mygOfvERK
         LUu6afP2QRW6yIfEUdI5QykIXyZcYy2ZVmtZpoU09YgaCvcV1E9ukm85fKrw/Q/5kBb8
         V4N9kGr0KupTjQThGULzXAzzUvpA/AmFGj9jDwxRvquPEOIjiGJEsBvnF6rFZLP5SwB5
         frzUEVRV8KlU2hEjlSRyDKGTWVW0UdTiDrAF/xglIDY/MgugG7SpN7W61TfpyFvE50hv
         Q08tSiAmHT36VVsaGsNRLB2zBKpyAWqgUSpSrVkB8gw+2+acT0fuhbTIo1ePcrJIhp95
         EiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334550; x=1774939350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugpJxAclVCmtKcWDm9x8ki1L9JFRH3AsCD5hq5XlnHw=;
        b=XxuR4P8VaudcU3DEUgfc4HwhFFvTMx5ylKK5MSpgqmYz1pptMJvMD7lAI9ZIEz3GCl
         Q6LK7xDpYBWGuaVYeZyydLAz+XRWMkaA2ay3WiCRiMbGn4ACMvhafQ/yLsX7dqOognEa
         T16oqYo1IQtkpiPIkLrzwKp7fejMEx/bGe1+qhNa2eAeSbkSojVCZhtYVgiSkR/GPcnw
         GjNcPmI/2tPvByWVwA3Xm8O8pcr2ugBKvOGFhB4Kg95SPqHpC0N44GehiL7BFtr1SiZu
         MpaI2BvAbggOSexu2zPIFLgo5h1k9ZlxRKyCVJq+J83kPjGIf9WT27UDsJ2ujVJqf64g
         Qigw==
X-Forwarded-Encrypted: i=1; AJvYcCUU70YZ3avUWHxU7DEZ/Txyh7uayG5GxJfZMUfQOVU/Bv33XmT7slibiGYzQRLeopj8q2KPi7zSCSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzefdlzvcuefIdqfjcUQ/2ak1Mgn+zI0zgIqLinklISu7vDC7j0
	I+6lYIZQNyI3EU6yHTwi5Rq/siKB9EmV8TSTUAue+J+mho/d6UjgPVBF31ebWtGKi+s4GdW8BAy
	HU0bhi8hsBh7bS8Xz8uktiys1QMDweUg=
X-Gm-Gg: ATEYQzyyFqV6Cm7HBZI/3sW2QTNRI8OFCgAvm19bSPx99ID9LTzz0HZIRdeICie1rR9
	bDfWkIHgNPwZaAFiJaI5uxyPBJBjZL6WTIIXvUcAcaIAq98/YxWf++L9mQpz6m+dzX4DTL/RZVn
	rsk1lEMI6K/77PMJRQ6HUoMVb9m679pBd8gIHVjBTgN7WNB33S2B44aUOI1TYtH//adsjm0j5lN
	yjOml9gwGE1XR94dzZiuu7NTdJDE9gJEPaU67T3Be6kypSaEXrn1u3c0uZ2nI+jjE2e5xOJDuSp
	IWqABV0646QtacGXdRddaud5i9gBWjqEvDsSW5sgWSvdDfTzOkJDaj+U2m6Dy7rinN4Ry7HKMdD
	4FTL6Eg==
X-Received: by 2002:a17:907:2d0f:b0:b98:549d:8376 with SMTP id
 a640c23a62f3a-b9854acccd7mr671723066b.17.1774334549994; Mon, 23 Mar 2026
 23:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324015722.12507-1-rosenp@gmail.com> <2776817.iZASKD2KPV@senjougahara>
In-Reply-To: <2776817.iZASKD2KPV@senjougahara>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 23 Mar 2026 23:42:18 -0700
X-Gm-Features: AQROBzB_fGTtplSzK9mI89qLMudwBTlbTpWq_K5dPKKnRhiin1Ti1gHDWVHCj9M
Message-ID: <CAKxU2N9E-9HLCJfGYD_r+qaW03fLz9NVW=RWuPvotCbSxv3ueA@mail.gmail.com>
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:01=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia=
.com> wrote:
>
> On Tuesday, March 24, 2026 10:57=E2=80=AFAM Rosen Penev wrote:
> > For this driver specifically, there's no arch specific stuff needed.
> >
> > Build the tegra clk stuff as tegra_bpmp_init_clocks is defined there.
> > CLK_TEGRA_BPMP also depends on TEGRA_BPMP.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: also build the tegra clk stuff.
> >  drivers/clk/Makefile           | 2 +-
> >  drivers/firmware/tegra/Kconfig | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 760d9643705f..334d5c522394 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -154,7 +154,7 @@ obj-$(CONFIG_ARCH_STM32)          +=3D stm32/
> >  obj-y                                        +=3D starfive/
> >  obj-$(CONFIG_ARCH_SUNXI)             +=3D sunxi/
> >  obj-y                                        +=3D sunxi-ng/
> > -obj-$(CONFIG_ARCH_TEGRA)             +=3D tegra/
> > +obj-y                                        +=3D tegra/
>
> clk/tegra/Makefile doesn't separately check for ARCH_TEGRA, so this will =
cause
> much of it to get built on non-Tegra platforms as well.
Sure. It builds fine.
>
> Cheers,
> Mikko
>
> >  obj-y                                        +=3D tenstorrent/
> >  obj-$(CONFIG_ARCH_THEAD)             +=3D thead/
> >  obj-y                                        +=3D ti/
> > diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kc=
onfig
> > index 91f2320c0d0f..ae21f460807d 100644
> > --- a/drivers/firmware/tegra/Kconfig
> > +++ b/drivers/firmware/tegra/Kconfig
> > @@ -3,7 +3,7 @@ menu "Tegra firmware driver"
> >
> >  config TEGRA_IVC
> >       bool "Tegra IVC protocol" if COMPILE_TEST
> > -     depends on ARCH_TEGRA
> > +     depends on ARCH_TEGRA || COMPILE_TEST
> >       help
> >         IVC (Inter-VM Communication) protocol is part of the IPC
> >         (Inter Processor Communication) framework on Tegra. It maintain=
s
> the
> > @@ -13,7 +13,7 @@ config TEGRA_IVC
> >
> >  config TEGRA_BPMP
> >       bool "Tegra BPMP driver"
> > -     depends on ARCH_TEGRA && TEGRA_HSP_MBOX
> > +     depends on (ARCH_TEGRA && TEGRA_HSP_MBOX) || COMPILE_TEST
> >       depends on !CPU_BIG_ENDIAN
> >       select TEGRA_IVC
> >       help
> > --
> > 2.53.0
>
>
>
>
