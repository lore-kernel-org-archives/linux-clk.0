Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AB4C47254
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 19:13:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E91A206FA
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 19:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588705997;
	bh=hRcuIbFiLNist/cLGJNltQ7csmh88dozJ2HTWt/Pfzk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=hl+yuSJeZwH4tVhMVfuhTOzKjSRNarEJeN1Tc6AKK9tpMvGqRRa0bwtwjSvL/CAbX
	 xCwuc+b8x0cG+42AiSu7EUEoWP0gQLHD28w/vaIerntIQAuyjCaz7/JdPdO6ah1uZz
	 EFiBzS1lKpIP3VXZwR2Y0oPwjve2gb7LA/zdialE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgEETNR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 15:13:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728346AbgEETNQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 15:13:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52F4E206B9;
        Tue,  5 May 2020 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588705996;
        bh=hRcuIbFiLNist/cLGJNltQ7csmh88dozJ2HTWt/Pfzk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KJFi2sa4qc1YFtc/WlHsIdIpKuH/FblVg+Klb/26hq84pDGRCOC7CaKtudhBkrbcn
         pB7gkARo7Pz0TPvXAe/HSO78bfiDtj/DRcYBQkQ1P0atCBp+2QTQBEgfJwlXdsDY6T
         ANZAcjZZ5XCAaQS2WLKvIEUlhh1of/bc6PGifN78=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200416081348.326833-1-linus.walleij@linaro.org>
References: <20200416081348.326833-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] clk: impd1: Look up clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 05 May 2020 12:13:15 -0700
Message-ID: <158870599561.26370.3723302763695127259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-04-16 01:13:48)
> The IM-PD1 still need to pass the clock output names.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-fixes
