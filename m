Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B62C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 23:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FC322081B
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 23:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6A61lSq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfA3XzS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 18:55:18 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44458 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfA3XzS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 18:55:18 -0500
Received: by mail-oi1-f194.google.com with SMTP id m6so1206063oig.11
        for <linux-clk@vger.kernel.org>; Wed, 30 Jan 2019 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t4Hzl0WnumLfehaM8ySLdsmrRbbatl3xeeXUQDRSUHg=;
        b=i6A61lSqDFJ9Qm1oQGFFoZvqJNXpDsB/xyq6pKqhkI9+1L3AuJTKRdq0TKiqkiSPQW
         Qo3FYw82f1tqc2qPnvLdtNuXQjR5pXlC5ffWRA2Oe75l4gLPzmOsLYrcQ7tyKraGcbJq
         0nhYBfBBQovKbS3iLvsMcVldvNnZoW53gzBfstxz9602pSQj+UOuPNa7epb2sp6kHGRl
         x1sD36io2J2+JrrMZJUGn+2l2W+q4MB5WHtHKmZFGudceBrdK2NqXDg9w4HtiDkMsxZ6
         NQ5bjKx7urlb59qPY+aqMqMXnfczV7QeSCgTgbXO9WdJot946RnBpXgpmmwQrCIOu1+G
         /TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4Hzl0WnumLfehaM8ySLdsmrRbbatl3xeeXUQDRSUHg=;
        b=U8y208oP1TMEd7NwMWttY/4Ioko7qm6AIHHfkeT9pF4o02qhdth+mS4r7tRn49Nl6A
         cnhi756rkBGzWdzDgTXSapUWSubXa2jkZ6k3H0l1U/RDVVrA5b6+yttzUWN3voli+9dA
         MlkrXRLU+DDow1ShEsGV6y9pC6850Ibh/YuYb/+9btRWQ83pvViDJc3ndQbXQ/1tT0xN
         +niFzXHnX4LdHGCjM9WGxkwqdF9k0t/LhkRe0Gz48pyUwKW2uwsbkcnho3jop8WrPD1Z
         uF0XT/5k56nr+tClb1aswAAcA0pb4SC+YNiwLavcpNmxY9JCfktQGDEjx5W9ucmpP1qB
         lg9Q==
X-Gm-Message-State: AJcUukfDUipkljFNjmwcIuSUGoEewHwKsuDNfA1/r7WJVLuZ5voNjI/X
        eJZJJEh1156ftybe4qUq46iLwHb0rTD+DhKcDrcJudamYDE=
X-Google-Smtp-Source: AHgI3IY6OiuRAnVEbsBQL5dFZqovDdRsxmu9eHRz4Gfm5PXMvkwSn2jCH+lxErvOAinha0IwyqD/b5kapwDiNC3w1p8=
X-Received: by 2002:aca:ac04:: with SMTP id v4mr14037099oie.342.1548892517783;
 Wed, 30 Jan 2019 15:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20190130201725.18961-1-ccaione@baylibre.com> <CAOMZO5AU8y1mf1DCMcJ6Y_AN_rP47jx1uVhj9pLRtgL6P70ksw@mail.gmail.com>
In-Reply-To: <CAOMZO5AU8y1mf1DCMcJ6Y_AN_rP47jx1uVhj9pLRtgL6P70ksw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 30 Jan 2019 21:55:05 -0200
Message-ID: <CAOMZO5Bs5sBniOtDgc2br9i+eA7CcR7T2K7KACY7STVdkeBHsA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8mq: Add missing M4 clocks
To:     Carlo Caione <ccaione@baylibre.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 30, 2019 at 8:46 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Jan 30, 2019 at 6:17 PM Carlo Caione <ccaione@baylibre.com> wrote:
> >
> > The clocks list is missing the clocks for the the M4 core.
>
> There is a repeated "the" in this phrase.
>
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>
> Reviewed-by: Fabio Esteva, <festevam@gmail.com>

I meant this instead ;-) :

Reviewed-by: Fabio Estevam <festevam@gmail.com>
