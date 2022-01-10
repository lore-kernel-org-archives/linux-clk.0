Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC318C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jan 2022 01:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbiAJBwm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Jan 2022 20:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiAJBwk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Jan 2022 20:52:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6564C06173F
        for <linux-clk@vger.kernel.org>; Sun,  9 Jan 2022 17:52:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m1so5791079lfq.4
        for <linux-clk@vger.kernel.org>; Sun, 09 Jan 2022 17:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PAmvDjOQprSLqp3N1+fz5g6MUD0+lASiAhwymAYrtVM=;
        b=TTA3x5DgsSIXAhRr84LY9zUjOch1cXk659M5mY85o3HhpJCosqz035iFXGHImoBLrL
         npwUPI0VKeyoAJmeclRznjI0GNeiZkj+qn9o4d+dhkqRCe+lTj7bDxg1GfD43zm2vN7V
         4TsHxbRcnmXXNtKFVpxNOYx4np7GnFZVIL/0NwlNs6IJlWCHkWY2EvZX5BFI2+H/2dzK
         6jopjdilMadSNzvzNDfApcSD4xXc5ERIl5T2mX77GvVUJO3Et1rrk6OTinWJuu7DY7qR
         myich9mgF+4x1SRliu/WXPJW3gwZs9A0FOnziI0Gypk8jYurXTHazn0w+JudkvfyhiWL
         JUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PAmvDjOQprSLqp3N1+fz5g6MUD0+lASiAhwymAYrtVM=;
        b=BKcSCbeLNuq0Yu5bvT0jJFtvjPaihQWNhGZt3s1JCFNbpDjjI6o5ox6Pv2PS7xPvuP
         Xm3eK8U08dL/wu222bku022hULha3BdmjYoAixYF7x3i+99gf2xnEmAJmiDJNQObGg+c
         GBUGB8a0tUbgoq7Yqip6LqjVkW5Jr5SvNdJdubGzYtGRUoKNU8BP0CmbpWBEMYsnqZgu
         mcguKLz97XYoyhMgteGgcwS3WcUIy8jtu+ai3d4B+djeHtttQ20Y1a6HK6KFWhMuajKf
         zP+saHSOiVUlWKESUOj4x+qZOed++f305JpEGkgDnYoWBG5KshPX9DtvDYH10YETh4n7
         PlXA==
X-Gm-Message-State: AOAM533YxrL7xIYCXdIDHhAlsr9dKPgaOmlnNorbZBnM7xTxnxcBHEfT
        quHr2BykfSKeZw1/nOLEIe9zttYoLWT6AVeQmyrHtmuZfDn5tQ==
X-Google-Smtp-Source: ABdhPJzMPmTi/ANQ/Ww5I/fTF/P9J0QbJtUOem/3EUzfHpLTjXLP4Uu9/jvj83SJc6SXf62ESEAmBEJcZB2S/vNG0qM=
X-Received: by 2002:a05:6512:280c:: with SMTP id cf12mr988837lfb.5.1641779556910;
 Sun, 09 Jan 2022 17:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20220107090715.2601-1-zong.li@sifive.com> <20220108004514.C331AC36AE9@smtp.kernel.org>
In-Reply-To: <20220108004514.C331AC36AE9@smtp.kernel.org>
From:   Zong Li <zong.li@sifive.com>
Date:   Mon, 10 Jan 2022 09:52:27 +0800
Message-ID: <CANXhq0qQO9K0j5OaB2U3jJi+4V1tcDpf9Pu+yrcqBtdZ-Q5Z1A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     lee.jones@linaro.org, linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jan 8, 2022 at 8:45 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2022-01-07 01:07:15)
> > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> > Declare static const variable 'prci_clk_fu540' where it's used").
> > For fixing W=3D1 kernel build warning(s) about =E2=80=98prci_clk_fu540=
=E2=80=99 defined
> > but not used [-Wunused-const-variable=3D], the problem is that the C fi=
le
> > of fu540 and fu740 doesn't use these variables, but they includes the
> > header files. We could refine the code by moving the definition of thes=
e
> > variables into fu540 and fu740 implementation respectively instead of
> > common core code, then we could still separate the SoCs-dependent data
> > in their own implementation.
> >
> > Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static
> > const variable 'prci_clk_fu540' where it's used")
>
> The fixes tag should be on one line, not split across two.
>

Ok, let me fix it in the v4 patch. Thanks

> > Signed-off-by: Zong Li <zong.li@sifive.com>
> >
