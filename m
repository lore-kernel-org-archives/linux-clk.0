Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44803C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Dec 2021 05:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbhLUFVQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Dec 2021 00:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbhLUFVP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Dec 2021 00:21:15 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934F1C06173F
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 21:21:15 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so15302126otu.10
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 21:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GbMIVRDQcSGmbWDG4PxJ9+suchfDQXd/lNU4+vs5+iY=;
        b=b1Tp8sAQ7Vj9e7MXiLaNKO52Xq9+slAzHiuZWRIxrnKFXYt9yymPGBsEshGyWfLPPm
         WbCpZSGOKhkdetbKCxEd7p2kmjbJszr5sniB1ZGXLWvhgOpkydzr8hlYqjvAgIgOghzN
         4Y8QXU8pjpo7UxWZE6WO8WbDDWxxxxUlF61NOtlEFKXmyNRZ+bKPzIDdqfpprW2pfM6l
         KsHr+2Rg2t+CokRAJSpxeIT3adH7T8vRWFoNtkjx1BmXiC4bQMXbDRRWjU9AMs8p21pQ
         Ir6AAcdB+LQnsi9K4QwR2hWyF6PKlO20+QY4uUW98zq86WEGVH6xK/tb8FLeK2RYLqy8
         R65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GbMIVRDQcSGmbWDG4PxJ9+suchfDQXd/lNU4+vs5+iY=;
        b=ML1DkDqaggIV/gOCb5ARThIKRpTKiz/t8J4kVEBNTQVqs/ey56qoICXasNnnzbykwj
         ukHZoMpY4Bg8isdNJZt7OSC1KzsgiA5mkDFNuwYgAAfzYJ+KWM6+5O1vJeflzmDnzk6t
         lbsSCUgbKNNvANoVhxwFVo+j9MALsMy0Ouxc/Z1spg3AztPkwvs7K5CVL4UH7F7UO2lY
         iqh4tUHcAVHEWPQ4tEgBbNqCod2nJ+CWO7wli3WzClAGDlv4F+z6cvjdNMQ+VtiS/X2P
         fsnWYflkN2KrQIOodgzpOV+B7EMu3WrbOt11Jw21pDswooUWOMxroO1DG3xT1tMhFmzS
         CdTQ==
X-Gm-Message-State: AOAM532mu+zbJ4HqMRYxYkHRceCG/GqotWkTa2P+KdAXIu5XCvfdIdnV
        UGv6bp6vaH1aqRsYiKSEjJqRqQ==
X-Google-Smtp-Source: ABdhPJwxlR6/ClbKWIRSnoZTMQlA1XinE4VEiOJhQagABoX1Bp+8kotC1w45aAvwjEc1Anfs+B9AZw==
X-Received: by 2002:a05:6830:910:: with SMTP id v16mr1078864ott.223.1640064074888;
        Mon, 20 Dec 2021 21:21:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v19sm3573867ott.13.2021.12.20.21.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 21:21:14 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/8] clk: qcom: explicitly include clk-provider.h
Date:   Mon, 20 Dec 2021 23:21:08 -0600
Message-Id: <164006405161.3630669.14289122230570263108.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211215113803.620032-1-vkoul@kernel.org>
References: <20211215113803.620032-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 15 Dec 2021 17:07:55 +0530, Vinod Koul wrote:
> As disucssed in [1] it is a good idea to explicitly include clk-provider.h
> for clk providers, so include this in rest of missing qcom clk providers.
> 
> [1]: lore.kernel.org/r/20211209082607.06929C004DD@smtp.kernel.org
> 
> 
> Vinod Koul (8):
>   clk: qcom: gcc-sm8350: explicitly include clk-provider.h
>   clk: qcom: gcc-msm8994: explicitly include clk-provider.h
>   clk: qcom: gcc-sm6350: explicitly include clk-provider.h
>   clk: qcom: lpasscc-sc7280: explicitly include clk-provider.h
>   clk: qcom: lpasscc-sdm845: explicitly include clk-provider.h
>   clk: qcom: mmcc-apq8084: explicitly include clk-provider.h
>   clk: qcom: q6sstop-qcs404: explicitly include clk-provider.h
>   clk: qcom: turingcc-qcs404: explicitly include clk-provider.h
> 
> [...]

Applied, thanks!

[1/8] clk: qcom: gcc-sm8350: explicitly include clk-provider.h
      commit: 33aa94fd94d7c1ca1af77f398c194bd82ebc6a98
[2/8] clk: qcom: gcc-msm8994: explicitly include clk-provider.h
      commit: d7a49c8d2c67ab504b3959aafda290018d42b0e7
[3/8] clk: qcom: gcc-sm6350: explicitly include clk-provider.h
      commit: 1fc8887c04b28d294b71b802fca29a5fa667d7fa
[4/8] clk: qcom: lpasscc-sc7280: explicitly include clk-provider.h
      commit: 27f239a4c5e79a8e2f721b0ded24e1f34437d7f1
[5/8] clk: qcom: lpasscc-sdm845: explicitly include clk-provider.h
      commit: 3333607bdd4f1a64a13741a252f2eee1bb0a442c
[6/8] clk: qcom: mmcc-apq8084: explicitly include clk-provider.h
      commit: 5bcc2521ec7053b0a99e20bbf8f18d6001a78e6c
[7/8] clk: qcom: q6sstop-qcs404: explicitly include clk-provider.h
      commit: 737a2267581ac145db337081ae6fbf9f62feb47b
[8/8] clk: qcom: turingcc-qcs404: explicitly include clk-provider.h
      commit: 96ea2a4291343613a7c2da03c03f23dc259171ff

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
