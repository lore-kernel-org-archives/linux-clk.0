Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240054;
	b=xJ6HBHi8spRngfFmKqaEsQ+YaHJRPa7vpSXBmBmvvHwCI80YRMwIcrPI8WM96diYQP0z
	 dvBRDs/S7ceTy5yDjmucXe6YyDLnz8TTNyxyJ6wapyr1qJCDR/Z4YD69Anz3VOFHv76rE
	 TCrttM49xJH8x/GqN3NP3020Dmm+jj6eLV3kCCdZnCQlVMO9Px5v4m65NSSXsaBiBJSJm
	 Zj1+GNybSgisJnuQ32zTPfHmlei61EIl6ChfA2rnAWP77tTA+xY1p/Ta24Ibu9bagBetl
	 lYb09s9VNQ9WxT9MNwIqw5TFsgMFgs5OyOMJ3+72xRV5yZ+NsG+9SX2TyhrePfEpDAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
	b=JZ6lLzcPe1BOJ+a1TOigIrUNCImI3Dz/9iNYSai+BMiuoiamZ5NWZFsGzL4ZFL3V21Lc
	 lyhLT9Z5LLv1uAA2yTKwUtYusiaO+8Gnvm7vL+bffFgk6rnmJ0QfXfoc4nidvv7Cy1yoK
	 /IiGZPdSUMNrHEs00EWsglmJoN4SrEBgtodewyJjKdyCrKgeThR6MFzmFJG7/ROwmjWE1
	 8xH6igbZMzGIySylHy6d0JFaNiprNyHyvn61qQXhQauR40xUhMI1kZK3egwkFKFMtrlF4
	 CUzNA9/f04z2ABxQvzW2v7FaQA/itRHuYuAWnSWAI5obXKWuh90cdiTt2QPOoOD2iRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD160A2629
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 16:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FCD160A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XsshOqMz
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1683772a12.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 08:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240052; cv=none;
        d=google.com; s=arc-20260327;
        b=G2oR6Hsx26AnY7K7IStri0ZWsNwieQZ6A0QnbJ+6sonR0J3PVPELDllJ+8heySKqgY
         KLnP+Pvfl9pNZ+tXe6M3jGDHcZGqMDrbzpSq8YIIiqok4hdgRp0NvVblW+CtcAVkHMvA
         9hda/mTaQ6ggnFerWtZdioX1QEoWIA4QmcWjOEUL3hq2mns6GJ4qsjnje3E2UJNTlP6t
         Ccqvxg90baYi0CCsHgVl1o5fNAqDPziypsgHv3VCd7L09LAM9ai6htIGn/OJsZ3VozTb
         0jTELmyFdIrCVkcHtBU7+JdgQX24tAkTKX+4Z7T+N0P5YK8xH00ErDcnhHCvyF8IZizn
         VcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        fh=gHyw4fZaKge+ux1LwnamckjFNocfM/P/5LHu1OT8KUc=;
        b=Mecg/RUOjz5vcV2xcZiWapNj2pjiTzEAOvK+ducU1k//J0i+2RbZo1t/7iRIrtzLlG
         AZwGQEkwnNjXTGoTNKXMWI0zOn3jDtSmnRDzUggBr8tSH3wEwyR9LTZKdqZFoStFQ4q1
         FZ977wvxJ1M7A49sra9D5gXKu4wX6vHxzWW8EOpOkQUH2S8zJpNm6QNrU+YKzlmkONRc
         qblf/E45/w51TNiHkgYQniDAXwheqycZSD5UoGIRA1Bgr++CUm4beoBkHEG2wQdukUMb
         JnGXziSjBcmg5PHdtaICBXmIpgCNQSHgsYM/tbrjhteJjIfBZdsRBbmiLHlU1DkxhexP
         Tjmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240052; x=1794844852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=XsshOqMzA4g7VkUFJSMBdIgw+TyNKoOTeZcdXvA2/JueLosVVFf1C1anFVPFqzsdm/
         +il24/vmlBaJ+7GEebvhk8L6xeucLXfjMgk4BCtasOETmK2ilY0mnGPZJiMUCECbmIOT
         qh5NN0+nRWZcTbaiPUHeRJDKjbLLCNKGkgeHK/ulASwD+SBj0PafYUVdA+gU/Zk9PmDe
         sKkXNPtxtGoHTWYE2OJRyc/+zykR19F3iaUdLi/Zy78CpfTt4Q6And+Wj4tufyBodwVc
         ctKxYkiw3BSI0Tx+qZwpeeuCXN5Fwat8kOF+OWPx7UHHKkU9mMIV0n+rYKpkal3eyCj/
         71Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240052; x=1794844852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUAAWlNbR6q9k12Xva7G11dNMgLZ5tfgag11tYRdXFs=;
        b=sL9GGArEkvZcSePS9PaJEK3paQIWT+gJWL+83jYx5zwVmRdMAAlOLsXThAq2Mykf9t
         QzsyoD7bLUSb8bJj7eKBgB0XNJFWdJadIUGkAOK82VbpcWcpF3qCyT4Om9p8Q9gR+Wm1
         nbkJBGWD9fRVbqzYh0vDQByt5HD14H/9I7REc+lDQPp8Yqp9kIkXHk7Qu1WkyYlrMmwl
         GfYzF44cbjpQHV+K9lX/VUi40xbUehrsJwMX5DyDyhuoQoKC2kZouLrzZ+KxsRoPj6tD
         w806zXfrM+SYIacFXC6G0H0/Vi3EiR5E+kWAKshjXSdfIUiPpkoQutLXEKO/dyrm8L58
         0YlQ==
