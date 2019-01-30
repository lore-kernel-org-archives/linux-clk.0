Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAD8C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 23:17:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3826420881
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 23:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqGsq6Qz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfA3XRj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 18:17:39 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34299 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfA3XRi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 18:17:38 -0500
Received: by mail-ot1-f67.google.com with SMTP id t5so1239865otk.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jan 2019 15:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mg2YhfagRVrUxNfCl2To+A8sM/Flr3Rnugx6IiNTkro=;
        b=FqGsq6Qzoi2SpGOMcMFx85uxdJYVowHCDErDcf9I/F94gvaG240ANLheA88Q1fWgbX
         1eM53Uz1/zJihMq7c8+vE8GuoXQAvWy8ghC14JN4QuGwl58TOhysoFoR2P3bUUWgkbtq
         dl+291YFuGZ8kMtk3BCXAVmEbJxmoNBQAdb6CSuCrFdk3HaSIeotM+kAgqPJrC6uWLPz
         obd5cgmBhOApr83C/81MIlSA1IO0UIPkbyMNQjIxLZUfXHWz+eNclf7zi9P2VtQbQXIi
         +Cek+xC7Xne40LZwPisOZrVBeqyzejOH3bxs4ISNw7gkug5Lh8pYCs4Y+Mom7n4cWbfK
         us3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mg2YhfagRVrUxNfCl2To+A8sM/Flr3Rnugx6IiNTkro=;
        b=gLkje6QJVIgA6NKwYyyPwCIvxHazOo3vNYEyV/Jhx9LjCUvsjRe/8ratYiSKUSHm9/
         SGXX/sTxssLalyT8xAd99JPNHKMzFdlXFRf+mnpA8OUrweSQ+LSXWiLZ0YvChiZCTtUL
         9vjy6fZ3ToejvTwl2NhjfHSIO3sqI12tKnX/hVlg6TLXohS7srVvhJRW8wr5vYpNBeNn
         JirhBWhxn1zkFGOytfse+XMwG0YjTeBoZ5TbvjZMK+CiZCQp1gmdUXKeQ2j7v0n5xWoh
         W779fTQAHgFqg4V96Oc9kEy4DGuzwiH8HCMAxfuzNSZeeRJPKF1vdIlszZAXsIo+7GjJ
         QR4g==
X-Gm-Message-State: AJcUukdbukvj6DkCEkcR40ZktgUHeaCSYUQYVBkK7vR0Pj6CUsV6Mb3J
        7ni1wKtc5+JIYw243rxNq7aU26GUKkohtlLBfeXKeE3U
X-Google-Smtp-Source: ALg8bN7NnC+7jRWGNlDsekjCP4/ytzdo9AsnTrdd7Fj5qZ9ZeJ4yGK71IAE/VmEtKFo3k1lHQSTKmfI4FsCeoZsVBUw=
X-Received: by 2002:a9d:721e:: with SMTP id u30mr24540483otj.203.1548888382471;
 Wed, 30 Jan 2019 14:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20190130201725.18961-1-ccaione@baylibre.com>
In-Reply-To: <20190130201725.18961-1-ccaione@baylibre.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 30 Jan 2019 20:46:10 -0200
Message-ID: <CAOMZO5AU8y1mf1DCMcJ6Y_AN_rP47jx1uVhj9pLRtgL6P70ksw@mail.gmail.com>
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

On Wed, Jan 30, 2019 at 6:17 PM Carlo Caione <ccaione@baylibre.com> wrote:
>
> The clocks list is missing the clocks for the the M4 core.

There is a repeated "the" in this phrase.

> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Fabio Esteva, <festevam@gmail.com>
