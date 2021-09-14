Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1414C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A557761212
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbhINWVr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:21:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:55946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235876AbhINWVi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:21:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B0FA61175;
        Tue, 14 Sep 2021 22:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631658020;
        bh=r1OvlgjiQppjPiGzI6tFa4VMULrxK1llfZWUWLThmRU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KFAGYXkQPaCZ7ioZ1XITS5A1kbs2w+LjFX2J9kJY7yONArtF2roB/EhOeuqLa1zCV
         39dr86s+XDL49jEmEC2WBcZ3ClRTjN/GoAwddgw/94mtdnOMEbW0SW1Ls3QqT2ACfR
         Q7ji5eoDOkt5dUF9Hvpqx7I0mQ7xQlsD7//A0f3LV39woaZkPtmBADw1IPsqrJz0f3
         WtYonEZyE+KHIxBxEPjT32lZJT0ntKjQN+E/g1L33HG8gZNg/BYN+4PJv7gpn1fqFt
         miizRL/x50LE3BENHi72BpKwLX8lUkD4qQhz8LcC+HHkbqGphdTRhNkwPbxLTWucGN
         JaIkhpmqxf3Tg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-25-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-25-chun-jie.chen@mediatek.com>
Subject: Re: [v3 24/24] clk: mediatek: Add MT8195 apusys clock support
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
Date:   Tue, 14 Sep 2021 15:20:19 -0700
Message-ID: <163165801904.763609.1606672028948718811@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:33)
> Add MT8195 apusys clock controller which provides PLLs
> in AI processor Unit.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
