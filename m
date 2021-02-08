Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9813C433E0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D81B64DB3
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235528AbhBHSK5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:10:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:50274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235386AbhBHSIP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:08:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CFC464E8A;
        Mon,  8 Feb 2021 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807654;
        bh=1rCN5lRbbSRry5jStIYUAuYaXXT6fKzTwnjt0u8Xjs0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HwoYaL8fzZcOawFkoLmeeHAKmhNZruP6RcQPOTNLe/KQAVtzjkobGFgsEFqbj2GWk
         PvzGIaUU/HaynLUoq+Hw/FUCq3fUSJIQg51zybFd+qVgSS4YfyuJYQ79xJjJFOw96K
         mfbwwbR/fcauVaziYT9QKA02Otd0YWrzQqyoVKGuOkGeNa2jenLnTAzsZ/oeIfRvXI
         0id69GYS0WGT+gkgqvW2P6dbSx5nees18vYOyfYiLyYyuUl++aOMCE3+2gQPIXlu3Q
         +c3Nxfoc95aSl7yYYvFPppE7nCkXN+pVrlReuJtIZGpQ7ou4nbeehv54UsGWWSWnGd
         w3kuTYJuPOt1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210127070811.152690-2-vkoul@kernel.org>
References: <20210127070811.152690-1-vkoul@kernel.org> <20210127070811.152690-2-vkoul@kernel.org>
Subject: Re: [PATCH v5 1/5] clk: qcom: clk-alpha-pll: replace regval with val
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Date:   Mon, 08 Feb 2021 10:07:33 -0800
Message-ID: <161280765313.76967.11635409328980662960@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2021-01-26 23:08:07)
> Driver uses regval variable for holding register values, replace with a
> shorter one val
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
