Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAAFC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 21:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJQVIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 17:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiJQVIH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 17:08:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FC878BE5
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 14:08:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2F6DB81681
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 21:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75355C4347C;
        Mon, 17 Oct 2022 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666040880;
        bh=PEd3VMfM3ZdUTCnWiOBM/cEisVoIk6qegWHGtLrK200=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DfqKUKtezIK5olz07bjE9D6ObY92gS+vXbPKLTpYKkOLOf7Rmq3/55B7EJj+QJXk7
         0YaXf9v+gF9gaD9kp1scQYynsCXFHChs2uUE8Ds2atiiRiRZV8uEM0bIHQYCDAOUBN
         7ahWhiHCHznExv0d0G8UzVIy7PcK0WueMXeQXpGIwXd5wxS7IP1/mB+UhFZgfIOPsG
         kfoLr0GJ5WquSzI16sZ/IBw8U9oS8BM3XHkcnppY9dIF7Yedxsa1Evh/kYE3Ab2t4x
         cOa7/gqOGXSDuzWSzKTF7NYhwG1eKeEBPqAQyIfCCZSjCJTNhWXqBmhGW1TwwIWj7o
         xGGUgQA48QTKA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221009025056.35311-1-yangyingliang@huawei.com>
References: <20221009025056.35311-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-topckgen: Fix error return code in clk_mt8195_topck_probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        mturquette@baylibre.com, yangyingliang@huawei.com
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Mon, 17 Oct 2022 14:07:57 -0700
User-Agent: alot/0.10
Message-Id: <20221017210800.75355C4347C@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Yingliang (2022-10-08 19:50:56)
> If devm_clk_hw_register_mux() fails in clk_mt8195_topck_probe(), it shoul=
d return
> error code.
>=20
> Fixes: deeb2af77cf6 ("clk: mediatek: clk-mt8195-topckgen: Register mfg_ck=
_fast_ref as generic mux")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-fixes
