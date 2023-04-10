Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB66C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjDJT6o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT6o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:58:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934511BF7
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:58:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EDF261416
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886E1C433D2;
        Mon, 10 Apr 2023 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156722;
        bh=+tMA6sZRs0TVjFS8iFqP2tuDTdeRdedX4L9IpvncIWo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=C75Ya/Zf3Dd9oEFEDgxu2SNJZeHgtPuqOznvg1w8oJyMOFyt3jrk5Fbr8BXkZ35dz
         sozcJBWAk4D886MUHVBssxuI+4FwZGj2RegguRhB7M9Rc0GuLlMdGjCb9w9Kddg9qb
         G4q7AoX+f6e/nIgkoO+xsc6rh7DokLzpdIHOYwZNDOnQxs4MZdNeLoLW7XhF8xWgj4
         Rezhu1wW55jFflm45EQIUSZUM9K+Nu1ReuWAh9u7DMFFB/K4+iocBndQZ+ZOnyoSLn
         E9ycmrqt+M1R/McbtoKCy/epqhuGkhi2BvHiNFZcEO6nny7eIgjuBML77VbUpkf3IB
         EnrfO43Ums+Sw==
Message-ID: <528d7fdc7d42eea3cf1c1c4d2bdabc96.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-3-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-3-lars@metafoo.de>
Subject: Re: [PATCH 03/11] clk: axs10x: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:58:40 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:54)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`. This makes sure the provider gets automatical=
ly
> removed on unbind and allows to completely eliminate the drivers `remove(=
)`
> callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
