Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BD9C76196
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjDJT7O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT7N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:59:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0EB1BF8
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:59:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBD6F61D9F
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDC8C433D2;
        Mon, 10 Apr 2023 19:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156752;
        bh=Jen5gjpR8oetdzID9/2w9qsy438HGxQq90lgIXaiI2Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AsujjY5tLYYXAikPmlPsaRHqzUwIBpOdQ3s36f6DqWN2J0xAAMnPaHwDbuVeGnadg
         b1ozLHqJpyjsnNESXt+9Lgo74Uh7W9dofzbH7KC9v8LZcA+p8agLg6Gw87Ym1QET9E
         tzWc0LT73sIztq75bUrMspm+7vLEYRomyKGKFA5/yoUec2VRJ3RZV60vLlrsC0RukX
         lTmb7zceCtX8ChjOL8xn1JEDmWJNV03bJhsSprhOG8XzUJX+z5XKBjeDZwtizoEjtJ
         XxfYL6CcQ2o3XS0EfA8gHg0VdtglyMawXes7ri8gmUwtueEsNoDWzZNl2ZUOkiXIxY
         paYkCM0oYJ05Q==
Message-ID: <505735fa5bb50e0dda7ed58206f90278.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-6-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-6-lars@metafoo.de>
Subject: Re: [PATCH 06/11] clk: lmk04832: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:59:09 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:57)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
