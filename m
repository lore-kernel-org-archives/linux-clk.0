Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A35BC77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 20:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjDJUAI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 16:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjDJUAI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 16:00:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0DB1BF8
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 13:00:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB80261403
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 20:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AFCC433D2;
        Mon, 10 Apr 2023 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156806;
        bh=ki2HGYS0wvQGC5ATgaGCYfDsQkCxbqCUx0wWrooKcLw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=niNE0lJHbqOfHr8pqYyF1de+lcGPV5NiakSN3sCF51q037XTreIsfHAlxj2/t/uZ2
         ayRpHreHpa/hNEZjo9f7dsuNxDsHiNKuWhZl39xD2v4uTxdJ02TQARwAGzN8amn+yy
         6lCY9XCBnCYt3+AjzGJDJk36of0cziGi8fQ4B9tbnRm1QttklThSJXGoChJXOiIBP+
         ExxEYvHLnaBPySjMuLLPV7VLt8jbNcll/f4oPr2W6XUqth6w8drgicZ+KQ/qbOt/1A
         Nuxc1zy6OAm54ejl3OLBiotgP2uZ+qh+AIVHgO1ZYivfkZdHnTzPe/puzPmiMbVnZD
         ThckVSkHMMvsA==
Message-ID: <f202d41794ac3b968673bfcf58a36dc4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-10-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-10-lars@metafoo.de>
Subject: Re: [PATCH 10/11] clk: si5351: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 13:00:04 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:45:01)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
