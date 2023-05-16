Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567B1C77B75
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 12:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbjEPM57 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 08:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbjEPM5v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 08:57:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B754EFF;
        Tue, 16 May 2023 05:57:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2440E6399E;
        Tue, 16 May 2023 12:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB70C433EF;
        Tue, 16 May 2023 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684241797;
        bh=kX4Rxpw+Xpgmt8wu5MKO6M/8EfKU9eaYZ8q0eueknLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AeurgxXbjhjO7nH5RPc+ReOKzZIHL6M6vlQfsq3Ynpq17Guc5ms9ErfxRk+cbem40
         jtZKxinRg29KQc6LBB+bFZlN8CFMgeisnQ2jL9ephNM715Kq8H3YYxX+3L8V8BXqlZ
         UMHcJydzJ2ec7t82dt6KVZyWSnmQwWyg7jexvmNiXKUVF03ljATeGi7nx20aM6ZtB4
         tHetdHUCLhlrwEC4m5Uaa263douVGkg3JKOerMWCd5cPGC32EVrMCcs6jfMKPO4e89
         HWHSPxvdDuLpQwz9QzJyfPndS1ExWSx56euCI03r1FXp8emqsqJ7MmiANzfwRZfQRF
         Qm5S2TYOfLLrA==
Date:   Tue, 16 May 2023 18:26:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 0/9] Enable IPQ9754 USB
Message-ID: <ZGN9gchu7dRb6QwC@matsya>
References: <cover.1683630932.git.quic_varada@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683630932.git.quic_varada@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09-05-23, 17:24, Varadarajan Narayanan wrote:
> This patch series adds the relevant phy and controller
> configurations for enabling USB on IPQ9754

Applied phy patches, 1,2,5,6

-- 
~Vinod
