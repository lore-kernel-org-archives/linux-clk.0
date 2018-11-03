Return-Path: <SRS0=gl0N=NO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FADC0044C
	for <linux-clk@archiver.kernel.org>; Sat,  3 Nov 2018 06:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F1A52082E
	for <linux-clk@archiver.kernel.org>; Sat,  3 Nov 2018 06:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="f1lrE9mS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1A52082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbeKCPuj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Nov 2018 11:50:39 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45244 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbeKCPuj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Nov 2018 11:50:39 -0400
Received: by mail-qk1-f196.google.com with SMTP id d135so6575855qkc.12
        for <linux-clk@vger.kernel.org>; Fri, 02 Nov 2018 23:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q1ytv0B8N58TtbzujD20KCmXYnuYQY05JlyU0gR/1Ww=;
        b=f1lrE9mS8TRfeySBF1mXawYZ/zt9Ma3dShcSVEi9emoZSd/YWLfl81fjOq59uuawtZ
         YM9GEfHSC8S/au7b76TLYjx5aA80RkJ4eTQj2T0CHWA50D+AiQE0eO/UOwnf0uo3tzGo
         EohbG8KTMPqiG3nDVvy5wnT1VtD6Fow+gSoPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q1ytv0B8N58TtbzujD20KCmXYnuYQY05JlyU0gR/1Ww=;
        b=Mpah2oRova99/sZe2pgAV6MeDbhi50Uk1qkZwR/RK7PtnWVAHyNVcoLD+cIKqHKTem
         OQokEqsy8E0j9XHpLNTcNBbD9YIrBgLuBSe19911L7hhlGkvmPdILKnvP4m6asQiOOsJ
         sWIaJEhP6MZvm6gHEYcRG3nBoFc/9oFMW7j7ctMx8s1xMX7A+V2bX05lCXwasipeG67I
         8drb80IyEGElvozb0W9wFQpjU1Tzw0pE22dyNqkZ1dpSn9zVCyU0D32BqfbHNpeRlvb/
         CX73eGB51m4551dgvi3/Ps+gFw2uzXNqUknjRVhzDaHEslxbQENHB+4ZIHo5sFn7AxTU
         qREw==
X-Gm-Message-State: AGRZ1gJEfoVAMQV6/WuCeSehQwIQQTslecDoNKh0enHIN5sI1HNFeVGk
        /1gLsWUfdpn2um4YRlkbxtbAr0fhSRdajtKnN+rOVnxyLUUJuA==
X-Google-Smtp-Source: AJdET5d6w0SPmRVKd92okOI9+aLgrU33U0jjp8oyoVLOkgcGa80bdO5SwY4/6U1KKcVGFugNumlpGlyDON6hnifxpME=
X-Received: by 2002:a0c:bb82:: with SMTP id i2mr4149064qvg.159.1541227222041;
 Fri, 02 Nov 2018 23:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi1Bad325ZEUZUuPcQoGJtxzTWtkxuZYH8eCeKK1uMbn9A@mail.gmail.com>
 <154120835220.88331.11131007130802849581@swboyd.mtv.corp.google.com>
In-Reply-To: <154120835220.88331.11131007130802849581@swboyd.mtv.corp.google.com>
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Fri, 2 Nov 2018 23:40:12 -0700
Message-ID: <CABWYdi0TCo=CO4rQfWvXim2_-Ker5QBZQ_mzVuW7dM-eTZQcUQ@mail.gmail.com>
Subject: Re: [PATCH] clk: cleanup Kconfig to remove duplicate help tags
To:     sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, trivial@kernel.org,
        mike.looijmans@topic.nl, mturquette@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

They are not different, but you only need one of them, not both in the
same config option.

The following command can find all occurrences of double usage:

$ grep -Pzo '\thelp\n\t---help---' -r *

I'm using nconfig, but I think I originally saw the issue with oldconfig.

On Fri, Nov 2, 2018 at 6:25 PM Stephen Boyd <sboyd@kernel.org> wrote:
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
> >
> > Signed-off-by: Ivan Babrou <ivan@cloudflare.com>
>
> What kconfigurator are you using? From
> Documentation/kbuild/kconfig-language.txt it says that help and
> ---help--- are not actually different, so I think you should fix the
> configurator you're using instead of trying to patch all the triple dash
> helps out there.
>
