Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F121C16D
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013557; cv=none; b=Do1lxsdKAUOPl2IQ37DZkHSTulDGbfcMU1IDPbfLn+QAVvyC1geAUccVT4Tq79Der1eoVOE43W4+KhYGiPu1/grpXu9DfY9ye1HgEmZKH1Zzr0czKsS5h7A0HTcY1IYTJA0qJ2UqQVtqFY7aVCTQ7W6ohoXnzwDIhlPGT1UqPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013557; c=relaxed/simple;
	bh=UXt5EXFTIUCSIejkEueO1TGqvacKY2Tzkl6QFLDHdac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTG1gmiH07fg9tZCMbZjJDLwXVCjLbzWg940NRZQtLAAGF8ZciogY6Rz0ArkxVBN7tad+nTBQ0zE0HnkJ6Oxtmc7G/e0M0OmM4LW/CBsN3SIruWBU2nPuSLSlPmvOUdjm+opbpzjkb+DMAXooeqOq+uy3pKZke5ukIMzcQs+4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eb+CrG7R; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eb+CrG7R"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70c7b8794faso381557b3.1
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748013554; x=1748618354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tMirZWfsi+MGV8gZCAIGOzywZSQ1Z0yW01g9pidm94=;
        b=eb+CrG7R7IcCQ20OExwq5k0KXZ1MTPBLR5ij72LMiH15OndFKSeAn1hXRaPletYgkE
         G7lcz44h63m1W+kPI516iYGMyLoFvD1fGd3uI/f52kNYT2D2ODi67b0F2TuayhZmjtus
         0BuEPWmkeF/sDBf235aLqt9cTI7cK/pDDedQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748013554; x=1748618354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tMirZWfsi+MGV8gZCAIGOzywZSQ1Z0yW01g9pidm94=;
        b=PmiLkTo0lmGT9GePSQKgyZXNvv5MnTMgaCWg/e6W5js1MH9J4SAK2IxaiogqXrixAO
         ZO5nvFlDPqC5wB4hGdsjlBoj7E/IT8UwUONFS7AmuUx3bUnchvNeVGl+Oo0X29xWdYd0
         VAqpF98EriolVRZKC+cCfmA3BB920t/+AhSF+2tZMy5c1O7MTFnKyZmDH36zjuEqGts5
         tQS8fKYCh31cDRdVii7MWeFjoiCyIzKXgQ184dJ1mDCW+JOWkgSNKI0VKkz1vnB/jn/1
         f5dRouEB4SmpxM1ipHqt2bnQG8QtaB++UtrFrdlve9eiKADfDXgwfX7XxfnrTKHNeYaS
         PbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpct86TjfQG7D9Dyuqb+7h9jyXff+OEyfJRdalmaUVJHyoaJyJvhM5J3Suy5jtUj+OLFvyxTuRRF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHAlgm9kJx9KcfuKT9MM9n/afFD885PqAKuhMEFnxhyyUVISM
	+EodzYlybrap6GNH2txFKTh5Ia4f5c9K6qaXpPkymK5DtjGFQSiQ5KqbjHxgcSo+tJEOfajRrJi
	HXW1fYirmg7HzaLaIx8qImp+QuiTcx/zdkwFHp4Vnaw==
X-Gm-Gg: ASbGncsLuFwH0Sey512qmBhwo9c4Yfzy+zo6tDRONyuidFddSh8CzYMvtUQGIk0qbXf
	zeN/pZ0O2ZwkfK+xdTKE/XpLUIeVQzQtlnpvJBH8bWTg/Bdv4qcP7DfH+kixuVoujlnIov6xOyA
	90Q+s4gu1OjdnIy46HrEasJbsFAQ5yqCJ1Af7oGEg=
X-Google-Smtp-Source: AGHT+IHxEZibSLTC27ty9k9SE4RestS9NJakh2D2/0B6bmuMwt7+v2CHzq0G2guIGMTCMUwepBrci7zFuK4tcost1sw=
X-Received: by 2002:a05:690c:d87:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-70decdda042mr174164037b3.24.1748013554100; Fri, 23 May 2025
 08:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com> <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
In-Reply-To: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 23 May 2025 17:19:03 +0200
X-Gm-Features: AX0GCFvfElR9-JsrdMn4qtdpNkk4pgwm-5OPkXQJhrc9LVmxjY0io-Yr760AW04
Message-ID: <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Abel Vesa <abel.vesa@linaro.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Abel,

On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wro=
te:
>
>
> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > This version keeps the version v9 patches that can be merged and
> > removes the patches that will need to be modified in case Peng's
> > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > The idea is to speed up the merging of the patches in the series
> > that have already been reviewed and are not dependent on the
> > introduction of the assigned-clocks-sscs property, and postpone
> > the patches for spread spectrum to a future series once it becomes
> > clear what needs to be done.
> >
> > [...]
>
> Applied, thanks!

I was surprised to see that the series has been removed from linux-next.

It=E2=80=99s been 8 months since the first version dated September 28, 2024=
.
The most critical phase was version 3 -
https://lore.kernel.org/all/20241106090549.3684963-1-dario.binacchi@amarula=
solutions.com/
-
where two key issues emerged:

 1 The CCM design is flawed because "in the current design, CCM is
   taken as the producer of CLK_IMX8M_VIDEO_PLL, not the consumer."

 2 A driver for anatop needs to be implemented because "using clocks
   to replace fsl,ssc-clocks is possible under CCM mode, but you need
   to develop the fsl,imx8mm-anatop clock driver."

These development guidelines, agreed upon with Krzysztof and Peng,
enabled a coherent implementation of both the DT bindings and the
code. The following versions, from v4 to v8, were necessary to
review and refine those implementations, bringing us to January 2025.

At that point, Peng opened a separate pull request -
https://github.com/devicetree-org/dt-schema/pull/154 -
for the definition of general-purpose DT bindings for spread spectrum
handling, which ended up invalidating mine.

While waiting for his pull request to be accepted, I submitted version 9,
trying to at least get the patches for the anatop driver merged,
eventually reaching version 12.

This final version was merged, but then a few days ago it was dropped.

As it stands now:

- We still don=E2=80=99t have proper spread spectrum handling
- Peng=E2=80=99s pull request has been stalled since February 20
- We don=E2=80=99t have a driver for anatop
- The CCM design remains flawed
- Not even the first 4 patches of the series were merged =E2=80=94 these we=
re
  simply a replication for i.MX8MM and i.MX8MP of patch
  bedcf9d1dcf88 ("clk: imx: rename video\_pll1 to video\_pll"), which
  was already merged some time ago.

Could you please let me know if you're still interested in this series?
If so, could you suggest how to resolve the issues that led you to drop it?

Thanks and regards,
Dario

>
> [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> [02/19] clk: imx8mm: rename video_pll1 to video_pll
>         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> [04/19] clk: imx8mp: rename video_pll1 to video_pll
>         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
>         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> [11/19] clk: imx: add support for i.MX8MM anatop clock driver
>         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> [12/19] clk: imx: add support for i.MX8MN anatop clock driver
>         commit: 80badb1d7264e83b512475898e7459f464a009c9
> [13/19] clk: imx: add support for i.MX8MP anatop clock driver
>         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> [14/19] clk: imx8mp: rename ccm_base to base
>         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> [16/19] dt-bindings: clock: imx8m-clock: add PLLs
>         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
>
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
