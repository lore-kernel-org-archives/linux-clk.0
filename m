Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76929C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 17:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbiKGRgX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiKGRgX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2022 12:36:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982EF639C;
        Mon,  7 Nov 2022 09:36:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 363CD611C0;
        Mon,  7 Nov 2022 17:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBFCC433C1;
        Mon,  7 Nov 2022 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667842581;
        bh=AwBvVZIF9qlgA475hSkeq7qNy18IbEKQETL/LT5Aeqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gIH2JjakcJY2CmwdiPDKG8y+DI2GCGN/BUntJ6gnHTb9fCs3ZgiXxQF2mgS0g8d60
         LKnoSnHdsrnXYZvkkQedSobAV7/FMDbQlsnp8QW2n6KP8VEE6NEsMfF2OlP2QpupQ9
         ROMCdiFjpZQvXcJJdD5/PtrV6D0SGEoMyrTAt6PhcYPJ6bnpexzC6dXs8/UF42BER1
         BiW3BdLi6k38YZcPbiq7t1wzTP/vpe2Uh8bWQY0tl4xdC24qljQeK2CJDQq5+sdWpQ
         o46w6j54+j8YBFx8Y4WR09Hzup0DCcCx0kUw3Oh+FdNwpbhfGecJzhRoOLisvhKc6A
         qnSAKuPfZ2ANA==
Date:   Mon, 7 Nov 2022 11:36:18 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Melody Olvera <quic_molvera@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: Add RPMHCC bindings for
 QDU1000 and QRU1000
Message-ID: <20221107173618.ws5rrqbrmtu22iut@builder.lan>
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-3-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026190441.4002212-3-quic_molvera@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 26, 2022 at 12:04:38PM -0700, Melody Olvera wrote:
> Add compatible strings for RPMHCC for QDU1000 and QRU1000.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

This is independent of the GCC binding/driver, so I fixed up the
$subject per Krzysztof's feedback and picked the two patches.

But like the PDC, it's better to post independent things separately.

Thanks,
Bjorn

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 437a34b930e3..fccb91e78e49 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -17,6 +17,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,qdu1000-rpmh-clk
>        - qcom,sc7180-rpmh-clk
>        - qcom,sc7280-rpmh-clk
>        - qcom,sc8180x-rpmh-clk
> -- 
> 2.25.1
> 
