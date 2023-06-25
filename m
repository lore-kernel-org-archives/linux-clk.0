Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ADBEB64DD
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 19:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjFYTw3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 15:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjFYTw1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 15:52:27 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2920B19F
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 12:52:26 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F06EF1FA83;
        Sun, 25 Jun 2023 21:52:22 +0200 (CEST)
Date:   Sun, 25 Jun 2023 21:52:21 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Message-ID: <75d64lixeawfoqbrctm4thzh73cxkvnlmnh5xgbpf277pmh3gz@zthnqvvuxmeq>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023-06-24 11:12:52, Krzysztof Kozlowski wrote:
> On 24/06/2023 02:41, Marijn Suijten wrote:
> > SM6125 is identical to SM6375 except that while downstream also defines
> > a throttle clock, its presence results in timeouts whereas SM6375
> > requires it to not observe any timeouts.
> 
> Then it should not be allowed, so you need either "else:" block or
> another "if: properties: compatible:" to disallow it. Because in current
> patch it would be allowed.

That means this binding is wrong/incomplete for all other SoCs then.
clock(-name)s has 6 items, and sets `minItems: 6`.  Only for sm6375-dpu
does it set `minItems: 7`, but an else case is missing.

Shall I send a Fixes: ed41005f5b7c ("dt-bindings: display/msm:
sc7180-dpu: Describe SM6350 and SM6375") for that, and should maxItems:
6 be the default under clock(-name)s or in an else:?

- Marijn
