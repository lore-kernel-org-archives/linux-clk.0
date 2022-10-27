Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B8DECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 21:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237019AbiJ0VtM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236903AbiJ0VtL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 17:49:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E142E86FA9;
        Thu, 27 Oct 2022 14:49:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 871156252E;
        Thu, 27 Oct 2022 21:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6BFC433D7;
        Thu, 27 Oct 2022 21:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666907349;
        bh=0k2eUjbGTZClwZCNMvZTbgZwooGx5soYZsILmA03pD0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j6bI1ti3m4wQ0VgaAxW5i9znS5m8p6Cx2HgWjerZn3jk3DgM8vcwDmnS0RchVIzxt
         S8Wt3TfTxsDOPq1h3o8USFEqxT8DQg1yD797axLBBBr4bkdCCtRA4GiiLHyJq0glpS
         f42IY4nMwjzTfhPQIrHkY/wIemNfCB0SvYB1i2BuSDUUow3875jvscA8TXUeeFV5TQ
         SjJ1jeGThupLMTgHs/yL2did4/Z28OqGbjMbqIA+b3BqFQFU+hU9YDHr8apGNmCqJl
         8C+UKp0T3+YvocBk1xpCL0yWWL48OPDf6csxmJvImGCvZBkHryH+Qymja82V0DTOAy
         ZNGCiH0MgDIyQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018231112.2142074-4-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com> <20221018231112.2142074-4-sean.anderson@seco.com>
Subject: Re: [PATCH v7 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date:   Thu, 27 Oct 2022 14:49:07 -0700
User-Agent: alot/0.10
Message-Id: <20221027214909.CA6BFC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2022-10-18 16:11:07)
> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
> with assigned-clock* to specify a particular frequency to use. For
> example, to set the second PLL (at offset 0x20)'s frequency, use
> LYNX10G_PLLa(1). These are for use only in the device tree, and are not
> otherwise used by the driver.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
