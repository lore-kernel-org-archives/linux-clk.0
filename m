Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74408C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 15:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiKUP6e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiKUP6c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 10:58:32 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D22B8FA3
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:58:30 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id z4so5930381wrr.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=boaL5U5lHjDH+ZC332huvtClKnKW6p97RRdnw48BP4Q=;
        b=YFMj3EFl4YLM9B1jLsh4rtQRLCxY723arRHQ+vczimYMzxZIy10TxqV9Q9LVCTDry8
         jJj5G1poLBa/OFvvTO1IYolMO+5kHAGX0DKEfh6uiGqrnQS2Qlalx78uWuvCRjJF+G/H
         V5yQrkwlG2sbvajRyrNVNUQmOLUKQ7R4PMjrs9Dn+MiytJnCCeuJwxr3DPYkF4SPGpnd
         2980r946NDUkycp3wbdSOSnV9Sf90G541gmkPYHR8ifkGYiDhmXuz9xAQoKGv4w0kWWl
         WrzDX5GByDf+sLBAU4xAIP00nunrVpKjflbbb2z2DFE8nE1qRuxwnKA33htu7RMo1dNq
         YScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boaL5U5lHjDH+ZC332huvtClKnKW6p97RRdnw48BP4Q=;
        b=fcEvLkLPRc6ZZB1Rz+ugRXrG9KjA8Ok2AzLOO4IbOxBVPYEXZS1ZZQ4X5xk/JIhH4j
         uC53EtjTMNrUTjAFU5C6Lg6pUCDbHTES+zumQUb7/TDAwJKtyUGnXh1tnCXcckGNfXh+
         6PlJ0d/wX/pBQOa4NHWjSjBFt4GZn1o749tD0NA7RN+cDFuWxYlB0WyRGnuwSQhkRXJW
         jDSQhV/GmFRByQdsISsbKPH4eBxcsKQKE1nWqgkA+HkHEU23iXjPrw1xUBUPKYsK876P
         bhxApLDnTO2OB3o9YrQf0KJdQpDzoq3Sd1rGcOSN85Br6c/ZScrcFTD262EHGjFao17c
         lhiA==
X-Gm-Message-State: ANoB5plfGx748MJohzDDqlU9AmnY2+uVY5kw95GF8HATAVkA+p5cJ88/
        YWYEd0JaJjNlzPOb5DwYDqsVpg==
X-Google-Smtp-Source: AA0mqf4+dUpe//QvM1kAIjVKsxybn3o5eGV9dbBAKWQ/+uyuAWO3EgwP5bvG4vDdaIa0hXIKdFB9dA==
X-Received: by 2002:a5d:6b46:0:b0:236:56a6:823e with SMTP id x6-20020a5d6b46000000b0023656a6823emr11465977wrw.495.1669046309483;
        Mon, 21 Nov 2022 07:58:29 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm20025676wms.42.2022.11.21.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:58:28 -0800 (PST)
Date:   Mon, 21 Nov 2022 17:58:27 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/6] clk: imx93: fix and update
Message-ID: <Y3ugI0+hS7OrWaMW@linaro.org>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 17:52:05, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V2:
>  Update commit log for patch 3
>  Add comment for critial clock for patch 5,6

Applied all. Thanks.

> 
> patch 1 is reported by Dan and marked as fix
> 
> During our development, per updated reference mannual and design
> information, correct enet and drop tpm 1/3, lpit 1/2.
> 
> The TPM/LPIT patch 3,4 are not marked as fixes, there is no user,
> so update binding and driver both.
> 
> Patch 5 enable HSIO root always on
> Patch 6 enable sysctr always on for cpuidle
> 
> Jacky Bai (2):
>   clk: imx: keep hsio bus clock always on
>   clk: imx93: keep sys ctr clock always on
> 
> Peng Fan (4):
>   clk: imx93: unmap anatop base in error handling path
>   clk: imx93: correct enet clock
>   dt-bindings: clock: imx93: drop TPM1/3 LPIT1/2 entry
>   clk: imx93: drop tpm1/3, lpit1/2 clk
> 
>  drivers/clk/imx/clk-imx93.c             | 38 ++++++++++++++-----------
>  include/dt-bindings/clock/imx93-clock.h |  4 ---
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 
> -- 
> 2.37.1
> 