X-Forwarded-Encrypted: i=1; AL+hErFRvnYJecdAHQnJAyzCVLiRhwfipnheAb5ThtBEGjla0TSS6M6MNMz0f+3s34UcMs3CC69aK1fM/KM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gYt4tnnYlkjx9sn09rwoPcDzHJz4A0ENOWuUCZMi6S4boqak+
	ZESC9WNBgX0ihOO/C4Rw4azqZzLiBrbJBsmBrKjUb+BSWE68Mg743dGkirH05lXJ9wtaU8F8y2S
	xwCD9plAyuHn7zmdpTMwDmVIZcEfGH34=
X-Gm-Gg: AYBFou3gdIH+HC6VOQlatwBncNAoQUx6S89kd1NztJypCs0Oc3SnW+wzOpIAalxSzys
	Hu8mvpMGpRK/0wmGk1n22t/AKPCyf4yGH+RAIsmQV3HoZoa/CajRZMHrAcj6FUQPQH9q2aVMVpw
	M9o98vpLSSJnt777Kj2MANh9CrHqpCmAtnqCEZH3WnKtDKxh9xeKmbsaOl42jkPbyI3+1gjL4l9
	3M3ix9PFw/eckb9odsf4UqRHGMQVxMT2roTfP4sVR2RquamQ0gz18bmH7TVpsg1X0wHSUakSapo
	yAs+whMnfMbyN/QvjJaU213ScB+sa42SlJximAZy8QteJUEBUPV1CHCKfGt2saNHrWPyjcq8WQ0
	YSwBCj8+Ug1j9Mbb359G1BwSF5EIYAe7CTiDuHLCwUji7exTqjGcDSqflQnG7LBMQrelxybIhNg
	1z9KbuQhrbUPiVh6xku0WOWuDoGUEpxcLpzi0VeDtYCSItC4fK69tWYwgBCQ==
X-Received: by 2002:a05:6402:3908:b0:6b5:47d6:a8b0 with SMTP id
 4fb4d7f45d1cf-6b756afd795mr8207a12.37.1794240052060; Mon, 09 Nov 2026
 08:00:52 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u-3NFryZA_8GN=fR09+fcyvNGLMV-09z-mPXTePxkgvg@mail.gmail.com> <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
In-Reply-To: <744d20c9-9aa2-4f3b-b42f-cfdd0a17da65@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 16:00:25 +0000
X-Gm-Features: AclHuK9DoJ0CyffK9_ibsQ9MndPimemnqbVSvRuC8icXaKh7HkxYXoo5YAyMhM8
Message-ID: <CA+V-a8uHLK4-GFhWQO96yHBDzXYXQ+aggbWfskzXsK_17dAKCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add syscon support for Renesas WDT driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Mon, Nov 9, 2026 at 3:28=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/9/26 04:27, Lad, Prabhakar wrote:
> > Hi all,
> >
> > On Thu, Oct 1, 2026 at 5:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> >>
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Hi all,
> >>
> >> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs=
 in
> >> the WDT driver. The WDTDCR register is part of the CPG/MSSR block for
> >> which the CPG driver registers SYSC regmap. WDT driver now uses this
> >> syscon to access the WDTDCR register.
> >>
> >> These patches were part of two seprate series [0] and [1], out of whic=
h
> >> certain patches have been queued separately, so I have included rest o=
f
> >> the patches into this single series.
> >>
> >> Merge strategy, as the WDT driver now includes renesas.h header file,
> >> the driver patches can go via renesas-soc.
> >>
> >> Note, patches have been rebased on top of next-20260930.
> >>
> >> v7->v8:
> >> - Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
> >>    restart handler" addressing Sashiko's comments
> >>
> >> v6->v7:
> >> - Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() functi=
on
> >> - Added new patch to drop pm_runtime_resume_and_get() &
> >>    pm_runtime_put_sync() calls while accessing the WDTDCR register.
> >> - Dropped propagating WDTDCR access errors.
> >> - Dropped converting WDTDCR handling to regmap as this would require
> >>    resource address comparison to get WDT index to call
> >>    rzt2h_cpg_wdtdcr_count_start().
> >> - Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
> >> - Added if regmap is available, use it for WDTDCR access
> >> - Updated commit message
> >>
> >> v5->v6:
> >> - Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
> >> - rebased on top of next-20260922
> >>
> >> v4->v5:
> >> - patch #1 is new addressing Sashiko's comments to avoid potential dea=
dlock
> >> - patch #4 is new addressing Sashiko's comments
> >> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
> >>    restart path.
> >> - Handled the regmap locking in the driver and introduced nolock
> >>    version to be used in the restart path.
> >> - Added review-by tag.
> >>
> >> [0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.maha=
dev-lad.rj@bp.renesas.com/
> >> [1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mah=
adev-lad.rj@bp.renesas.com/
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (7):
> >>    clk: renesas: r9a09g077: Add helper to start WDTDCR counter
> >>    watchdog: rzv2h: Use pm_runtime_put_sync()
> >>    watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
> >>    watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
> >>    watchdog: rzv2h_wdt: Add syscon based WDTDCR access
> >>    arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>    arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR acce=
ss
> >>
> > Gentle ping.
> >
>
> No feedback on the first patch of the series. If you let me know which pa=
tches
> don't depend on it, I'll be happy to apply them. AFAICS that would be pat=
ches
> 2-4 ?
>
Yes, that's right. Patches 2-4 can be applied without the dependency patch =
#1.

Cheers,
Prabhakar
