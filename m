Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F52C2BB48
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 00:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF2B23B97
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 00:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbgLJAem (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:34:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:55874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728448AbgLJAef (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Dec 2020 19:34:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560435;
        bh=F77ivtoe1JKtlcvXA6W2cjZqACGVyncVsGLs616kk5I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aw72G4SrVbhwZGzpBRI38vpJuo96bViSqE91v/mO3c1xEmDN3K7eEvEvwtwR6bfzR
         6+joBnTKQZ/h+xR1v7v3YSA8tmuU9XN8+8yCCysfCf5cGTo2a1JFGjjKmB9xWkeOBh
         kE2V/ZqRkMqIjiGtKiirB7lqxRH4x74nFBPdKy8Vd8B1X2JpzkYEyrkEwBWHCJyQvX
         JBW1rp6VOUxhYjdGLclkLXFyzkI+t8otqABRU8KlESNEyEjEmwrFLA0TAnAoOxibNO
         ddS7AzTO1c3R1ojGWBABC4Tg9P3SVBuh5nIk+NamKDRTJGtPoMBFTNgsI91B8nvPj4
         FZcgFWF7ulYKg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-2-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-2-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 1/6] dt-bindings: clock: Add SDX55 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:33:53 -0800
Message-ID: <160756043374.1580929.2256356743862452282@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:39)
> From: Vinod Koul <vkoul@kernel.org>
>=20
> Add device tree bindings for global clock controller on SDX55 SoCs.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
