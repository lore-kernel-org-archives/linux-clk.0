Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0C4C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 21:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbiKUVak (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiKUVah (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 16:30:37 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031C2DB84B
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 13:30:35 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r205-20020a1c44d6000000b003d0283bf132so7943wma.4
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 13:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiQJdCH+8sYhTRQ1EnF60bNt6EZIXVO1VSAMNseQ+hQ=;
        b=FvmiA7LCcIaDkdXjsqbwDDWqxXF5Hd76EBvzDkReispOVeUQ9cgbcNZvA/q/+eAkaG
         HrlG7cDn4Q9pPIdfbHc++C0fybp3nziqOTSuXKtlukl4sVQ/wDzu72WfXhzxDCsCyyMu
         rlYsEn+FeClH7J2hFyIKLBTHOIUA8PdU1GFgNGW7Uy44UrHa5QYnGG2xohCB/hN9rYcw
         AynHvNispHJPU+9OEYSIGT2qPgqtd1+i0jM95o4fV1zGbzHeCJrJf838PpZ06aq/NCJ7
         uZvHRGObsVhwlin+qt/mhLzlRM93V+XdzX9T7BMs6DomkR5Wfe2gwd61gVMJZbppijR8
         9Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiQJdCH+8sYhTRQ1EnF60bNt6EZIXVO1VSAMNseQ+hQ=;
        b=TlHioYSqRUYRfek0TxCuEC5lHOEwbtc5yi6G1X1fj2ReIyKDhKbx9LKSH4AO7b6453
         qk0EnVlE5LfZD6wF+6zcxg49FnuSGIqumjJcYNtdj7YNXK2PqGNejNA4WTPHghDeU5ra
         h5gE2PMfnpvJTcaaYw8wJiUJhHTQ/N+UQUdxFeJgGk12j1HMgN553euq8RQbbH7dQaPU
         YhXeE6XDNqfLMYe1sSuQUKb3CumxIF6TnsBmdKviiC3Ag07qW3pqT4DsWsYL1wH7HUaA
         iZHr4Da+eV2cPiMRLLARZB45e/o3BjLIZ9jysWphzSWj59LgWF8xRQ29h3MuXSIbyPRO
         OL8w==
X-Gm-Message-State: ANoB5pmQAL4bRzBhP4oNtU4oaisgk9V6c6qm3oBuxyX1Oto46FxfIyaO
        bafok7CKEP2rBCmTOlWrm6xsoQ==
X-Google-Smtp-Source: AA0mqf6YbQjgJZFJYx4H9UDd2t6AizUuCaMNUc1hrdIXCyVdCjz3mfJODPsXDAwrbHwthDWoUVWnhQ==
X-Received: by 2002:a7b:cb98:0:b0:3cf:9a12:e645 with SMTP id m24-20020a7bcb98000000b003cf9a12e645mr7163985wmi.59.1669066233542;
        Mon, 21 Nov 2022 13:30:33 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003cf774c31a0sm17947459wmh.16.2022.11.21.13.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 13:30:33 -0800 (PST)
Date:   Mon, 21 Nov 2022 23:30:31 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bough Chen <haibo.chen@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jesse Taube <mr.bossman075@gmail.com>
Subject: Re: [PATCH 1/4] clk: imx: imxrt1050: fix IMXRT1050_CLK_LCDIF_APB
 offsets
Message-ID: <Y3vt94iDv6MHOPDB@linaro.org>
References: <Y3vRjItCVhvCRLv4@linaro.org>
 <7C149D5F-FE43-466E-A02F-2AAF5B31B844@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7C149D5F-FE43-466E-A02F-2AAF5B31B844@benettiengineering.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-21 21:30:06, Giulio Benetti wrote:
>  ....

Please, no HTML formatting. Plain text email only.

So I guess I'll just apply this version then.

Thanks,
Abel
