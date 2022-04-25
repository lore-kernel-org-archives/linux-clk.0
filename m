Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BE9C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 23:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbiDYXtP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 19:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiDYXtM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 19:49:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D961903C
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 16:46:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53628615ED
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 23:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A818AC385A9;
        Mon, 25 Apr 2022 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650930365;
        bh=B5o157O0Mck4BDl0g8Ej1puAyM/I0BZIL+Y+78GoTlQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RzrSfWTUf26Er5Njf7GZSmoK+B9BCy0LZzY1hCRXPlodiCURGLJ9/TxXqdzu+bkk3
         MNF4iEvZqaRS68kMXVi31a7KJMCQBBK9O/2E+f5FsmtXgrCKojBai2RNuhg4Zevlu/
         3Zijq83UlikeApq20hFldP5Uay46kof180R6U0VYCWPm7i2HmxovGBfW3vPbICKJ8n
         OOPBuU4MMO9WncpAac6khd+g8yljtEoNvaSd0oEnTby7/MYqdZ9/uu3PIE1DsWNOjE
         skLafw68YbKRK7/k4pPUP5UjgW+JUAAPDldxvU7idJ692dXzEP8XQntxjX6d4OAXDP
         Dr/PCNUtg7Wdg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220414221751.323525-3-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org> <20220414221751.323525-3-linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5 v3] clk: ux500: Drop .is_enabled state from PRCMU clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 25 Apr 2022 16:46:02 -0700
User-Agent: alot/0.10
Message-Id: <20220425234605.A818AC385A9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-04-14 15:17:48)
> The core already keeps a software enable count. Drop this
> custom software enable count.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
