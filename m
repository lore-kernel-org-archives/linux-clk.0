Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E748C6FD1C
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 20:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjCTUHu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 16:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjCTUHr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 16:07:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9761328874;
        Mon, 20 Mar 2023 13:07:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A6B5B810A7;
        Mon, 20 Mar 2023 20:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9636C433D2;
        Mon, 20 Mar 2023 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679342858;
        bh=4H3RQ3uPz4tpgxEk0WBGgH02doouQ29TPuTkc4zWCuI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dqbkDyWNs60MXx3C2daI7vDvTEqnXUKw8Zxr7IH0hOfO0FOjymmphuVZKBEHhNKc6
         4NE2ZM3hp9RyN/EiBLInA1MJrnqtM/jG/yi58zHTwGykqFH0ncYzI08dhxLuQUQYhi
         ipGCkahtm1USpq28XIyVwnKuDfzYASTVzBoiIvOdhXtiMCGOatffvRL6a73AXORbeR
         ZTday0zCPZLyc5jTpqLEP7awL2a6UU5OQyoljBQzy3Ps+foYHKdCfH4tua+Pw4NT7H
         Ha1VI7FHwlqjFf+gmfmgl4Fefb6oADhlU6nLg6YCIIQgnvd2H8a9A3966fF5Pfw/ee
         U2+uTW+Lstj0Q==
Message-ID: <591123c5b80d12cf861cc5392688da41.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230320104003.407844-4-keguang.zhang@gmail.com>
References: <20230320104003.407844-1-keguang.zhang@gmail.com> <20230320104003.407844-4-keguang.zhang@gmail.com>
Subject: Re: [PATCH v4 3/4] clk: loongson1: Re-implement the clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@gmail.com>
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Date:   Mon, 20 Mar 2023 13:07:36 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Keguang Zhang (2023-03-20 03:40:02)
> Re-implement the clock driver for Loongson-1 to
> add devicetree support and fit into the clock framework.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V3 -> V4: Fix the build error of missing linux/module.h

Most of my review on v3 still applies. This needs a resend.
