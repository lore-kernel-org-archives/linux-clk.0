Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A179C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 17:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5ABDF2087E
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 17:49:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbfCYRt0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 13:49:26 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:33465 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfCYRt0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 13:49:26 -0400
Received: by mail-vk1-f193.google.com with SMTP id r189so2164280vkb.0;
        Mon, 25 Mar 2019 10:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8poUT5jrgrFbGbozVkeY1e12rLHI1zhr/ehr01/n9I=;
        b=DWqjxtHQY6kOnCusXSOqu48dQPCzfdD0iMJ/Pf7zgyzI4klcH47FIk+SbAHqKmCXZh
         gyO2tiJbRkDr3y5rbSFIk497Ud51Bp135HvmpYmyS8btmU3VKvgNk4H+TG3tZOGj45z1
         DL8QgRCVry6mJxTaGk0ZFP57uzY5l3/j19OHOBp2k7KjdatEIYNKQQ4zjDFr9vT7a2R0
         h3ubTfaaISt1F3Rf4Cskue2TsctRgiBCe7N4MQRwAFoIUMCzp9/jcOVDWO31K7RnINfN
         /79RdENQ7uGx7QhCvEFWJoowm6o7qJcU5mcy1tY3vZFFJhWxwY1I+FGFkmCoIBnBcnH3
         HiBA==
X-Gm-Message-State: APjAAAUo6J8tyIoTEc5crWajt2up+TxtDfXZG1CWjPNAappEZmD4qKxz
        NsCVy3wGHkerK/1InO0LlIU35h/f7ksPrKeiUok=
X-Google-Smtp-Source: APXvYqwP5wQ5oCopjcjeIjjTTFYTralEFvYqCEKlrMuns1qZc9YKl12uS7KnXXcFf9q3kg6aYVL6AzJ+7xYRUjjEp+s=
X-Received: by 2002:a1f:1284:: with SMTP id 126mr2443159vks.72.1553536165382;
 Mon, 25 Mar 2019 10:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190325163556.22025-1-horms+renesas@verge.net.au> <20190325163556.22025-4-horms+renesas@verge.net.au>
In-Reply-To: <20190325163556.22025-4-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Mar 2019 18:49:13 +0100
Message-ID: <CAMuHMdWFZTq3TyTOROpYmVvso_6Buc1tha-PUfTs3cqNreZHow@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] clk: renesas: rcar-gen3: Remove CLK_TYPE_GEN3_Z2
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Mar 25, 2019 at 5:36 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> After recent reworking of Z and Z2 clk handling
> CLK_TYPE_GEN3_Z and CLK_TYPE_GEN3_Z2 have come to have precisely
> the same meaning. Remove this redundancy by eliminating the latter.
>
> This is not expected to have any run-time effect.
>
> As suggested by Geert Uytterhoeven.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
