Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EA5C636D4
	for <linux-clk@archiver.kernel.org>; Fri, 10 Feb 2023 22:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjBJWOx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Feb 2023 17:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjBJWOw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Feb 2023 17:14:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BB168AD7;
        Fri, 10 Feb 2023 14:14:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF26061EB5;
        Fri, 10 Feb 2023 22:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172AFC433EF;
        Fri, 10 Feb 2023 22:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676067290;
        bh=ghsvSRGZgVlNPpv147xscv46Fev0smcGbeevNCTC204=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tSuU+Zd/H8MpF+kyXmRqB2uMIvcVIqC0Ndnl3PE2XKAPIslHYIJ6XgpKdmv85VJoP
         28o5Zfpsl/TXFnFeLau/GQ9rYkVNfFatuiiOu77m+2msROYPHZ5QdOA00wOv2z2f6y
         fDHzUZDG9lvO+UCvN/SwWyl7BPuohLptcc06cZt4HGRhEf8se5M4fciivyQ0cqUz1Q
         VYLanXCctALvihJkdiqIxgNjcETowoIm6dMXH8JQBy5T5zhicl6shdoJFZXcQiv9tm
         lvJjpP48WA16sXyNf6XOhvRL3HcFjFesYvTjaQxPI1DeBVmTu+pGCNGb4XPkCABo9f
         CctL9IETvPx6A==
Message-ID: <6fa247b53740ca760a608e1446f95c95.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206073101.14796-1-quic_kathirav@quicinc.com>
References: <20230206073101.14796-1-quic_kathirav@quicinc.com>
Subject: Re: [PATCH V2] clk: qcom: ipq5332: mark GPLL4 as critical temporarily
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com,
        Kathiravan T <quic_kathirav@quicinc.com>
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com
Date:   Fri, 10 Feb 2023 14:14:47 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kathiravan T (2023-02-05 23:31:01)
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq533=
2.c
> index c8a5fa1bafca..2e043d2d0598 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -127,6 +127,16 @@ static struct clk_alpha_pll gpll4_main =3D {
>                         .parent_data =3D &gcc_parent_data_xo,
>                         .num_parents =3D 1,
>                         .ops =3D &clk_alpha_pll_stromer_ops,
> +                       /*
> +                        * There are no consumers for this GPLL in kernel=
 yet,
> +                        * (will be added soon), so the clock framework
> +                        * disables this source. But some of the clocks
> +                        * initialized by boot loaders uses this source. =
So we
> +                        * need to keep this clock ON. Add the CRITICAL f=
lag
> +                        * so the clock will not be disabled. Once the co=
nsumer
> +                        * in kernel is added, we can get rid off this fl=
ag.

s/off/of/

Does CLK_IGNORE_UNUSED work the same? It doesn't sound like a critical
clk from the description of the comment.

> +                        */
> +                       .flags =3D CLK_IS_CRITICAL,
>                 },
>         },
