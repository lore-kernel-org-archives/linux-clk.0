Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB9C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF41160F23
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhH2ECy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:02:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhH2ECx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:02:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2934E60E73;
        Sun, 29 Aug 2021 04:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209722;
        bh=z5ZODBZ8mRT73c77PAEsEb1LpuBksdkkBs/eyn8GqBU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=T46M40AB6D0K5jxxnzFX6/221Hw0kk87pTQb0w3pzhgbXTgjT/SiyWfQzxFBnYvl7
         r6kHpB0xKnnR32zUDzUzRU3PIXyu5l18Yx+icV1+OmbhRMIXB1/Op0YzgDXSsfxuCT
         ynCS8fiSi5LCN75PFvvcLVsMtgooxh/p06iWvpdqulUWQV6JBKfR6AGYq066vNNQiz
         5rktV8Hdg9KzDb7jmf5ByultOV/oRZVPgAZO8QFfcuVFhSshdO1BVKWf2Z5Y3aSEKr
         ZAWICxzRTfw+lgprQ+XBH/d20n6h+76D/e6SauCC/ppvCrUQcvltCJE+AKWwZTDLvj
         kpoxLmmm411eg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210820203243.230157-3-konrad.dybcio@somainline.org>
References: <20210820203243.230157-1-konrad.dybcio@somainline.org> <20210820203243.230157-3-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] clk: qcom: rpmh: Add support for RPMH clocks on SM6350
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sat, 28 Aug 2021 21:02:01 -0700
Message-ID: <163020972109.2676726.14600208790228623679@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2021-08-20 13:32:43)
> Add support for RPMH clocks on SM6350 SoCs.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
