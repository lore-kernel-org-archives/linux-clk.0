Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE4AC77B7C
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 13:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbjEINII (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 09:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbjEINIH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 09:08:07 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2913C14
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 06:08:05 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ba5ebdc4156so849206276.3
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683637684; x=1686229684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=alSD/LYUTqJfX0eULQ7Dos6x9QJDjuDbku/vaMMg2mM=;
        b=eSRY/H9cGw+xOv99Rkt9fVU+GIk/nTmztiI7WoSbsTTf/eDvBNBdRblaLuHP9Dumis
         CnqmkXrk83jWJIezxiE3JuCtLIokdpZnOdKkqTsCDSFr/huG19nMF7ZqCW2UIS3F7Ejy
         Fq9cpUtgkD6BJnLlFt6aCCM0ik1dikFPhdzOnsixORrJsEyUqewgnoyy51Pa1A3UXggW
         9EVrEJHHBIXbp0A5YLcOQcb7Vnnzgmx9U7uPTAPZbCUVLT51BTvRRll2zJ7n/gEBP3go
         MxNccG06M8zNnVZfqVyzOr6J7+TJQASrDX6ZsO3lJT4yhvtcqKaENJq7ozY+w1URHyf2
         RRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683637684; x=1686229684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alSD/LYUTqJfX0eULQ7Dos6x9QJDjuDbku/vaMMg2mM=;
        b=NiNe8xvlt5/dS0D9ARxfpHoXUj1ysBF6q4eFBUblw8jNZZLcedOjlB4UPSBLkPs3Vm
         LWFDMBJVSKpojjD1Kawo0FXMev2BX4tdPiTObSmlI7c1Wm/j7qQaBFXnpCr3q/rvFPkn
         yZjfLlhPuhAtSDlATHDXL3jyBfwoUPVBZMgWWk/FGchcooPMsHb0Z/o8UXfXHbI0sOBi
         QXhVuprqKDk+ifPytqmmPFnHLBGPwy8uigZ14BkUeiqCQj5T2Xq3bRYVEFiEKxFEZKXv
         4F3GESpBhRtno18Yr7Cmj3WD/kUD4w0s2S6Ki+2S1TMpKULSVBIIDNhnGVk2F2VaRvOE
         puwA==
X-Gm-Message-State: AC+VfDy9mXLC2Lqt7uqZxerAJZDrdyaBqEoZ4FhtVQ3KEiuSjEg52DO/
        +i6cRQn/jtEBLnHjRedfe8wHoFeYji3mbg1iZcR+vg==
X-Google-Smtp-Source: ACHHUZ7eHh7oUs55p4PsRymZEwkOfiBBPgxu/ifd0C50xzBovPjQu9PPhdwLcNa1wVqEsXJ8GAAB1RYUv4jPFo6R1HI=
X-Received: by 2002:a25:6943:0:b0:b9d:853e:5cef with SMTP id
 e64-20020a256943000000b00b9d853e5cefmr17476795ybc.37.1683637684177; Tue, 09
 May 2023 06:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683630932.git.quic_varada@quicinc.com> <1691872a83758cb65053dce7001e96e88dbeed2a.1683630932.git.quic_varada@quicinc.com>
In-Reply-To: <1691872a83758cb65053dce7001e96e88dbeed2a.1683630932.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 16:07:53 +0300
Message-ID: <CAA8EJppDtY=Q5oOvXG+pE_+KAk59TPauabUav1f0=eggmLULYA@mail.gmail.com>
Subject: Re: [PATCH v11 9/9] arm64: dts: qcom: ipq9574: Enable USB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 9 May 2023 at 14:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Turn on USB related nodes
> Provide vdd info
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v11:
>         - Rename dwc_0 -> usb_0_dwc3
>         - Maintain sorted order for the usb nodes
>
>  Changes in v10:
>         - Provide vdd info
>
>  Changes in v5:
>         - Move "host" mode specification to board dts
>         - Due to dependency with earlier patches board dts
>           filename changed ipq9574-al02-c7.dts -> ipq9574-rdp433.dts
>
>  Changes in v2:
>         - Fix node placement and coding style
>         - "ok" -> "okay"
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
