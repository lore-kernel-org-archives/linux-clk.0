Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23770C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 19:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiKDTSg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 15:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiKDTSf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 15:18:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2E4178B1;
        Fri,  4 Nov 2022 12:18:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4771862313;
        Fri,  4 Nov 2022 19:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB8AC433D6;
        Fri,  4 Nov 2022 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667589513;
        bh=MeLNeoS9sVOu/HfZN+g21DXFk1zljSplJ5VAsbDDdFE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EaK2VNcceiEUMwhho46/wTu7/5TvObUmK6NpCzjbIgJgIsn6pHx5wxzGLOLmVNcRB
         iVHWIZjZ164BUdt96WD6m/eNaGfzrS7LZdp8jW2/D1ODummXYXjlEGX4qtE72qufRj
         kRRCJKqUG++VW8Ts35mppkTusLH/MgPLgzQKqDiWtgH5sSX46RR5tPfz5eKRWG0G04
         NkXYSTjUh4qtzLzwpZFeyXR1iZn3crAG2MdVzYzqgvLrI1q5BDdacVIp5hKViXN9Av
         c+1EO6NW3YiadgKK1XYXa6+jsPQiQ3pYDjT2qgGXhCz0xI70VeQmVlWsZXqAFfc92/
         wxme1vJbemafA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221104182108.126515-1-krzysztof.kozlowski@linaro.org>
References: <20221104182108.126515-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,sdm845-lpasscc: convert to dtschema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 04 Nov 2022 12:18:31 -0700
User-Agent: alot/0.10
Message-Id: <20221104191833.8DB8AC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-11-04 11:21:08)
> Convert Qualcomm SDM845 LPASS clock controller bindings to DT schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
