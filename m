Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEA8C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbiI3Upm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbiI3UpY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:45:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A985B36870;
        Fri, 30 Sep 2022 13:45:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D1E87B82963;
        Fri, 30 Sep 2022 20:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E30C433C1;
        Fri, 30 Sep 2022 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570715;
        bh=ZspkTH4wlIWGK9ulllRAJsIDoyBdcCbhDGVxDXKjq/I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MVASHu5fv18JrpGr204eAma9LTf1jEKzMNENoS92eYlNOx8PJjllmrZIuwmRKoMda
         Su6lP3FTlZaS1Tj4yoOkIBEjw8ypx+JuXMapQjfofkt+h71XkbHNg0W1usT2+mvYP6
         6vm2dn+9/icPpERDnEy5pm08rIZdx+obdg1Nk1Ct2vZKrFZbfTAvKY6ijqE9qOwIO/
         Q0RbRP7suCjRlhNvS+kQaENTjzwXCWF6SKJriwNViyPsxYW9MfLwysKCSW2SkGfIei
         O1H6au+1kCSk6G8AUCURAHFmgy0XqRyd8wqJiOyVLFI5+8B8+bdx/ixV+a4/g6ORwJ
         ZdL5Dm04M1EzA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-13-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-13-doug@schmorgal.com>
Subject: Re: [PATCH 12/12] clk: mmp: pxa168: control shared SDH bits with separate clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:45:13 -0700
User-Agent: alot/0.10
Message-Id: <20220930204515.77E30C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:37)
> The PXA168 has a peculiar setup with the AXI clock enable control for
> the SDHC controllers. The bits in the SDH0 register control the AXI
> clock enable for both SDH0 and SDH1. Likewise, the bits in the SDH2
> register control both SDH2 and SDH3. This is modeled with two new
> parentless clocks that control the shared bits.
>=20
> Previously, SDH0 had to be enabled in order for SDH1 to be used, and
> when SDH1 was enabled, unused bits in the SDH1 register were being
> controlled. This fixes those issues. A future commit will add support
> for these new shared clocks to be enabled by the PXA168 SDHC driver.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
