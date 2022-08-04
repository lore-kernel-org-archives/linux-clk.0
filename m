Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B78C19F2A
	for <linux-clk@archiver.kernel.org>; Thu,  4 Aug 2022 16:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiHDQ4Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Aug 2022 12:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbiHDQ4P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Aug 2022 12:56:15 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E1D140F1
        for <linux-clk@vger.kernel.org>; Thu,  4 Aug 2022 09:56:13 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id a89so419341edf.5
        for <linux-clk@vger.kernel.org>; Thu, 04 Aug 2022 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9RAxd8vXCg6ebH7MqJTjtNEjn+NCrIjJbPyy/864Rdw=;
        b=SgnT3/z7wOSRxmSgBsg2dLV8AI+Yk7NQTu0NY5LahlFhImWUqUw5E7Z7WnrfRXd/XG
         j9QLj2tmr3MqrmL3EboqUn2ci+T4jLGjO3rmcP7CJ+ZmIg+gYe38yJHxcI2K9hZ42XuW
         QHerwQ3wkF0tG2HuvqyFd7YawhKRJIMyLkJFjKZEqdwDTG7Br2VV6ZEhWT9ueGQjOgpp
         O9PEcaDo3atSqwuw+u7N5ztcTrzocGJP+tL/MvNcsovqbZ6cWA0Zw6ZjqaohYCxnexvd
         sKh2Sv8bi8FEv0LujC74uY8lfptluR76fuy+hYbM9+igE89s8b6fVN4Y2z86G0/uFmca
         dd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9RAxd8vXCg6ebH7MqJTjtNEjn+NCrIjJbPyy/864Rdw=;
        b=cfKvJ2JqR33m4aW/V1OEqfACkVS6/SrGeFeLE1zpODPn8Tzwk7bVbk1UqoQ6eOyjD4
         RAm1Dt9mJCUDmWCN+WLsbMAqRqAx12OkBd0Fwn1sdYbw1lHm3O6nD1dLMOiqkHyInnqw
         X7arBz5/5zUYSmig8666J8T6uhfqpYDPaat82vvWRq1iOQKCP4xuN5KaYaPKSo0FBmEh
         Hg0wXmJoWCgoFnTnHorAUqQPCc3f0DYXmYA+ycuZ7pxJ5WXazcBpbHYT4091FzOaaOzH
         X5dHRA/QQlO1UJGCOAuezcolA0symuvxTnDsg7vlDAdHsYQ1VgAYWFuIpuzNF8YDuUhE
         BpTw==
X-Gm-Message-State: ACgBeo1toA/JIKIW8iUf/IJjaoz4ZFfregH/9eXBrbvJg1GZkHYgfRNe
        WedQuqkRUyx52zwlsfOsXfRN5ZeL9b28oQ==
X-Google-Smtp-Source: AA6agR4vqzFgi3ZOFoI9pHyekMbM4zYfttqGHcixJ/EQsRgF4Gxfs6K/naNbKjK6+z7G/bzY5AzqjA==
X-Received: by 2002:a05:6402:888:b0:43c:fce0:2f0e with SMTP id e8-20020a056402088800b0043cfce02f0emr2907897edy.247.1659632172064;
        Thu, 04 Aug 2022 09:56:12 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bq7-20020a170906d0c700b0072f1d8e7301sm532588ejb.66.2022.08.04.09.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 09:56:11 -0700 (PDT)
Date:   Thu, 4 Aug 2022 19:56:09 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] clk: qcom: common: Detach the power domain at the end of
 probe
Message-ID: <20220804165609.hbrcylpayu4ypsbt@linaro.org>
References: <20220804103456.3176943-1-abel.vesa@linaro.org>
 <CAA8EJpoYrXNBeZfDTAmjhsHaMqO+jeUVt4BtQkKy=T7Q0EuH8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoYrXNBeZfDTAmjhsHaMqO+jeUVt4BtQkKy=T7Q0EuH8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-04 17:37:48, Dmitry Baryshkov wrote:
> On Thu, 4 Aug 2022 at 13:35, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > None of the CCs actually need the PD attached to their device,
> > but rather some GDSCs registered by those CCs need that PD as a parent
> > in order to propagate power gating and the performance state.
> >
> > So lets detach the PD from the CC right at the end of probe, after
> > everything has been successfully set up.
>
> Would it still be possible to read the clock registers if we detach
> the device from the domain?
> I think it was the original issue behind putting the dispcc/videocc
> into the MMCX domain: to be able to poke into the clock registers,
> which are gated by the MMCX.

+Rajendra

OK, so I might be wrong here, so I'll need to double check. But, AFAICT,
today, most of the CCs devicetree nodes do not have a power-domain property.
So I assuming the PD is never really needed for register access by the CC
itself, but its only use is to be set as parent to those GDSCs that do
not have specified a different parent.

Again, I need to double check.

>
>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>
>
> --
> With best wishes
> Dmitry
