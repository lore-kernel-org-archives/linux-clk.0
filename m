Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBADCCA473
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 15:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbiGFP0j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiGFP0j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 11:26:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C181123178
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 08:26:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y18so8033484ljj.6
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xkg95pf2VgwRCEJJEItSiXpYFy7ka5sRDOHSa/kP1po=;
        b=mgrR+AEEAcw5j44BbEiLZ5yHDnNtDmv5N6qWIh4n5Mbxgr+3tcKJ3VoEsK00oycHEw
         DnzgC5MSJQsdW/kJ06vYz3JSSkfjmi7NLedB8PG7MXoe6fZRiequJYnaOZRI8C/Sywz0
         zttq9pBZqa393fcFB1SXhCqB8QXOXd4RaalZ9pj/jRow6w8gPmkA2//SMlmaQWZWYEAZ
         x2TWZPJzGm24uxKTvmWCR/TiWPcKG+R1DhQybNvCvZ5U13IxqAoMQDtH2PUQb2rI2PnL
         Jt3HcEIeBu/ujBsRnQOLuspaaRidDGWm77OmiF/JiwgHUpKDBLfsoveeGtSL8MQVQeyh
         8l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xkg95pf2VgwRCEJJEItSiXpYFy7ka5sRDOHSa/kP1po=;
        b=2UKZd3W+aRHqgQYA0DPQ+072YngAEvvnSv/NPBJAebMaXJ6O/WTL6qDPLW1O+HYmot
         /hVLv0sqDFHt5yxZPAWp506lJvW3PnbIQ+klo3wxOz19otA2THWxEVx/kz1Cd4VxMv/M
         v0y1L91OcNSbzZusW4mX06o2Vx/Rlr130R//yjAfhpnNZLqr6E0B5uvM1ojs0In8gQ8q
         YsGutiyHni6uvmyMTYH9mv5jF3sn42qHhBYwdP8C2vCcxjVnF2nuIBEpgFiBAH5BSBr0
         XNbIhPa+zg3zvmvwy69683798j/dSWUh/oEl/f67UvLfEAMhANbCwFyMSfySeaK8+AGy
         Ik1g==
X-Gm-Message-State: AJIora9UaMXEyjqGJ82ORn3n5M/jdpWusaqXFUUnWypEjRZ1Kya76Ty/
        EE4VcMiMhUgXgN7GbTXgZGqz1Q==
X-Google-Smtp-Source: AGRyM1vEohigYJQajv6ZrgS0HOTAQ6UvdgByviYEQIksiR7xKJKaCrbXgkJuVmHMZ4cb05SlvkF+Bg==
X-Received: by 2002:a05:651c:19ac:b0:25b:db26:55c3 with SMTP id bx44-20020a05651c19ac00b0025bdb2655c3mr24348102ljb.457.1657121196196;
        Wed, 06 Jul 2022 08:26:36 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24250000000b00478fe690207sm6318651lfl.286.2022.07.06.08.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:26:35 -0700 (PDT)
Message-ID: <54e97d07-eee1-a775-5c7a-c3ba270dbfa2@linaro.org>
Date:   Wed, 6 Jul 2022 17:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add schema for MSM8909 GCC
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
 <20220706134132.3623415-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706134132.3623415-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2022 15:41, Stephan Gerhold wrote:
> The Global Clock Controller (GCC) in the MSM8909 SoC provides clocks,
> resets and power domains for the various hardware blocks in the SoC.
> Add a DT schema to describe it, similar to other Qualcomm SoCs.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
