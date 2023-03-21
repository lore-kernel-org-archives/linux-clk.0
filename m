Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B82BC76195
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 23:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjCUXfh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 19:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjCUXfe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 19:35:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210F454CA5;
        Tue, 21 Mar 2023 16:35:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B42A761ED2;
        Tue, 21 Mar 2023 23:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E2DC433D2;
        Tue, 21 Mar 2023 23:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679441732;
        bh=RJasCDYJQWWNbg9wwDepavOxaIj0S3i1nSoDSy0FF+M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VwycltZJ23xwYib+lSLhbb5KuLFmQk/YKKFwJ2DET//V5rSLgL3fhaViqCyF3FtBL
         OYwzuLCukIpxKuGnFssnTcDS6wZsT7WVIE0Oktg3w6mDk89fssgrQc5VIMhozB+Vfm
         RiqDwpSJIOWi9N2nP9bglS2M4yUL8crvvq/L4Jd13DBHyzGg7MnS4luVpeCSqcSQ39
         sSpYuVxr35ClSFOmar3sO7KUEBEhYtZDeDdXpGJEwC+vMeNpdxjvwu4endicCi1JFp
         ypHuldGBUzvi0OAnNsrLvAXPG8SubzrL5f3AK0dLEHm5J6d7nmRRivgYbEhIqq/JFg
         OhG5TQ8eu83Uw==
Message-ID: <8ff38ce6cf4c75f2a774cd10d01d089a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230321111817.71756-4-keguang.zhang@gmail.com>
References: <20230321111817.71756-1-keguang.zhang@gmail.com> <20230321111817.71756-4-keguang.zhang@gmail.com>
Subject: Re: [PATCH v5 3/4] clk: loongson1: Re-implement the clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@gmail.com>
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Date:   Tue, 21 Mar 2023 16:35:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Keguang Zhang (2023-03-21 04:18:16)
> Re-implement the clock driver for Loongson-1 to
> add devicetree support and fit into the clock framework.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---

Applied to clk-next
