Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2DFC77B72
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 23:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjDQXie (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 19:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjDQXid (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 19:38:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC4E10B;
        Mon, 17 Apr 2023 16:38:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3945A6130D;
        Mon, 17 Apr 2023 23:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C48C433EF;
        Mon, 17 Apr 2023 23:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681774711;
        bh=jS+RcxN/3nKFFMKkB66jmd+rrPmuLF5fDbDuRqcfjt8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=P7b3znYb8pr11hYUD6m1E7JUqw34HKMPiZQL5CQhz19SbXyMi3qPHbKLCkVaON7FF
         oZyu8NoZolpXLmgrHQtSaKK60xgH0KV6PXED5IMhMY5E/aTMATMbr9rgjUjbqnZC8y
         GZ9UDabAoKhuKizkTEThsbSKnCjMCVif1VPyunffSH1hQkxBxPiasl/Zq8QoJhI0MW
         3gNzlinClVoLEaYV2pUU/wX4KyQySAGOjxJoQaIcIPme/EvdV102Yity86wbcJuBnC
         tMORlYUVt1ETqXjIUp4f8x0i5iVil61G3dB3HRahUw9rV4P4MkdVVgdV86KxBBeCeI
         muHJ0zNTWlzBQ==
Message-ID: <9ce2220fef8a49043240cb94adc0db58.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230417114659.137535-1-dmitry.baryshkov@linaro.org>
References: <20230417114659.137535-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] clk: qcom: include cc device name into error messages
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Mon, 17 Apr 2023 16:38:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2023-04-17 04:46:59)
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 75f09e6e057e..7dcf818e1dd9 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -19,6 +19,7 @@
> =20
>  struct qcom_cc {
>         struct qcom_reset_controller reset;
> +       struct device *dev;
>         struct clk_regmap **rclks;
>         size_t num_rclks;
>  };
> @@ -227,7 +228,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_ph=
andle_args *clkspec,
>         unsigned int idx =3D clkspec->args[0];
> =20
>         if (idx >=3D cc->num_rclks) {
> -               pr_err("%s: invalid index %u\n", __func__, idx);
> +               dev_err(cc->dev, "%s: requested invalid clock index %u\n"=
, __func__, idx);

Maybe also add the regmap name if it is set? Sometimes we have multiple
regmaps for one clk controller device.

And can you remove the function name at the same time? It will be pretty
easy to pinpoint this function now with the device name in it.

>                 return ERR_PTR(-EINVAL);
>         }
>
