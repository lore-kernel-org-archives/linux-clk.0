Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A60C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjDJT7E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT7D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:59:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9AE1BF8
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:59:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57DB461416
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE57C433D2;
        Mon, 10 Apr 2023 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156741;
        bh=M3YNBi1Zs2HC/haMP+y567+1iHB3aCvAWLhK5WYcJLs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RYjfNADla0OruJxl4IIvtnHW9tNPg5bSNYP0IIQC+Qd8KsjUeJmGO1DClFCs2sAca
         77AYw3ZEFbzxbGIW95m+Np8rGOMoeaJ6CfioGNbiGHynhJE7DcezSZTNQanMf6UiUU
         ywAx4la+px0xVuxFxsKGvI3uOwYgEdY9b2Akzr3efUzwln7Vt6sDIrkrQ0d4FYbKiQ
         d+DM790ibaC6zoSMxq3lebmMUJRns9Qve+axxY1OnNEfZHIulcjFXs9qEMTUA+WwkW
         mJiXZ3yOnhEYUv0ZNoRCYYPrH4FXOmC0yHcqlW+/Lenstq67S+b9Tbhdg6ezqgUoT5
         NRXYxGeExU4sQ==
Message-ID: <070f96086912d609ce449913c2aaea64.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-5-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-5-lars@metafoo.de>
Subject: Re: [PATCH 05/11] clk: hsdk-pll: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:58:59 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:56)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
