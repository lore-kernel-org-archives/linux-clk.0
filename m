Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC31C19425
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 00:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A88FD23CD4
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 00:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgLJAfT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:35:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:56098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbgLJAfQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Dec 2020 19:35:16 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607560466;
        bh=dGu8x7s/80OJUUCRF1FFqmK37Libi85qRHutPmZx3qA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CliVdxcHMRmOdigIpVGjYV/FRrBKyYGGfIZwP5bS3nnlDcvqs1iQ3pNlBufTxTOIK
         YURYbZb9AA1IcTYrxgFnU0vPdosDipI0V631O+kS/bm08KvERv3Km4W6omzya/Ofo+
         GI0lKXPpEmxw8+j7m9BGio71SnWSOCIXEJ0/d8uuiLRJys+fJssT1DCKcHcKoxNXuw
         UC4Wh7zzqjRCGh3AzEQakm1RddjbaVAIz0aanx0JN5WwhmK1nO+EaG3NK1ivw8AQ9d
         d95VcC5Vr2VLcxZAr1kyzg5Xs9Y4PAcAOyjlWVrh6ld2KvDmAjY0CYF7NRAe3Q0d1o
         6GleiPyuT+EpQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201126072844.35370-7-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org> <20201126072844.35370-7-manivannan.sadhasivam@linaro.org>
Subject: Re: [RESEND PATCH v4 6/6] clk: qcom: Add GDSC support for SDX55 GCC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 09 Dec 2020 16:34:25 -0800
Message-ID: <160756046559.1580929.6449738302849701410@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-25 23:28:44)
> Add GDSC support to control the power supply of power domains in SDX55
> GCC.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
