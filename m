Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23035C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 22:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbiFIWev (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 18:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237296AbiFIWet (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 18:34:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0884232DBD;
        Thu,  9 Jun 2022 15:34:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B87761F98;
        Thu,  9 Jun 2022 22:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAADBC34114;
        Thu,  9 Jun 2022 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654814085;
        bh=dBKNxF1K520/m+yTDNoLaoC08D0Nq4opdmEABWHhV8I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XovdbldpQO+DBhq6nk6NN7LeIskhttaZQ2olUiZBz2ZykiYgaOW53ykUJGboadOB3
         0rDylXVg8jT9DgReYt+rL5GgocnwP943cnntOyx/O5tm6TTXBcSTLc9tMysKFXmA5O
         FC4Qq2b2dm52kWEEVHokSqQYCQjH9/8ntHLk/F613pcXVmaDJwHWz43lwSThnE/CZB
         3lN4TDvy+qIQjEoS+YtU3UUIAlIpt+HsP+JtOPZAAeBn+vYxCtIchTP6bsIx+SWaW+
         iBpeA1Z+BQynXdDWsV2aqmZ4Ovx4JnRf8rAX5LGHK5IeeMcuv3sRw4nP+2wf1ezQJi
         dA8HiZhXVrtdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220608021154.990347-1-weiyongjun1@huawei.com>
References: <20220608021154.990347-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] clk: stm32: rcc_reset: Fix missing spin_lock_init()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, weiyongjun1@huawei.com
Date:   Thu, 09 Jun 2022 15:34:43 -0700
User-Agent: alot/0.10
Message-Id: <20220609223445.AAADBC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wei Yongjun (2022-06-07 19:11:54)
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
>=20
> Fixes: 637cee5ffc71 ("clk: stm32: Introduce STM32MP13 RCC drivers (Reset =
Clock Controller)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-fixes
