Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E07C25B08
	for <linux-clk@archiver.kernel.org>; Tue,  9 Aug 2022 21:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiHIVGJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Aug 2022 17:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiHIVFz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Aug 2022 17:05:55 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8514599C
        for <linux-clk@vger.kernel.org>; Tue,  9 Aug 2022 14:05:49 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10edfa2d57dso15550495fac.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Aug 2022 14:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=46DbGyQMRqNHGkxsacJCotXRTrnXUBQPUgKwQCTQR8k=;
        b=hKJ9CRNm64FZ36uHItRlkf0idiXTuCMHIGEr6dAZWogMfifrszy0oFCa8H7K6Cah9D
         55TjcK/iPn+BvOBQtb3mTI/51rUKzCQKkeAftF7q4oAP41j2EtShrtivvHKSpR5bfZer
         kKomkfpi78zEBQWdUTGBQsWZoO1hLcqLrubVg3hbnYziSqG7Np8t99DOzJt15uvfu4DH
         lIl3P/v4VaAuXaU2DVxn1GSS9n3BdSp8H0AaoYSW06MbcdfjeAjzYF6jJv0KLF0567nM
         IvcbioXxyho8pz1HTFTb4zgU+MfEOO3JI1a95UB3T4VXsLIsG9LxbQS1K6baKYW1BMBZ
         sV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=46DbGyQMRqNHGkxsacJCotXRTrnXUBQPUgKwQCTQR8k=;
        b=asZ+jgU+htG6KA55R8vUc1L9kuiP6lVMrIKmZhgAstUDyhHcMDGmWUGo1P3nGcxaXr
         tvWrE/pBlQFBaF/PwoEDHXv1wPc2s3LqWlhQoAnM2G0o5IivAATBXB7vp5JflWovstjd
         10/okL6rkNo/7391ihSJ76BrmEakwnh+L2fwSQpMwNdNNcqu86B6FUTjYlRwI8ZyYd86
         H5oIIO9jch5EBfbszNbiAPDTugYDptDskp6qbZT4SycNQFNwr1AtCIXXrS+5RTi3gwe9
         o/DRqLoJw3l0bfoeaWtn/Ufd//Hn3FsrajAXZwcrxx1fEW2tEsIwLW20QbyRVwtynkPH
         f7YQ==
X-Gm-Message-State: ACgBeo3Y56Z7vc37YoLqKtoCjGV3YlrVAJE/bpR6BUOEVy8VaqyxuY7F
        fiF7Spf6DfuxvEfkdY68Jon2fA==
X-Google-Smtp-Source: AA6agR7/jfhQKdcyS9t/lnwAnJxheoLryGMKECjJwkUJ1IJiQ9e3xVupz1MV7wbT5OutnB3H7N+IWA==
X-Received: by 2002:a05:6870:5818:b0:116:a478:7f6a with SMTP id r24-20020a056870581800b00116a4787f6amr170549oap.204.1660079148210;
        Tue, 09 Aug 2022 14:05:48 -0700 (PDT)
Received: from baldur ([2600:380:785a:7aa8:200:ff:fe00:0])
        by smtp.gmail.com with ESMTPSA id s70-20020acaa949000000b0032e3cca8561sm214842oie.21.2022.08.09.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:05:47 -0700 (PDT)
Date:   Tue, 9 Aug 2022 16:05:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using
 'reset' inteface
Message-ID: <YvLMJ2yQRhBFp2y9@baldur>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 30 Jul 04:17 CDT 2022, Akhil P Oommen wrote:

> 
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal. To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.
> 
> This series is rebased on top of linus's master branch.
> 
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
> 

Forgive me if I'm assuming too much, but isn't this an extension of:

85a3d920d30a ("clk: qcom: Add a dummy enable function for GX gdsc")

With the additional requirement that disable should really ensure that
the GDSC is turned off?

Regards,
Bjorn

> 
> Akhil P Oommen (5):
>   dt-bindings: clk: qcom: Support gpu cx gdsc reset
>   clk: qcom: Allow custom reset ops
>   clk: qcom: gpucc-sc7280: Add cx collapse reset support
>   clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>   arm64: dts: qcom: sc7280: Add Reset support for gpu
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>  drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>  drivers/clk/qcom/gdsc.h                       |  7 +++++++
>  drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>  drivers/clk/qcom/reset.c                      |  6 ++++++
>  drivers/clk/qcom/reset.h                      |  2 ++
>  include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>  7 files changed, 46 insertions(+), 4 deletions(-)
> 
> -- 
> 2.7.4
> 
