Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB86C7EE22
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 20:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbjEJUn2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 16:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236538AbjEJUnZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 16:43:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E2E6188;
        Wed, 10 May 2023 13:43:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4ECD663DBA;
        Wed, 10 May 2023 20:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4783C433EF;
        Wed, 10 May 2023 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683751402;
        bh=27KIjq7CBSBhNB7+NHDWhRflDTQlTyuk3TbNQR93QOE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ra0A8gvZWpxO3dV57jJxQtcMtBgqHhbMsedx0sWbyAAxUv0Nfz+zpPbgUQhXfdR77
         38jkUQpcXSNKBlaoBMeHbp5u6EGQMvTU2y8VG2UFoCt3+hz90Ede6PsCBUxetrIMhJ
         3JT+Z6G+FcotxuVEtMjVQqnIcxDf4lmA95JIr44ZrwmF9PNzGSrUNjJT46doVBVoX5
         vsLdPU78WeShn5LmJmdC30NBIPtbmFeSbUpA+EwCNOmW0ghEboMtJGKCCJmTLTCM6O
         bMhN83SiHyokHJn0GhcBIHVzAvJ8jxPIQ7kSDObLnEd3uLbREtAprnXxHVwFq6G/ww
         D1CJkHxDTjOEA==
Message-ID: <59316f19892d2e7505b95500eaee25d6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230430190233.878921-3-u.kleine-koenig@pengutronix.de>
References: <20230430190233.878921-1-u.kleine-koenig@pengutronix.de> <20230430190233.878921-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/3] clk: mediatek: Make mtk_clk_pdev_remove() return void
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@pengutronix.de
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 10 May 2023 13:43:20 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-04-30 12:02:32)
> This function returns 0 unconditionally. Make it return no value instead
> and convert the drivers making use of it to platform_driver's
> .remove_new().
>=20
> This makes the semantics in the callers of mtk_clk_simple_remove() clearer
> and prepares for the quest to make platform driver's remove function retu=
rn
> void. There is no semantic change.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
