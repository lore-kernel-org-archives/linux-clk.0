Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD216C47254
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 08:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A008D20721
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 08:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H6brHUXh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgEEIGa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 04:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEIG3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 May 2020 04:06:29 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E46EC061A0F
        for <linux-clk@vger.kernel.org>; Tue,  5 May 2020 01:06:29 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 188so591450lfa.10
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2020 01:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BM5I/eLIBpdDqwONsc09KvAhqNejkBtbqW6zXUqOGDM=;
        b=H6brHUXhmPoa6zRoah2a4Ev/ApNs4HQfXgl1AMVDedbRFjJd3q4fjzSWBPoTdQxGzX
         UvIQuWfeP07JlzPU8ZTkczKI7kH9BANy9v4VG7/REnKPxBhBQkh6jD8Euir6dJoW/7pE
         JqQqo8l+Z0WRSjOeE53ncbAsDQ2b0WBUWLk+NsqSZ7+u02Wh51h+bSWxJ5DReEUkwbbP
         M+1IDQxD2QN/Uuj7jBaDJIt5vXQTL4dgnH1rvi3/0Gds7oJIN2Jp6gzfqZeeghDa624N
         Mglt1/voaZXMSLb0dOKJj6MSQSCMAvH1Jkhblz4/ZEfh8NyP/0sOqf3AefDr9FPN5C0o
         aSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BM5I/eLIBpdDqwONsc09KvAhqNejkBtbqW6zXUqOGDM=;
        b=T/QdHn5XxaC2NW5b98O9GqPiyZMqN8rX7VWEJGabf9nkaEytWYRCTuzMc5uwwGzvRc
         AajRLyP8NZ4iU3AsFVCwrOHV/p/mbwAQ23A24SKcHNdb0No1aaXqLkDc2egQv4pXjFe0
         SwopViJAK7XaTcPS1D5VlwwKBcB2H3AiA9/cqBINrPKdqw7nbfCNUlO8hhaRLDwB560g
         XSIfPdik0xuJ041TKCmMZy1an/lysFr6FRtsOmAlyJr+skFB6QBT+hS1Rr7kRGIqlQy8
         ZyX6UzaYqS1/ZIZuH7ftdE9cDfQxLttR/E+D0P2LumzF+F9asHr1rCzObDg0DsAm6DcH
         +XJA==
X-Gm-Message-State: AGi0PuYWDrBFo3azaVjY9VSm65fm6L8xJp8TH9+YKJYsjvsrZbTCPHEH
        4p5x/YYR0xXiJwS7uZxNGLrYSHj7AaxEAVSdnMjh5CVP
X-Google-Smtp-Source: APiQypL1w3SpaPxH6QovOqv0jtLE711ohHCS4Ihcr316KdeCGm4QK1l8Bsdjm5HPnveuD3CAqIEEP3ixMrDd7SHdu0o=
X-Received: by 2002:a19:d55:: with SMTP id 82mr866154lfn.89.1588665987769;
 Tue, 05 May 2020 01:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200416081348.326833-1-linus.walleij@linaro.org>
 <158754977096.132238.12292029969034991900@swboyd.mtv.corp.google.com>
 <CACRpkdaurouZLFD2aqjDnUgvp=iMOjZ0Lu=xboxqEUx4-dvWWg@mail.gmail.com> <158865980315.24786.12205627766889336218@swboyd.mtv.corp.google.com>
In-Reply-To: <158865980315.24786.12205627766889336218@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 May 2020 10:06:16 +0200
Message-ID: <CACRpkdbrkZnD8JpaWgqY6R4gAbsrBh2Xwfe+Nm15SEUPOJnfEA@mail.gmail.com>
Subject: Re: [PATCH] clk: impd1: Look up clock-output-names
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 5, 2020 at 8:23 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Linus Walleij (2020-04-28 05:51:10)
> > On Wed, Apr 22, 2020 at 12:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Linus Walleij (2020-04-16 01:13:48)
> > > > The IM-PD1 still need to pass the clock output names.
> > > >
> > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Is this a
> > >
> > > Fixes: 84655b762a27 ("clk: versatile: Add device tree probing for IM-PD1 clocks")
> > >
> > > change?
> >
> > Yep. Can you fold it in when applying?
>
> This is being deleted so does it matter anymore?

This patch is for the device tree path. What is getting deleted
is the board file path, if I'm not mistaken.

Yours,
Linus Walleij
