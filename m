Return-Path: <SRS0=8svT=UW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32546C43613
	for <linux-clk@archiver.kernel.org>; Sun, 23 Jun 2019 18:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3235206BA
	for <linux-clk@archiver.kernel.org>; Sun, 23 Jun 2019 18:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WXW9FMSz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfFWSyj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Jun 2019 14:54:39 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33579 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfFWSyj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Jun 2019 14:54:39 -0400
Received: by mail-ua1-f65.google.com with SMTP id f20so4911149ual.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2019 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwiVA+zdiXVtcAA48z1FRqgt/DlrA/D4evtHSh23uZY=;
        b=WXW9FMSzc1UsTJ9rcjpMCaBxf1C5ZoHQ14UHz9qlPWDHQ33TLNnXHqXeCW1ClW/+ST
         XQwra40eUZSCdu4HdPc9kJ1NmaHLfVy1gGjvaL1awaEzqtNkPwTte9x7gYkuYF0fhGnF
         GU5wQy9BmQqlbvy6M6Z44zI4no0tW6MjFIU/7bFpx7Tl3VPemNK1v+iApt6V8tkbxPPB
         pr3hMV+RUiwIsvrH15F4EshfYsykku4k2+kHzf2Cpz0WEDF/utrZSZBCbTYCw/jLYpor
         O++P00M0YlBYp2h7ISt02IDLepKg3z9WgCBPolmvzaWqrpK92FeNZwoIYiCLcEXPSgvM
         ekMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwiVA+zdiXVtcAA48z1FRqgt/DlrA/D4evtHSh23uZY=;
        b=l3cMEFv6xflTz/94e3xx6IV9VvgPzk9hOkQG7eXEIkUusAtKzar7Flvk8/9GN/J0sy
         XOIym/YvD4TXn4EHFsZTk4KEtXW/pQN2Ih7KCG7cAc653sN0bOgj+ymC9KbSBn5kwzmR
         CuD/sDYqTSfMYE6Gyfz5TqmluJcaOAVff4ZesXiqB6Dp1yu2vW8bWhsvU2NJ0xhO/nh4
         Y8yncaECtDh6TpzEnPIF4pWm++5wueZurFRERQiyhrlj+JItPElEKazgRc/10X1O12MK
         bHpCvIBGW3lLKV62qDMbKtQftda/DLJokIBafJ8E2nyK4YPvKcZzj0y3yp0tS6hlHutf
         kvTg==
X-Gm-Message-State: APjAAAXHHQOKJWugAmAmZp249gdQDOonzmYJx9Ar9HmTxLYkcklFjZ02
        qtHO3xey9MOcnQ/8HpPZeVYKDfHzeUryyH+P4qhVWg==
X-Google-Smtp-Source: APXvYqzCzRAym8rh7cPGxz5P73v27dCWRwG4pG1j4xoLUfqZS/QTXvBWM1/a80OjBJmtJ0Ubodh9P1H1ZuNsZ8OVOQY=
X-Received: by 2002:ab0:23ce:: with SMTP id c14mr9036423uan.77.1561316078413;
 Sun, 23 Jun 2019 11:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr> <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
 <d6f20e7b-2609-faf3-3dfa-aba644d8a9b6@free.fr>
In-Reply-To: <d6f20e7b-2609-faf3-3dfa-aba644d8a9b6@free.fr>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 24 Jun 2019 00:24:27 +0530
Message-ID: <CAHLCerP-dwpEdquSJ8F-tWatp97LHaF-uCxPNrvB4FStdTw0gw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 21, 2019 at 5:06 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 19/06/2019 15:47, Georgi Djakov wrote:
>
> > On 19.06.19 14:44, Marc Gonzalez wrote:
> >
> >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> >> built by default. List them in defconfig after dropping the default.
> >>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> >> ---
> >>  arch/arm64/configs/defconfig | 2 ++
> >>  drivers/clk/qcom/Kconfig     | 2 --
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > Sorry, I wasn't very clear. IMHO the defconfig change should be a
> > separate patch and the v2 of this patch is ok as it is. It would just
> > make things easier to merge.
>
> Oh, I see. Could you give your Ack on patch 2 then?
>
> Would the defconfig change go through the clk tree?
> Or maybe through the qcom tree?

This defconfig change could easily go through the qcom tree IMO.
