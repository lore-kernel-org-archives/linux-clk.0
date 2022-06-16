Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88944C43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 07:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiFPHrH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiFPHrG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 03:47:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94B05D18A;
        Thu, 16 Jun 2022 00:47:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C57261CFB;
        Thu, 16 Jun 2022 07:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06F1C34114;
        Thu, 16 Jun 2022 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655365624;
        bh=WvXWN/2Zdd9ltiiG67Oz2GlJzBbZnQxc/zeK3AgSyXo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=brxp3SJOfdupMT3gHseHoMnPOVitQL/dl3e/jVl3eO3gowVQ+TpOMTkD6Ko6sl/ay
         WHhX2rLKtgQmDAh2k17V+ZumSYsJIKp79b2a4e/XZYn6SreJjcnF+gRMjusq0lqLXQ
         pIcTuQI2w5KbYts+/KtGYLO26vXBPRCMD3+hL3bTjlyqhGeckLhwM5s7e2OpIed3yV
         Wk19MIGirYi2zr5C0lWMW93JNFdN7D8nLmYZjZgIYdUd29L1vGyOFNtZ0QMLvUrN+T
         eUgbowvI4S3Bg/kipLfqhKLHMqAYyAs1d65dtIoAq9Ml3z117fd7xnQ/2PhVDxiB+D
         x5zIXo7kaKCCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220610104911.2296472-2-vladimir.zapolskiy@linaro.org>
References: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org> <20220610104911.2296472-2-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: add QCOM SM8450 camera clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date:   Thu, 16 Jun 2022 00:47:02 -0700
User-Agent: alot/0.10
Message-Id: <20220616074704.D06F1C34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vladimir Zapolskiy (2022-06-10 03:49:10)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.ya=
ml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> new file mode 100644
> index 000000000000..6e774e59f213
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
[..]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;

I'd prefer to not have container node and just change the reg property
of the clock-controller node instead.

> +
> +      clock-controller@ade0000 {
> +        compatible =3D "qcom,sm8450-camcc";
> +        reg =3D <0 0xade0000 0 0x20000>;
> +        clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +                 <&rpmhcc RPMH_CXO_CLK>,
