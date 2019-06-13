Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE28C31E45
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 16:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEAF120665
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 16:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zqq8iBgd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392867AbfFMQze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 12:55:34 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37332 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729999AbfFMQzd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 12:55:33 -0400
Received: by mail-qt1-f195.google.com with SMTP id y57so23396846qtk.4
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2019 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cpeR1oqDMBZUpG954pBrUTTYYcn3Zggg2IBtHJxA5v4=;
        b=Zqq8iBgdsPVPJLY4JGsFEQwdaxwUciGd2Fc5ZKjNs5jgV0Pu0qQ4GOxcUsMI/XM1bM
         s2K4nQnJRAjktThjAVg+9xli/pUYEzrr9r5pyf8JN0ERtXwIjdz9JZr26sAWQm3PnuhU
         fHlLpLHENwwr84jPnidvMqH07WJ+FXj/edyclsk/5Z83gjRf2p0qJMOXcXe04qO2TTQM
         Paa3Hd2vsAa2oHswH87np/Sxkwi4jRwyeb/pAc9ThMgpOgmMWMCq1TLtghGHL8wnA5dV
         NTz8Xt3LHq7CtAW2EciK3dRzh/h2aBYuLpp7IGRJOu3AWGBB2BvGtzuFKk2g6xydakGR
         rhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cpeR1oqDMBZUpG954pBrUTTYYcn3Zggg2IBtHJxA5v4=;
        b=Cx82zLehgDyKpFDi5fRbFfRYPiXBQUJZlZ3zXhjyBiBSopy6hoMfSAuhaHz+tzNzuM
         Sw0e2nUxyt3L93+gKGsuY34bbU2DulL1+0vA6gwrK/koarKJPagqdGQBm1Erk36ReGF3
         /rLGiVsY2BXyrocG5JbnLjsNkcpoxH2mun81ltZpOuYTaXYKtbAXX1wKc+YgoRkbLXJ7
         waUIi1Ptc1nSlNLxegiG/Cn/P43Ez735sP52VuAUBVInhhSeltBBvyeP8Qe7DbOKZ/HE
         NNG6aOBw/wId5qQaek7mm29TQcGdEY3kvmJGPD7yHkWdK35E66b9C4K/8PfdW+l7e+lV
         tdGg==
X-Gm-Message-State: APjAAAU85XCkJ1GU+6Jwjf0RSdN8KjOfrCS1joY1DVeZaaeAYSeHFpKd
        Tb6amtFXnFsm5CEmlo5AJxr7/mv5IeNuJaaB73/TeQ==
X-Google-Smtp-Source: APXvYqz86ouH7qW11YhIdQ+/pUkNlNb42R0tYC+q9OD3ZyZ2tlhUGh65ELc9Aj3l+yGRkQyoKy8wbukUoOx4aP/oyNA=
X-Received: by 2002:a0c:afeb:: with SMTP id t40mr4514204qvc.28.1560444932838;
 Thu, 13 Jun 2019 09:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY5eShXAr6QyFjqyaL-JjgQ+OKU0LtComURBVf_sDCqGeA@mail.gmail.com>
In-Reply-To: <CAJkfWY5eShXAr6QyFjqyaL-JjgQ+OKU0LtComURBVf_sDCqGeA@mail.gmail.com>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Thu, 13 Jun 2019 09:55:22 -0700
Message-ID: <CAJkfWY7=JKBub9W9q85cqQhZ1P3VT02CMOHaSyNsHebW4-xikQ@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in drivers/clk/mediatek/clk-mt8516.c
To:     fparent@baylibre.com, Michael Turquette <mturquette@baylibre.com>,
        matthias.bgg@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey all,

I'm looking into cleaning up ignored warnings in the kernel so we can
remove compiler flags to ignore warnings. There's a variable
(ddrphycfg_parents) in clk-mt8516.c causing an unused const warning.
Just wanted to reach out to ask if this variable is intended to be
used.

It doesn't look like it has been used since it was first introduced.
If it is no longer needed I'd like to remove it.

https://github.com/ClangBuiltLinux/linux/issues/523

Thanks,
Nathan Huckleberry

Re-sent in plaintext so mailing lists pick it up.


On Thu, Jun 13, 2019 at 9:47 AM Nathan Huckleberry <nhuck@google.com> wrote=
:
>
> Hey all,
>
> I'm looking into cleaning up ignored warnings in the kernel so we can rem=
ove compiler flags to ignore warnings. There's a variable (ddrphycfg_parent=
s) in clk-mt8516.c causing an unused const warning. Just wanted to reach ou=
t to ask if this variable is intended to be used.
>
> It doesn't look like it has been used since it was first introduced. If i=
t is no longer needed I'd like to remove it.
>
> https://github.com/ClangBuiltLinux/linux/issues/523
>
> Thanks,
> Nathan Huckleberry
