Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FC5C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEFE961216
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhIOBZO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:25:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233057AbhIOBZN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:25:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6F3361164;
        Wed, 15 Sep 2021 01:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631669035;
        bh=a4Q5VaYy+4HCbuUSPOC/CcwYoE5BEe6GS13nz7hj9jg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JiNsVp3DtBHWqHDoFaThuguqdDojwnttXgGWQL9Rn8MvhkkDN38l8SgwHbzWBJZEh
         RM5x5BkJrF7wsCF9gFWbJRbVHGOXrCYzehp28QKz13tAOvKhExilh8Bd2QPu4DiNzS
         elROiwyML+nn4v7vlUKPht5hYqHAdVFiNVUUl4qvJ/n94F63vvOIpvmqClZr5+IRUf
         QrPz1HL8me1T8J0H2gkmrgSpprtCTuSaA4xyzFsaPoQOpaeOGJ4Y2w3zE8IIt86PSc
         4Ex/MF1EEqvCJ58pjyN3d2hPNK/6j/rViZHgNT6l29y0cojHp6/iB531hCzYhcm1gu
         qh0ZOuEbJWvbA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210901222526.31065-4-miles.chen@mediatek.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com> <20210901222526.31065-4-miles.chen@mediatek.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: support COMMON_CLK_MT6779 module build
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Wendell Lin <wendell.lin@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        Miles Chen <miles.chen@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>
Date:   Tue, 14 Sep 2021 18:23:54 -0700
Message-ID: <163166903470.763609.2461004170232167564@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miles Chen (2021-09-01 15:25:26)
> To support COMMON_CLK_MT6779* module build,
> add MODULE_LICENSE and export necessary symbols.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Hanks Chen <hanks.chen@mediatek.com>
> Cc: Wendell Lin <wendell.lin@mediatek.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next
