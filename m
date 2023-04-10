Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45935C76196
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjDJT6X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT6W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:58:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6C610DB
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:58:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11C1961416
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BC6C4339B;
        Mon, 10 Apr 2023 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156700;
        bh=fiVAVmMtF7xzrptDMrJyichMbbhY5MrqVI3X9HuNS4I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ibrplrcmuGxDjc8jl05oxP/Ox669jzYfbuSu7PT3m8UuLO31MDtpT8GNsztUIWU2a
         sB1xZn/d1IhLSZNkhggIcCIyUMAz+asDjzfI+IlODkHEt+dP/ktQim1RlHzgIOOWAa
         jZU8UiGZlNHTwbMCHibLaHwr66610BRhNrFmrwjnR73Amk1jjk3BgdpszinSM8pzDZ
         +CK0u6On7SIWoLj+lgJqo+bP/qwFOWUUgaFSetI7OuOwXIg91r5h/XWZb6i+NuU5Kw
         z3c8VSsCzeRjGlIg2hZdaxzu1BbTnappIVMnHtQ+FQ797jfRBaL4DxXLlN6y5XgEyk
         NhENQiLHhmYVw==
Message-ID: <e1da09167583cfa29ce5410a6f9b01f1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-1-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de>
Subject: Re: [PATCH 01/11] clk: axi-clkgen: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:58:18 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:52)
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
