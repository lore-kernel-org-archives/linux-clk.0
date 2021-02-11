Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A230DC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A68264E45
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhBKTzW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:55:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:38006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhBKTzI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:55:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 562FB64E45;
        Thu, 11 Feb 2021 19:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073267;
        bh=plow/Nl5sp9Qbeaz3RuFOPCFMn6bO2c6VClH6R59zz4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ca7DW4sLXSieMVfSFut4k56gQwBe1Q5uq9J9KDM3XKf5JG1mZ8cceSnDRHw16lBJt
         9xp5AHGaIn7ztuqI/pz9XHWGo2DIRC41qtONn0xIWEwU6mfx+Ro3nFwdcub0zRJvUe
         CRG5mWPQSpY+8K9izAqiz+3EV0OzipTRmUVb4EETwsuBBV03xtKketM/YYJRu+T29N
         DcUHy/Lhfo8pKntyiqB5speVd/pXovprwuSPXUNy6cyK6kdRnGrYXqUvptDePO10q9
         duinsTH4GqImQItKRENaW73J3DNKMniSrc6eHDsYZhDd6/H2+glIynbkI670cXAezg
         NCn8B6wNsIfeQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-2-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-2-lee.jones@linaro.org>
Subject: Re: [PATCH 01/21] clk: zynq: pll: Fix kernel-doc formatting in 'clk_register_zynq_pll's header
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?utf-8?q?S=C3=B6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:54:25 -0800
Message-ID: <161307326594.1254594.18156729685110988578@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:20)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'name'=
 not described in 'clk_register_zynq_pll'
>  drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'paren=
t' not described in 'clk_register_zynq_pll'
>  drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'pll_c=
trl' not described in 'clk_register_zynq_pll'
>  drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'pll_s=
tatus' not described in 'clk_register_zynq_pll'
>  drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'lock_=
index' not described in 'clk_register_zynq_pll'
>  drivers/clk/zynq/pll.c:187: warning: Function parameter or member 'lock'=
 not described in 'clk_register_zynq_pll'
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
