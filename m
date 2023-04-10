Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94432C76196
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDJT76 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjDJT76 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:59:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC961FC2
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:59:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC7876140F
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534EDC433EF;
        Mon, 10 Apr 2023 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156796;
        bh=4zprwvfoP4I5Dkeha9VLHEOBeEUuEKSrWtfCRFwnUmc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WCD0qOFWDoCrNMQyQVW167BRNqsGOb1uTq5SE8uKd0Z64n/K5i1QFQzc+V5Q/yfg2
         pnL0vWmhjJagZKitDSS3j1Z+1dEYAcUd7QcEJQAwncul3oCQ1kDr6b0//aV2vjuG1v
         fsYs57EZrCthkpdmtpXu8l/WvVvqL3wUm8N6xfRst87SkfRgEn8Qsn2PDYksrEJmde
         7ZUUbDgaqRlz9E86VkrXa3rRTFI4BoLJcE1TwibdCmmgSbpau3otLrL82AG6Hk2cd8
         MlUUZ/uU64IwK8eHBWzAJphZxmXvZ/BwapCSTFu3iYNA/MgpV/zeOtoOZ4+GwI6TfE
         wCWEUFipyS+Mw==
Message-ID: <4360b9daa18c4b31273cc1bb4d8279f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-9-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-9-lars@metafoo.de>
Subject: Re: [PATCH 09/11] clk: si570: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:59:54 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:45:00)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
