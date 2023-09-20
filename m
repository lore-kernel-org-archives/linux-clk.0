Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0259C04AB4
	for <linux-clk@archiver.kernel.org>; Wed, 20 Sep 2023 17:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbjITRKr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Sep 2023 13:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235495AbjITRKb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Sep 2023 13:10:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7C113E;
        Wed, 20 Sep 2023 10:10:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20216C433AB;
        Wed, 20 Sep 2023 17:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695229821;
        bh=K0sbzUr5jtVHR89g51G0NkEZtQQygAev4/km+8TF2zI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KaGRn/sUlxTUwOwVDJUOKl874bT6lpR6k2REBs0mAw1R/+FcIcLWrTv7jKe06ld8C
         /h0mu+XWl7Eyo2ZctNYM/Zcb0nI/SI4O/W8ottKhpQ85AVTnLfM3xXsNz+hLDp1tsf
         vfh5hAjFocLhf4pJeKmZFpgquifpSjFwHNfV7J92/4VbwA4qRfF67xEYvGME1KLCHI
         /abV8iSlXkjsBY8L//f4LW/BtFPNeNGS4XeuKkUppwfagmgYiFUyuHvgNnn2WbLK5C
         SRgYaFymt7xtNCKoPyZYLAIqsZm9jrBiazyTlDE201mc2RTNNyYWu8B/lzc6qm4DHA
         InW0bN9ab5qMw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] clk: qcom: Add support for GCC and RPMHCC on SM4450
Date:   Wed, 20 Sep 2023 10:14:07 -0700
Message-ID: <169523004970.2665018.17640231475620159294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230909123431.1725728-1-quic_ajipan@quicinc.com>
References: <20230909123431.1725728-1-quic_ajipan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat, 09 Sep 2023 18:04:27 +0530, Ajit Pandey wrote:
> This series add dt-bindings and driver support for GCC and RPMHCC on
> SM4450 platform.
> 
> Changes in v2:
>  - Remove min-items and optional tag from bindings documentation.
>  - Use qcom_branch_set_force_mem_core() wrapper API to update bits.
>  - Link to v1: https://patchwork.kernel.org/project/linux-clk/list/?series=779098
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Add RPMHCC for SM4450
      commit: 0b8aae7ed8eaf24d5f59d390325e9b2ebf1c78bd
[2/4] clk: qcom: rpmh: Add RPMH clocks support for SM4450
      commit: 5a6eabf3268f91ce3cb5350210d0a876fa65b481
[3/4] dt-bindings: clock: qcom: Add GCC clocks for SM4450
      commit: d2d04deb5566b82aeb795f24014f5b3bdb8315ed
[4/4] clk: qcom: Add GCC driver support for SM4450
      commit: c32c4ef98baca6dfedbddace1e0bbcae0ca65050

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
