Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9095DC77B60
	for <linux-clk@archiver.kernel.org>; Fri, 28 Apr 2023 21:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346631AbjD1V6e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Apr 2023 17:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjD1V6d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Apr 2023 17:58:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D440FB;
        Fri, 28 Apr 2023 14:58:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E32160F7E;
        Fri, 28 Apr 2023 21:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F46C433D2;
        Fri, 28 Apr 2023 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682719111;
        bh=fyWwakSKamoWNBAsYwbyvuqW/0ewVXkTXZQ8lUJsseA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uQio8dgE4Oo0GlzvhVvjk7riCfNA5RsK7ujWfKeyiZLiwqkgcLkYJ/oEWt+7By+Og
         oGX8VQArrWbIJDuYiAMNul82uh677cZmyiF4u7w3L53P2MZatL1mSHAxVGf6xMLo9y
         wlEvSOrO41yfkKDOh0a7DUpgGO4cTHY7jMz2uy52aXgwgxVekjQi9s9+oy4oX94jV7
         WetQxU7Eyn///07l6vlJKM2fIIiAsNItXyjagtT7nf4u8O+1gOvZJScmxlxm/fxfdd
         MFCE/vxdA4wSK+U59rv0nhH3po6Ux5jUAgn0ePfdMMALVsyZGgGz/SvlbKN0/RJp7F
         mFw4cmQz0eFRw==
Message-ID: <6415cfbf0d89bd286b9ce36775125b4d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230420080154.2356480-1-suhui@nfschina.com>
References: <20230420080154.2356480-1-suhui@nfschina.com>
Subject: Re: [PATCH] clk: Remove unnecessary (void*) conversions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suhui <suhui@nfschina.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Suhui <suhui@nfschina.com>
Date:   Fri, 28 Apr 2023 14:58:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Suhui (2023-04-20 01:01:54)
> No need cast (void*) to (struct hlist_head **).
>=20
> Signed-off-by: Suhui <suhui@nfschina.com>
> ---

This is https://lore.kernel.org/r/20230316075826.22754-1-yuzhe@nfschina.com
