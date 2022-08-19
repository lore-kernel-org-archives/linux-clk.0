Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9917FC32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 21:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbiHSVf4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiHSVfz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:35:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC17B10E970
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:35:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67BE7616E4
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0310C433D7;
        Fri, 19 Aug 2022 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660944953;
        bh=8QGyVc46T1BX91vUgxEQyuFhlu+qBz5e+zPyAPkl5aA=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=MwTKK9Oz1rkOTXW5tN8MSGgRhGDfJzKCiNo/AIafzBTMqiMR+vmFztkmunM8ut9oA
         Oe0GT4bNv3r1X8DKaW2mA5I7HkeaJJjAG1QO2n6oLQr/3+GpHyqT76B4iOqcey77Ks
         cAJ1AV2MgYRko6Sdvk7q5i1zZNbHbU0rEZPoPzyqeq5SMyRzbrmgwrabxDEayaT3N3
         V9OvkxUyuqNdp2RrbnFKe0cYPDQlttlFiR0Xg//RyCm/Sx4KBqDmzwZXs7Hxr8nETS
         J2gh6DEdgcau+kEsiWWqoizvXqPzaMPqVQH8R96W47Awc8b+2CYV9G37vIHKrGomhV
         l50xHQ/l/GAKw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220628143155.170550-1-windhl@126.com>
References: <20220628143155.170550-1-windhl@126.com>
Subject: Re: [PATCH v2] clk: oxnas: Hold reference returned by of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     linux-clk@vger.kernel.org, mturquette@baylibre.com,
        narmstrong@baylibre.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:35:51 -0700
User-Agent: alot/0.10
Message-Id: <20220819213553.C0310C433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-06-28 07:31:55)
> In oxnas_stdclk_probe(), we need to hold the reference returned by
> of_get_parent() and use it to call of_node_put() for refcount
> balance.
>=20
> Fixes: 0bbd72b4c64f ("clk: Add Oxford Semiconductor OXNAS Standard Clocks=
")
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
