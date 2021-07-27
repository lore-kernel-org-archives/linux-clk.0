Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F242FC4320A
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D601E60FC0
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhG0Ryx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:54:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229607AbhG0Ryx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:54:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC97D60F4F;
        Tue, 27 Jul 2021 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408492;
        bh=vDofES3SKsNItFQNoFLSKBjmWxTDxCuWy4CH5P1eJeM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tjdTwlfGkepY7R75CwWAPDawT+8gCYJ+rdXZKmc6ZECrbswaR5PpjeL3McmbPb3WN
         i9kJBtOFKVBTK6GSHGKbV3tdrQOmbtuBguPIheFeYDg6v5m0pdZ4Wy4vCMi1yZdvR9
         +9EBWWOQIDHNyKU/C+Qos8QC8DA59C0Nnm5U344l5YQ71KMkkpZ6uDrJ/TyRQxxiZ3
         H+dpfLnnc7XOysXp5g5/2N/mHP09MwcP7wO+tt9cMlfR17RKdh1edluYrsvUXGWRLB
         wLmpVHtmV7Fkbr0yqUnpZFDiClxEugXsnl0q4voS7TTjx2RIVzcJHDqa8N9SYym09X
         Ku6hMiESQdkRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-7-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-7-chun-jie.chen@mediatek.com>
Subject: Re: [v14 06/21] clk: mediatek: Fix asymmetrical PLL enable and disable control
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
Date:   Tue, 27 Jul 2021 10:54:50 -0700
Message-ID: <162740849051.2368309.17691414587415743961@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:04)
> In fact, the en_mask is a combination of divider enable mask
> and pll enable bit(bit0).
> Before this patch, we enabled both divider mask and bit0 in prepare(),
> but only cleared the bit0 in unprepare().
> In the future, we hope en_mask will only be used as divider enable mask.
> The enable register(CON0) will be set in 2 steps:
> first is divider mask, and then bit0 during prepare(), and vice versa.
> But considering backward compatibility, at this stage we allow en_mask
> to be a combination or a pure divider enable mask.
> And then we will make en_mask a pure divider enable mask in another
> following patch series.
>=20
> Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
