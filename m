Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8CEC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 23:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbiDYXte (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 19:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiDYXte (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 19:49:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0E11903C
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 16:46:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6FDC8B81B04
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 23:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E74C385A7;
        Mon, 25 Apr 2022 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650930386;
        bh=Xdc/ISYABJMWss6EI13WOvVa3n+60yRIVadGk1fcadg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KUNlHLq1ytVxXvHeXKO1wkk/ZTLejoc81TMipPs93suh/wDPelL7AI8K1jDHvNSIw
         pQUOrm2iQcnxColhHS1SLJhcq6ScBVQ+cMR2bXKY9UpNE1yxvU7JlBqJncBNA9BJCK
         rKxzlqiY2w0kf1H/CdZR0/oOc+ASVN7x9xikTIgcn8mCBVW3K7FvspXklqPD2pUTOt
         J2V2+pACD1W9KmQEi5APp06WIbhcVLu2Kmze7l2TmRTJLACr4+P7YABufMwNAG9of/
         bLfWttP3OK4aiaZ6Fi0j2CY9/b+OPrbWBgyS+QIYZ/ffEmYqJlNWMFcD5xVwamuMfA
         9JeJ/PWH3Krbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220414221751.323525-5-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org> <20220414221751.323525-5-linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5 v3] clk: ux500: Rewrite PRCMU clocks to use clk_hw_*
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 25 Apr 2022 16:46:24 -0700
User-Agent: alot/0.10
Message-Id: <20220425234626.23E74C385A7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-04-14 15:17:50)
> This rewrites all the u8500 PRCMU clocks and helper functions to
> handle clocks using struct clk_hw rather than struct clk, as is
> normal for modern clock drivers.
>=20
> Use clk_hw_register(), of_clk_add_hw_provider() and stack all the
> clocks into a compile-time dynamic array of
> struct clk_hw_onecell_data.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
