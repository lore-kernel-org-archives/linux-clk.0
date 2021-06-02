Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE0AC47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 19:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86C6D613EE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 19:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhFBTMI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 15:12:08 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:45628 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhFBTMB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Jun 2021 15:12:01 -0400
Received: by mail-ot1-f53.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so3388160otc.12;
        Wed, 02 Jun 2021 12:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZEERWraqaTvOVc7wyj1T8RShA6NakK3wsqC/mYbNn14=;
        b=pMH54XNtFio6i1VSM6jYqigV5xJ0W5wq1CO/U5kj+a7YhwGEpd9EpSW10P3Otx4ovj
         cxVg8DrxEmEcwh9ZdRey4KX1wd7xrFMQQED1lmEnvmdWutME+mAHEw4VOQsvXlgxh/9h
         JV32Grqc+IRLhip7SzK+yETTODyt+R6KjVG7XYT7jRJVzXxQyKnxFoj1URGWportinPs
         33fyKdYPEv7PN32Vl1c0klobUjSqcxVC6pGYGm90mWxjnbBxGyZFZOgTKUv9nAiysZV7
         YvmmtjTf4OYHmhLZ9jXHYC3sCX7Jrg0jrJGejQQY1s5eI59KOkcnlUNv8Lyautm3Mlih
         InaA==
X-Gm-Message-State: AOAM533SIRaatFUG0vDmSMhBV+svzbcj+QcyLHvZNKbmFqMAB89z1vMU
        /ix72xngzot/rA3FbDyB6g==
X-Google-Smtp-Source: ABdhPJzwJEilCndd97PDM8ZXwEX1XcVZNVoMeSoGE1P7XZXISMz1XOH7Ip/al4ikZFZNcb0rLCJiiA==
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr11877842otr.316.1622661017937;
        Wed, 02 Jun 2021 12:10:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v6sm145698oou.14.2021.06.02.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:10:17 -0700 (PDT)
Received: (nullmailer pid 3800149 invoked by uid 1000);
        Wed, 02 Jun 2021 19:10:16 -0000
Date:   Wed, 2 Jun 2021 14:10:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] clk: qcom: Add SM6125 (TRINKET) GCC driver
Message-ID: <20210602191016.GA3798477@robh.at.kernel.org>
References: <20210526184325.675736-1-martin.botka@somainline.org>
 <20210526184325.675736-2-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526184325.675736-2-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 26, 2021 at 08:43:21PM +0200, Martin Botka wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add the clocks supported in global clock controller, which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> None
> Changes in V3:
> use parent_hws instead of one-clock parent_data
> abandon global parent name lookup
> remove a stray "//"
>  drivers/clk/qcom/Kconfig                    |    7 +
>  drivers/clk/qcom/Makefile                   |    1 +
>  drivers/clk/qcom/gcc-sm6125.c               | 4190 +++++++++++++++++++

>  include/dt-bindings/clock/qcom,gcc-sm6125.h |  240 ++

This goes in the binding patch.

>  4 files changed, 4438 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm6125.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6125.h
