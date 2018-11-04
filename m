Return-Path: <SRS0=E5Sm=NP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A28C32789
	for <linux-clk@archiver.kernel.org>; Sun,  4 Nov 2018 07:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3515A20854
	for <linux-clk@archiver.kernel.org>; Sun,  4 Nov 2018 07:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Ng7VVRVx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3515A20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbeKDQVf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Nov 2018 11:21:35 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46493 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbeKDQVf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Nov 2018 11:21:35 -0500
Received: by mail-qk1-f196.google.com with SMTP id q1so9744703qkf.13
        for <linux-clk@vger.kernel.org>; Sun, 04 Nov 2018 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kaNnUahRXskh6UU7q6PbIqOAudkKMFn2AL66oGR/UYo=;
        b=Ng7VVRVx6C5Wr0ZBz7f+gxCujzWcu8pujUaViz7HMx8PHKn4OvDp6+8WWJ4uIJi14+
         8sWizNhPsVIR4ARzHy5P+asjeSNcFM0tmQh2fDC63B/kJgY+45u54TKNohcXWFkqRpFt
         yxeMUP3RcFUazEhF7SzOiBSmzIjwFp8mghUY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kaNnUahRXskh6UU7q6PbIqOAudkKMFn2AL66oGR/UYo=;
        b=Sr0Vr1kUHLYjsueKNMDu47adRPCbIvYZTAm69HytB+DxTiaMbOc4dBX00FRV5pYAyA
         xXEH3eslxqQXuqzRE27SERe+H9yPXZk28sa5Dj67Dt0/Y0NmhAZolcYKUW6h281418O4
         58nsqVl4PW+HggU2AmHAXdIAVKTKIg1e3i+MXESBslUPgE4pLqgDW/e03xFZzGS0piz2
         O4xAulG1OzsjVm3TPTKiX1fZg24gtCVM5ddzgNsG7FcjWFqDWZv2ym9rpX8JR5kSGqET
         uISsvfWD782ncnZgH0xK/5ZqKh/Dd0voe1nbWBHsXlEgTVkfXKXhpYnsk4xYEBub84ks
         prew==
X-Gm-Message-State: AGRZ1gI1WFzniqKaXg66HO4Wt8TWFgtfhGjnGPQTpaBEY9qkWLBaeF7j
        0hSh5TCs3GpCPxR2xQNnp3hOZFtA9+9Dsa2CXRju7w==
X-Google-Smtp-Source: AJdET5e1aWNYlU4PcppCYKuXY85JzMOuWtrGy1vYVXAJD5UDAZ5bQ3MkhbKtxlZnxBD8niEu+lxNHyCgCmGb99AV2ro=
X-Received: by 2002:a37:9f46:: with SMTP id i67mr16741551qke.168.1541315259182;
 Sun, 04 Nov 2018 00:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
 <154130022584.88331.11328574821722290484@swboyd.mtv.corp.google.com>
In-Reply-To: <154130022584.88331.11328574821722290484@swboyd.mtv.corp.google.com>
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Sun, 4 Nov 2018 00:07:28 -0700
Message-ID: <CABWYdi0Jwy5z5ieqEEUDw5_-723ZzqZFTrgoNhdQBa2iPy8UbQ@mail.gmail.com>
Subject: Re: [PATCH] clk: cleanup Kconfig to remove duplicate help tags
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, trivial@kernel.org,
        mike.looijmans@topic.nl, mturquette@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Correct, this is just for consistency inside of the file.
On Sat, Nov 3, 2018 at 7:57 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Ivan Babrou (2018-10-24 15:27:16)
> > Before:
> >
> > =E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90
> > =E2=94=82                                                              =
  =E2=94=82
> > =E2=94=82 CONFIG_COMMON_CLK_SI544:                                     =
  =E2=94=82
> > =E2=94=82                                                              =
  =E2=94=82
> > =E2=94=82 ---help---                                                   =
  =E2=94=82
> > =E2=94=82   This driver supports the Silicon Labs 544 programmable cloc=
k =E2=94=82
> > =E2=94=82   generator.                                                 =
  =E2=94=82
> >
> > After:
> >
> > =E2=94=8C=E2=94=80=E2=94=80 Clock driver for SiLabs 544 devices =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> > =E2=94=82                                                              =
=E2=94=82
> > =E2=94=82 CONFIG_COMMON_CLK_SI544:                                     =
=E2=94=82
> > =E2=94=82                                                              =
=E2=94=82
> > =E2=94=82 This driver supports the Silicon Labs 544 programmable clock =
=E2=94=82
> > =E2=94=82 generator.                                                   =
=E2=94=82
>
> Ah ok. I was thrown off by the first hunk that didn't need to be
> changed.
>
> >
> > Signed-off-by: Ivan Babrou <ivan@cloudflare.com>
> > ---
> >  drivers/clk/Kconfig | 13 ++-----------
> >  1 file changed, 2 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 292056bbb30e..8b5993ae30d8 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -48,7 +48,7 @@ config COMMON_CLK_MAX77686
> >  config COMMON_CLK_MAX9485
> >   tristate "Maxim 9485 Programmable Clock Generator"
> >   depends on I2C
> > - help
> > + ---help---
>
> So this one is not needed?
>
> >     This driver supports Maxim 9485 Programmable Audio Clock Generator
> >
> >  config COMMON_CLK_RK808
> > @@ -157,7 +153,7 @@ config COMMON_CLK_CDCE925
> >  config COMMON_CLK_CS2000_CP
> >   tristate "Clock driver for CS2000 Fractional-N Clock Synthesizer &
> > Clock Multiplier"
> >   depends on I2C
> > - help
> > + ---help---
>
> Same for this one.
>
> >     If you say yes here you get support for the CS2000 clock multiplier=
.
> >
> >  config COMMON_CLK_GEMINI
