Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1410FCCA473
	for <linux-clk@archiver.kernel.org>; Sun,  3 Jul 2022 03:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbiGCD53 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Jul 2022 23:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiGCD5T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Jul 2022 23:57:19 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B620FB1E7
        for <linux-clk@vger.kernel.org>; Sat,  2 Jul 2022 20:57:16 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id q11so8906692oih.10
        for <linux-clk@vger.kernel.org>; Sat, 02 Jul 2022 20:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRwOqQ/85sp5lF97lpgTtu23mAk2f8CqxwUWAJh8dkM=;
        b=VXcwvHIvIGG7yOoViwRjDZOGto0oviiZeaTaSJnzcSXUKOb2xlQ2Xf28U+q9u1P4D7
         cNBTvkzyNW/ak58Rd1q2z+dSgGrEkc9iTVMFaKPsb1eCPvKcogHT1eGegRUQWHFH43V8
         Okv1OqBJYMf5sPJgEQLxkWbPJuU0RtImLVe3x7EdGCixRUbrGXwMwOIoxaIdNwSFjfud
         EoWssrhgSpRWOkXP+snYu5lEldyJKW3jJmr69xmt6BPknKER3GsjsHQUtEDwMxxQyJKM
         QX6j7c1cXTIGBOtp5Rn0Q2L5BE2dbUcdKJ/m5WRIHXfk3anr6mEC8pbC9AT3ojEeZ2hw
         0CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRwOqQ/85sp5lF97lpgTtu23mAk2f8CqxwUWAJh8dkM=;
        b=6AS5SFegea5mmnil0ku08KQru3U1ICt5a3CzWgWt6gb5EKUPmZXPR1wq4mscdh4NcA
         2/X6I+SNXuA8lbf3uhq2NyDTuTsPWtvD1AU/mNZVfmfqwAVpUxl4+wckA+ikw75jweaE
         1Cl83fx5+tzCLvMiUh36nQqVgAA3nswnn6UTnyPtJtREaU3X011DWTRseLm2tFOKwsRS
         VcWs3mG9DfVHXJztU4UuivHtXa39Q/mcLIutZDnLscGqqOKiXS+HIdXyEri3zTeZKFlm
         z27RdnWh6cGne28iTrw+ntD01NVWe42Snnwl7/s+WE78JRDn3eSCJf6ERHrTAlO1kYIz
         nFYg==
X-Gm-Message-State: AJIora/rdMlCyrObXyCmCOT2rQHvenCdvpPxFge5/y3eeLzDL8BAbKdj
        U0tI3BS79Y/t0Sn+vmF1168gDw==
X-Google-Smtp-Source: AGRyM1v8l9HsMp8ZvDlnJsJrod2ErjCqtAjExLs5GevL+iRU+k4XwVyO8XUovRbgGThCScRgNhUG3g==
X-Received: by 2002:a05:6808:1790:b0:337:aee7:ac78 with SMTP id bg16-20020a056808179000b00337aee7ac78mr2365267oib.21.1656820636118;
        Sat, 02 Jul 2022 20:57:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe
Date:   Sat,  2 Jul 2022 22:56:12 -0500
Message-Id: <165682055967.445910.2483056046671899758.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628085707.16214-1-johan+linaro@kernel.org>
References: <20220628085707.16214-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 28 Jun 2022 10:57:07 +0200, Johan Hovold wrote:
> Use the new phy-mux clock implementation for the PCIe pipe clock muxes
> so that the pipe clock source is set to the QMP PHY PLL when the
> downstream pipe clock is enabled and restored to the always-on XO when
> it is again disabled.
> 
> This is needed to prevent the corresponding GDSC from hanging when
> enabling or disabling the PCIe power domain, something which requires a
> ticking source.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sc8280xp: use phy-mux clock for PCIe
      commit: 9410fb940114444f37a0b787bd84077b61d76bf6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
