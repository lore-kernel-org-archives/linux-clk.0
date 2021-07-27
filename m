Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F39C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:55:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EFE060C3E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhG0Rzy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhG0Rzx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:55:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DA7160F4F;
        Tue, 27 Jul 2021 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408553;
        bh=smtLvJcO48Cr/GlWu76S6GyKdMQWmXLPX4mM+AmMsz0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WDJ5yAKAMlaNc1PLD6ysHyk7TZKNO84xYEiCby/fN7nt87Ruirn1XczOlPcFPLMV/
         m42mRZtFs3CV3YLQvrQ2mRhh4fVCPwJvtH1ynyroRPBBGnu3doaR+luAALZCTPKd3b
         t8dj1QuMzSK/xnL1tq7wAzk1uCem+M1xtabxUOZ/QaNTZUStxRD0aP8x/rZXGPu5T7
         BXzj6e8pXvA/vp9PShuEYfHUNuCKE56M/3tvw/7tAFYIgsYcGoFc6Uq2FamUbL6HZI
         JszK7NQO4TeGUGACrnvoKyOJCpH5FMXoy332oHNe3HXtJG09W8//1iIQxvwEqGQ2Vt
         evgB/ksU82KzA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-12-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-12-chun-jie.chen@mediatek.com>
Subject: Re: [v14 11/21] clk: mediatek: Add MT8192 camsys clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Jul 2021 10:55:51 -0700
Message-ID: <162740855126.2368309.16697502176155707933@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:09)
> Add MT8192 camsys and camsys raw clock providers
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
