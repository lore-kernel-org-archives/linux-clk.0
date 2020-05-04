Return-Path: <SRS0=oKF9=6S=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A275C4724C
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 08:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A818206D7
	for <linux-clk@archiver.kernel.org>; Mon,  4 May 2020 08:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J3yzsGB2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgEDIko (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 May 2020 04:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726351AbgEDIkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 May 2020 04:40:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3EFC061A0F
        for <linux-clk@vger.kernel.org>; Mon,  4 May 2020 01:40:42 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s8so9567864wrt.9
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2020 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wpw4hLHfkH4N+JOXSI4RLmWbxNK2gVAne34AzQXBo8Y=;
        b=J3yzsGB2QZKh1Z+Ii6kkufTdep70GtErKemHckmXneKCPyHLhdh9tMb5i6IbTG/m73
         0s8Afn8+JSYzUH+z7ztFvlRcaHMUyN84q6fqAnVS2Br5PXjvMBddJLk/tBuXKBVcehLj
         IIzg46qYAnji9++Q2cRhGolaGp5kynN56oegR6E/CNF+8WPUhGgRmzmny/+ZF1/bwK7L
         vRSd8BDUr6htNiPXtmOGPaaMtja/kuSCCieTA7VAZKx0I7ggFOK/X+FqChM93YUaWcqM
         OYR1qNJG68C8pgRlRYSdcfbXJnP6efwV5sakQN7WBz77OQKAjrybEFpmUcdIjHppk5TN
         LA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wpw4hLHfkH4N+JOXSI4RLmWbxNK2gVAne34AzQXBo8Y=;
        b=Cl4atgTBdGM/dyIoy2JLp33a28mT+IpxGxGQqMJPisBbehQ1VKQfCAAw1zx0feoizV
         bULqN8VVOjy4R0lRL1gPjryjIyv61U1GkjP3vyRYGT3WmHXKfT1HNDH0fHlxAx9tRmGc
         axYM7GRBvkJ4uYY4l9F0pJm1cX8Vu/tYdlVrBxmscQsn7e0G6Mk2hpyb5QQBR67Pifch
         e7feU7bCLZpNLQCQ6r1C2GNN2G/EOErCB2oY/92zwklM2Nlft9JBIlVD3RUSdkb4MHBY
         zNuawvzpveOfdE6eYPBAzoS/1gDKHL9EeBj+hDZGQ64PeafppGWcXvn6XystPw5b3gBP
         BivQ==
X-Gm-Message-State: AGi0PuYYo9tyjXkT561JE1NAeIOhavBg10nXnd2cD/+rf2RsNGuAUGXg
        UvwuIvvRJHIvdukt5dPNyt3SjQ==
X-Google-Smtp-Source: APiQypJO0zONjRsCboKbXszJQHwjxv+YnXjZXuR20iHpxubYidpCjzHDGbNcO+jV/xoiRdAE7tcptw==
X-Received: by 2002:adf:e58e:: with SMTP id l14mr17099093wrm.186.1588581640714;
        Mon, 04 May 2020 01:40:40 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id n21sm4012749wra.15.2020.05.04.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:40:40 -0700 (PDT)
Date:   Mon, 4 May 2020 09:40:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 11/16] mfd: vexpress-sysreg: Support building as a
 module
Message-ID: <20200504084038.GE298816@dell>
References: <20200429205825.10604-1-robh@kernel.org>
 <20200429205825.10604-12-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429205825.10604-12-robh@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 29 Apr 2020, Rob Herring wrote:

> Enable building the vexpress-sysreg driver as a module.
> 
> As deferred probe between the vexpress components works now, we don't
> need to create struct devices early with of_platform_device_create().
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/mfd/Kconfig           |  2 +-
>  drivers/mfd/vexpress-sysreg.c | 15 ++++-----------
>  2 files changed, 5 insertions(+), 12 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
