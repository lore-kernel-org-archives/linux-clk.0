Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B145C3DA7D
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 01:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbjADBZL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 20:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234196AbjADBZK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 20:25:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D481183F;
        Tue,  3 Jan 2023 17:25:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 938BFB810F3;
        Wed,  4 Jan 2023 01:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20546C433D2;
        Wed,  4 Jan 2023 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672795507;
        bh=Lyet3mcYg4ZvREAuOYeCMU/ozJ67aWg2NRaUtTmN5Jg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R4Ez6doUF6uU1e91vOkT61J6TCdCwDIHsFCEwLuGWJ5eAwacOYMfodWH/e1c1+6H7
         Fxibv8L66Lu1YUe2HNxtAlH1h4uR2bwsyVxTA+twBfKZGvf4MtrvHdUFi0Wv42p4TL
         I7qAi4LXDCh4CSJFLck64+h72mpFSda2TMbWbjXnuc05sfoaeaM/fSGHCLMApjNo5V
         bhhpPfkqOVhOpL18/ffukGRUl5vJA48iF8CIKtQxJOEFrcMEu2UWpI39gp0w6fM3CL
         t3MQa4YJ7YQRPEahfIBrZxFihupFGZj12JXpaHgaHFeoouc5Q0okg6x1DLlhvhbAh7
         tvufhUsdt8nFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221224214404.18280-1-krzysztof.kozlowski@linaro.org>
References: <20221224214404.18280-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: qcom,camcc-sm8250: extend clocks and power domains
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 03 Jan 2023 17:25:04 -0800
User-Agent: alot/0.10
Message-Id: <20230104012507.20546C433D2@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-12-24 13:44:04)
> Add clocks and properties (power-domains, required-opps) already used in
> SM8250 DTS:
>=20
>   sm8250-hdk.dtb: clock-controller@ad00000: clocks: [[46, 10], [44, 0], [=
44, 1], [45]] is too long
>   sm8250-hdk.dtb: clock-controller@ad00000: clock-names:0: 'bi_tcxo' was =
expected
>   sm8250-hdk.dtb: clock-controller@ad00000: 'power-domains', 'required-op=
ps' do not match any of the regexes: 'pinctrl-[0-9]+'
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
