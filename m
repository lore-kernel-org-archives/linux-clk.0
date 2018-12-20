Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCCEC43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 22:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C92F52186A
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 22:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390172AbeLTWoW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 17:44:22 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41642 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbeLTWoW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Dec 2018 17:44:22 -0500
Received: by mail-qt1-f195.google.com with SMTP id l12so3683624qtf.8
        for <linux-clk@vger.kernel.org>; Thu, 20 Dec 2018 14:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0D5Dc/si8xPRw0x5o3p7VyIeXk4ElYdDjAf++SoeC6Q=;
        b=KQMQ8b7j8yrpruhhTH+vsBWaAi1DMZyYZpUfkf9jCJCPCA3NU4FE2J5RVn2KtV+VxM
         sCZP02OAv8tCgZHbKy6cvtEEQyp3FxWxM0xzsIqltbrEBPk5nyaKg9RSk83hXmrjOIk0
         rFw799BaEfuq69KjXK/ojMHptszHag0HJLdp+OfDnEdG+LN1NvGyRRSJB0V/483XO3hv
         sZ8Aa6ICZzOFkJ6gVijxRA9ykROsTj8exBfrZa2uMOfffhZIYCbuCYY6WHWO8axE2WGw
         Q2IcFA3BiGachjc0IcHQO92DdKRv23KiZZaXkx3TfNPbs4ljLUdwycuVGp+ytAV2aizP
         /EHw==
X-Gm-Message-State: AA+aEWZNAvrSX9vO7Ng0jeUVeFww+olFsf6Ds38smExoIhzLVtsq7lPw
        c5BKRHTkVX5Eyr86QNkRDe5l0xySi6X0HJhUXq27h5MYwGw=
X-Google-Smtp-Source: ALg8bN6E380i9sSTS/E+mDtlpsfv6yNKcltEgn1dZhKqHwZM4v8WbzTo8qgjB1e3NQtvU198WNMk3C2FThNajaAu7Ac=
X-Received: by 2002:ac8:4141:: with SMTP id e1mr97282qtm.96.1545345860549;
 Thu, 20 Dec 2018 14:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20181220085433.20334-1-shc_work@mail.ru> <154533496261.79149.8151013115299125376@swboyd.mtv.corp.google.com>
In-Reply-To: <154533496261.79149.8151013115299125376@swboyd.mtv.corp.google.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Dec 2018 23:44:03 +0100
Message-ID: <CAK8P3a17F-M3e=8-CwmeYip1eLyhok9yCLBC6AoGy1voC24P2A@mail.gmail.com>
Subject: Re: [PATCH] clk: clps711x: Remove board support
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 20, 2018 at 8:42 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Alexander Shiyan (2018-12-20 00:54:33)
> > Since board support for the CLPS711X platform was removed,
> > remove the board support from the clk-clps711x driver.
>
> Can you reference the commit where the platform was removed in the
> commit text here? It helps me know if there are dependencies.

This was a while back, in commit 4a56f46a7dc6 ("ARM: clps711x:
Remove boards support"), which made it into linux-4.8.

      Arnd
