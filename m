Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA2C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjDJT6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT6e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:58:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B001BF7
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:58:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2880C6117D
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828FAC433D2;
        Mon, 10 Apr 2023 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156712;
        bh=QtiQm20PkGXp7mpazwKCyGmOF+4x6/8ZGX/pAy20u2I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YZ0TKxtzaL8QWYVCghm7vKQ7ygYV7bCSVen3f5jKKsdUqqCczGHhgducGc0FG45xs
         LZodEKxxPk/Ehs03adg5HX3xjfzTyOnGmB7xeG1GAMTrt0omH+SnaeagdOpLY0pMhU
         BHVauuzQH7rvWllRiCQH53KjqItbfLlzVpYLGJCC5zAXReXd+de+mcY/YbATcrs0wH
         FRVTakeEP3gFC/SRHgwkcw7PtesPRGaQC3HX945hVyJ5EuH30Xnq4ROBgwInnr6Ulr
         Nd3uTDp9rnit/YcBlmRadSVWezvPLjWodxJNQzz11CFptH4Ha9q+0INnLejUEZdwdM
         Yxg861F0jQwYQ==
Message-ID: <31029d98f3500a73fcba3eb17e587892.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-2-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-2-lars@metafoo.de>
Subject: Re: [PATCH 02/11] clk: axm5516: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:58:30 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:53)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
