Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46675CE79AC
	for <linux-clk@archiver.kernel.org>; Tue, 19 Sep 2023 23:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbjISXEa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Sep 2023 19:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbjISXEO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Sep 2023 19:04:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16511AB;
        Tue, 19 Sep 2023 16:03:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B579C43215;
        Tue, 19 Sep 2023 23:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695164636;
        bh=TyjQ2a3fkLX16U9DrTeFwA6CpB4id9tE4rUUupeTxQM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FDHQK0XZUKFKX7CtidDDbUDAllbjRjLgpaqYZcU8s16H5gX3vSlJVLTa06FyKkqFO
         5FJzoeESlfKVYExy1xAyvNtA1So+4PEr4dEhvag4HWg8ESa2u+2Hxy450KYcxItcZx
         P+GGNbBpqx/GpH0JYdewKVmDdSJA1UGk6yl23OixU6mKnNLOY31U/Tl1Y8QVcsvI98
         OYPPknV5llvL4S9VNOlYYI898pV1JQXhtGRk5g4QdkwDSPS8lplV7oBAktSD81RB0M
         aU5DNkHhTsLB8r585noxLUqUP3ANwEOR5CIVWOA+dCusrTO/FOxdarQi5YZ/IaJ+UT
         jVFYKUp4BIVHA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: (subset) [PATCH V6 0/5] Add camera clock controller support for SM8550
Date:   Tue, 19 Sep 2023 16:07:44 -0700
Message-ID: <169516485981.787935.8704144419477158360.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230707035744.22245-1-quic_jkona@quicinc.com>
References: <20230707035744.22245-1-quic_jkona@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri, 07 Jul 2023 09:27:39 +0530, Jagadeesh Kona wrote:
> Add bindings, driver and devicetree node for camera clock controller on
> SM8550.
> 
> Changes in v6:
>  - Updated parent map and frequency table of cam_cc_xo_clk_src to use
>    active only source P_BI_TCXO_AO instead of P_BI_TCXO
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: sm8550: Add camera clock controller
      commit: e271b59e39a6fbdc57784fdda7e68076f8e58ef7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
