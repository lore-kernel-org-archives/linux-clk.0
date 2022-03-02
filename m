Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F2AC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 20:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245037AbiCBVAj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 16:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245018AbiCBVAW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 16:00:22 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE35DD64CA
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 12:59:38 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id e22so2526622qvf.9
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 12:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7mUjbtpCCtsOG9jYKgJxNZISxNazpeqTfffY69y8STE=;
        b=aavMfozFmXfin3ehGCM8/cbJ45gjcXA92LUIHvpXcrPFXksrvC/pAH/jfvGXai4FFU
         ocGOv6ED9Yo92B+9cv5uRySx8W76NvdLsdd+an8GuVsUp8UsyWQWuk4Fu1WiyVV6hay3
         8WMCK36dr/G68oEUEQruwQX6r2ZFZWQf3TlcTHhmfK7ciULdgYxfDEofhXOhIItGXVjO
         t4H86M42+EGuAhcr94NUcW1h68cuSzyG2ZFjHbUBOa1GYbuY5C1/BI7M8GbE5OafZqJh
         vvzyAa4IzAvS63bD+8vlcs2zZEiyGcYQxOLjFvcoVJXH3u2PREZc4O1v1KJAHnyzSAF6
         ypmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7mUjbtpCCtsOG9jYKgJxNZISxNazpeqTfffY69y8STE=;
        b=mnt4P8cPOCJ8kBWs5LxVO0a5uoEKQxVDJ9OU6MCC/q+OLyuWn1nunDyXSzz7i5m0Iy
         0229yg1i7RETcrxTlZWOCKKuqangZ6Q9Nh8g4T55VndRN3macCQtGFoQaI1bdDKYWnEO
         B7SnZulH0IPkbjUAzgW+u6OPWHWuKxeGQrZh5GHxhUSx8a86b2ldPGKfIUWZb5+EQoGM
         Jx00ePB4BPIK6LwD9pr2N5XH+wjiZWb346NFbjHBdCkh6ra+NugxBvA8qgJExvQaxehG
         /pu99MT1rCz+3WPgfPp5/glhtL63JwN7fpnUasddOteUjCuKdiLqQRzxJhZZYyjEU2z2
         rusA==
X-Gm-Message-State: AOAM531aKCrNWeMwsFTvhjI7FFFEbFEdso/CxeyYqvqY7hLcE3xnUGJB
        isv4NJKF4m4FRp35urtkJlRJ5JskFWMLfvSTkPSS9g==
X-Google-Smtp-Source: ABdhPJx9v0p/md2jydNCQ6XCgdb9TFM9VczTiKrSjtKaCqAuPjqYf5f3eAI8AFE+zTL1zbzO1qaq4dBXim2UgWtVyHg=
X-Received: by 2002:ad4:5883:0:b0:432:b007:962b with SMTP id
 dz3-20020ad45883000000b00432b007962bmr20943794qvb.55.1646254778062; Wed, 02
 Mar 2022 12:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20220302203045.184500-1-bhupesh.sharma@linaro.org> <20220302203045.184500-8-bhupesh.sharma@linaro.org>
In-Reply-To: <20220302203045.184500-8-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 23:59:27 +0300
Message-ID: <CAA8EJpqEy+669gpDsy-zGp2NpDP-d7ZxNf7RVo=OQZdvGdZOvQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sa8155: Enable PCIe nodes
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2 Mar 2022 at 23:31, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> SA8155p ADP board supports the PCIe0 controller in the RC
> mode (only). So add the support for the same.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 42 ++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> index 8756c2b25c7e..3f6b3ee404f5 100644
> --- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
> @@ -387,9 +387,51 @@ &usb_2_qmpphy {
>         vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
>  };
>
> +&pcie0 {
> +       status = "okay";
> +};
> +
> +&pcie0_phy {
> +       status = "okay";
> +       vdda-phy-supply = <&vreg_l18c_0p88>;
> +       vdda-pll-supply = <&vreg_l8c_1p2>;
> +};
> +
> +&pcie1_phy {
> +       vdda-phy-supply = <&vreg_l18c_0p88>;
> +       vdda-pll-supply = <&vreg_l8c_1p2>;
> +};
> +
>  &tlmm {
>         gpio-reserved-ranges = <0 4>;
>
> +       bt_en_default: bt_en_default {
> +               mux {
> +                       pins = "gpio172";
> +                       function = "gpio";
> +               };
> +
> +               config {
> +                       pins = "gpio172";
> +                       drive-strength = <2>;
> +                       bias-pull-down;
> +               };
> +       };
> +
> +       wlan_en_default: wlan_en_default {
> +               mux {
> +                       pins = "gpio169";
> +                       function = "gpio";
> +               };
> +
> +               config {
> +                       pins = "gpio169";
> +                       drive-strength = <16>;
> +                       output-high;
> +                       bias-pull-up;
> +               };
> +       };
> +

Not related to PCIe

>         usb2phy_ac_en1_default: usb2phy_ac_en1_default {
>                 mux {
>                         pins = "gpio113";
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
