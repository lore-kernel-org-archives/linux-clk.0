Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4656C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjDJT6y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT6y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:58:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CE21BF7
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:58:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D436E61EB7
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37063C433D2;
        Mon, 10 Apr 2023 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156732;
        bh=Mt83/MokqWodyu7iYROHR8rHFRfMf4oGVpCeLThO3xI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ucmyLovPpGAxNQD7nA7hvSBhPvCFk8Ym44BTJ2BkSanqU6mrvjUe6Cn5L7efJqB8p
         +uRgvpI4N483fa9vMKGv1XcfXv1pVL7+UsMn7baUxk5EbvowQvj6lqVUMi2hfc4FHK
         1LRMPSL30Zhn/3RETlXZI4l64gkn2kO0haJflsZkAI+WKfNIbRBIvGMv37zrBWpM4x
         fOoJ2n54Pn8fUQbclj70aDCcn4PXuAGrLgigojI8EFChFXPu2Q/uQRja7Mp/gV+giw
         UH0/GrReww5Gm1PBPydT7fY+zCNs9z6dAtPZlD7u7TGXjyyib4ckZgoC7QxbizGMV+
         cwWGaIfxiKakw==
Message-ID: <f52c91668f88b97b8cee70f4ec332734.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-4-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-4-lars@metafoo.de>
Subject: Re: [PATCH 04/11] clk: cdce706: Use managed `of_clk_add_hw_provider()`
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 10 Apr 2023 12:58:50 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:55)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
