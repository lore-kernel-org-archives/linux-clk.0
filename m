Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244C1C04A95
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 00:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbiI2Aj0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 20:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbiI2AjZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 20:39:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0E2E2356
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 17:39:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 216B9614A3
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 00:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F96C433D6;
        Thu, 29 Sep 2022 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664411963;
        bh=7xPHzTBZmJ6MPVuiaFfM3giD1v5pmkT5FJsQ+s1Qhdg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lvuSQ4n/pwx39gpW4h3BxWvXD2eS8jEJYLLkZ/7/aBXDpeuSCghxIjvRSS7McoWq5
         NygnwytjTHV0fmu7BwKuSbnKA+a47LXfYfh0RGENyAc4EaYlC6K2TBKQh3neJMZz09
         e3HqmQLFYuBMr0JBCHNzmS5ZiM5dJtNguJQHlt/6ptZJz8vVIvQZpx1rpxDDjjlt6o
         mhP0VJLtyEytt2BrGdhpve81MsoGU/NZO/bT5td91icogtuJFLw5ZRkl0Bzxwiv9QU
         XKUSlLLzcht7fMAeJ8jh2hmiZScl8+tFFoXUjZafW92X1B4DajgZfAfkRZxswqe+1F
         DqqpZ3zD+8aNw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220927133931.104060-1-yuancan@huawei.com>
References: <20220927133931.104060-1-yuancan@huawei.com>
Subject: Re: [PATCH] clk: clk-npcm7xx: Remove unused struct npcm7xx_clk_gate_data and npcm7xx_clk_div_fixed_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     yuancan@huawei.com
To:     Yuan Can <yuancan@huawei.com>, avifishman70@gmail.com,
        benjaminfair@google.com, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, openbmc@lists.ozlabs.org,
        tali.perry1@gmail.com, tmaimon77@gmail.com, venture@google.com,
        yuenn@google.com
Date:   Wed, 28 Sep 2022 17:39:21 -0700
User-Agent: alot/0.10
Message-Id: <20220929003923.72F96C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yuan Can (2022-09-27 06:39:31)
> After commit 6a5898411159("clk: clk-npcm7xx: Remove unused static const t=
ables
> 'npcm7xx_gates' and 'npcm7xx_divs_fx'"), no one use struct
> npcm7xx_clk_gate_data and struct npcm7xx_clk_div_fixed_data, so remove th=
em.
>=20
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---

Applied to clk-next
