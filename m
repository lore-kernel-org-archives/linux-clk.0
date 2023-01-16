Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256FAC54EBE
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 21:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjAPVO0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 16:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbjAPVOY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 16:14:24 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4EB21A31
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 13:14:22 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4d19b2686a9so269209467b3.6
        for <linux-clk@vger.kernel.org>; Mon, 16 Jan 2023 13:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwm6WO7QnPNEhy4JvZi2wxkyAD3RRMBe1FVE+2vZ5sA=;
        b=aXpkbUjL0kDFvTMkVim1GagooD1opDikVVx1RL7hUyJFfhKyLDACnWABKytVIEmA/l
         ufPr01muhEm19QVeOus6n6Q3gqLxEZ8gLXkUOhSLltujFDGWF/BDVy7fsNe0qHbBAtFF
         39Xlrmuys6/gTXXe7s1DP3rM41lmkKU6Sk+vweWaBd3OfNZo4TgHQvChYVt35+bKJJ8B
         dnKcZwMP/K/tdria3W1OcnnTWgWCwtpy1J+HSjkY8pjMYwJXbmnUCcTwIFp+iCZYf6bH
         PQxzrbEiJ9ZK3TpBdUZ7PA2e50RV4wctF+6/8Ce51ftuNYKJq4wttrtu3IRUrd1BX7sa
         jBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jwm6WO7QnPNEhy4JvZi2wxkyAD3RRMBe1FVE+2vZ5sA=;
        b=lV0hD6HMTzaJENQRMhvttH0DWqrojaMMPp0Rocf2wAyX9bt8qY3ihvJu9zIiSGblxv
         xPAwIex0/UXOXkwAmc36qkU8DuSLq99LBjcCM4I142LAFHQZq/wT+G6B3+sJdxpajLM0
         dUIsGcTb2N5flqYRhC7xb0f+SpOGqfepz4l+lnaM4gdN8EtNzhUsIjpg60dYHfSlk/8W
         xvShKD4P7zaLTsZFw/VWvluITdwc5mN9fGRMySBezUtuUoiskK9jw/ucmjI9BwKZs+hJ
         qQnObDNCc/znJ+SbMI2IF+PHJnBKWAwaMP5IFIHT9wHEq6MZrSwstgLZ6kTCmFqYxZr2
         xQHQ==
X-Gm-Message-State: AFqh2kqlleFG/ZYDo0yVyO7ta5Tg9aFYjJbxV4DKYd1JeAul0XCZN3rI
        FZbOUK/7qwEVEyOLN27wdwxS0W5A7igfVpr5JsWtOg==
X-Google-Smtp-Source: AMrXdXvEbRCJ6WnLKKWGRezrhVD86gzZ1ps7Npqh8eCYrpaQI1JQdsTAl0zrDXMtI/vwF+AI1YYNNBrPYoqqxsxo3k4=
X-Received: by 2002:a0d:d5c6:0:b0:4ef:ce3a:a54 with SMTP id
 x189-20020a0dd5c6000000b004efce3a0a54mr96174ywd.485.1673903661649; Mon, 16
 Jan 2023 13:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20230116204751.23045-1-ansuelsmth@gmail.com> <20230116204751.23045-2-ansuelsmth@gmail.com>
In-Reply-To: <20230116204751.23045-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Jan 2023 23:14:10 +0200
Message-ID: <CAA8EJppdYqwM6n+6BdKtjO+TTerqeodLO7CEpBVNW45yduFV0g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: Convert qcom,krait-cc to yaml
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 16 Jan 2023 at 22:48, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Convert qcom,krait-cc to yaml Documentation.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>

I know this has been reviewed already. I checked again my apq8064
branch and noticed that the bindings are not compatible with the
apq8064. The SoC in question is a 4-core device, so this is what I had
in mind:

       kraitcc: clock-controller {
               compatible = "qcom,krait-cc-v1";
               clocks = <&gcc PLL9>, /* hfpll0 */
                        <&gcc PLL10>, /* hfpll1 */
                        <&gcc PLL16>, /* hfpll2 */
                        <&gcc PLL17>, /* hfpll3 */
                        <&gcc PLL12>, /* hfpll_l2 */
                        <&acc0>,
                        <&acc1>,
                        <&acc2>,
                        <&acc3>,
                        <&l2cc>;
               clock-names = "hfpll0",
                             "hfpll1",
                             "hfpll2",
                             "hfpll3",
                             "hfpll_l2",
                             "acpu0_aux",
                             "acpu1_aux",
                             "acpu2_aux",
                             "acpu3_aux",
                             "acpu_l2_aux";
               #clock-cells = <1>;
       };

> ---
>  .../bindings/clock/qcom,krait-cc.txt          | 34 -----------
>  .../bindings/clock/qcom,krait-cc.yaml         | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,krait-cc.txt b/Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
> deleted file mode 100644
> index 030ba60dab08..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,krait-cc.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Krait Clock Controller
> -
> -PROPERTIES
> -
> -- compatible:
> -       Usage: required
> -       Value type: <string>
> -       Definition: must be one of:
> -                       "qcom,krait-cc-v1"
> -                       "qcom,krait-cc-v2"
> -
> -- #clock-cells:
> -       Usage: required
> -       Value type: <u32>
> -       Definition: must be 1
> -
> -- clocks:
> -       Usage: required
> -       Value type: <prop-encoded-array>
> -       Definition: reference to the clock parents of hfpll, secondary muxes.
> -
> -- clock-names:
> -       Usage: required
> -       Value type: <stringlist>
> -       Definition: must be "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb".
> -
> -Example:
> -
> -       kraitcc: clock-controller {
> -               compatible = "qcom,krait-cc-v1";
> -               clocks = <&hfpll0>, <&hfpll1>, <&acpu0_aux>, <&acpu1_aux>, <qsb>;
> -               clock-names = "hfpll0", "hfpll1", "acpu0_aux", "acpu1_aux", "qsb";
> -               #clock-cells = <1>;
> -       };
> diff --git a/Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml b/Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml
> new file mode 100644
> index 000000000000..8caa5a677394
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,krait-cc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,krait-cc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Krait Clock Controller
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: |
> +  Qualcomm Krait Clock Controller used to correctly scale the CPU and the L2
> +  rates.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,krait-cc-v1
> +      - qcom,krait-cc-v2
> +
> +  clocks:
> +    items:
> +      - description: phandle to hfpll for CPU0 mux
> +      - description: phandle to hfpll for CPU1 mux
> +      - description: phandle to CPU0 aux clock
> +      - description: phandle to CPU1 aux clock
> +      - description: phandle to QSB fixed clk
> +
> +  clock-names:
> +    items:
> +      - const: hfpll0
> +      - const: hfpll1
> +      - const: acpu0_aux
> +      - const: acpu1_aux
> +      - const: qsb
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +      compatible = "qcom,krait-cc-v1";
> +      clocks = <&hfpll0>, <&hfpll1>,
> +               <&acpu0_aux>, <&acpu1_aux>, <&qsb>;
> +      clock-names = "hfpll0", "hfpll1",
> +                    "acpu0_aux", "acpu1_aux", "qsb";
> +      #clock-cells = <1>;
> +    };
> +...
> --
> 2.37.2
>


-- 
With best wishes
Dmitry
