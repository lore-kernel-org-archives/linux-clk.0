Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC85C48BC2
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jun 2021 23:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 166CC6100C
	for <linux-clk@archiver.kernel.org>; Sun, 27 Jun 2021 23:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhF0X4g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 19:56:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0X4f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 19:56:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1590619C4;
        Sun, 27 Jun 2021 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838051;
        bh=IOn3iHgDjgZ/kdQLn+m9AeAqUY81RhpOmvka5mirtUg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tlPE26+BvitNu7ceXhUniJ+4YVwiyg1VyEaBlkr4+tK2zH0RQvAVnlIAa7WhQ3sZR
         Coq0xbd8zel4IAkuQRZ3YHWrfiSyszaocjOTkOb2BnQYgCIB0gssx6azz4Y0yAt2ww
         5mgngRVigEyS6ryTfYhMtHNYOngaEIiaaWQ9rPjJGGuWj3bn5pufPPzTtt3lCTj7Ud
         NSveH86muvrl8CK0Is60vZpjHw1SGtj2fXDdodL4U/buEaCeWjffZ8iYxX1+1SzAaJ
         lUQmaVgVCRq3r5/Vvbx542iXxQocvN9j5VjS/VBhPN8xVFhO0juyo7uv3yty86uWpv
         L7UdJfGPw1xTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210605121040.282053-1-martin.botka@somainline.org>
References: <20210605121040.282053-1-martin.botka@somainline.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document SM6125 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>
Date:   Sun, 27 Jun 2021 16:54:09 -0700
Message-ID: <162483804969.3259633.12130694864125127567@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Botka (2021-06-05 05:10:37)
> Document the newly added SM6125 GCC driver.
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Applied to clk-next
