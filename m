Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6257C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CFAA2173C
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 09:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbfC2JH0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:07:26 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:45840 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbfC2JH0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 05:07:26 -0400
Received: by mail-vk1-f195.google.com with SMTP id v187so321787vkf.12;
        Fri, 29 Mar 2019 02:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UizF5iDtsraqFT5+CrHrnmhGgWQh2i1/nqJzMFJdms=;
        b=aBJSJXGD5Q0kfNmzvs5DmEJLbNUC4JjUoevU/RXMFKhBI0wgEaRhp5mLl4WSYPij1Q
         MpMkk/VgpiMjgYpnN74AG7Nx6YhbD7tSILNLEWU2uWJnt7XJU0h5NYcuWMXtAwbZVK5K
         JUnHgtLHHhurNDxRiBLsyIuLUAS+eDrDPmhMbF9ZcniBTEcoNGof7qlOdYofLV38onj5
         XrPlNeLMUahmo/reZ21BhqIT8x3YXd2x+2cxCfcjv5INtSu8PSSMcvuqQmajYceXrfJ4
         +P1c463UW09L2z61JG7ht3fqRw7C5wCPcWUWxAFzyBEP0jxClJD3v9k5+VTgAp7pkHLV
         A48w==
X-Gm-Message-State: APjAAAXO1CzxnJORc0VuE3GfVvMhBZrYZWWZHjXKTjvKr4BFY+WBjX4Y
        cRBCHpUGgefh5xNw29C40fpBeT2POF/JPke0q6k=
X-Google-Smtp-Source: APXvYqxMq6WAXfyK1VMxPCVkH+1g0DUIHUKnr4ryOD8sEuy0RlP3LBU58pH+aXENQc8kxkFQcrEFTYGrI7epm8upPJg=
X-Received: by 2002:a1f:711:: with SMTP id 17mr29358527vkh.65.1553850445052;
 Fri, 29 Mar 2019 02:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190327124140.8800-1-geert+renesas@glider.be>
 <20190327124140.8800-2-geert+renesas@glider.be> <20190329090242.wzprrwttm77sgmtg@verge.net.au>
In-Reply-To: <20190329090242.wzprrwttm77sgmtg@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Mar 2019 10:07:13 +0100
Message-ID: <CAMuHMdUgh1wcfM7AnzG8N+k57Eh688kisw6sCae-FNWVBXuL=w@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: rcar-gen3: Correct parent clock of EHCI/OHCI
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Fri, Mar 29, 2019 at 10:03 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 27, 2019 at 01:41:36PM +0100, Geert Uytterhoeven wrote:
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> >
> > According to the R-Car Gen3 Hardware Manual Rev. 1.00, and the RZ/G2
> > Hardware Manual Rev. 0.61, the parent clock of the EHCI/OHCI module
> > clocks on R-Car Gen3 and RZ/G2 SoCs is S3D2.
> >
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > [takeshi: Update R-Car H3, M3-N, and E3]
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [geert: Update RZ/G2M and RZ/G2E]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> During my review I saw that R-Car E3 (r8a77990) is already using

D3 (r8a77995)?

> the correct parent clock. And with this change all R-Car Gen3 and RZ/G2
> SoCs do so.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
