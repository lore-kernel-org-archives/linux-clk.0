Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F5CECAAD5
	for <linux-clk@archiver.kernel.org>; Tue,  6 Sep 2022 16:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiIFQJa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Sep 2022 12:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239123AbiIFQIm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Sep 2022 12:08:42 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247119BB5C
        for <linux-clk@vger.kernel.org>; Tue,  6 Sep 2022 08:33:21 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso9844354wmh.5
        for <linux-clk@vger.kernel.org>; Tue, 06 Sep 2022 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=8dfsxuLQkwhGof/iBTeTnMKCWk0wegl/kZDWDKnjl0w=;
        b=5WpliFAJbWGKf4kORR8xbjCcjX54KQMghE3FyyPPlAfwyhFe1u7U4EBBMxgqwSn0wa
         hkWcPsF/UCAjwXvDfLnwkZaB9uBFnm7NZd4clDdVNd9OMmZnN3ZhTuEI/+WoOdsOKT48
         XZhtw+P25AIH4dFPTe/9bqS5KMWPCUcoX26f1CunU/w3ysBuD6Ea9k1lIXvfJXqkAcVi
         Ry5dSgBKv9OdLNeOUF7Jl+ZVi8tDS/BmVapFxQc+Fdhdce3jop/atNiPPRFG7RW/hInu
         gNrzystqWRYHNfXWNhD4Gu+B2TA4aIf/vGynugDuaPg4+JTChHlJRoykEEVELDh6SHSW
         baYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=8dfsxuLQkwhGof/iBTeTnMKCWk0wegl/kZDWDKnjl0w=;
        b=qg1ZjzC3bf8SXUanM3AVaV/hYlC0XyfNpefnEs+2YQsBHf47LNXd0gJ3RbZRVJlo+l
         FmIT2rUBpA6kwGdtm/oks7bxZ0Y5rLhwCve/yUtoSWHp4v91cNBk6yFlQvCZbhhfi6RO
         4KY1EfgBGiEC+54LrTU6Xmcq5CU/dZ73PST/91Ivx2wjRLJC8q+qFjlMMmxPdOZiksUh
         RCLBLDasxd5HDyybe7iRADyR2u2W9U7qnN0l3vxVitSE5o4a45WQ/j/sjlRt4Hxmhbem
         iXqR0xtyRT0QvvkQS+XBVrmPFyqIX/5zLHP0L9BcvIuqochGVjIA5swSb8oBxnJIeL9M
         woZg==
X-Gm-Message-State: ACgBeo3Z9ROG0b6Lr4vBAqPXDO8h1NMGmnZ07q7n8w1fqgwlwm+0fIdo
        sfV0ejT8rS0qoE4n0gW3pdI1yw==
X-Google-Smtp-Source: AA6agR5tEfmioxS2Hie3WY0cth/zuqR4PwJ8gLnBsFEAJ0jXcN8QX0pmR1E7iwT0IL6ZnYqjahILbQ==
X-Received: by 2002:a1c:7315:0:b0:3a5:ff61:4080 with SMTP id d21-20020a1c7315000000b003a5ff614080mr14079094wmb.196.1662478399600;
        Tue, 06 Sep 2022 08:33:19 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q11-20020a1cf30b000000b003a8434530bbsm20268437wmq.13.2022.09.06.08.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:33:18 -0700 (PDT)
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Date:   Tue, 06 Sep 2022 17:29:03 +0200
In-reply-to: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
Message-ID: <1jk06gwm9u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 29 Aug 2022 at 20:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Currently we loop over meson_parm_read() up to 24mln times.
> This results in a unpredictable timeout period. In my case
> it's over 5s on a S905X4-based system. Make the timeout
> period predictable and set it to 100ms.

Nitpick: next time please try to make commit not about your system, but
about the system and the codebase.

For example: In my case -> on an S905X4 platform (even better if you
precise the platform here). Thx.

>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied, Thx
