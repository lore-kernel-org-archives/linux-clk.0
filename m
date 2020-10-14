Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714E4C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29AA121D7F
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 02:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602641443;
	bh=32rr6xjv+li58m+dWdCFjqudSTOamJ/mwaSI2fYTyck=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=waKyAtiiypE18jSotlvZWB8D+bn7EMmL6GBlI3oV81wMr4m574SzG78/G4eSTqzGs
	 xPP2WhG5NlTs3Prmm4MBgDPVfAEquXvQ/ZAofs+hdIA/T/gzsVL7Gvtl2sKJqIDJAY
	 y3WHxO6NV9Cz5KjDsjod+NtjVznhjp8UkhGub67g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgJNCJ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:09:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:57416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728973AbgJNCJt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 22:09:49 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FC7621D81;
        Wed, 14 Oct 2020 02:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602641388;
        bh=32rr6xjv+li58m+dWdCFjqudSTOamJ/mwaSI2fYTyck=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pfC3Gtub84F7sm3fAWoewKiAxKPaU4COpjAIaEgInnwRxH/7kaKzCMIWbvJt7+H45
         X3XBszR8RYZfAnyWUtENLEKlCrLW9MIKgDrbVtB7lsgccGInArXWeUN1mGC8zWIHRt
         rOGf+gH4lebg8z7clnPJK9bvF9l71uy/srnwgWEY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602609110-11504-3-git-send-email-tdas@codeaurora.org>
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org> <1602609110-11504-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: Add YAML schemas for the QCOM Camera clock bindings.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 13 Oct 2020 19:09:47 -0700
Message-ID: <160264138707.310579.18410759318207954658@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2020-10-13 10:11:49)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.ya=
ml b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
> new file mode 100644
> index 0000000..07bd38e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller Binding for SC7180
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm camera clock control module which supports the clocks, resets=
 and
> +  power domains on SC7180.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,camcc-sc7180.h.

Maybe just=20

     - dt-bindings/clock/qcom,camcc-sc7180.h

so that us copy/pasters don't have to delete anything.

> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Camera_ahb clock from GCC
> +      - description: Camera XO clock from GCC
> +
