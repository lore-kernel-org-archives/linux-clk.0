Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED27C6FD1D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 17:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjC0Rtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 13:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbjC0Rti (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 13:49:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D247170C;
        Mon, 27 Mar 2023 10:49:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A467C61458;
        Mon, 27 Mar 2023 17:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE77C433D2;
        Mon, 27 Mar 2023 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679939376;
        bh=z6Mf9mmmJmkwpYKNu4EDMwMe4wXtgPWUTk0mNL0Jqd8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PtK0fCgDxniwbHb2b7tunPgVtISR8UmCwPRszDIj2DUAp/az/6ONLmvSjH7DM3sUC
         yFrHIVTWvcyZgY2KVwMYXzzJdy9zBtJig3D7rYd38SwmVpCgyPfuaVGidixEnO4qgD
         /8O5TCcvqHLBeF29PnGgC9OCamqscPIEBKtPkYxmzdxWbnovjYE0R6ughSk/PZIJER
         Erl2JMZ1E5q+Ui4LsrncJ+wd1hqN91+m5TdfA79BQWG2gYgPmYfvLaQEOKqfN0PBkf
         ZYMft2+eBw6hZu0Tto8Wedfg3yJ3DL99B3OcGp8V0zQVzXotw8e80vklina5RXqLGn
         0ECQzt2kaUAfw==
Message-ID: <6407bbae6eb46897765508262bd2e1ec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118191521.15544-1-marex@denx.de>
References: <20230118191521.15544-1-marex@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx I2C PCIe clock generators
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Mon, 27 Mar 2023 10:49:32 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-01-18 11:15:20)
> Add binding for Skyworks Si521xx PCIe clock generators. This binding
> is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
> generators, tested model is Si52144. It should be possible to add
> Si5213x series as well.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
