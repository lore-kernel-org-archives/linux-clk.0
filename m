Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43B6C48BCD
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 21:13:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82033613EF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 21:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFIVPC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jun 2021 17:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhFIVPB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jun 2021 17:15:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7EEC061574
        for <linux-clk@vger.kernel.org>; Wed,  9 Jun 2021 14:12:55 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id c5so26942615wrq.9
        for <linux-clk@vger.kernel.org>; Wed, 09 Jun 2021 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=cAUmhDMcAs6pVQpZ39SGVcYjz64esmLkl1UKed+u18o=;
        b=pNeRzIRnaTGmkgMPbCsKBqgdbBVn9dylp+G0Eqvxu807/HBsMAHxFUc5a+XIu1yHK6
         SKaaUgzOTNFBC4rvP2sqwz3/JVHsQc+6eTBDV1LrgowQmYyY2ozO+r3AudwfHuKHMPOt
         nGTVhRY7x9UToA6cGogqALMWoCpW1Q/oI5ZWOeIz6AqDIsPLFWHwkV40xCBf57Scki0W
         chuyVwZKLNkuY0csTRr/Q2Pu3QnvfhgPVge/m3gQajCdvc6Xhcsz3s8PJvC/bTEeK9Mh
         BS/28jwR12tLz6YgMI3N38oshG8cqKarWsMbTtKfAbFsGm1SAiDy1/0jJCJf3CZOQ/JX
         ZaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=cAUmhDMcAs6pVQpZ39SGVcYjz64esmLkl1UKed+u18o=;
        b=bASAAjkz0mkEac6nNgifT5FIMfiedALSFZeJ6xXCzeibzc2htlv6Sk/j1wHZpEc5SA
         bBAcoOR3X0k8cLpcfxr6wkrW4cJDLFsU7kXeg6fbnTKL8qEdaDegrVOm6bNRsEJpJkbM
         Vo2fIaDZimF4ICfsJTSDKrFIKM6H48IojyUieHc6uL0HpeMmQ9d3N/An8lx9qi9crlbx
         NxZ2BvlJqB3ZcRsVWBa8kdIhHfIWuGDyGvlMphkfxgFPaFKExQwABKL2ZSXOo2b+yVFq
         pKoiTryl6v9MCu2lNXpVzaUyTN5GnxiGLdk6xvutln7KQy8fPzrs+JmIvtfiO7ESXZOD
         b4NA==
X-Gm-Message-State: AOAM531dJHQqiMBmGYP2fCWo80bkZXKZcvqZ4HwSthtWrWIUXy6ZJtL+
        6zIhFqaBLOWsAMvQeYWwdT5uIA==
X-Google-Smtp-Source: ABdhPJyQoNukEOdgVu3ZKB+pj81tAMSWz8KS/fjVm7EvL0ZxydElHHPfNS/0BXv1kWn2Op9TO/p/xA==
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr1736396wrx.22.1623273172798;
        Wed, 09 Jun 2021 14:12:52 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id m21sm7088297wms.42.2021.06.09.14.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:12:52 -0700 (PDT)
References: <20210604032957.224496-1-xieqinick@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     xieqinick@gmail.com, narmstrong@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     nick@khadas.com, artem@khadas.com
Subject: Re: [PATCH] clk: meson: g12a: Add missing NNA source clocks for g12b
In-reply-to: <20210604032957.224496-1-xieqinick@gmail.com>
Message-ID: <1j1r9a214c.fsf@starbuckisacylon.baylibre.com>
Date:   Wed, 09 Jun 2021 23:12:51 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 04 Jun 2021 at 05:29, xieqinick@gmail.com wrote:

> From: Nick Xie <nick@khadas.com>
>
> This adds the Neural Network Accelerator source clocks for g12b.
>
> Initial support for sm1 already exist in
> commit 2f1efa5340ef
> ("clk: meson: g12a: Add support for NNA CLK source clocks")
>
> The sm1 and g12b share the same NNA source clocks.
> This patch add missing NNA clocks for A311D (g12b).
>
> Signed-off-by: Nick Xie <nick@khadas.com>

Applied. Thx.
