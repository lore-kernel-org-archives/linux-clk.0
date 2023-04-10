Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA76C76196
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 19:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjDJT7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDJT7e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 15:59:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C977E1BF8
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 12:59:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63BCE61403
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 19:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE54C433EF;
        Mon, 10 Apr 2023 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681156772;
        bh=OVy/AULzakt0Yczi1Ar8bJAukqs8TcqoYWQ53/bnDcc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=J49bCmnapniZE3Hm1BafhpTpONad2uXGpJGnVtLW8l7U4a7fO5VOQJ+a/RhXO3lVz
         8lv560NBVHeTFiFMuRaRCW3XNEJrXirRV5BgA/LwkJWuV5UJUnIhhqiC+cPkTXzHvj
         Nw9mEmfDzyxCVS6356e0yQfnAIymdojt7m8nDVXv/n6PXZlXXjbeGK3Tqt3r3siWfm
         yvJzArhBn6iNd8Az3exPY3F/YVqxEjYFJVYAqljoMZtWKkkUFGXhyEYHoSSH5guOIJ
         NQNBMqpWuAjoKp0FlxmazIlP1XuGuZa5h5nE0InS+90Aw2gEguqeayyEIOLJZn0QD1
         aIKb8D+mhZPcQ==
Message-ID: <7ad8146f633283ad913608b21c264b61.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230410014502.27929-7-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de> <20230410014502.27929-7-lars@metafoo.de>
Subject: Re: [PATCH 07/11] clk: qcom: rpm: Use managed `of_clk_add_hw_provider()`
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
Date:   Mon, 10 Apr 2023 12:59:30 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-04-09 18:44:58)
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()`.
>=20
> This makes sure the provider gets automatically removed on unbind and
> allows to completely eliminate the drivers `remove()` callback.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Needs to go via qcom clk tree.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
