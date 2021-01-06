Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F801C433DB
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 16:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FBE423130
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 16:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbhAFQHF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 11:07:05 -0500
Received: from mail-vs1-f49.google.com ([209.85.217.49]:43414 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbhAFQHE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 11:07:04 -0500
Received: by mail-vs1-f49.google.com with SMTP id r24so1997667vsg.10
        for <linux-clk@vger.kernel.org>; Wed, 06 Jan 2021 08:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4I+j91SzRpbJU++/PLF1WdmV7cxoyfORp78Rkzq5K0E=;
        b=Q4lvq+1A82iZqteGxcFVOFQaRpSBD52ylQWvdAam9BpfRGFO4mdkBOSDIzpHpViPUH
         eoAv7lSp8803gGXhYAOMhEebyoYYZfci5Q9IfGORP/0DF9vzG5X6epLh9qijENXfkIAF
         mMVPSMIpo8hZQURIJC/ygcclcKm1gw7UsuMVdxlKOigQsebZuYDH77KR8gscZ0iUS6bL
         VNlg8GJAauHhmQqH34imz85JdpbyAx/9kCZNUCcwtvUrFzg8MHMDXwez+Bz4ZQoUPNIw
         Qbfgg/jUZ9U/Qgd1fFj2xoYLCtGJlqMBFd/2Yi1SMcP5STHDIeR7Kr5Y57r/xIyWv7It
         Dlpg==
X-Gm-Message-State: AOAM532pOjVvwC4/E5PxfUcG0M8gMFri+xVLo25Tr2YHtBH7F4ntpugb
        OVdfVUgNwygq7lk+KjvoUoUfBm+29rBfUQ==
X-Google-Smtp-Source: ABdhPJwAhHEuAzlfTk+6xevJC6NwfVZLk7Mnv10u4KtBwR756YqeOq7NOP9sAac9R/7Ecci/NHgoQQ==
X-Received: by 2002:a67:e448:: with SMTP id n8mr3726432vsm.8.1609949182791;
        Wed, 06 Jan 2021 08:06:22 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id s204sm472401vkb.27.2021.01.06.08.06.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 08:06:22 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id x26so2038412vsq.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Jan 2021 08:06:21 -0800 (PST)
X-Received: by 2002:a67:fd88:: with SMTP id k8mr3735451vsq.17.1609949181677;
 Wed, 06 Jan 2021 08:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20210106143246.11255-1-andre.przywara@arm.com>
In-Reply-To: <20210106143246.11255-1-andre.przywara@arm.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 7 Jan 2021 00:06:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66G+4yUsCZmfuzbC4-8AbpQgtN=Jt=4-7iXUTb+F429AQ@mail.gmail.com>
Message-ID: <CAGb2v66G+4yUsCZmfuzbC4-8AbpQgtN=Jt=4-7iXUTb+F429AQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: h6: Fix CEC clock
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 6, 2021 at 10:33 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> The CEC clock on the H6 SoC is a bit special, since it uses a fixed
> pre-dividier for one source clock (the PLL), but conveys the other clock
> (32K OSC) directly.
> We are using a fixed predivider array for that, but fail to use the right
> flag to actually activate that.
>
> Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
> Reported-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
