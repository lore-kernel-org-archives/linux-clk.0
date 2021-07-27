Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCBDC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D1460F8F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhG0RzO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230054AbhG0RzN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:55:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DD0960F4F;
        Tue, 27 Jul 2021 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408513;
        bh=V0sWi07F3L3vTmxYYuqVjtOrQs5lT/nKvgb4IxFEKOk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YR1CPnRFY1EIFAtu4cXf6BnDkmCiOn+Q8ZQSuwcMdkQcbr30iPmFuI+0QwixbcBv9
         htcZvZYOoMD4vAb+0vxmzQMaaf6SzqJ+51kNh/6lbYjfjKDfHerj/RicoEIgoL/QqO
         AGqWFfr77Y1SSy1qX3aA8UJpFPfMUmcUU0Lm6QKo7gDza6L2Lwf8qGGx+tiAM0ivxb
         ftJYCRuefzbZ4N+UIj/TszJQVzlYaqMqffelZkJ2Ugin4f6fU+2lF43HKDH5W9e9RQ
         N8qqtYQxfK7XbIC6rqYnSj2nMHORNzC67thY2rjRMzvozSaSw8zlzTCdbWccczHBQK
         rFVPDkCYOLunw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-9-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-9-chun-jie.chen@mediatek.com>
Subject: Re: [v14 08/21] clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers
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
Date:   Tue, 27 Jul 2021 10:55:11 -0700
Message-ID: <162740851136.2368309.3574784042718719986@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:06)
> Most of subsystem clock providers only need to register clock gates
> in their probe() function.
> To reduce the duplicated code by add a generic function.
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
