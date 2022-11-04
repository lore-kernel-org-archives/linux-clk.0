Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91339C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 18:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiKDSSK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 14:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbiKDSSJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 14:18:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D16A4B99F;
        Fri,  4 Nov 2022 11:18:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF606B82C15;
        Fri,  4 Nov 2022 18:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56683C433C1;
        Fri,  4 Nov 2022 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667585878;
        bh=9VtWDryebaqUymvJBEjIZqQbZMrxYyTuLuWgeC1iNoQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bmHGuLDU+6d2+crQf6d2d3nH7MSJXwAiNRlvtrZFC5VU3epGgNT3kIeF/Fc9TtIlJ
         WkvyJH3NtTlGHeHDmswrYC3/lBtSSX0Z/32NWhbNstAKKG0EVFogc+7Kpv3a7sCwP+
         biOWAAtQyNsQJrhEMKq5mhmIOsGmTtSPeRjou3JXY70flJBd/Egj1w8vPJLINo3oC1
         /teQd5F5y0K4mXUPOD/wzfD8jET6lKg4ZSa0YMJPfVqbBXY2Ky/CZkS++8C8KyTCk6
         pqugov3vZaTPhraFeyHWbibDevRLETg123HwYADxIJWN8Q6OjdeKPMlngbfdVz+mMb
         SKmcCLqB/GATA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
References: <20221104174656.123979-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,aoncc-sm8250: fix compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 04 Nov 2022 11:17:56 -0700
User-Agent: alot/0.10
Message-Id: <20221104181758.56683C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-11-04 10:46:54)
> The SM8250 AON Clock Controller compatible used by Linux driver and DTS
> is qcom,sm8250-lpass-aoncc.
>=20
> Fixes: 7dbe5a7a3f99 ("dt-bindings: clock: Add support for LPASS Always ON=
 Controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
