Return-Path: <SRS0=7G01=VW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF670C7618B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 12:57:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B373A22C7E
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 12:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6mND/fi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfGYM54 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Jul 2019 08:57:56 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45476 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfGYM54 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jul 2019 08:57:56 -0400
Received: by mail-io1-f66.google.com with SMTP id g20so96956347ioc.12;
        Thu, 25 Jul 2019 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zw8QWpG8j0EL+1f/JxBtB+EVg+jXBaOVcDPpFEI42q0=;
        b=K6mND/fi/g9b/swg/IUZ42XnbpDHKj16AQz9cokoGFAaoRHMFlgIA+VRavfg0qZdrP
         PRxBqZdTliJJ/ZrTCh61/TI4RDHCo3WwsqLyYMGieu0NET1ILmWr9n3mkBHz7YqdDX8q
         Zu4Mz9NChgH8jm+IoKyn3iiHduRNNqpGehhSXAiFX9bdxraHF5Bj7r2cH73+w6VzlvMs
         gsgBl5xndi9okj0QAEutDNMmmrkc7V2I8I0HOimYiOtOmb0qYSLP7YOw6fLowFsufD7s
         hwj3AQbXw1VEzftSQpUKs21ZzJ5nH+XBKWct1kyCwsnqxnyQPwWVHyZTqNEY4kvPi8cT
         D/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zw8QWpG8j0EL+1f/JxBtB+EVg+jXBaOVcDPpFEI42q0=;
        b=XJYw3g6uWzzSMWcwmgIb7ZDr5iQzBg8JY03XzKPlwjpfQz/WMe4RqU6SB/9777k3Fr
         htJ1tZGYzjXl2xNdkRPzBFDDIEv0v1z6BqXWzs1FHPQYbWGFt6edkX26WelnnHxMffpj
         phnX5rbgv48y+mo1dekQtT5sUILs6tUuIv9FuU0xYmpm0ADm2k6CVmxEeaeVDiKtLEWE
         ZZ3W70KpvChyYEo5A2aNA0zi8t/jDTmoOwIxXIksaNqr4gX7zrI83CDP48QoSY9tN97c
         qsU5xgwNKRbuL8ya1ZoD0zpm7q3FkcHt6qAnop4z24ua5Gr466NqPD6Lm+gHSujQ6Ym4
         3qAg==
X-Gm-Message-State: APjAAAUp1YlaDvcd+eFaRoZWPMyM7tFWmB3/XClGXhPnfWK2m+znarji
        YDJnHkNIv+80JGSIFm0iavKXU4Er6Mws1ZhZ2QaG/O7dsN4=
X-Google-Smtp-Source: APXvYqzHz5gmDpIh7oRLyBA4Be4IO2T4r3a6v0TWU+RMO1HPrrr8i8irOjmDme2npo3kVJOMoLPw5dECOj3YQVEcW+0=
X-Received: by 2002:a6b:bf01:: with SMTP id p1mr51679827iof.181.1564059475453;
 Thu, 25 Jul 2019 05:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Thu, 25 Jul 2019 20:48:47 +0800
Message-ID: <CAA+hA=TkrwzWbJQu7Cc6njdQSP--u=Zf+=FcPg-wCZ=rRXoRuQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] clk: imx8: add new clock binding for better pm support
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob & Stephen & Shawn,

Could you help review this patchset?
We're pretty stuck here for a long time and a lot continued work are blocked.
We really need your kind help.

The related DT patches could be found here:
https://patchwork.kernel.org/cover/11046341/

Regards
Aisheng

On Tue, Jul 16, 2019 at 11:23 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> This is a follow up of this patch series.
> https://patchwork.kernel.org/cover/10924029/
> [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
>
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS
> can be shared. e.g. Clocks, Devices and etc.
>
> However, current clock binding is using SW IDs for device tree to use
> which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> different SoCs.
>
> This patch series aims to introduce a new binding which is more close to
> hardware and platform independent and can makes us write a more general
> drivers for different SCU based SoCs.
>
> Another important thing is that on MX8, each Clock resource is associated
> with a power domain. So we have to attach that clock device to the power
> domain in order to make it work properly. Further more, the clock state
> will be lost when its power domain is completely off during suspend/resume,
> so we also introduce the clock state save&restore mechanism.
>
> ChangeLog:
> v2->v3:
>  * change scu clk into two cells binding
>  * add clk pm patches to ease the understand of the changes
> v1->v2:
>  * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>  * Add required power domain property
>  * Dropped PATCH 3&4 first, will send the updated version accordingly
>    after the binding is finally determined,
>
> Dong Aisheng (11):
>   dt-bindings: firmware: imx-scu: new binding to parse clocks from
>     device tree
>   dt-bindings: clock: imx-lpcg: add support to parse clocks from device
>     tree
>   clk: imx: scu: add two cells binding support
>   clk: imx: scu: bypass cpu power domains
>   clk: imx: scu: allow scu clk to take device pointer
>   clk: imx: scu: add runtime pm support
>   clk: imx: scu: add suspend/resume support
>   clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
>   clk: imx: lpcg: allow lpcg clk to take device pointer
>   clk: imx: clk-imx8qxp-lpcg: add runtime pm support
>   clk: imx: lpcg: add suspend/resume support
>
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  12 +-
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  34 +++-
>  drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 103 ++++++++++
>  drivers/clk/imx/clk-imx8qxp.c                      |   9 +-
>  drivers/clk/imx/clk-lpcg-scu.c                     |  41 +++-
>  drivers/clk/imx/clk-scu.c                          | 216 ++++++++++++++++++++-
>  drivers/clk/imx/clk-scu.h                          |  50 ++++-
>  include/dt-bindings/firmware/imx/rsrc.h            |  17 ++
>  8 files changed, 452 insertions(+), 30 deletions(-)
>
> --
> 2.7.4
>
