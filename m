Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0688C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 21:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbjEJVSQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 17:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236812AbjEJVSO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 17:18:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C697A9D;
        Wed, 10 May 2023 14:18:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD4786153D;
        Wed, 10 May 2023 21:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B841C4339B;
        Wed, 10 May 2023 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683753492;
        bh=6wnXuR0Uc2BahIDEvzqhRJQCaY9gzOEcQOGZoDtF2ww=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OzMXZsLU2BSip09Tnai3Lsa4m/Vf/2TWC4pDIQm6uci92fKbsp7dPM+IRDO4emqKO
         xjAm2DdtUv/nSl/q+cXWS26Syv5ZD5415u1rjvX88fVDVtWtmRPIc5Dt2Hi6lG7PC0
         7m16qX2e9QMLNVsRJRjdtqy/xpqmifr+TU1B7AgLXgYXz1RmBhB8Klx8YoS/hwWJBv
         Ln1knJdZ4hpPgujCm62SO/DsOkzpMn8ODkauHm95KlobPb3ifdyDiPg00lHIYgqMmP
         J21xGvcW1vr24/0lcfKX8ZdBBw+iOB4jKTlz8MmaOPyQps8e4467/vq+ab/0k0BvLd
         FQfo0AWIdllsA==
Message-ID: <b35458250af972d95c708792633c9a58.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230509021214.17105-1-gehao@kylinos.cn>
References: <20230509021214.17105-1-gehao@kylinos.cn>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to avoid resource leak in clk_mt8173_apmixed_probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     gehao618@163.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Hao Ge <gehao@kylinos.cn>
To:     Hao Ge <gehao@kylinos.cn>, angelogioacchino.delregno@collabora.com,
        matthias.bgg@gmail.com, mturquette@baylibre.com, wenst@chromium.org
Date:   Wed, 10 May 2023 14:18:08 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Hao Ge (2023-05-08 19:12:14)
> Use devm_platform_ioremap_resource to take the place of of_iomap for
> avoid that we don't called iounmap when return some error or remove
> device.
>=20
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and=
 allow module build")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---

Is this v3?
