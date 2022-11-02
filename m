Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FE0C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 13:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbiKBNro (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 09:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiKBNrm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 09:47:42 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329692AC5B;
        Wed,  2 Nov 2022 06:47:41 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 16-20020a9d0490000000b0066938311495so10304462otm.4;
        Wed, 02 Nov 2022 06:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGpEyXXVyXPOrEOOBkcZ03FYWwkR3GVThqUz07ODObE=;
        b=h0vrRZkzpO8YT1zBp7ll09rY6O9aOevMJuOSD79eH6XXNrcmf0hGbT6jS+rUIvcc+l
         fmH4kjNbBRMR+BrUtQAXRisYVrDw6WLoi3TbG46kbuUHLS42UcxCTGbKGuOT4tw3yRpl
         jk+GqFSU5eu3aXsjL0PhV42pQ7TMZ+F3wfD3Os4r7Av8Sw8ihJia2pV/4ockE19czNis
         r+H3JIE3cxi5w/0pkK3C6jeHxYviEfnUB9IW1wWtQwdmJhQUawltb9KgwwPlRDJq8CvY
         CV0GoG3/j2BaT/ZGy9g/1vXmXFFGodONJznDKwyJnbbUhcmf5lC8dFEPL15MigKgBz4E
         ht2Q==
X-Gm-Message-State: ACrzQf3gHH+hgK9Na3gTozT2UT6nmVd0YYF7VLVoaBo7Fi4hPuu/7BGh
        qHtBTVsD5JgzxuSdDRfDyA==
X-Google-Smtp-Source: AMsMyM4rBlGbDO/gPIe3u2OjlrxQwDeQSgPaUoceBazCsEcgAWHwbXQEyWwUEo1cwLqhTTTrBvY15Q==
X-Received: by 2002:a9d:7449:0:b0:66c:41be:56d7 with SMTP id p9-20020a9d7449000000b0066c41be56d7mr10536267otk.381.1667396860427;
        Wed, 02 Nov 2022 06:47:40 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c10-20020a9d480a000000b0066c75a2643asm682333otf.66.2022.11.02.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:47:39 -0700 (PDT)
Received: (nullmailer pid 3704516 invoked by uid 1000);
        Wed, 02 Nov 2022 13:47:41 -0000
Date:   Wed, 2 Nov 2022 08:47:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        sboyd@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@somainline.org, tdas@codeaurora.org,
        agross@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 2/3] dt-bindings: clocks: qcom,gcc-ipq8074: allow XO and
 sleep clocks
Message-ID: <166739686110.3704462.17117268037747402541.robh@kernel.org>
References: <20221030175703.1103224-1-robimarko@gmail.com>
 <20221030175703.1103224-2-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030175703.1103224-2-robimarko@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun, 30 Oct 2022 18:57:02 +0100, Robert Marko wrote:
> Allow passing XO and sleep clocks to the IPQ8074 to avoid having to do
> a global matching by name.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
