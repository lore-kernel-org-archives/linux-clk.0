Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E179FC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBA566117A
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbhINWUC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:20:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:54480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235546AbhINWUC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:20:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 543BA6115B;
        Tue, 14 Sep 2021 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657924;
        bh=01uS6VKFvnOijqMcf9pn5juu60oS1v80Mb/+F+Yu0cY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M1D7z/GiyWf7pviaz/6UmuBgvaZUSnzu+Dq9epmIBdKfvpMTVqEFngkgldvRs3JhG
         W2oj4LTs7LbAL3jDO23Jys3CyBHyPbf72bhE0pxih3aEj6ppS4YlFbi3vXN7N4ZrIq
         HisLaYA6LhEZ1jnY6nmcQROEDWAJ4HF8jip7GRbLNzujfesaP/d4Dw7OVLJqtE0r0m
         lJ28k0eMZJStScjAe8+m+JCdk2qAyiIuiSnCeh/n75BKMJMkLQKlQIRUCacrIWHuCJ
         ytF+G1kqCBPW9Dr/tznibcDm7iuUIKmB623s3N3BrRtFazv+yiMcKPlOqAb42DZ9yi
         LmA8qEBNs1CSQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-10-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-10-chun-jie.chen@mediatek.com>
Subject: Re: [v3 09/24] clk: mediatek: Add MT8195 infrastructure clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 14 Sep 2021 15:18:43 -0700
Message-ID: <163165792313.763609.7788460119459873369@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:18)
> Add MT8195 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
