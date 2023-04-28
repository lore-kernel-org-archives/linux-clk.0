Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9D0C77B60
	for <linux-clk@archiver.kernel.org>; Fri, 28 Apr 2023 13:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346295AbjD1NiU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Apr 2023 09:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjD1NiT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Apr 2023 09:38:19 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AE01BFA
        for <linux-clk@vger.kernel.org>; Fri, 28 Apr 2023 06:38:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso76685215e9.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Apr 2023 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682689096; x=1685281096;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awr90pDSVtfyy1jd/suGdmmMMbIzI+zduHlGNGrtMxw=;
        b=DK9RVn9I2jrEnbfhIqefEft0dxw3pPj9Tmez44q30xQGunOW5BKzt656k4Zwb+QvqA
         QnPRKI+QpF0wKVjuXSxUhEgINyUMvfPnUMN6FY5QUPinUXTCsPzC3kzdZB9DrJPFy0D9
         mCPI38C+pi/6SPUnoAFb4JCg5VpSvUCWA1EK0HokthXoE+ICqz8wrJeV8bstKe8t4XB2
         8q5vBGsWeSvBy1b+siABTEAfFcgEa5FSXObhJ4x/N5f0m4gpHXTeIIeJ51jN2rbiVZZq
         ZWOT14kZVWyjNohmQAizYT7bfd6UgnAd9rHrl8ACuHaaFxj2Fjzo/s3tooHm8irkuGLp
         GJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682689096; x=1685281096;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awr90pDSVtfyy1jd/suGdmmMMbIzI+zduHlGNGrtMxw=;
        b=ktsZ2WxNlVZ8eKmjLLfLrxZy76SXCm9XJtCSmq1DQCQ5XoQA1Ec1HhxcoV6y3+mXox
         hHtwfNt4+YDKv8dTlqpyh9cmSdksShPBtcfV+l6dWPQ+BsgEjtvwQ3/BR5pebSJ9Uraq
         pB+Nf0jHxntKudSXXnJKL2H7fYjLxcp0OWuOfYDSggOhqO+0COooq9zMuztPDVY6eq52
         JWscMKTuvS2NT5zA7kumT0FT46x/RsGvH/s4yNgEKBG3jKadUX57TVenpoBMjbIo4/Z1
         ck/3iG5zgx/bcjSUa7ImEaiVMMA3pwWHsiKkRnSp1IPdrZSX00D0Dx0TzN/+N049aaBv
         c3Uw==
X-Gm-Message-State: AC+VfDx718/Vbq2CbxcZLjbFysJENOrg9Txls6z3z6lxsy8ioY3uzHgS
        VPs7wrkSBtQdXIybqGk8/yt2om0BrfOhouwQH3Y=
X-Google-Smtp-Source: ACHHUZ7Li1J3Go9LqCYnt2dUoy8OLEwkppMDtn0ZUPfIxAq4HnbEkWk05MJi7txIpvF9W8iCOao85w==
X-Received: by 2002:a1c:ed0e:0:b0:3f1:7372:66d1 with SMTP id l14-20020a1ced0e000000b003f1737266d1mr4315648wmh.0.1682689096103;
        Fri, 28 Apr 2023 06:38:16 -0700 (PDT)
Received: from [172.23.2.142] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003f1738e64c0sm28006319wmq.20.2023.04.28.06.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 06:38:15 -0700 (PDT)
Message-ID: <af7e5037-50b2-5ee3-83cc-42311483bc85@linaro.org>
Date:   Fri, 28 Apr 2023 15:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v9 7/8] arm64: dts: qcom: ipq9574: Add USB related nodes
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1682092324.git.quic_varada@quicinc.com>
 <dc573596d863767748d0bc9541bd4e6c0abef441.1682092324.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dc573596d863767748d0bc9541bd4e6c0abef441.1682092324.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/04/2023 17:54, Varadarajan Narayanan wrote:
> Add USB phy and controller related nodes
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> 
> ---
>  Changes in v8:
> 	- Change clocks order to match the bindings
>  Changes in v7:
> 	- Change com_aux -> cfg_ahb
>  Changes in v6:
> 	- Introduce fixed regulators for the phy
> 	- Resolved all 'make dtbs_check' messages
> 
>  Changes in v5:
> 	- Fix additional comments
> 	- Edit nodes to match with qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> 	- 'make dtbs_check' giving the following messages since
> 	  ipq9574 doesn't have power domains. Hope this is ok
> 
> 		/local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: phy@7d000: 'power-domains' is a required property
>         	From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> 		/local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: usb@8a00000: 'power-domains' is a required property
>         	From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> 
>  Changes in v4:
> 	- Use newer bindings without subnodes
> 	- Fix coding style issues
> 
>  Changes in v3:
> 	- Insert the nodes at proper location
> 
>  Changes in v2:
> 	- Fixed issues flagged by Krzysztof
> 	- Fix issues reported by make dtbs_check
> 	- Remove NOC related clocks (to be added with proper
> 	  interconnect support)
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 120 ++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 6a8680a..a6790fb 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -150,6 +150,33 @@
>  		method = "smc";
>  	};
>  
> +	reg_usb_3p3: s3300 {

Nothing improved here.

Node names should be generic, so at least regulator prefix or suffix.
Prefix is preferred as it keeps them grouped.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

