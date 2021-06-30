Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B94BC11F65
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 18:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE0861474
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 18:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbhF3STx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 14:19:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:34822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229991AbhF3STx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jun 2021 14:19:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3035A61468;
        Wed, 30 Jun 2021 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625077044;
        bh=YkFK0nTuDgcatqh0Z4RxYBaOtpWEF4n6tHpf8q7du7c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bsJmwceCqUFBMuMwo5BQFTB6PZ2D4ORepBjkOxLXY9Jy8acl5/L0JqRr4t3Tg1ovA
         375NqldXnMa5w/CAsM6t4Krm6K5thrADg7SJkKzaRrrcd6wS3g0Cv1ouskxOkoENe5
         4pa82L+lM7+cCFnhFKgZrTmaa52Rx/KZDNjvEG05C8aNZgp00/ikU23Vxrkgq+oXdE
         M5EL3YN7lAz7idpKL45JPh9awJaVtZ6I+KhC7neAYWl20oiBOeHKOdT55FmjlASNh7
         oKx9Z1pXEZeTlQ6pvjl3bifxH73dCE8u7ADl2vH5gFFJS1oJtaVUSFsIIxD46hkA9z
         W/Em470lFB4hQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210630015824.2555840-1-wanghai38@huawei.com>
References: <20210630015824.2555840-1-wanghai38@huawei.com>
Subject: Re: [PATCH -next] clk: stm32mp1: fix missing spin_lock_init()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Wang Hai <wanghai38@huawei.com>, alexandre.torgue@foss.st.com,
        gabriel.fernandez@foss.st.com, mcoquelin.stm32@gmail.com,
        mturquette@baylibre.com
Date:   Wed, 30 Jun 2021 11:17:22 -0700
Message-ID: <162507704293.3331010.4992617374982640116@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wang Hai (2021-06-29 18:58:23)
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
>=20
> Fixes: c392df194a2d ("clk: stm32mp1: move RCC reset controller into RCC c=
lock driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---

Applied to clk-next
