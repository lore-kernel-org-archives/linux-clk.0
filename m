Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826DBC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 00:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbiBRASu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 19:18:50 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiBRASq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 19:18:46 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88303EA86
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 16:18:30 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id r27so1384227oiw.4
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 16:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=A0w/SqOdMz9JqzxXphVHbdn/ofl6hS1bJpMLgWc1xKY=;
        b=RBDdLXcavqALvL2aPUvJnlvKaIQ1sNCTlGXUjSixkUx6zPkIULCzeE7lGRnnYdGkyY
         pQEFeiJzwfJIfdf1nIN6cHzlhLbuJK9eRgGN/PXncVdznskcbaZrjp7SfS+PEs1yZCg7
         4FALdj7QCzEXJm9vAG6IikJTTdxED3fi4wiI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=A0w/SqOdMz9JqzxXphVHbdn/ofl6hS1bJpMLgWc1xKY=;
        b=tDuFBDNjZuXLbH63cFoqDXTipkro4bhKfnwjSjkIu6CGbDp7eZ5tVHNKO/Dk0FvJyD
         OelrR5XE8SYGbE9f4Z5mloEMPYy/mH3pR5U3PTp3CKN/cu14l/MLXsY/HcrbzSh2ZdS0
         hMtackrM0UJW0gn/R1FY5zhyqmJGG3ZOQ2mGek2Ma/DczV7tj7XfjSmoNpX0vJiayvBk
         CPOQHC8vN9X2ifQ4jnrDRbWQFo1MnswkYVHgx7IRUECSjkQ0TGPOwTapw28NSncL14RX
         bL78elAJwJ+qwjTClJe7xVY9O4RYtDJIaEfUPlwOCapfs4CDAaNhM2maH/aOSHUi3qPU
         8BSg==
X-Gm-Message-State: AOAM530dUPeJwhPrMR8fvTka1SMGL4cIVeFwFMu3bzlSRzg6Q0hfMfPT
        0M8nZRIjF1bQPPcQWTD3vUa+3IWj89LqJH6Z9pY3CQ==
X-Google-Smtp-Source: ABdhPJwqNt21JkBwrP+UAPtFRk28p6wGEEJdk3rvAFbwcRwFIjPQ29AefqdWopg67l9g+04pxITxo3m5CSJlse7/eLE=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr2216175oij.112.1645143510019; Thu, 17
 Feb 2022 16:18:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 16:18:29 -0800
MIME-Version: 1.0
In-Reply-To: <20220215201539.3970459-3-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org> <20220215201539.3970459-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Feb 2022 16:18:29 -0800
Message-ID: <CAE-0n52DNP_vgG5E2L1hnh_sPxWsDgZVVL-_XoEfbH3yOUqoGQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 12:15:36)
> The driver can parse bi-tcxo clock from the clocks passed in the device
> tree. Specify it in schema.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
