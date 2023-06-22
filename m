Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F13EEB64D8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jun 2023 14:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjFVOy3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jun 2023 10:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjFVOy2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jun 2023 10:54:28 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E721319A1;
        Thu, 22 Jun 2023 07:54:25 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-77e2ed26037so214861139f.0;
        Thu, 22 Jun 2023 07:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445665; x=1690037665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubD2PYBeh8ffF/UBDCXX/95bU5nJS9x9g5EvZCRcauI=;
        b=I3ZCHul0o7fm5jKiRYEyG3tofgoctWkZo0gVWi6qZ/RZ9bUvuVn7gxqANQZqPl8FPe
         dOjCpm2RqwUF9vJ19OrXYGmFfNCEke2TrzW3kLxuJ//nyYFgCcmw6lyUJKPuRhvHjivu
         HN97+tOMRRLZ7Kwxd0QdHI05p2lBM+VMuT8cpCQ8lNIPs8E0+ZItNpjNKsttZBG+4phL
         GiA13s/SfwUhDemIVkrvC3KRX0x5JwsaEYdpv+cixYUm3+eE16Hekmi+Xp6zwU52vzjy
         JOf0cEyT7x+D9KUhFI1h3zdN2zBlmhZa7hJaLdZQ9J2YexWmJaoLnfwgNBwKZDh235DI
         JNVg==
X-Gm-Message-State: AC+VfDydDV6FXDhLRisFbamokKhZiz8VBY/zambY3twLb5w+eD0Qzdwk
        zVZzSgr42SBLj/JGoaJ5vg==
X-Google-Smtp-Source: ACHHUZ4xM8qYK+FTWkEBsnwnqleZPi90wXUqnuZc1HyM70ODQwp5BkQwv6xzqviWU4jJydkT/1QMEw==
X-Received: by 2002:a92:d406:0:b0:335:a70:5e4d with SMTP id q6-20020a92d406000000b003350a705e4dmr13720772ilm.16.1687445665035;
        Thu, 22 Jun 2023 07:54:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w5-20020a92d605000000b00341fa29aaf4sm2034982ilm.39.2023.06.22.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:54:24 -0700 (PDT)
Received: (nullmailer pid 1689134 invoked by uid 1000);
        Thu, 22 Jun 2023 14:54:22 -0000
Date:   Thu, 22 Jun 2023 08:54:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: clock: qcom,mmcc: Add GPLL0_DIV for
 MSM8998
Message-ID: <168744566173.1689075.15807872833231274999.robh@kernel.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
 <20230622-topic-8998clk-v1-2-5b7a0d6e98b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622-topic-8998clk-v1-2-5b7a0d6e98b1@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu, 22 Jun 2023 13:57:42 +0200, Konrad Dybcio wrote:
> We've not been consuming that clock for no apparent reason. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

