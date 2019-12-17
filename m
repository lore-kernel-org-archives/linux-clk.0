Return-Path: <SRS0=Sw4L=2H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00179C43603
	for <linux-clk@archiver.kernel.org>; Tue, 17 Dec 2019 18:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C92B520684
	for <linux-clk@archiver.kernel.org>; Tue, 17 Dec 2019 18:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="gk4R2X+Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbfLQSB2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Dec 2019 13:01:28 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:45391 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727814AbfLQSB2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Dec 2019 13:01:28 -0500
Received: by mail-il1-f194.google.com with SMTP id p8so9090467iln.12
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2019 10:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PdcYbIX9zD87WOQiQjh6z4jlpJt4qAAg9On5ty0UJ8M=;
        b=gk4R2X+YZupTR+a2bDTDJQXeh112vU9cbO3B2YoQHIETMUFys0NnBFcNb/ENzHqbuY
         12dx8bYfH86OJF5Ln1Dk8eRIieldtdIm56XDz70NxbGDS6imNJHacbVwITBEkWzXSF5u
         shinN54ZxgwBcFvxPw4wZopNO1/V1u6E7lQLbH+DQZwviZDRJTOZBJuRAtRIRUhsHONG
         cz4T4mw2GBHnZd8fSfGRM8uUfyGMCJT5lecjmonydBpuXINgKDp3KraeT6O05yawzj/G
         34XfoS6o0e95MY1K0lRZXgZ/sFlMeYNurX+pX7OUFrc3Vx/lPIYSiiaskz36G2uhJH9s
         bDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PdcYbIX9zD87WOQiQjh6z4jlpJt4qAAg9On5ty0UJ8M=;
        b=TBJQ4lUG5f5Eb8wIHQuqD430c14b6P67vwL6yGp7lbBd9/jLX6upGj7y1DVAT/tZ8T
         xB1N3Il1+n2cjkkH5EtSs5RUpCIk1rRrjaQR0TAV2UDAGrYRqHJlhrFP8q+DF0E+n1WP
         4OSR7topXD9+wHjmHAAEPRY1wQlu1LKMzr+g1Eux+XKEiQEJOw6SESviCn++YmttRKQX
         0JyZzLdDPGfzJ+5w+QCG8GQHhJ4Gs+fu/Fy7zbemoxQrYg6+HF2mXlI2EcpDBwoqlNBD
         gcJbS5vPhDZWTTrr4MdmuLv9fbk/mgezRBziqeX2LrYwnkZ15WGeTvQvU787ntNihAAS
         j3ag==
X-Gm-Message-State: APjAAAXYezR3allVlL5+TeHHA7WtXMcW/BRct63Uqdi/P9qvWf7+EH6+
        28FOHqYu7JQSrfK5ZXSGQtwpi+Ipe9bYBqxICP84WYUe/ROH2Q==
X-Google-Smtp-Source: APXvYqyhxeDoLyEt0MjHhxElEw4D5pIe9yMqutPHPISDmCtWdppTlqdbUF/vofq+XDibsxblHtSITMesEFaTaPIkzCU=
X-Received: by 2002:a92:5d03:: with SMTP id r3mr17318935ilb.278.1576605687381;
 Tue, 17 Dec 2019 10:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20191217044146.127200-1-olof@lixom.net> <20191217044635.127912-1-olof@lixom.net>
 <20191217082501.424892072D@mail.kernel.org>
In-Reply-To: <20191217082501.424892072D@mail.kernel.org>
From:   Olof Johansson <olof@lixom.net>
Date:   Tue, 17 Dec 2019 10:01:15 -0800
Message-ID: <CAOesGMj2qRM3YhTWQubRqmjP2TgMgXVyLxHs5D=bWfd4sKnNrw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: declare clk_core_reparent_orphans() inline
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 17, 2019 at 12:25 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Olof Johansson (2019-12-16 20:46:35)
> > A recent addition exposed a helper that is only used for
> > CONFIG_OF. Instead of figuring out best place to have it in the order
> > of various functions, just declare it as explicitly inline, and the
> > compiler will happily handle it without warning.
> >
> > (Also fixup of a single stray empty line while I was looking at the code)
> >
> > Fixes: 66d9506440bb ("clk: walk orphan list on clock provider registration")
> > Signed-off-by: Olof Johansson <olof@lixom.net>
> > ---
> >
> > v3: ACTUALLY amend this time. Sigh. Time to go home.
> >
>
> Isn't it simple enough to just move the function down to CONFIG_OF in
> drivers/clk/clk.c?

"Simple" in a 5000 line file is maybe not the right word to use, but
yeah, sure, do with it what you want.

Seems like clk.c could do with some refactoring? :)


-Olof
