Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D593C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 15:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E089121852
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 15:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbeLTPO7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 10:14:59 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43445 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbeLTPO7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Dec 2018 10:14:59 -0500
Received: by mail-qt1-f193.google.com with SMTP id i7so2135571qtj.10
        for <linux-clk@vger.kernel.org>; Thu, 20 Dec 2018 07:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTa3ylSRpQmILzt+HNufEhRhkP8NFVj8i0pv5h1o4Vw=;
        b=WNVPRT11612faCy9uIVztLWfEEi10P5O/2fu1od0Qmhpnx8Knh9gwQhEiWn6lQxOlZ
         N1pNOxS9ZxLI5Wl/lmWGdmqDAA75sZeRlMEXyGGkiR5R5doXq6yNI+JO/upAg/ELCxop
         uN8lICRhREcHfupYxbZv/J1iBxC28dQj0JEScrmr+bOA3Eq4lweDdFecd7khEq2RlVU4
         MOsr97jhENsaWXVoGSnU/l1a5zj0t72qVsCxaZn3EIlSxcL4N2bUGKttKs8P1zzBeNRE
         rov4NUp5S+V3j2hAM4nIfcmeBEOO2V93eUqudIWKW4ZkSBmhi9cDj/CtvL5btKoZBopc
         Yupg==
X-Gm-Message-State: AA+aEWaO+QlX8iTICijcSdGvfElOpgA4w5FO5n+W2TghoHP2ZzTZ+1B7
        EowzVdGJI370uTDBkDkqEJMBbK8BYCEU6or8avs=
X-Google-Smtp-Source: AFSGD/Wj52vwkLNBn7FIMmKmWqG2Bq7ZSz4qL3SDB7q/5QO7/i58D/+9PKdzdeyErnUflZ3xlgav+80S2Vtmee54ZZw=
X-Received: by 2002:a0c:dc0f:: with SMTP id s15mr25904287qvk.40.1545318897740;
 Thu, 20 Dec 2018 07:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20181220085433.20334-1-shc_work@mail.ru>
In-Reply-To: <20181220085433.20334-1-shc_work@mail.ru>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Dec 2018 16:14:40 +0100
Message-ID: <CAK8P3a3r-HmsfDK=+gSRwHqU5iX8Tx1ryFe9pabu0N5ziq-r-A@mail.gmail.com>
Subject: Re: [PATCH] clk: clps711x: Remove board support
To:     Alexander Shiyan <shc_work@mail.ru>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 20, 2018 at 9:54 AM Alexander Shiyan <shc_work@mail.ru> wrote:
>
> Since board support for the CLPS711X platform was removed,
> remove the board support from the clk-clps711x driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/clk/clk-clps711x.c | 61 +++++++++-------------------------------------
>  1 file changed, 11 insertions(+), 50 deletions(-)

Acked-by: Arnd Bergmann <arnd@arndb.de>
