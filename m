Return-Path: <SRS0=x0k0=O4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC9EC43387
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 17:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B47A218A6
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 17:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2hyBUv4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbeLSRIE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Dec 2018 12:08:04 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42379 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727640AbeLSRIE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Dec 2018 12:08:04 -0500
Received: by mail-oi1-f193.google.com with SMTP id w13so2181450oiw.9
        for <linux-clk@vger.kernel.org>; Wed, 19 Dec 2018 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7rvSbhIF9NmOeNnYFxhPiV5rJQG6Q6/tL23qLEIa18=;
        b=T2hyBUv41S6gI5ZffsUY/u6A28XCQZ3+rOoTMfS683aXsU8Cw840AxZmOqO9J20hNH
         eTprTFkjsfUefMOQOlzNwNCJSQ4JT8Cc++mxtkBOWsQzrZVCTx89OBsHYZJnhNpFhDje
         +TeRD3v4vYnTSiL2yt0mv1C5Tpo+Ge22dlm8/u708t6k6zLizFmGAkGLVmCQJ8Na0DTa
         To9HgyWYaNSDMBucH/yL/Kwo6+VTF7luMrMqkAJLRYwA/0UzxapqrKFkMO7ZEt3aRufw
         vndIwmnCti+3waSI1VmsSSGDXn3Z9/eUHEpMlwJDt60HXFbKXa0hXMes9DkQGceG3cP4
         xCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7rvSbhIF9NmOeNnYFxhPiV5rJQG6Q6/tL23qLEIa18=;
        b=LuFpnpft6F/eJolDs4KE6gJWPx6tMAnlE5aqniMzdXWS9yAraVG920R7TSFR80fiY4
         9ZYMPB48KG3VKOZWa29rvbosytQ39BiXd0BKBln0wnQKILs8cfSwvu478KXYpncKOev6
         8BRkT5btQoEg0y3lLdV5FK0L9VUYeoIdmCeTXifa6AQdEr233RNQ71zM8B/JabZ1uxpi
         dtalYuk2UvSWOzvep2ZwqgcCUsST9g3syQONJKSnXT8xZokIUZrTHKhx3TgRM0q9m4S9
         A4l9dQbRcLC7K8EIyoZOUjr4OtWN33VWLmOwaRsHKgLXJ0CoDuhspdNdxNgyVZpadjXQ
         Gn6g==
X-Gm-Message-State: AA+aEWY0ClvuL/CcL63g3BIIXZ0gfv03+/dIP1NEdD9ScoNlztr7BKjm
        SES9Nrx41yCvQ9ZRf0FUtQ+xiSKim266BAwCSIQ=
X-Google-Smtp-Source: AFSGD/XcUJUC1nsVuwWF/6wLjKv/TuSaM0/fCtxDnFWKaqNQvidFqDe2KVbZekRickJ2Jj6FqvZwsubKsgUhL0xvWxE=
X-Received: by 2002:aca:ab53:: with SMTP id u80mr1662728oie.261.1545239283507;
 Wed, 19 Dec 2018 09:08:03 -0800 (PST)
MIME-Version: 1.0
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com> <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 19 Dec 2018 15:07:59 -0200
Message-ID: <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Aisheng,

On Wed, Dec 19, 2018 at 1:29 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's make the name of clock ID generic to allow other SoCs to reuse
> the common part.
>
> This patch only changes the clock id name and file name, so no
> functional change.
>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 146 +++++++--------
>  drivers/clk/imx/clk-imx8qxp.c             | 152 ++++++++--------
>  include/dt-bindings/clock/imx8-clock.h    | 289 ++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/imx8qxp-clock.h | 289 ------------------------------
>  4 files changed, 438 insertions(+), 438 deletions(-)

This seems like unneeded churn. Just keep the existing naming and
other SoCs can reuse it without problem.
