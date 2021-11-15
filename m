Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2134EC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 15 Nov 2021 05:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE75A63220
	for <linux-clk@archiver.kernel.org>; Mon, 15 Nov 2021 05:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhKOFeV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Nov 2021 00:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhKOFeT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Nov 2021 00:34:19 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AADFC061746;
        Sun, 14 Nov 2021 21:31:22 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso25475167otj.11;
        Sun, 14 Nov 2021 21:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KPmwQ/kJpf+B9rVby2s8xXr+WWWYaWAXm47KkH9dtJw=;
        b=Rd8g97AHhg6FExk66AhhfjhX9ObjAX8MJBZJZN2EvcmioayzuXGznGKwED2YkJi8ai
         Kc9eYkIfRwjxCY6wzq0bb8Xw8evTZ2UQGd2siJLBmyty6RlOg7C7E+wpA0aHCS3a37N+
         ZSYQnnmBSHgQNdS9x+lw5GV3UVlTdG0mHnyvDuf8MSXsfFpguELaoyry6lnag5/rRXJj
         IDts84Us31hrBPrewtk7mEu/55usIdE76ogxn6fubyiL3YdWrwkf96Wmrg38Uyl/al5q
         hpfAwflR99fa5JWOcc/7TRSFd/1vIGFwRX2CeTcudg16a1K52pIrru93oQ32CxG2fagq
         To3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPmwQ/kJpf+B9rVby2s8xXr+WWWYaWAXm47KkH9dtJw=;
        b=BzTQF4MMQF8tI9hMWmB3I3R3/Ej2w/ywkm0/wloixDPA8uP893cb3H39vhilM3/V4o
         G/aBpu1DOCqEaZOcwLP4b+N9wWh+igjIT0SHGBixjPd6rPmyvVDrt8vX8BQzlGIuXC3j
         uuHPpKLuq7bkWrznh+OA9uVdO6v1g4bbOzTXyYHRlp7ItLqPrA0+T4CtuxxKLm7EUhYb
         l7GZ8x+18wzwEaLB4xvJJ3JdYdiJ3Ix8D7wWZzeHWESLLS8W7TwuGlkjVUlr5JKe4Qsv
         Lffb7K/JsjYq3iyff3Nk2NqxbbMer42CX9FTg9pO9TTjgUS3P8of5gpBVOVblvQMJ4LY
         hZ0w==
X-Gm-Message-State: AOAM530lCgl5FQkFkpL5mvrhem3ZV7Z4tKkHgSLlPRfE2q9y2P9Mo3Nv
        XcW0exV1KzlQV9P9C+y1cqe1DsRB3LMtl1d1h+GJg2mFOJY=
X-Google-Smtp-Source: ABdhPJwSbHIfB3qSPRPm28j+psyLxiB2xNqOrIlkrk95AA/OU6BtMmBRmu01MGqbdQYFYRG5YelqnXRJm0o7bUxJrlM=
X-Received: by 2002:a05:6830:1e57:: with SMTP id e23mr28554851otj.16.1636954281875;
 Sun, 14 Nov 2021 21:31:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Mon, 15 Nov 2021 11:01:10 +0530
Message-ID: <CAKfKVtGGsw10RAzowZdGmuu-5ABsnfOWhR-Sxnoymc4QiqvCPA@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] clk: clocking-wizard: Driver updates
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-staging@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi ,
Could this patch series be merged if there are not further comments.


On Tue, Sep 14, 2021 at 6:27 PM Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:
>
> The patch does the following
> Update the versions of the clocking wizard ip.
> Move from staging to clk directory.
> Update the bindings.
>
> v12:
> No change.
> Rebased
> v13:
> Update the clocking compatible
> Add the change removing the driver from staging
>
>
