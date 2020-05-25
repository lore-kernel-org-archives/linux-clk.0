Return-Path: <SRS0=dPrR=7H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6984CC433E0
	for <linux-clk@archiver.kernel.org>; Mon, 25 May 2020 21:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D33D2071C
	for <linux-clk@archiver.kernel.org>; Mon, 25 May 2020 21:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389242AbgEYVwu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 May 2020 17:52:50 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:32951 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389092AbgEYVwt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 May 2020 17:52:49 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MHWzP-1jqlHq1QJt-00DaxZ; Mon, 25 May 2020 23:52:47 +0200
Received: by mail-qk1-f178.google.com with SMTP id w3so13173217qkb.6;
        Mon, 25 May 2020 14:52:47 -0700 (PDT)
X-Gm-Message-State: AOAM532dBVGiJkStP64p4jc+69s4sum8zw9ngUIACcv/U9YQd9cDUdiR
        h1X0pOOKvAAIq97XRzmop5ZFGrHT3zm+ygkjxoA=
X-Google-Smtp-Source: ABdhPJy+xHghXFmMlIvXmBRJxJZ2x5N0RRarCPcbtKCSzDVGCRYiV7Cm/MjIMfxIPBg33mUpBL3hSsl3q6ZIFHDOEio=
X-Received: by 2002:a37:908:: with SMTP id 8mr14677582qkj.3.1590443566109;
 Mon, 25 May 2020 14:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200515145311.1580134-1-thierry.reding@gmail.com> <20200515145311.1580134-8-thierry.reding@gmail.com>
In-Reply-To: <20200515145311.1580134-8-thierry.reding@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 25 May 2020 23:52:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
Message-ID: <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
Subject: Re: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tL126tmUHCvaHT298oNszCXfK7n0l3iszztIPEXHTV2lTw5Ghe+
 s+VzLI0AlsllhMABj65Ch5pI0MJvkNi4B+d0ppFIPzCZ0eYiNZ56/mEAWKaGB1H9UmVCPfc
 TUPStrCTAVMu80i5MQ9M/uF+dGl4tylOOm9eDoEtt6mUePLPbscA5yY8m3VQKx0lulsp//5
 5THbAtbRXoKbO+DlSKz9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qINHKYyHzE4=:cQrDru2FmBaobTlrOeA2Yk
 mBbtxkRxpclfSTTMHpXYwzzNSRpCaX7nn+YDYAAhbR0wnF7QFA6jcoVpTrfavVvrYGndItXZK
 3GKdnatRAoOgOO+8q92jPntMLjYzstcWLMj29eUSnVfk20DIwDUO1wAmVmabXmxG2rpyGlkdC
 J2h5ak7/8iMR5DCy7dAQdUAfA9BUIc6gFk59CSrXctbzVRIgSepVeIMH5ZDcelzC4bbiRzbRz
 VGAmOJpGuWozKzGCil2JXc63uhxFdwc99p0DAYYdY3bnRXmJOyiB4jTGEBRV21uRr/Igy7oUT
 zrbYfXYEn1XrPZvlJFqXEg99fQUE/ySV0aWdZMfj+zWt9h6FIaQZ4JsgxAbJVAhTsQ3WAtN1U
 HAbQlPPKqEHPhuJUWcI8sSOIuiaOzjwVfbrDc+3m8KeNXDRXwKQnU7i2aLH+TfKI3Ct8PXi9F
 ek5mlb9jppmZRGyyYnNapYVtc1QGrtVzyP8UXMF9p8rapKmFNPZu1NqAlIJ7+FxE9FtX4hsi1
 DmPq1zJsmuVkAtr2jknNS9hrjQiVOYpr+fIH8qs/sqtR9s735rB86zOxYAlGcuw6GDlG7L348
 Bcvdo1G5oTP8fBlovd+sM5F+7n9JW+xDSjwX5ut43/J0foLTrCVHpzg6VI0PGbZzgnYQijIPA
 iKmS5EsUU0gHpVYxsJqbKBp4tuqPvWfKgFFpFu/gs8OYk5GyTZ9G2ukX5xXTS2LQ0wFBSqLKn
 k2fDoCuQlb97dLyHzoHIcRvXwTFIANY2uwX0tRR7l3b4yQA3H53/LFBUyq5re0F4mXVaLKC5d
 +z0/lQy58lH5IJzPsPpURW9MqN1CF/C8SNI1f/Aoo0BvVZwKVg=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 15, 2020 at 4:53 PM Thierry Reding <thierry.reding@gmail.com> wrote:

>
> ----------------------------------------------------------------
> memory: tegra: Changes for v5.8-rc1
>
> Contains a few cleanup patches and an implementation to scale the EMC
> frequency on Tegra210 systems.

I don't mind taking the memory driver patches, but it seems odd that this
pull request has so many drivers/clk changes but does not mention that
in the pull request, and does not Cc the clk maintainers or include Acks
from them.

I would assume that the reason for this is that you have based
the memory controller changes on a branch that was already
accepted by the clk maintainers in to their tree, but when you do that
please be more explicit so I know what is going on.

Waiting for clarification before I can pull this.

      Arnd

> Dmitry Osipenko (9):
>       dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
>       clk: tegra: Add custom CCLK implementation
>       clk: tegra: pll: Add pre/post rate-change hooks
>       clk: tegra: cclk: Add helpers for handling PLLX rate changes
>       clk: tegra20: Use custom CCLK implementation
>       clk: tegra30: Use custom CCLK implementation

> Joseph Lo (7):
>       dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
>       clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
>       clk: tegra: Export functions for EMC clock scaling
>       clk: tegra: Implement Tegra210 EMC clock
>       clk: tegra: Remove the old emc_mux clock for Tegra210
