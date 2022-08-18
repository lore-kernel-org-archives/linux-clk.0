Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876B5C25B0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Aug 2022 21:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbiHRVat (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Aug 2022 17:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347168AbiHRVab (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 17:30:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF9BB8F12;
        Thu, 18 Aug 2022 14:29:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 316176168E;
        Thu, 18 Aug 2022 21:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC43C433D6;
        Thu, 18 Aug 2022 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660858153;
        bh=FipX6TVhrxxHlLkeH5ciwQ7iKPbNA0jvMsmy8hdNRVs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NXopHnykGh+XHvpPSsAr1PicYgKojNMOjbNGWZ2RLkbOutAOlwZlGtBHjKiDClZ/h
         mFdGpx625eZyQcJ7gtko3p0RysfP8L8LHRcAeKpwCXoV8gNlYblZq0tyYC/DEc9sEe
         ApZedc47hAVg4FG/QM00AaJpXnrLOsgN+q2cbNQgVOPpXDE9/RCA10cCWzqLXUqiBX
         AyXijggm84IOZPXK+wloH42vbZL/uMhbqnSiKEsL2p65FJhp8eTc+9O2umwqgSitm0
         W0sGhKd/LNZyJ+dmbUfi9mzd33atwR6qbTy60Yl/5agGESK5MPCs/ekf/3Mrfer0eU
         5FR7MMDmo65ww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220818124132.125304-11-jagan@edgeble.ai>
References: <20220818124132.125304-1-jagan@edgeble.ai> <20220818124132.125304-11-jagan@edgeble.ai>
Subject: Re: [PATCH v3 10/19] dt-bindings: clock: rockchip: Document RV1126 CRU
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@edgeble.ai>,
        Kever Yang <kever.yang@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 18 Aug 2022 14:29:11 -0700
User-Agent: alot/0.10
Message-Id: <20220818212913.7FC43C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jagan Teki (2022-08-18 05:41:23)
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xin24m
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon managing the "general register files" (GRF),
> +      if missing pll rates are not changeable, due to the missing pll
> +      lock status.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"

Why aren't clocks required?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cru: clock-controller@ff490000 {
> +      compatible =3D "rockchip,rv1126-cru";
> +      reg =3D <0xff490000 0x1000>;
> +      rockchip,grf =3D <&grf>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;

Can you add 'clocks' property to the binding?
