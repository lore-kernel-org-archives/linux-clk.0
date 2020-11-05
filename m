Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D9CC00A89
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83F8E20936
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mbxPu3UK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgKEJbK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 04:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726737AbgKEJbJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 04:31:09 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B1DC0613CF
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 01:31:09 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id t16so996233oie.11
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 01:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVlXt5BRht7Msns3dWc+vm5sdIuxtjpHGFdLpNX48Es=;
        b=mbxPu3UK+fq+Ovztx/9psvRxP4INSGNNfXhjyN/7XZpPdiOw2hPOZxHaFYALt2WoDr
         CgEgMHhRqQAcwMqHx632hYUobRS2jbmpsVh110y0vHVbR5VGP6VIE4gko2uzJYGCKpf7
         L7LrnnBbbdNJzkb/3rs6argzCy8hPxzZUkRM/8G1p4BEhB+hfPZufa2IiMm2JNg873/u
         7zvk97cP1azTwPr9HYOR2XSnOkQznxnZda6ZlyYtCY1hlxFbFAKjhq83k+/l1TSKXI8k
         yaKy7x6Jk1w2ZZ20pv1lRoAnev2cAK8T1npaVL7mq4iYlvYO9S2gkPGMuDxhh/UJOLoD
         G6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVlXt5BRht7Msns3dWc+vm5sdIuxtjpHGFdLpNX48Es=;
        b=oDD3fhjCi6WKOgOCc8eiNuEEJv/qoffF6XM6IuL13OuyfyVb2uTlhfBbu3rjjb6Tp6
         jH5czJZCz2CZbyisXBa+Qyw81MZeYQWDHv8s6VmNuFPlKqYDQ1hZ4/+fOpiujkLH+uT2
         59gI8aWSdv+iNGNN3kyOwABMc+X35cJhpeTSrhEzljHqTSitLDR1K14mI/jAVPbPpe1u
         gyxEa/4q4PZo+97ItS5AbMdW8v6R6ijCgy96TV98N763vXsdWPhbTQzCGcLFPCkfwljO
         LAutUC5LmhyPL+XMNddkdXtnCIhoq+tx3g3Cy6euUs08cpXd1yfbX/jSD93pMfetIl4u
         lkBw==
X-Gm-Message-State: AOAM531GXXf2LsIV9egYuW1uexrvbvlJt+jOmyYoDn1pH5lIBdiTftUl
        0g++hBLOxBvT+M4kD2YuY/Z7zDOpJq1YCGPBUdjVo7/PATA=
X-Google-Smtp-Source: ABdhPJyrSKMg3Pisi32xbZXMPw/5VQzRrgQcEcttOCy/1JMCHMRUwxra8w/HmkA2JEIXs+L57kUi1P3riqpHoDNYjsM=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr973648oia.35.1604568669184;
 Thu, 05 Nov 2020 01:31:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com> <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
 <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
 <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com> <87a6vw40v4.fsf@igel.home>
In-Reply-To: <87a6vw40v4.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 5 Nov 2020 17:30:58 +0800
Message-ID: <CANXhq0qmo4Vct3KAc9S71O1M6DwPpmU3AFPgnEFO=1BDdmcavQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 5, 2020 at 5:19 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Nov 05 2020, Zong Li wrote:
>
> > I tried to add -M and -C option to find renames and copies, but it
> > doesn't detect anything here.
>
> -C40 finds a copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c}.

Thanks! I used the default value of these options, I would create the
patch with -C40 in the next version.

>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
