Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC49EEB64D8
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 00:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjFOAXB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 20:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbjFOAW7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 20:22:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD192683;
        Wed, 14 Jun 2023 17:22:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC4F461177;
        Thu, 15 Jun 2023 00:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7EBC433C8;
        Thu, 15 Jun 2023 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686788577;
        bh=JC6c+WD8LLTd7NEVpZnlLgwkDa+RKjFs3gZCsKb3OYQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=laB2QZ0vqyJVwjmYgT52FQQd867SlZRhlOaxgDFx2TbW9r52J1oL13myKbyZOUEem
         3GKY4EPd6t9kZfxmVXg2sY0YjbepU+wE7/brfqHvrcbN77JBUSsv1GT8L9+ij/iP59
         lq8ptQaoIKTmvDT7tmhpUYJTWVrvTPxtXZ++BYomD1LIk5uIHZTjVBLxinvYbUEG6p
         BZAEll8gJpgSRANQfd5RxIgh6q07KJ1ruBZJLy+DUHCg1T4vFt0r0jqzRkGlYzWzyA
         i+OWLIqvelF7/ROg5rBGECAxjXpDiKQKpffF8pX0HND22/m4Fenc0mIgbwUW6SjRU9
         cJ+lp66VP8Gcw==
Message-ID: <b0a8bd528d5fea056e48a1cc9cbf019c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f0e39b5c-4554-41e0-80d9-54ca3fabd060@kili.mountain>
References: <f0e39b5c-4554-41e0-80d9-54ca3fabd060@kili.mountain>
Subject: Re: [PATCH] clk: clocking-wizard: Fix Oops in clk_wzrd_register_divider()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Date:   Wed, 14 Jun 2023 17:22:55 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2023-05-11 10:01:20)
> Smatch detected this potential error pointer dereference
> clk_wzrd_register_divider().  If devm_clk_hw_register() fails then
> it sets "hw" to an error pointer and then dereferences it on the
> next line.  Return the error directly instead.
>=20
> Fixes: 5a853722eb32 ("staging: clocking-wizard: Add support for dynamic r=
econfiguration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next
