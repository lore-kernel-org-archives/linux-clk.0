Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A8DC54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 23:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbjALXzU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 18:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbjALXzT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 18:55:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033C55CFA5;
        Thu, 12 Jan 2023 15:55:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3432B82036;
        Thu, 12 Jan 2023 23:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C110C433D2;
        Thu, 12 Jan 2023 23:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673567716;
        bh=W/23aIj063hW1VxkMXRK+8HLzDg4mLdgXErXrSirWtw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AWli1Jo1CpKdBRF6klFV7UuU1bwM3jFQHuyJhgaEgJQzoPcRjsG/bsKv6mWDVUhhh
         uGefGORXXoeWIEWtsBlxf4AzciT+Y5CKcHzT4MQtcm/0r5VX45ngnWMwxMHRVQ0cou
         YijxO4ZwT7VFKkbVn/2k05HaQq1vcagqXcTmTZCSD/fcScQWRi+8+2se191vY5ftUD
         hyDkm2Lg4Jz6BgL6MBUZZXR6UH2CWdTSYMB0FWnn01PGBS8RdRYsQPnjkxQvfT4nTa
         Q4fo2EbHRsyXizTyyXDmGD4d7TOL5moAmqBWgFtYSW3SXOrcHsQCnTVYEcLQMZllle
         NCHN/+L5Q9+mg==
Message-ID: <f695d08dbb8982337a0f514d28d0aea2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221219171058.164381-2-m.felsch@pengutronix.de>
References: <20221219171058.164381-1-m.felsch@pengutronix.de> <20221219171058.164381-2-m.felsch@pengutronix.de>
Subject: Re: [PATCH 2/2] dt-bindings: clocks: imx8mp: make sai4 a dummy clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
To:     Anson.Huang@nxp.com, Marco Felsch <m.felsch@pengutronix.de>,
        abelvesa@kernel.org, festevam@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Date:   Thu, 12 Jan 2023 15:55:14 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marco Felsch (2022-12-19 09:10:58)
> The hardware don't have a SAI4 instance so remove the define. Use a
> comment to keep it as reference and to avoid confusion.
>=20
> Fixes: 108869144739 ("dt-bindings: imx: Add clock binding doc for i.MX8MP=
")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
