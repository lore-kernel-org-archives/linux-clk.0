Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFF3C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jan 2022 01:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344427AbiAFBzi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jan 2022 20:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344457AbiAFBzh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jan 2022 20:55:37 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA9DC061245
        for <linux-clk@vger.kernel.org>; Wed,  5 Jan 2022 17:55:36 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o12so1898513lfk.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Jan 2022 17:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OY3uWewQtYqbmVzvOMrfMhsghQBKU5B87qtjpHzkHwM=;
        b=ipUfJrPtuoM3OX+8XpUGTuzwp8LIrxnrnVTCz/NKRTFLj0eDItJI7MINOV2zCJh4fP
         DUBDZ5m8TOKZUoat+Zen2mZLg4iwATK4/TJ8oLpzCYdJDwzIOephdvB2QCmrmbdnET3w
         t2pzXnxwlHCX06cLahqhBDjbwBeAxW2KUAPXgGX1rnTpvBRDzHUtNNFJVUyjr7/kgF+p
         sZxWdQP4r9PAFgBmZobrpKewDOjY2CyFHi9mf+Wb/TiVoOEQG/X4et0ZajC9Mt2d2zM4
         m2QmFoKsHMYZzptDMyHI8PE0L+rF/Icb/slVZUei4K/YTUoFNBAvqFWPjsyM8f/4VBpw
         ZGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OY3uWewQtYqbmVzvOMrfMhsghQBKU5B87qtjpHzkHwM=;
        b=PB1ALoFMepZXD2cnCXNlr4ZLtxz+mE2zVhbz9MbV5E2U/Qhi2OEEEq9ry9abC0cay8
         NLSNjGoyAQbZg5pbGPjtHplwqznd/l7nqgPQXeQ69/h5oLc1tsL3s7O33bKn16gLq03V
         I66So9PpHf3c5XVo0f5pfwl3aHLlOYFPSpVfD3ey1I0smCMzmF1q78Jac8m9jVGNN6Kj
         2PVyCLl+vN0DDhVcdbiboD3J/Vpxczr/JidBmko4UMVV1Q7+MgCABO9dAW2w31INgTK0
         mt6NJYYe7o/HN7q4QDKiiUH2llbK8v4t1jKKzL4NGBjieAk4X1dJ8fSJOoYbEC+76MeQ
         xrZQ==
X-Gm-Message-State: AOAM531jS/KIo+t1osZ9qSy73yJUatvKfZyTK3GAOgiW/J8wS2Ppu4tH
        h5p1L3IgaJAcRZX3BE3YndF2t7DKEbx3uI9WCj9Fag==
X-Google-Smtp-Source: ABdhPJwpOpaROeBcJuF5ML+cbQJ+6ZpxXluAtT9hh8WQwOGx1lb+lORNlbJeI+rM8pjhVvPrEb8pwtAYLIOeVAUeufk=
X-Received: by 2002:a05:6512:10cc:: with SMTP id k12mr44602930lfg.5.1641434134779;
 Wed, 05 Jan 2022 17:55:34 -0800 (PST)
MIME-Version: 1.0
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
 <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com> <20220105234103.D597CC36AE9@smtp.kernel.org>
In-Reply-To: <20220105234103.D597CC36AE9@smtp.kernel.org>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 6 Jan 2022 09:55:24 +0800
Message-ID: <CANXhq0qVsgposTnYQStHGP6c0NTgZP7W_QpzzG54kKwRqr=72g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, lee.jones@linaro.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 6, 2022 at 7:41 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2022-01-04 20:24:28)
> > On Wed, Dec 8, 2021 at 6:06 PM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> >
> > ping
>
> Please don't send "ping" at the very end of the mail and trim nothing
> else. It wastes time.

I got it. Thanks. Let me resend the patch with the change information.
