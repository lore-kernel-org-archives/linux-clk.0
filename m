Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFF7C43334
	for <linux-clk@archiver.kernel.org>; Sun,  3 Jul 2022 04:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbiGCEAg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 3 Jul 2022 00:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbiGCD7d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Jul 2022 23:59:33 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E914DDECD
        for <linux-clk@vger.kernel.org>; Sat,  2 Jul 2022 20:57:56 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 72-20020a9d064e000000b00616c2a174bcso5077985otn.8
        for <linux-clk@vger.kernel.org>; Sat, 02 Jul 2022 20:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3zOZ3MqII0KFFAaZDDfenhVGfFMiJvrgl8/5EMBW7ag=;
        b=ymGG0NtxJGLg+zYyz2dizigpt7wbO92E0cPUiz6lAy1jgaZImJDim+nrcSaHWoW1qS
         U3uxyNseVPqt+EYxGHwBHYTeghw5souXkj8UcRC1Mv4vGkTgKxGfvM53Hphh6IWHghnQ
         Bu6Paw7Wyymd0S4dpHdRahb6WGP1wQzEBwLkvjtYSLYhY4YexH39oEXT66DQxByjNqOO
         2dBL/9Ecj+oRW9KlUXdwp+5akfdoNJFTGLi+V40wslYIYaYxgbMsLJfKxs8842uIAzJe
         aWD8/MKJfyYSRW41Raq/SUCwOkGAfjD/BBpNHjP0YmGR4FhLUPzL5IWu1XEhNVcg4BsL
         jSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3zOZ3MqII0KFFAaZDDfenhVGfFMiJvrgl8/5EMBW7ag=;
        b=shrG8cqeQiipDrgIgxu0DuYaqn0Z2EdMFcKmrFRfbKdEsS0M6wEwOr6e9FElcHVluL
         eGFUK7zL5uMNyvQRLWC/PxsooUA1zyJ2tZWhDIH88CF51OCkgNgGBTufJvlBw4qOQRqG
         FKL4Q/rSUU7a7aWGb5t2lF0yDB8/0loT+DtS2VPU/S4kln0bT3HDjqnaX4nyOYHCFFN+
         Jz+1ihZmJCPRo2JXRypuxXwDLxogZZIZinXKItewasi0Wk5yyDFtQuKSVT2JwkcA8TCe
         oSr3lOzENSiB+M8XqRDybYNTsezhX5Vxjy27QJNSDqHn2zj3MD7CxBoQx7tDqUAnQilQ
         HmTA==
X-Gm-Message-State: AJIora9jxjaURbpqKZEbdiiK6+Zs4wFEpzS9rDMc6bTvOeaJXxwW4Ti2
        xGs0nkNiNAhRnDIMzxZbOCcNSjCUSi4i122y
X-Google-Smtp-Source: AGRyM1tJm9MRWLcwix3aIIM9a6BsLKemQcEA+nfhwm8Q8ppVumFlVJVYRq/gMcItgD/u87lt+IHgLA==
X-Received: by 2002:a05:6830:40a8:b0:616:ac1a:8d3f with SMTP id x40-20020a05683040a800b00616ac1a8d3fmr9764179ott.384.1656820676512;
        Sat, 02 Jul 2022 20:57:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     dmitry.baryshkov@linaro.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, absahu@codeaurora.org,
        tdas@codeaurora.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        robh+dt@kernel.org, Robert Marko <robimarko@gmail.com>,
        mturquette@baylibre.com
Subject: Re: (subset) [PATCH v4 11/11] arm64: dts: ipq8074: add USB power domains
Date:   Sat,  2 Jul 2022 22:56:49 -0500
Message-Id: <165682055969.445910.690711389355959951.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220515210048.483898-11-robimarko@gmail.com>
References: <20220515210048.483898-1-robimarko@gmail.com> <20220515210048.483898-11-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 15 May 2022 23:00:48 +0200, Robert Marko wrote:
> Add USB power domains provided by GCC GDSCs.
> Add the required #power-domain-cells to the GCC as well.
> 
> 

Applied, thanks!

[11/11] arm64: dts: ipq8074: add USB power domains
        commit: 8bbda511a3d93be7b24b666dc0820cdbea4fbf37

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
