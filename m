Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8641CCE7A88
	for <linux-clk@archiver.kernel.org>; Sat, 23 Sep 2023 19:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjIWTOA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Sep 2023 15:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIWTN7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Sep 2023 15:13:59 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B65FA
        for <linux-clk@vger.kernel.org>; Sat, 23 Sep 2023 12:13:53 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59c07cf02ebso48214357b3.1
        for <linux-clk@vger.kernel.org>; Sat, 23 Sep 2023 12:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496433; x=1696101233; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZmYNV3oT+zkVAf2ugnkULn4izub45DJoleWbLBZiLk=;
        b=BYmUWmHm1d+2YeSfA6FrjZLsVZIWFYDvO+oimM5AK1Ut1MfL9t6+qD0oiN7kaG94e0
         KKBLl867I3svVBLc4CWICmmboBjCFPY5D+IJtJSFiXUPcp/mw4jkteJuu7RdQfzBF1x/
         OZtYgkJrUE8ncCeNi3NQPI6wa0WmgYRuTJQekEzFg3ShGcFrWD2r/NR6DjijuiQrhlpr
         54vKvq52qjLHw5z/8fdmCfm8HFwR5hg2fU4PadZYdQhm6p2ZehRM0HQuz/xV0w/oP4TY
         2WuyrsWKKcRVcLsN5y7CH9gjiPAQNsVj8pneQf50dX2wk5lc8dp8to1vOQvpyv7OEw76
         bwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496433; x=1696101233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZmYNV3oT+zkVAf2ugnkULn4izub45DJoleWbLBZiLk=;
        b=BVLXXXeyM3BREb3PJpFQhSKKFhVWjI3c3qwyl8KZbeEQ2exv+LR+MP9WYppj1Cup+y
         TyckRwPZvactMoyiiU9lgY3Vi47ixzjeTSVNv9OP6f5K1qQhzGC17wOtRY5izDrrXpkw
         C3TwvkVvB2M93pcJLlr47LID1lbl0x8f6/3myFFUGOpx1alkeYzGQ7V5lHo6YXgO5fX3
         aGtNhA/x6hxoGOUXB6Ca8lLGlUOJYeQeJaKLuXszbLzJanQqMESkU2VNQl4zWDoWI0WY
         H2wkHe6nqm1Fh7w58rw13JmWIGglzaPdcnPvjgeP5ZF3q3bKjLyovN0iqT+4m6NSC5Rt
         yQ5Q==
X-Gm-Message-State: AOJu0Yya1RjbQGfpYsP6GJjwgqx6A/Urxj/VR+nMLAi9NPVM5ojn53pW
        SLUip4ifn49ufy1x0S0aIgu8z4OVD4EuPhA3CL37nQ==
X-Google-Smtp-Source: AGHT+IGXN+4C918nlV0X9cam2P53VSEtGaNCjhNVGXRfBhpYoducXAEJcOhhSM/a1gaDZ9hAbqMkiRbLfciiL/l5bZg=
X-Received: by 2002:a05:690c:4483:b0:59f:5361:d18c with SMTP id
 gr3-20020a05690c448300b0059f5361d18cmr2111515ywb.41.1695496432784; Sat, 23
 Sep 2023 12:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230922084303.4164046-1-quic_gokulsri@quicinc.com> <20230922084303.4164046-3-quic_gokulsri@quicinc.com>
In-Reply-To: <20230922084303.4164046-3-quic_gokulsri@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:13:41 +0300
Message-ID: <CAA8EJpoyaM0_utG9oAwyqO3RPoNDNduuPc3u+tzrjYM6NXRnjg@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] clk: qcom: apss-ipq-pll: add support for IPQ5018
To:     Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 22 Sept 2023 at 11:44, Gokul Sriram Palanisamy
<quic_gokulsri@quicinc.com> wrote:
>
> IPQ5018 APSS PLL is of type Stromer. Reuse Stromer Plus PLL offsets,
> add configuration values and the compatible.
>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
