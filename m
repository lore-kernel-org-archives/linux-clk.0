Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9CEEB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 23:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240145AbjFMXrl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 19:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241427AbjFMXrW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 19:47:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC902D4B;
        Tue, 13 Jun 2023 16:46:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 81E9E63C7C;
        Tue, 13 Jun 2023 23:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A45BC433D9;
        Tue, 13 Jun 2023 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699942;
        bh=Y4bU11qYX6QwxEel9Q85VI1TlVfqbOIFBsPHmGRKibM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bbi+ot9ETFGJtwG3gFKhVpSacBVHU71oQEqGN6H2wRSmgOtQYQASuOPSq9lSDM7fY
         BIHJ8K8xP84aHEnPwTkymkNeQ8H5zmzH2BcB4qEFDwDwoA6f0gQXyF/Bn3NlrGkOJ8
         bd25MWCj2hpC1Mpx/Py9E8uVC1GxETjBFOyPYUdoE2T0onG7XHTOci900OT/dYzpH4
         5IFLUd+pn3CVbqofKf7dHqKp5YHy3JAhsgXnUPfeCwAQ1QrltDbhyf8rPMntIHdH4H
         e5is7Gp9Pm+BY6CZ4cw9WU/V+A+z7Tu5lCr6z0cvpQu14a2XvD1PhjdMKpoVaVFqpy
         3k9Xq2ZHdO0Ww==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 0/2] Add VDD_GX to SM6375 GPUCC
Date:   Tue, 13 Jun 2023 16:48:46 -0700
Message-Id: <168670013503.1400697.7477513214624813621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529-topic-sm6375gpuccpd-v1-0-8d57c41a6066@linaro.org>
References: <20230529-topic-sm6375gpuccpd-v1-0-8d57c41a6066@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 29 May 2023 15:14:22 +0200, Konrad Dybcio wrote:
> The GPUCC block on SM6375 is powered by VDD_CX and VDD_GX. If the latter
> rail is not online, GX_GDSC will never turn on. Take care of this.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: sm6375-gpucc: Add VDD_GX
      commit: 2f138c667cb94a3a150d3341ca5ebf62480b501f
[2/2] clk: qcom: gpucc-sm6375: Enable runtime pm
      commit: 097d359c8ca892b63e9d91bdfaf6c45d07c943c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
