Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE92C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 062DF60F8F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhG0R4p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:56:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:46476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230435AbhG0R4p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:56:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C8646056B;
        Tue, 27 Jul 2021 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408604;
        bh=ZF8wgQL8ya5hJrdbE7ElZ+y/AC2fEVAzKC0WCAIOM8g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Id2UwbcXa69DeFUAt19RScuQ+/V175vPfIsktNnDwVrVGz+IEVUN2TLckNFVSq26N
         EaG6KWN7dK5+Bi4kKKv5U9T/tXZvXubi2fSZUwY1yljOQT4QE+b3cNIgsUCAtOm/EC
         +lm+q1lJrgowUyl0XBHeBPV6ksQblupj++I27MJDHPtaUHYUjB6kaw5rQbmPch43Vk
         6G1rUZv7ae2uqdI1LM8BwXK98c3qqPZTE7EI84mAXv5UjviKcR73COfInDxqtPBhg9
         6FlmSKbXtfS1VyKA71MLRSfLAz5XH0WhiKsfGeRLCiAX+y97ZqzTY0+xJq7NMOJtBI
         TkKrpnDiI19lw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-16-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-16-chun-jie.chen@mediatek.com>
Subject: Re: [v14 15/21] clk: mediatek: Add MT8192 mdpsys clock support
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
Date:   Tue, 27 Jul 2021 10:56:42 -0700
Message-ID: <162740860259.2368309.5808478569910109438@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:13)
> Add MT8192 mdpsys clock provider
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
