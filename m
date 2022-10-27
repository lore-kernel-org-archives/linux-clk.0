Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D632FA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 21:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237036AbiJ0Vtu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236903AbiJ0Vtt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 17:49:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D28B630E;
        Thu, 27 Oct 2022 14:49:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD04162506;
        Thu, 27 Oct 2022 21:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E375C433D7;
        Thu, 27 Oct 2022 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666907387;
        bh=cXGDPjIyPWx8UiyRGBCbkkAS52u2EQyVcZUq/AORAQs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MEhpxBQhV/KO2HnDMDARug/2e4WkZL5RGC4ftIu92d1qRAyacIHN27rX2scN5vSgW
         j/n9kUi2LHLK/tzvui+zQiiaomeAsHFVDFu+QT+kPnpBTt1HyokSBELEKaTYzkYS/3
         ZnJIjv3Xy3ZoxXtth3BtPB2U8kBVDglFWi5eCsml1xrV44EPKBSGIWW8J9jCPOsWA7
         OzykEcAIFTDvFZnsvqAtraU9cL5/Aytok1TH1w7eZO96KkdlhlB5l9VFGrLjV5w7kW
         DkSlbkCSWxIaQIkWsqeiIoffbutXh+RvdIKQB4j7sV7M9wLAEWrI2YJcJsoJw5OkaF
         UXsG/blFh9yYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221027191113.403712-4-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-4-sean.anderson@seco.com>
Subject: Re: [PATCH v8 3/9] dt-bindings: clock: Add ids for Lynx 10g PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date:   Thu, 27 Oct 2022 14:49:45 -0700
User-Agent: alot/0.10
Message-Id: <20221027214947.3E375C433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2022-10-27 12:11:07)
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
