Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AA6C77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 22:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjDMW31 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 18:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjDMW30 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 18:29:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC0D86AA
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 15:29:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 249FC60B47
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 22:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E007C433D2;
        Thu, 13 Apr 2023 22:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681424961;
        bh=fgXeHdsdHaqlbfQ66S2URD3VgCs99Ny01gmqZGMyl8M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LFhIJV+RcUNGtJpZGVuhnl1osZVCFsnCm46lseMLFPw2T67uzv5T1YK9g8KNZwc0F
         FNjRwKUk/a7qbLxnxPTyO6y8pFvj7HVKWwkzD5pRsn+nQSvOGn+u7AvM19MjVCcWyW
         PD4VKP7pdl1/EnW4pulPRE39OUMLE7cSFp1wS1XkwJYrRoIANoeCano+2FA6XHq/fM
         XTm2PE5ItZ1UmGXd/YsdnJNBl9CZORYcuOQdMCF2JrC3RkTHNM8Nfx5uYJ2uSzyDhw
         F37HIUyiYJzJAzinX8CRwvl6Lyd4Co5TD1StWisNKRjPnHua2OxRi8AY5hOl6u4rct
         v7LXUliNBTc1w==
Message-ID: <f336e108d8651f1e317fae39dc058966.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4eb4755b-7a06-6cd9-7c9d-6d088d05ab19@gmail.com>
References: <4eb4755b-7a06-6cd9-7c9d-6d088d05ab19@gmail.com>
Subject: Re: [PATCH] clk: change clk_hw_create_clk() to avoid being unable to remove module
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 13 Apr 2023 15:29:19 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiner Kallweit (2023-04-13 14:39:28)
> With clk_hw_create_clk() we have the problem that module unloading
> is impossible if consumer and provider module owner are the same and
> refcount is incremented. See also following comment in __clk_register().

Do you never call clk_put() on the clk that you get from
clk_hw_create_clk()?
