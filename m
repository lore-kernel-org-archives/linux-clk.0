Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B507EC43461
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C5F461184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhDHAPa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:15:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAP3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8037461028;
        Thu,  8 Apr 2021 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840919;
        bh=ohHe3wk5yUF+rRX0XikN5l4WhxwQRG88VMnLrljbAY4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pxzQphyh7Og6Z0q087Z/FEoxSCMa28sPpXG7yKxx92qbcNJiU/zjyspZqi5rFhjCE
         QtE0RpRqqdCBkET/GVNLz7DEf/YWUcmDVWY4VA7crgNPa0lJUycTh4D34vdqS5+w+S
         dTZq7K31W73ggmBf3HCSe7/x/Z0CiNJ7Eyr44D8tPhpwM6gur9ok33v1CqIdI1uW3i
         F3HNa8Q+Iq/EjwDpTpfm7U+wG+JdoMYonwHS6vgtRLqYxnvP7X2Wh+WrWg0O9XSUvp
         s+Lp8m+bt5FJQ3ZtEr3JP040nFj/f9admmuqkc5f549Xdv9Z9ZQHfEwvSY6b5RbU7A
         Ufb7cdgd9+M1w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-8-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-8-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 07/33] clk: qcom: gpucc-sm8250: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:18 -0700
Message-ID: <161784091834.3790633.1012176085661888464@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:17)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
