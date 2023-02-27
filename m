Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B98C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 13:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjB0NdU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjB0NdG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 08:33:06 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD779014
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 05:32:54 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id n6so5305870plf.5
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=URqe1dE6GDBSL5K5ua0uDBAeYqEkfW5tE/SYJGuf82k=;
        b=PkMX2eaV/wlZmoA2f7yuF/Ra7MJy1jAaZT4S/fDagDYogeDasuZ3BFjIyRu0zm7x0c
         2pPlxI0hxZWnsTx0RjwaGA8YRdpxI3MuVbxWGbSj6kCUaozZ7yHsXc49l51G2bPAq0gZ
         3zsmdI2q8QB+wy0gUnJ3d7hpjNBiOrkyS3TmF2cWzBiCPXXIqYDsdI+gTTmPl6ZHGDIt
         +AAB29AlsBwcyh3tNtr2cPMf5AtZYPiG5/Eas9Xn620NoZLqldG1SrgORz6PCluTAmrs
         xHSKrMiv9zmATs4ATLXsSFES61Yn9C2DPtwpjNjUzom1QKizcFD4blU0CmQkg3jnvQcK
         mVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URqe1dE6GDBSL5K5ua0uDBAeYqEkfW5tE/SYJGuf82k=;
        b=17WtI34Jlyc2Fv7IodA/8YYOmL9yvKlCh3MKQ3dLcsIOR4uIiWScyv2yfei7jT2WE3
         7MqopXQE2bu17Xlyx1KVG2L9WvGcADyKeHFzztN44LZV164gndr5I1p1pe67dIR7qH5M
         gjPtFNgIr6nofAPIrlqWr0pnkt8iFKVgTWX7KbALO7AyUT/xq5ioyccZh7nrzgJzcB8r
         IhZvappThxR5AV/x1GdLzNr1/9uO/0jgkAwAbw5kWzbupQLUZyauJId7XlyESY7NUm83
         Pp3uaJDIIIi5/cMfGnm1GTqalWdsI8CvunVcEBwisGasy1reqbd/aLoOb6M/UXTB10Tb
         snmQ==
X-Gm-Message-State: AO0yUKXoIA6R33/qCoUESOU5u6R8+NESNK+4wnjpcSRBpkNfsNoz80m4
        yq5tCNp3RW1ukTv9RM0h+a8/
X-Google-Smtp-Source: AK7set/e+a2DpEFO/UgnY5ozJ1GeqDmYcpR84mWWJJPHxN9/B6VO9HajCRnMjQAz6FOHPiW3MI/LdQ==
X-Received: by 2002:a05:6a20:4b1c:b0:cd:36a3:3beb with SMTP id fp28-20020a056a204b1c00b000cd36a33bebmr3479100pzb.30.1677504774385;
        Mon, 27 Feb 2023 05:32:54 -0800 (PST)
Received: from thinkpad ([117.202.191.60])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b005a8f1187112sm4239936pfn.58.2023.02.27.05.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:32:52 -0800 (PST)
Date:   Mon, 27 Feb 2023 19:02:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     helgaas@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, quic_vbadigan@quicinc.com,
        quic_hemantk@quicinc.com, quic_nitegupt@quicinc.com,
        quic_skananth@quicinc.com, quic_ramkri@quicinc.com,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        svarbanov@mm-sol.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, lpieralisi@kernel.org,
        robh@kernel.org, kw@linux.com, bhelgaas@google.com,
        linux-phy@lists.infradead.org, vkoul@kernel.org, kishon@ti.com,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V1] arm64:dts:qcom:sc7280: mark memory of PCIe as cache
 coherent
Message-ID: <20230227133241.GA3647@thinkpad>
References: <1677490575-29092-1-git-send-email-quic_krichai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1677490575-29092-1-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Please fix the subject as:

arm64: dts: qcom: sc7280: Mark PCIe controller as cache coherent

On Mon, Feb 27, 2023 at 03:06:15PM +0530, Krishna chaitanya chundru wrote:
> Mark the PCIe node as dma-coherent as the devices on PCIe bus are
> cache coherent.
> 

But this is a bug fix actually. If the controller is not marked as cache
coherent, then kernel will try to ensure coherency during dma-ops and that may
cause data corruption.

So please add fixes tag and CC stable.

Thanks,
Mani

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index bdcb749..8f4ab6b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2131,6 +2131,8 @@
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pcie1_clkreq_n>;
>  
> +			dma-coherent;
> +
>  			iommus = <&apps_smmu 0x1c80 0x1>;
>  
>  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
