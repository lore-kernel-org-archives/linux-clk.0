Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318ADC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:42:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17D9460698
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbhINVna (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:43:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:46086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235319AbhINVn2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 17:43:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5172A60698;
        Tue, 14 Sep 2021 21:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655730;
        bh=a98IsHRSSG2MWJbjf+aFCIRULhfyb9/QzmAPb6nfQKI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HuCjpcumdVIN9JKVwJATimF5dLd/Ww1TMsBoHrntWMY0/TrwJnsXsoPAvIfSQom1T
         dmcxUDjr/zXvLT+tK07fEm/LPnZMp+5rcfoXnZ5tEM/cdNujzKA7kZlyfX6BufInU5
         zJll+Y/Fdw3pIenyIzqTPCiF6BUAcjqa8Jsxp+mIYz3x0fclcR8RxtNkWmEoUrZYBx
         rp/D6TAuJWpIf27grmAPGtVhVl/xj2M/puwfp/1G5nQ4pfKfSZkpf7xk35rx5VpgXs
         U1v4lLn4rXG0v9/9QiMZLG+H7LJfcqy+ypr7x2lGx33/zK/Trf8ka1lJ7fkAzfkngw
         SH2Lk5+bxVwBA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911121340.261920-5-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org> <20210911121340.261920-5-marijn.suijten@somainline.org>
Subject: Re: [PATCH 4/8] clk: qcom: gpucc-msm8998: Use ARRAY_SIZE for num_parents
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
Date:   Tue, 14 Sep 2021 14:42:09 -0700
Message-ID: <163165572914.763609.2481168733902439009@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 05:13:36)
> Where possible, use ARRAY_SIZE to determine the number of parents in
> clk_parent_data, instead of hardcoding it.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somain=
line.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
