Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC23C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA7046117A
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhINWTI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:19:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234017AbhINWTI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:19:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72F8861164;
        Tue, 14 Sep 2021 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657870;
        bh=H3LVFe3o74JDFJmwzbvvC8Hema3SZT1AXDwvppvUE5M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eJpdHrDbnx+3vrF8pnM6ntrAkPZb4titKQ40xqM1cji/VUseuBpY6tGyfgqIBf9U/
         9KNAy7z/fuPS8hTly36jaW593KK31wnHezJmIX5Ynz8mhxabYUO4gi1qu0GEgigLwo
         Jv7VZgRIc4SpN++K8SdJdCx+w8/nDM7SFGDLB7qwuN10Naig7QdcnqDnIN1mhExSP0
         AVwwsaCSUHWUC12gusEKs3vG1Zo1NihduV2EtFsaQLhESKpryQ9uc5Qp8UULHDyie3
         x3qghHo7aiI2fOxs4FKCsHLkYYXe7q0VcQPWxWOeRO5e1caGwAORHiC9LMaqwP0Chg
         Cf+sEk1WED8AA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-2-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-2-chun-jie.chen@mediatek.com>
Subject: Re: [v3 01/24] dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock
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
Date:   Tue, 14 Sep 2021 15:17:49 -0700
Message-ID: <163165786922.763609.13079852242605675480@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:10)
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8195.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
