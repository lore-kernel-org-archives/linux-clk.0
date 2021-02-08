Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9302DC433E0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6425B64E8A
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 18:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbhBHSV4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:21:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:53392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235554AbhBHSUz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 13:20:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACEC164E8F;
        Mon,  8 Feb 2021 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808387;
        bh=w+/GHaqj0dDxuSnxbw7GEXTX0ZDb0pRPn+5VCcjR4gE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dbaeOY3L8QZAl2qtZQaWKVa8McCQslxFAG+u8iQHEyQKDis1/y5MP/mFXBw9HgrfY
         uS2bi3dZP6rzuti6xgYIs30IUcSrIA67Y4lIJIfF6eso4Y5rk1oUW+LUSBRybYm8hb
         EaOK+xXBgsQ1xtwjyEpRfDgcpXf66lhQPSC4/AFuTJwBbKDzwNfTxaw5Jh5h4IEEEs
         tVaG0q4RD7EyiUeEivf10Ioy0a6cSW3snF/4ncEeQq+kjfRZel3WF2Fse+1G/3Boh3
         SJPJt+quqQd9wumtSu1J3ziMVfbehlG8V/HdtqiUAU/H2CCAYWlhdU0NV0K7oCu+2a
         a1Oh7LoI6pHFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:19:46 -0800
Message-ID: <161280838655.76967.11742308360689454238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:53)
> The GPU IOMMU depends on this clock and the hypervisor will crash
> the SoC if this clock gets disabled because the secure contexts
> that have been set on this IOMMU by the bootloader will become
> unaccessible (or they get reset).
> Mark this clock as critical to avoid this issue when the Adreno
> GPU is enabled.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---

Applied to clk-next
