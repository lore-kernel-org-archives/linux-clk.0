Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C8DC77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 20:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjDJUAS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 16:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjDJUAS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 16:00:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483471BF8
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 13:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D99FF61EB7
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 20:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E177C4339B;
        Mon, 10 Apr 2023 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156816;
        bh=Qq4fHN74V/FwmSmZIiwO2HZAlc1iAS96ejBr8KYU7ic=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Uq+O0BYWvG0Dbr/OYX/hyygASvaiWz5l4ytHgTGfFR3pgFSI0xIeInLnX7Sxv4xx0
         znMPxFtahQzn+ZOW+W/w7d+NW05Pq1wfPXTK9oNQvuyobBoHkJgmAqo6+24k2LOcn/
         uEsd1iw4wEsxWH8AXUEqT80bShmf648imZjh3x7xeg6cpi1FWA/Pa1WBVYJGF/8wsx
         GpryygHNenqUDoc26SNSlQHxd0rzSA/8gAg0ZrFygi3qQteQdwMIy/RoBLLqy2NWYm
         Vs1MxPXcFg7f8DtIhg2Sxva9n76s9208NizEq8RXzKZuCoRiE9lOVl2RhBakBi9Vl6
         71zaGUE/XnRQg==
Message-ID: <02878e81b82948fa7f7767c2391a4f99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-11-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-11-lars@metafoo.de>
Subject: Re: [PATCH 11/11] clk: uniphier: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 13:00:14 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:45:02)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
