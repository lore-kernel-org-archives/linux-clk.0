Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62C9C1B0D9
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 23:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99CDB23A40
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 23:04:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgLGXEY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 18:04:24 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34940 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLGXEY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Dec 2020 18:04:24 -0500
Received: by mail-oi1-f194.google.com with SMTP id s2so7911409oij.2;
        Mon, 07 Dec 2020 15:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JDyEQxWXMtErR98/q4wOxR4ceF9zN8CopbLuOWAp1Hs=;
        b=q7wgbNadz0NnYLt39YX30BjK4I4Iv1erHZwAVGFo9ermKkJHadPY0PogfqrwX71pWk
         8BlXlZ51zI+aNYdJsVci1+GH1LP+tPzGPFz8f3fXRQgJDKXKiIPw3+/e+8FgInE36a9X
         Eu7IDuIK9FVFxmF/+/H8BQaupKYDJ9Z7/fpD4a2gupQ6LbXmZqzd6RXjNTZ/xpg8aZgx
         cwV939KbSI+URgB5jyRrSO3iKvnJvRR24sSudO8lb1ohApCqRrzPwJ49x7Ha/csnXJ03
         z0+bwgtE5FChWyKwlUr9v3tnwO911jeT6DjMxcCGJ79rm0TSy2r9pz6bFjqkTmZAXYMa
         IN6w==
X-Gm-Message-State: AOAM531ZYd3RnNzYtP9RFyQ/BNsFZTS9V/NjYiqv/n9aFo02widyGsw6
        FM/cx2IdgtwgxbgpKhVNg5uvCaUzTg==
X-Google-Smtp-Source: ABdhPJyhvceWIftXpfjTcIiRH/weA9PgINyFjDiqVws7i4QdzaQMU+plcDBUtWO7TTq/Vw4flTSBMA==
X-Received: by 2002:aca:df83:: with SMTP id w125mr777779oig.165.1607382223593;
        Mon, 07 Dec 2020 15:03:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n63sm3281008oih.39.2020.12.07.15.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 15:03:42 -0800 (PST)
Received: (nullmailer pid 1012896 invoked by uid 1000);
        Mon, 07 Dec 2020 23:03:41 -0000
Date:   Mon, 7 Dec 2020 17:03:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: imx8qxp-lpcg: eliminate yamllint
 warnings
Message-ID: <20201207230341.GA1012843@robh.at.kernel.org>
References: <20201207045527.1607-1-thunder.leizhen@huawei.com>
 <20201207045527.1607-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207045527.1607-2-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 07 Dec 2020 12:55:27 +0800, Zhen Lei wrote:
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
> :32:13:[warning] wrong indentation: expected 14 but found 12 (indentation)
> :35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  .../devicetree/bindings/clock/imx8qxp-lpcg.yaml      | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
