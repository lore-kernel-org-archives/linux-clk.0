Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D53AC07E99
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 03:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 342C6613C3
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 03:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhGJD3T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 23:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhGJD3S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 23:29:18 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC0FC0613E5
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 20:26:34 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so11573429otl.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 20:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tSuIfx7otNSTWWg0Lv7QolwwIL/JONva33F7uh+h36k=;
        b=NHnMaBnOqVwTBr0XOrkL1oxHKcJPG6fp/YlCUIcxkLOavX628pGMgRe/V2J6v/3zG0
         W1t0NoTYJ4w2WgM7TRYOScJjmKNeTywURZWgrY+Cvc1hGHbnkNstkH2QA85u//D0k4Uq
         4hm+IIFrd3pB46UPn7wdpX1lM7Q76GRDiiQWa5GCVKJD+Glp/ZykFqMAPxLz2PkuM8mw
         5ydrzIUJm+xOKT6Fd31Z+B8++aQZZSbdzhZxXUR4HfZZ1m4cVYQN/dnB+Dn4asN3EMwI
         cU4AF7o3vVFPak/H43kN5jUSeQYtAFjlp7Iml2ZQfRD3pnXbfwoqm0ttHomX+4K3U+pt
         h49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tSuIfx7otNSTWWg0Lv7QolwwIL/JONva33F7uh+h36k=;
        b=kPOhClywb7s52F0lJd5NkhKHl8ooB0ev7KJkB0uZGO6N6Gf4Zbc4NdDy4b3oldzCdY
         +uiJd/5It6Ch73yVDnYsqZDIRdojhZ4wSgrEkqXKzyN92sPhLUz42agQl8E23E5+YfCC
         5DPRM2jvqBwD/++wRDenc04GkXg4iCyxT1gko/6ypKpLZgl1nDEaMHjmjKFo1gqqJ+hS
         xPHZZ/lc/zABNUOth+DFJ2ho6Ir3G9ynApO9vhUmpVAta5OCU1/c3aJNqFCrxcyhoKVt
         Mp+bcQYRFJOzZG0QNhrglGpepfKexKABe9HswWcTGVY5pXsHFSZ7PQ0XBhAoNLMN/ko9
         iF4g==
X-Gm-Message-State: AOAM531rJPVAOvUmAp0eO+BCT80g8HPwDZ+5MgNHGtzMYv3a49fgGO/e
        DTkrbv4qq3wMMLX79msdfeyFWA==
X-Google-Smtp-Source: ABdhPJxDbg03U0pOa6i4nzGyfe2Eer0vQVnplEDv1pEeJX60GmgdF19cAkP2w6HrNoUjt5S/GpDuJw==
X-Received: by 2002:a05:6830:1684:: with SMTP id k4mr31752681otr.359.1625887593427;
        Fri, 09 Jul 2021 20:26:33 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j22sm1570305otl.46.2021.07.09.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:26:33 -0700 (PDT)
Date:   Fri, 9 Jul 2021 22:26:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 3/5] dt-bindings: clock: Introduce RPMHCC bindings for
 SDX65
Message-ID: <YOkTZ0IVoErtjGLP@yoga>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-4-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200339.17638-4-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:

> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 RPMHCC.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 9ea0b3f5a4f2..0c901e748b2d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -22,6 +22,7 @@ properties:
>        - qcom,sc8180x-rpmh-clk
>        - qcom,sdm845-rpmh-clk
>        - qcom,sdx55-rpmh-clk
> +      - qcom,sdx65-rpmh-clk
>        - qcom,sm8150-rpmh-clk
>        - qcom,sm8250-rpmh-clk
>        - qcom,sm8350-rpmh-clk
> -- 
> 2.32.0
> 
