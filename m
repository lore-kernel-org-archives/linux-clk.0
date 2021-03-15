Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040B1C433DB
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 08:35:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC85864E90
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 08:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhCOIeh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 04:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhCOIeI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Mar 2021 04:34:08 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B69C061574;
        Mon, 15 Mar 2021 01:34:08 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id i20-20020a4a8d940000b02901bc71746525so75331ook.2;
        Mon, 15 Mar 2021 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9tcDXydBRYN7X1ouyOutHzUqrT2EcOzUMBbtNRBc1M=;
        b=b6TyPaHRpm6reFbVIf3ISUH1PYNj/1Ho4rQQU9rsNJyH2azbubQ5MefVT8iVIzg8F2
         jawHd8r4bZd+v8eaWtPWEqNC0d/eI3LsZFraQtfG03J45SA8jrTn9dW/hd18Yt5OHNLN
         4V2nZwX2YPWCU7S7fcDesLj4kIDDST2rMcQEmcxa8WeBJudC5KYn2dGlhYv4aiaOH5r/
         Dn90X0CvtVhSrx2vcdmCsO8mU9c+rBo8ds7emxhIFhVA8c3sWSXvCHXgjaZ8CCBtvxNF
         xnODepYi4dtACRb14GxuIHGC7bN1CvGPpEzxzICdfRMjOKmRlmCDGHVxqcs6kZLqLKTZ
         VaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9tcDXydBRYN7X1ouyOutHzUqrT2EcOzUMBbtNRBc1M=;
        b=oDFntNSmx/gk1m5NeTUdU6N7t9c+DyD3ZQjSfhfZDEORQzE1DScRFC8gmb/iqLO2wW
         klEGwx1Eg0mI+Ba5w7X1xVFN9CkxtA/BXLk6CdvtjZn9jMmxd0xPMpuHov82kGW0fFgk
         blyUNGZKWXZW1yrL9cpeMOfeULXQmzS6NtgstAxd/7aiafz9ZGeoxLJeRj3luXmyXovn
         AQK9t9oOd1ZQeRateT95bM3yH8gnFxpAT66ZYSR6AUql3kfWTAtv1LlFb7tpNSo+N/63
         GqsBp5QxMpanVoJ7j3LfI3kUY1e9JIh6VcpV8rGrj97YSO84L3Bn3T0zK7B3ZRSk1ztD
         Zd+A==
X-Gm-Message-State: AOAM532zO02HKLOJAeQc3phh55qnoKao+Mny6fEY/pvzl8HPViyII1ir
        0FwkFxyxRRsWSTbl03xgm12TeHK89Ejw5BT20gE=
X-Google-Smtp-Source: ABdhPJwoHR41pMa8eOKBFI9biSljHlrqSC5ZEhNJSLF4w0f9nl4qFGMZGNh+w9jx9S7pbYnE/uksgflwoiuybDMMb0E=
X-Received: by 2002:a05:6820:3c8:: with SMTP id s8mr12577637ooj.49.1615797247749;
 Mon, 15 Mar 2021 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <CACY_kjQcJmQaDY2gDxG4TcztsYEmCETTWtLwZDfv9Q+JEsoe7g@mail.gmail.com>
In-Reply-To: <CACY_kjQcJmQaDY2gDxG4TcztsYEmCETTWtLwZDfv9Q+JEsoe7g@mail.gmail.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Mon, 15 Mar 2021 14:03:56 +0530
Message-ID: <CAKfKVtETpsqa8Ui0mLdVoBW9HsRXpbkt5Zx=SYMo-arqPhNcXw@mail.gmail.com>
Subject: Re: [PATCH v10 6/9] staging: clocking-wizard: Add support for
 fractional support
To:     Zhengxun Li <zhengxunli.mxic@gmail.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        devel@driverdev.osuosl.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git@xilinx.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Julien Su <juliensu@mxic.com.tw>, slwu@mxic.com.tw,
        zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Zhengxun,

On Mon, Mar 15, 2021 at 12:55 PM Zhengxun Li <zhengxunli.mxic@gmail.com> wrote:
>
> Hi Shubhrajyoti,
>
> +static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
> +       unsigned long parent_rate)
> +{
> + int err;
> + u32 value, pre;
> + unsigned long rate_div, f, clockout0_div;
> + struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
> + void __iomem *div_addr = divider->base + divider->offset;
> +
> + rate_div = ((parent_rate * 1000) / rate);
>
> In some cases, the variable seems to overflow.

Will fix in the next version.
>
> Thanks,
> Zhengxun
