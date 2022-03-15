Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84A2C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 23:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352682AbiCOX7X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 19:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344372AbiCOX7W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 19:59:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC6A237FB;
        Tue, 15 Mar 2022 16:58:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73B67B819AA;
        Tue, 15 Mar 2022 23:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F347C340E8;
        Tue, 15 Mar 2022 23:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647388686;
        bh=aEUPRkIjZTFFZxhsW1yy8XT6N5MoOXxH39l0ie1Sz3w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ps8/ki++Dn8SWeeV5JQG904hm8IFlYZIAszlRpPylWD9V0sqUen/0HBV34465+5Kt
         nlLW6CM8C6suaBU3LYji+2okK7BSykwU1k6s8i5fVUApTnKXyU0U34JWfx7PgZQsPx
         Im40wu/nMREPESVRwYYBkgNs+4/oQfZitYpafun8IX79I4xUqvYJYbVJhtfEkvXuEb
         DgP7JeLZFpiXYbhOY0CroDC9IPjAJUGtQtF6BvsT0kRePehJ3XB0iobaLMGYiyXeZj
         FSao6e10SOEavLJQS3+F1Oc+kfaOCwa/mwUp4t7YvUUK3DUiGl8BoOi2cPfB54N2c9
         3U9onAqqs68EA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220226040723.143705-1-marex@denx.de>
References: <20220226040723.143705-1-marex@denx.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: rs9: Add Renesas 9-series I2C PCIe clock generator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 16:58:04 -0700
User-Agent: alot/0.10
Message-Id: <20220315235806.0F347C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-25 20:07:21)
> Add binding for Renesas 9-series PCIe clock generators. This binding
> is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
> PCIe clock generators, currently the only tested and supported chip
> is 9FGV0241.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---

Applied to clk-next
