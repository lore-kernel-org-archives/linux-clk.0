Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF5FC636CC
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 21:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjAaVSD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 16:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjAaVSC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 16:18:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBADFC151;
        Tue, 31 Jan 2023 13:17:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38192616E7;
        Tue, 31 Jan 2023 21:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BA9C433EF;
        Tue, 31 Jan 2023 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675199878;
        bh=peTRqyTE0Q9EIZx5ZmpFACPtfeNZ26PXxOGL1QjfySU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EFNjR6Yks7G1oYDKiIhFTwi9RP3E8PoOTjcWa04ruKxrAScLF4LxbkrGCa2XJaE8q
         /XD3PVLMYWCuJu/aG8w/UI25B0DP9NPCI9UMe/JIz7wuvgiLRb2hyW6WN7WMPgRCpL
         Zfg1EPEr45keZRjK+Gk9fvlgrlioBixr1redqfVLTAvYH4hqviiW1fJ6dnC9DvUBKq
         M85+gCPKMVIxPtfxZDvIE0GdCWSqnzbaTEkYFF963GCIk1p6PO+VR8oJKBUE7nS1Mg
         +8rP+RgwOp+HmvlJdXZXi6LMXHno/k8+oJO3AQ3jLsubA9I1gvo49m7PPwoGcVtzf0
         yiKA3Z6nEuzmA==
Message-ID: <1ce59ea1c33c4983a9c3c82be078d8be.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230130120959.9457-1-quic_kathirav@quicinc.com>
References: <20230130120959.9457-1-quic_kathirav@quicinc.com>
Subject: Re: [PATCH] clk: qcom: ipq5332: mark GPLL4 as critical temporarily
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kathiravan T <quic_kathirav@quicinc.com>
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com
Date:   Tue, 31 Jan 2023 13:17:55 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kathiravan Thirumoorthy (2023-01-30 04:09:59)
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq533=
2.c
> index a8ce618bb81b..6159d0e1e43f 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -127,6 +127,7 @@ static struct clk_alpha_pll gpll4_main =3D {
>                         .parent_data =3D &gcc_parent_data_xo,
>                         .num_parents =3D 1,
>                         .ops =3D &clk_alpha_pll_stromer_ops,
> +                       .flags =3D CLK_IS_CRITICAL,

Please add a comment above this line that indicates why this is
critical. What clk needs to be added that will actually use this? If
nothing is ever going to use the PLL then maybe we should simply not
register this PLL with the clk framework?
