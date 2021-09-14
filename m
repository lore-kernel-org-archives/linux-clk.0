Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57655C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41E3E61245
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbhINVnt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:43:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235363AbhINVno (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D6EC60698;
        Tue, 14 Sep 2021 21:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655746;
        bh=Aa1FXF1LIrP1rBqOkd/4J79cEceXMXZE2txNcDJ7r48=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IuV0NOyUtu0peADdYP24+6xirZ3WOiNTVAiKu1O4CKzp4yMeyt/cAJlvQAUTn3q9R
         AYaGRIUm9en7PZaYXq++dAc2cJOc3j18cGYCDoAS9UJGW6ZlyY0ESJtsIiGhfRrSbf
         QLGrVf8/135wQgr0He6MMNF2aAYp5v9fXddbm6mefOcwpebco1GAXgXjlYi+S96wbT
         B/3G+rfvIZdtOye+FEcm8zdZZTwGSbW9TdNzMyMH4SbZSvgS/ZMLRcmXR8qM/EGAdq
         ZoUh1rrDTC6C1M2vJm4FmhL4pO+eZ8qjENoZ+GXWJvzpErIIr2hy2CIrxWPN+TveXv
         Bqb6vYUEnV91g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-8-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-8-marijn.suijten@somainline.org>
Subject: Re: [PATCH 7/8] clk: qcom: gpucc-msm8998: Remove unnecessary fallbacks to global clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:42:25 -0700
Message-ID: <163165574507.763609.14425564120658910983@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:39)
> A previous patch removes the "xo" clock from the global namespace making
> it impossible to acquire by that ".name".  The device-tree for msm8998
> already provides the "xo" and "gpll0" clock since the addition of the
> gpucc node making it unnecessary to have this fallback at all.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
