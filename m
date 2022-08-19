Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2FAC32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 21:29:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352525AbiHSV3P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352516AbiHSV3O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:29:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E4AD1257
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:29:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F15AEB8291D
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0DDC433C1;
        Fri, 19 Aug 2022 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660944550;
        bh=oXnqkKNX77eEWYg1qgAADW+U5n+LOAMrarjc331LG74=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=RPdlorGEN5D+a3fM4tazE2C2IW2JthYgNvoFUpb7EPqtXpx9LAHeIoLUXMCaD91Qc
         rZNepwj1sAOAvDHG5+VlafexbuL6bUjutRkJ28lAHmkQrRE9nLEsJoGdHTpHVZLqLA
         9eXQUWiN2d5/XlDOZOUBKIPMtuvrej3T4PtXJT+B9GJgoixjROYApTmm7RJNw1dUQ2
         la7q7YD+nmwxypKCdcoVX/dL1reWg+w2jEtcqab3dAk8KLF7iCtpmfq5pkwJfR7nsA
         3iP2nNArS/LbYgee9McvXWIQ4lSBPeomAIUaxuJ24erDyh5DCWMVE7FVErcBbIkJ0f
         MidRLyBOhX3Fw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220628141038.168383-1-windhl@126.com>
References: <20220628141038.168383-1-windhl@126.com>
Subject: Re: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        martin.blumenstingl@googlemail.co, mturquette@baylibre.com,
        narmstrong@baylibre.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:29:08 -0700
User-Agent: alot/0.10
Message-Id: <20220819212910.AB0DDC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-06-28 07:10:38)
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>=20
> Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedica=
ted file")
> Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock cont=
roller drivers")
> Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if availabl=
e")
>=20
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
