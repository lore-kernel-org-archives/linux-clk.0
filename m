Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F29C54E94
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 20:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbjAYUdK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbjAYUdJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 15:33:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C586345BED;
        Wed, 25 Jan 2023 12:33:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42A9F615E4;
        Wed, 25 Jan 2023 20:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9945DC433EF;
        Wed, 25 Jan 2023 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674678786;
        bh=kOrIbcbj0AibIbFMrG7bhxU6+zC8SRrgbN/woFPSsKg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zo4XEHW8ZblceqGd+p3yERWjg0f8CiXcS1lvlbKJB2cvtNbSWdocfKfFmjf1I7XZi
         ADO6+nM4Z4i+nRJF/SlG/QOqo8aKOmitDfgv75xM67JjrvKcCE3u/GEs8HBxxmVQGT
         CcHY+OJWjBg6zVHSW0IVq+geJp6lYqlqZytxzO2esB9PFhudoNFBJANdMHsyMKFQ7u
         fA0JglKXwIN0BLObwDQ53K+kQKJuQd87KERyKpNqhlLi9rhCQFLbyxcVhcLe+F8Eqf
         ctdIpoEqmvfuhP//fcLs+ovRIqyVaSpQ1TLN+sXcowMUxRbVMq3mIFJwPPJd44pPja
         z0QLNF3utBCog==
Message-ID: <5e790f5b2d77a19f78e217c68b5bc0eb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] clk: qcom: cpu-8996: add missing cputype include
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 25 Jan 2023 12:33:04 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2023-01-23 12:18:10)
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8=
996.c
> index ee76ef958d31..40c4dabc20a7 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -49,6 +49,7 @@
>   * detect voltage droops.
>   */
> =20
> +#include <asm/cputype.h>

Please include asm headers after linux headers

>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
