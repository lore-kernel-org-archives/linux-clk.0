Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B689C32771
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 00:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiI2Ahl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 20:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbiI2Ahk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 20:37:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F26BE1097;
        Wed, 28 Sep 2022 17:37:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A110D61312;
        Thu, 29 Sep 2022 00:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB93C433D6;
        Thu, 29 Sep 2022 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664411858;
        bh=dgTvSGK9jrlA/BNaLNFVXJvbWxBoQXUObzJLWFXVar0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tWrbMTP/sWorPExempQDhceLTm3TAvsuWXDBDQhNv5fDV1o3SjdxB9wds0cbGO4qI
         PY2gvNB4le4nIJrSweoEUSzUjBLegouto4lMDvkkgPx5LMCdW45b9u18gyohAWOo9D
         pVde2Kt45lNWGZYVOEU8YsadiljyCY5ZWq6a0Iwkm6ZCgr+fOdUgnHOnd8XeBo+DMC
         MBrko7XcH7tx4Y0AlVz0g48ogvFmyGt2TM+pTvxe3r8EuUIShcn8blDNfigPf1jWkT
         50vy9DqVm6Wm0HBHjnC+zmCZeN0Z/5h/NvqH1HSsuA8k1PGJqaUFmw0SXzJKCvUh7g
         iz8D+GEwv5qcA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220920202356.1451033-4-sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com> <20220920202356.1451033-4-sean.anderson@seco.com>
Subject: Re: [PATCH v6 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date:   Wed, 28 Sep 2022 17:37:35 -0700
User-Agent: alot/0.10
Message-Id: <20220929003737.DCB93C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2022-09-20 13:23:51)
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
