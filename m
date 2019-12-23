Return-Path: <SRS0=2Ll0=2N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30444C2D0C0
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 09:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDD95206B7
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 09:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuE+qhan"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfLWJeg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Dec 2019 04:34:36 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:47082 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfLWJeg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Dec 2019 04:34:36 -0500
Received: by mail-vk1-f194.google.com with SMTP id u6so4204865vkn.13
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2019 01:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gn0gaOPRkBH9g7nlbqhQMaHYj9pmKbRCc31gk5E1Q+c=;
        b=FuE+qhanofuSoSaDwejPgJOiuGGYz6qovvJA5uJfdYRok3UY2Ux70K0ZTp7x40bPVo
         22Sz3nAbzrvdBUEKbPUNSRSxDr3ZSUDcWgg9xhnlUI7aMinG6IU/OtKATs7CIVQXqwXJ
         OZQzrEwwVafTxLJS1lBiX+IWzWuN97mHaqYCHFAHQ6RieYlSB+k2LvL0Flvf1fM2cfgI
         QaQ/M97D0Yd8Va9y7kExucE+Xox982JynKZgEhxurgZVX48L6TYetauJYZTzCGoq2w1d
         IVlgUgw3KY2WWziUxoJkHx2caDzQmC/lPCzy+GDkQquoytkv++QpV6mWL7ns5aISLaht
         0pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gn0gaOPRkBH9g7nlbqhQMaHYj9pmKbRCc31gk5E1Q+c=;
        b=fPbQShrQS8ivywJW8j4Oh2MPu09TXuId+NPtsl5HdH9Fq++0VxxgSY9EDL8BQ9XPyJ
         mI/2Ji5uMWqDWyTdjOULm7nuZjsEd0hDpNtKRAmW8qtwgmtqtLYSqqgtYuwJySA0pmrQ
         pKITQOB4AlJoc0wLfeO4WxrsuGyKpit+mT+mCkxan3fduwPmL7p0BAZYjKG2PnGUY05g
         nBwaj9rP1vYe6/IczxY0KFNIZu3GyJQ2OXG4a0n/wjSL02gOPeGziH6kCYWZJlTwNGto
         oFZ9dCzAYGj/r3ZlfXpWJ4TEoR3dli8giHwLArxRIqO/ykgJEeXV0WrgEnvwrrlX3Ix4
         mZMA==
X-Gm-Message-State: APjAAAXNhCpX+Fj6ADDBUqWpwXchPN9dI6pgIHvEBsEoBK33sAKr02zq
        m9ZcxYh0YcrxY2dGuj7IebTYSfo0V5DDIA0N+uRclw==
X-Google-Smtp-Source: APXvYqyoNfCN7TXQOMcKlwVxoZFP0tNFoYogyuuNmuZQC6NBz7cpmIj+aJD8ZG23QLYu4VBp5YhFCJo+Kf8ImPcX5yk=
X-Received: by 2002:a1f:914b:: with SMTP id t72mr13789845vkd.101.1577093675345;
 Mon, 23 Dec 2019 01:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20191222202928.14142-1-linus.walleij@linaro.org>
 <CACRpkdaE1T6yt4u5uO+SZB18KjrVp2_4Qd9gr_aN0v5GTJ2VGw@mail.gmail.com>
 <CAPDyKFrYZ3UHAaBdkO9+R+19hEp4yecgdxP=OzWD=VRJ1G4bEw@mail.gmail.com> <20191223092813.37c3ngkstym5sbfy@vireshk-i7>
In-Reply-To: <20191223092813.37c3ngkstym5sbfy@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 23 Dec 2019 10:33:59 +0100
Message-ID: <CAPDyKFrQKzRGNPhnLAshP=eH9t_zM_zBsMzJdKhTwv-p6L3dyQ@mail.gmail.com>
Subject: Re: [PATCH] clk: ux500: Initialize DSI clocks before registering
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 23 Dec 2019 at 10:28, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 23-12-19, 10:16, Ulf Hansson wrote:
> > That said, maybe the suggested "Boot constraint framework" [1], that
> > has been worked on by Viresh, is the proper solution for this.
>
> The Boot constraint stuff may get replaced by this series from
> Saravana, which is already queued by Greg now.. It should fix this
> issue I believe.
>
> https://lore.kernel.org/lkml/20190904211126.47518-1-saravanak@google.com/

Thanks, I will have a closer look then.

Kind regards
Uffe
