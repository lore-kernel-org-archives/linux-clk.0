Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC18EC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  5 Nov 2021 05:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5E3C6127C
	for <linux-clk@archiver.kernel.org>; Fri,  5 Nov 2021 05:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhKEGC3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Nov 2021 02:02:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:45926 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229456AbhKEGC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Nov 2021 02:02:29 -0400
X-UUID: 533af3c586ae408283a3b2bfb7ae19b3-20211105
X-UUID: 533af3c586ae408283a3b2bfb7ae19b3-20211105
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1347406527; Fri, 05 Nov 2021 13:59:47 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 5 Nov 2021 13:59:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 5 Nov 2021 13:59:46 +0800
From:   <miles.chen@mediatek.com>
To:     <sboyd@kernel.org>
CC:     <abel.vesa@nxp.com>, <festevam@gmail.com>, <kernel@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-imx@nxp.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <miles.chen@mediatek.com>,
        <mturquette@baylibre.com>, <s.hauer@pengutronix.de>,
        <shawnguo@kernel.org>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH v3] clk: imx: use module_platform_driver
Date:   Fri, 5 Nov 2021 13:59:32 +0800
Message-ID: <20211105055932.3432-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <163087455086.405991.14496690646389782129@swboyd.mtv.corp.google.com>
References: <163087455086.405991.14496690646389782129@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Miles Chen <miles.chen@mediatek.com>

Hi Stephen,

>> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Thanks for doing the review, I cannot find this patch in clk-imx tree,
Would you pick this patch, please?

Miles
