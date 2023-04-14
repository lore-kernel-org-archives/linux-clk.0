Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA17EC77B77
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 03:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjDNDdh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 23:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjDNDdd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 23:33:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A94449F
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 20:33:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12FA26439D
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 03:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94185C433A4;
        Fri, 14 Apr 2023 03:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681443210;
        bh=/KauP1C1n330Ut1f8l+ctrkpGjV7zdVgzmBEQkISa94=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h0EW3VDlATqkq4dkNIXwOzGMfcW0SOeRIkAPyd2KXtJvFmqopQlemo/sM9kum6tEV
         c8vCdc7bsVqh83rEfQWnr5th27psCD+czQIDHOyF8hJSL+HwYE+x0geAmgBtEkaGbs
         UCivMhGcJAq8E4HB/F1a+ftVjuv++iJJZGUfdvcrXIwfuOk00AjCLvi06U+BCWYiEA
         oVoCI4nUCsWqe8Z7n5p3vo7HPhUOmas6ztUI7nDWFQReo00a5bOI6ncLV7uYwhoXOk
         dCPvaxq4Z1oDw06MytG7/4z/hJaRjO+R9YTcpq7Un2pd7rzveZmZOKTxRkupdkJOkv
         NsJiKeiup2m0Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Cc:     Max Filippov <jcmvbkbc@gmail.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-clk@vger.kernel.org,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: (subset) [PATCH 01/11] clk: axi-clkgen: Use managed `of_clk_add_hw_provider()`
Date:   Thu, 13 Apr 2023 20:37:05 -0700
Message-Id: <168144342194.2459486.898850057286455356.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410014502.27929-1-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 9 Apr 2023 18:44:52 -0700, Lars-Peter Clausen wrote:
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`. This makes sure the provider gets automatically
> removed on unbind and allows to completely eliminate the drivers `remove()`
> callback.
> 
> 

Applied, thanks!

[07/11] clk: qcom: rpm: Use managed `of_clk_add_hw_provider()`
        commit: f1f67db9d64ffb85af04dbbf59e3f213fbf86add

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
