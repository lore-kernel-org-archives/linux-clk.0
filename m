Return-Path: <SRS0=uDsh=AH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFD6C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 22:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F48C20C09
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 22:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uZZCHkLQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgFZWLY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jun 2020 18:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgFZWLY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2020 18:11:24 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8291C03E979
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2020 15:11:23 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id v8so11324934iox.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2020 15:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YNIrriHH/RIU5dmEX2dKND5PfOJ0VIojz7jIC0SvBns=;
        b=uZZCHkLQHr82y8jANozhHzn6cMrwG5usNOhQqodWmatRvTouoKCWnMwrkZJT9gXQZe
         o0TUaVllNgRWGGncQg1/Y7sqdC7nGyOwmwWfxDfT1X4YSvmDpTfAtI9wloYp4XfXBUlA
         638bdJM5RiusKO+3lu2h2MHEBOyk3qjJbA18XVg9SvORbV2F2Dyi9Z9xg225tdiAj4wT
         2MIRI0bFoc+aGxRj2833Z5jL8asxBqS0zOqRoPv940ODwZt83jGDnkBcQUuvuwRGW3tl
         FKQWmzXC+mF/qMMl1it1LWWWXFBsbFJfhdAfNZp2w/NHOqO870Im/RkrIPzG8A+pASaz
         VuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YNIrriHH/RIU5dmEX2dKND5PfOJ0VIojz7jIC0SvBns=;
        b=F40hCDSzS0BIWgfFp8ZZUf+EB434Y01rPQIwh05DOYA3l9MUQxQdbYvhpVy6bzKMJ6
         hXMAcPiExV/aiV7gKBKpeZLJTs5vtU06Jhe6xxM6sCx4EKrEx5MoV14L9I3nJSX7s2W2
         rxV1y5vr85MelU3ttXQVqa+2VV8NbIPxqACZ9zLygvPHxS9SRbRw7KA2YRiFViMz7Ol4
         o+WQZoTschahaRLUv3JlCYPhSdhXGUXvRZorJx0NXFEPvx49PmGkhGPcRaUmALFwGr60
         QVdUWqw3oJLtEfhBUHDn/gyGFU1zCOrkpWGVDBGQIgbZRFJ5fY7320lv0sQOR3Mu7V7m
         NoRg==
X-Gm-Message-State: AOAM5318WoYRnXF9XajE2ZWeaRPRkAPj06nO3JUMqfshECAW/0HUl2/b
        M0hqZBDmhlPUstLgi158vq58v28nQ/9Xow9e0cE=
X-Google-Smtp-Source: ABdhPJzJMAJ9aB1RTc3YUN12ihxPWI0nlO7wbh6xycV31oI+8IjrDSwL6DKHSehLJVHYWBHSyG9SbcgFh6J+0w/C33g=
X-Received: by 2002:a02:10c1:: with SMTP id 184mr5472398jay.135.1593209483070;
 Fri, 26 Jun 2020 15:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200626103218.GA314155@mwanda>
In-Reply-To: <20200626103218.GA314155@mwanda>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 26 Jun 2020 17:11:11 -0500
Message-ID: <CAHCN7xKVgO7z+MN1XPWedxUD87p4XUm98J9i-e6b1jKUQqEREQ@mail.gmail.com>
Subject: Re: [bug report] clk: vc5: Enable addition output configurations of
 the Versaclock
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 26, 2020 at 5:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Adam Ford,
>
> The patch 260249f929e8: "clk: vc5: Enable addition output
> configurations of the Versaclock" from Jun 3, 2020, leads to the
> following static checker warning:
>
>         drivers/clk/clk-versaclock5.c:795 vc5_get_output_config()
>         warn: missing error code here? 'of_get_child_by_name()' failed. 'ret' = '0'
>
> drivers/clk/clk-versaclock5.c
>    784  static int vc5_get_output_config(struct i2c_client *client,
>    785                                   struct vc5_hw_data *clk_out)
>    786  {
>    787          struct device_node *np_output;
>    788          char *child_name;
>    789          int ret = 0;
>    790
>    791          child_name = kasprintf(GFP_KERNEL, "OUT%d", clk_out->num + 1);
>                 ^^^^^^^^^^
> No check for NULL which will lead to an Oops on the next line.

Thanks for your feedback.

I've drafted a patch that I want to run by a colleague who wrote much
of the patch I submitted.  I'd like him to review it.
I have also applied another patch [1] which corrects some other
issues.  The patch I am drafting goes after [1].
>
>    792          np_output = of_get_child_by_name(client->dev.of_node, child_name);
>                                                                       ^^^^^^^^^^
> Dereferenced without checking inside function.
>
>    793          kfree(child_name);
>    794          if (!np_output)
>    795                  goto output_done;
>                         ^^^^^^^^^^^^^^^^^
> Why not just "return 0;" so that it's obvious this path is a success
> path.  :/  Do nothing gotos have a typical forgot to set the error
> code bug but direct returns don't suffer from this problem.
>
> People think that do nothing gotos will force future developers think
> about error handling but this is not supported by data.  My experience
> is that nothing can force people to think about error handling.

That makes sense to me.

I've added 'suggested-by' with your name on it, so you'll get CC'd
when I submit the patch. I'd welcome any feedback you have to offer.
This driver series is important to me, because I need it in order to
support a new board I am trying to get into the kernel.

thanks,

adam
>
>    796
>    797          ret = vc5_update_mode(np_output, clk_out);
>    798          if (ret)
>    799                  goto output_error;
>    800
>    801          ret = vc5_update_power(np_output, clk_out);
>    802          if (ret)
>    803                  goto output_error;
>    804
>    805          ret = vc5_update_slew(np_output, clk_out);
>    806
>    807  output_error:
>    808          if (ret) {
>    809                  dev_err(&client->dev,
>    810                          "Invalid clock output configuration OUT%d\n",
>    811                          clk_out->num + 1);
>    812          }
>    813
>    814          of_node_put(np_output);
>    815
>    816  output_done:
>    817          return ret;
>    818  }
>
> regards,
> dan carpenter
