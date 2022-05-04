Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE5C43217
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 18:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357581AbiEDSGg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 14:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237334AbiEDSGG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 14:06:06 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F28E4FC73
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 10:21:20 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id h10-20020a056830400a00b00605e92cc450so1304792ots.11
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WCQd0BEkr2350zVHaq5lFX9i48jak99a6vqhtPevMLA=;
        b=fEKIAgKrPc3/Mqs8Fm9yoZwBQC9zu/F7t2r6+oEyIkgkGwg0jOe5SfeIj3DMsa1Up7
         AoG/M4xa9coTvnuHJYFlvQ5IAK0RtIqEa23aODajOCTQpz33cjKnwL1n/xLPwXbfd2Tc
         FH7r/sG/zdt1tSZz6uEZFGDQQnewvhfkeTNXe89i7/Sng2ym25yxlMiLVi7hgWB7g88i
         6SrQZpvy8JBBd5a3hAVgTOSMmSY4EhPSXgLuXcBaNCFWHRe3qefcLhTCSwGFZxpBT3i6
         M//ch3+ztRLkltCQQS6j2gkEWWRBj4UrdPi7nSEEmvSingrvRtl1GJ0cVF2XmljbkbTA
         OGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WCQd0BEkr2350zVHaq5lFX9i48jak99a6vqhtPevMLA=;
        b=0RA1yOYlkiuL/Gw5o+eMWeqjxngldCqRvpiMSx1agFBiNb38scUo92SLtWZTlCHdQs
         VlJHcW3LEVHSzE1Ip8ALYdFXhBW7jQiCCq7A6fVYKMT2stmOfPgQaU/5PHNWPKgQkMbA
         zuCPvAoX+Q3uTZOLRXVpQ2hZdgNBdGYQ4E2XgwyhOS7lugnBQkqbQiSzocqGrRFHxi9E
         ywGOMUN9w+AEQGd6WIm0e5VDze2sC+VkDgNA2a/anxMIq+axyi5VujeyLMt0EpuJhek+
         WRjeJr0WkVrkV2FYsTGrasSpovY2kIWE834dTTtq5kyYfXFM1MhSHlAzvttDolM5+f+k
         q3JA==
X-Gm-Message-State: AOAM532fm+UH1AQCQHiEhstXhZxiLyyWHda3+a7f1Oxyfoy2S4RRW+qB
        D47XQnvYLxcYLI657B+EJt0ApA==
X-Google-Smtp-Source: ABdhPJzYJ0FPCVUpXpj95XbIPDCcfuiWkIiq8GSf0HrRowwPJd5pm70bchb1f7meCo0CrJS5bAyQ0w==
X-Received: by 2002:a9d:6956:0:b0:605:fcae:3240 with SMTP id p22-20020a9d6956000000b00605fcae3240mr7564614oto.280.1651684879703;
        Wed, 04 May 2022 10:21:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7-20020a056870b14700b000ead8b89484sm5785452oal.5.2022.05.04.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:21:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] clk: qcom: smd: Update MSM8976 RPM clocks.
Date:   Wed,  4 May 2022 12:21:05 -0500
Message-Id: <165168485226.3730817.8622970582930057500.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426090226.27293-1-a39.skl@gmail.com>
References: <20220426090226.27293-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 26 Apr 2022 11:02:17 +0200, Adam Skladowski wrote:
> MSM8976 does not have rpm clock named mmssnoc,
> instead it's called sysmmnoc, drop define and reuse.
> While we are at it add XO clock to list.
> 
> 

Applied, thanks!

[1/1] clk: qcom: smd: Update MSM8976 RPM clocks.
      commit: 665ca429bc4131f9165f119ad3ed81c786bf3262

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
