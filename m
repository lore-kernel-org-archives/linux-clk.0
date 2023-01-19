Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17A1C678D6
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 02:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjASCRe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 21:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjASCRW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 21:17:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF02683E0;
        Wed, 18 Jan 2023 18:17:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0435D61A94;
        Thu, 19 Jan 2023 02:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A467C4331E;
        Thu, 19 Jan 2023 02:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674094629;
        bh=RFmFJdLqLW2wV2flJR/SwVY2rW47yWtRjfwVKAuORRM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fcfFOEl1uOGzu492+GljyqW93MWAdR097aADexD6QEFr1h7a4VJn0k3NCRApX8evi
         /S0Spy7cekpPzZa4qbRoMz9IVIOQNPuElS7oYMb1xP/HtmTkndGbxagqY8lGQ3sISI
         F9+GiVNRhbGPd3re8+IkvymmYkPosdDqAqAYyj8KsJdrNjdTz8L2rvFZAYPJNgBzvL
         KUVbqyEqboaw4kQ6ktlAESAbXC9wnJB+4zo3pPLVALV70AYmGvIee4kVsvaM3WP26N
         4NWEdWvQRsC15NvZt04/d+oeQL7Kb7vS/h/beXL8v6YVCfpSDpIY7WtihWMpY7qBks
         Tk+36yyfbeZaA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robimarko@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] clk: qcom: ipq8074: populate fw_name for usb3phy-s
Date:   Wed, 18 Jan 2023 20:16:58 -0600
Message-Id: <167409461440.3017003.1860190800471771653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230108130440.670181-1-robimarko@gmail.com>
References: <20230108130440.670181-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 8 Jan 2023 14:04:39 +0100, Robert Marko wrote:
> Having only .name populated in parent_data for clocks which are only
> globally searchable currently will not work as the clk core won't copy
> that name if there is no .fw_name present as well.
> 
> So, populate .fw_name for usb3phy clocks in parent_data as they were
> missed by me in ("clk: qcom: ipq8074: populate fw_name for all parents").
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s clock output names
      commit: 877cff3568c0f54511d77918ae16b2d6e9a0dfce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
