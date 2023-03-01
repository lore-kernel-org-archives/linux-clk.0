Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5A7C64ED6
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 12:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCAMLN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 07:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCAMLN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 07:11:13 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0210839CC6
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 04:11:12 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536b7ffdd34so359824257b3.6
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 04:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gIjv8wTxws2tEgCoRyOLyxbnH/NFNqoZJZnY4FJxenU=;
        b=Nf1ctbON/Xa+HGQqhkTja6yP7nrbZJxwW1ZEKkvtHotZ/zGBzwRlUj4+eIaCjelQ4O
         NWXIry4I1qeSRin/7bhObDRaARldmmgXJSVEVPay5BqoT5GaF3hRNSEdK9UqlqX5iHD+
         3EWVofJ6IJac3Y/iszjbgQwrweq6qI+BM8e8lZdjF/vEdfPqx7GDFSG8ypMrt2qL+b2D
         pCTk9q1JKJ5yjda6FctUFUDAiDfG5mBTB1iF2T3DFhAlP+IHse3f+Wz4qFQOIrw1OF7V
         vDviwWRecl7xI/Zxm6WDTDsVaSju+V5TybyBrNJeozBw++gJQUKkD9N62jflM312cvU1
         H7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIjv8wTxws2tEgCoRyOLyxbnH/NFNqoZJZnY4FJxenU=;
        b=ImCCkuDTr9FzfOJWYPymuTCSmF/k1NgUUp0xq7cLyac75aF2i0kK6FZGpNQMlOFCuE
         njKCrdN0XVclfqfdy9c3l0jTsU2oPPgT/EE0vbx8QOHrh+VFlAq/NFa5jsyiMhPAh9RE
         86S5Ye+iwKaow/rRaxodnAPP53ed2ylfd/dawnC+JKgA6TJyDcDlOfxaLQoO8dRkOlH4
         sSgELMxx+8sk5GV7Hm2eqRSqk262ge8at0ryzmvW4RrMgxIzPb6GcBWQiKQCMStpmshf
         Xrj/NKxrUvNfacxBSgKPIrjA6CKUd/cOWR812jhcwbE+ErJSux3G5K3087UCrUVwqe4a
         jwqg==
X-Gm-Message-State: AO0yUKW5/LEHDhK/mJ3aB+iwJoOXwSZZohpN1OI6kZ7xbukSyWxCQyDl
        1K9P8ynhugBgeKNd5m1vRENdBA2fsn1bJQA0dPbCaw==
X-Google-Smtp-Source: AK7set+Tu72vHlqdk+Utvb4jVZuScfGBW6iIUq7EkBuVeAuJvrgg2VHRkGymv+keK6qg6lrEzw1CAJ2PwjcxJ1uASN8=
X-Received: by 2002:a81:4005:0:b0:52e:dddf:82b9 with SMTP id
 l5-20020a814005000000b0052edddf82b9mr3672453ywn.10.1677672670881; Wed, 01 Mar
 2023 04:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20230301012506.1401883-1-saravanak@google.com>
In-Reply-To: <20230301012506.1401883-1-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Mar 2023 13:10:59 +0100
Message-ID: <CACRpkdYvSv0=FcsPUpmiBT86ocJaEtZF=c=Qty6FzdVsSPggzw@mail.gmail.com>
Subject: Re: [PATCH v1] clk: Mark a fwnode as initialized when using
 CLK_OF_DECLARE* macros
To:     Saravana Kannan <saravanak@google.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 1, 2023 at 2:25 AM Saravana Kannan <saravanak@google.com> wrote:

> The CLK_OF_DECLARE macros sometimes prevent the creation of struct
> devices for the device node being handled. It does this by
> setting/clearing OF_POPULATED flag. This can block the probing of some
> devices because fw_devlink will block the consumers of this node till a
> struct device is created and probed.
>
> Set the appropriate fwnode flags when these device nodes are initialized
> by the clock framework and when OF_POPULATED flag is set/cleared. This
> will allow fw_devlink to handle the dependencies correctly.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/lkml/CACRpkdamxDX6EBVjKX5=D3rkHp17f5pwGdBVhzFU90-0MHY6dQ@mail.gmail.com/
> Fixes: 4a032827daa8 ("of: property: Simplify of_link_to_phandle()")
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Excellent Saravana, this fixes my issue!
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
