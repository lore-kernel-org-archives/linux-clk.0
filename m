Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35572C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjDJT7q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT7q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:59:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872891BF8
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:59:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2244C61405
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2F8C433D2;
        Mon, 10 Apr 2023 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156784;
        bh=7PYduFfLPq8KTGe2o0R3D7axs+2/2RxiUfV/Rg+QKFQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MUaTkVigUCXEOHLnYPiGkNqEvoYxsPXGZKKHFXsKpmyrVJ/BUNVdvlZh9qjdeTu21
         stWBQ5b6+rGaqWxC3rYrbOEjARU+1D/g060CuQ/zrbm2m8Gr6sM2AirSflESa9W3HK
         MHLehqJRnntaSIFCmIOVzm8puIOPX9yAtV1qfSsnzSSVCOGZc5Lu8sqzZ4x8lP8IXb
         ou/c65OhdWKa29JTygeh67Qq3/1D8WJNC6NGBu6EOL3ekQ0731yeowFUWmI0LZhh+t
         1CZbNl5Xs6WMbeRVMs6mixIngjDUWqDLq6o3+o8sY+tZ+gG54rkWhCYnnhG7TugtCG
         xID7OQJYrBcgQ==
Message-ID: <7a68e8f8403e619f70bf7ad83c51b66f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-8-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-8-lars@metafoo.de>
Subject: Re: [PATCH 08/11] clk: si514: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:59:42 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:59)
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
