Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AAFC54E94
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 21:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbjAYVwA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236371AbjAYVvr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 16:51:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0620D6A58;
        Wed, 25 Jan 2023 13:50:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD310B81BF9;
        Wed, 25 Jan 2023 21:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C505C433EF;
        Wed, 25 Jan 2023 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683411;
        bh=RozHT5kWGkhM1LifVXhl7iLDIHvPL84iy6/29Smn2o0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O0cvoLT+5O0TTD2oe+rgRnBE/5FEsB4Vnf8FngR63v2vpNTZcm/ZJgS1USdzacGGP
         /YfmfAJuAQb+TRhBLk0mvUhcSdDDNsaQxjdgacgbS6oL5J5Z+JzBPuhm0K8K6064rr
         KDWlsGQH2fbP/Eu+QzYfB5/V3cnQ9S6AhZ6L+IqDIt0AaYA4942xJ539mJMZYh5eA7
         5R4oYoJ8hlm3wIT3FUw2g3G8PaHqvQkyZypweGaqJzO0Tlb/qvZsH5yDBdxxQzC0ui
         rJqkCYkHeb5VgxZNQEfmSX0RsZWrD+3QN3cErv/HabnXtkK7vI1cuhDK5E3bD6h7CM
         q2gnGiJY+12zw==
Message-ID: <253adc1f1cd97fb13b9aa2b3b8e0ed1a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-8-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-8-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 07/12] clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:50:09 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:03:57)
> Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
> the multimedia subsystem.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Does all hell break loose if this is ever turned off?
