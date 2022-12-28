Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4F8C54E76
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 04:37:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiL1EhN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Dec 2022 23:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiL1EhJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Dec 2022 23:37:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3542ED2D2;
        Tue, 27 Dec 2022 20:37:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9CCA261238;
        Wed, 28 Dec 2022 04:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5EEC433F0;
        Wed, 28 Dec 2022 04:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672202228;
        bh=ppwC4LOwWHOKDutNAnDqBaDrC7JswL9fWVDPbALelcU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lU2pjDqAE8c3d7G8mZCQyMIZVlkz7gy3nh/vUNeoLtnSVwaoP1noZ4s2RHPg82cSq
         OUAdCYhdi8ELl0dPOrxI0f+o5sepXtoszEKU1SvlSWuNn04WZUtiuG4g4SbZz3iKnu
         H1IU8aSqXyvM8ys1po9dFjobX7/FBZ+b6e43HaJHFWBa5doGoe9H5C/5IINpwyGcrQ
         ijXVfTRXT8Qpmh+iR7lvoFz7I46WIgvLxLp6oZJlnfNStQ/5He1VgP1S2hM2jKbUfv
         Vzkl07PeKTRZs5BYu0v/aPEYeFfItF7uPJQTrlycOWoFhx62OnCs6NMf5L2ORKclT3
         OL+rIilvn3uqA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        me@iskren.info, mturquette@baylibre.com, sboyd@kernel.org,
        patches@linaro.org
Subject: Re: [PATCH] clk: qcom: gcc-sm6115: Use floor_ops for SDCC1/2 core clk
Date:   Tue, 27 Dec 2022 22:36:42 -0600
Message-Id: <167220221226.833009.4380587340113538324.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221209123910.178609-1-konrad.dybcio@linaro.org>
References: <20221209123910.178609-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Dec 2022 13:39:09 +0100, Konrad Dybcio wrote:
> Just like in case of other SoCs change SDCC1/SDCC2 ops
> to floor to avoid overclocking the controller.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-sm6115: Use floor_ops for SDCC1/2 core clk
      commit: 85d4e6ea082d3905f3ede470ac337fddc2d47650

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
