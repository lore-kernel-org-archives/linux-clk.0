Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C223DC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB0B61209
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhIOB0z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232319AbhIOB0y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:26:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D6C261164;
        Wed, 15 Sep 2021 01:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631669136;
        bh=PjoWXD3Ovpkeo3CE/drCq9itutca2yZIn5UbamCKixc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GVQatktFLMlu3I1vvoYBlJyg4KnAHe9OC0FGg3Mflc1aaCbvG3BtAYrab/1QPkd9Z
         iDEWWazUJDKjbVrm+xOkRWoivosxLiqRVYnlkBlgMaZj9WbZmKjevgndVI+xo6e3e+
         723Io8/XjuWEqvRrqHZDioZuPdXgTy8C8t56BeqoOYyDIMBDLdyYHspwhdQsO4wVIG
         vhyWf50xULvDvCjr/HPa8cMKQTY0ekTA81O4iTAzub5oTsY3dKW1O4sACujxS8sBrE
         3z3r4STFLDMBvE2Ri8wwcySo7P1prTBYYCOI8IlflQianGXxsE/Sh8IbCgWHwQnqy5
         +Fjrs0OB1Yzfw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <545df946044fc1fc05a4217cdf0054be7a79e49e.1619161112.git.christophe.jaillet@wanadoo.fr>
References: <545df946044fc1fc05a4217cdf0054be7a79e49e.1619161112.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Julia.Lawall@inria.fr, gregory.clement@bootlin.com,
        lee.jones@linaro.org, mturquette@baylibre.com
Date:   Tue, 14 Sep 2021 18:25:34 -0700
Message-ID: <163166913446.763609.1283697746683465869@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Christophe JAILLET (2021-04-23 00:02:26)
> If we exit the for_each_of_cpu_node loop early, the reference on the
> current node must be decremented, otherwise there is a leak.
>=20
> Fixes: f756e362d938 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next
