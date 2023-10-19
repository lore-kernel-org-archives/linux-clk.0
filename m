Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97897CDB465
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 13:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345494AbjJSNNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Oct 2023 09:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235374AbjJSNNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 09:13:24 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AA9115
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 06:13:21 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a822f96aedso79213817b3.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721201; x=1698326001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfIe3DQvE2DP9VdNhWi96S3+RqWt1fdYkzYEGnn8FJA=;
        b=W/dphmMd8O9NzE1AyoZFDI7MsjM+oWhgxCO1QM8q03j9aGq7a69/ERC8IXTBy5A3Mm
         ahC9MQxl6+5QI2dUnj+tx+gZYNP+Lm1fhrbcHFXYxyxj3bj/5VC/T6YnTRJIObI/DFjR
         wYPpiuzq2WLGpjCQC1czKWnWW0IbyIHfMt7RNUgTwMcPch1fVs7TK1QbS9NWv9J3C0cx
         fNYeNVRtlEmttgL03ZGRl+1FgV1FFP/2nFj6MGX6TPNbii2B+W+sxlSd14X/fqNJvs5/
         R0s/ZaD8qKTdnwacIGH/kZZIQhJ78/ZU1LgU6CjyZdWDvRReLC3gblWyYQiFrPFU0NUW
         wZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721201; x=1698326001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfIe3DQvE2DP9VdNhWi96S3+RqWt1fdYkzYEGnn8FJA=;
        b=qobKXZSaX19seTpnQslSys52ZqOkR8cvLs28Zfny+L+0iG9tGji2GimJph8ERXi8U4
         v+HTeaW6V4+k/VPX7X3YQsjMM3M5GuH4QpsZ1D7BzaJTvlmdYE8lYsSGvZ4ci8+e+D+f
         DKv5VaBOmqXn+yUG6JsFwZ78QFrgCtlWsyaCtN3MNmd/vMOxz/SCHnya56vjDZhgSuW4
         c/RzicgQxaUz6QCXYXbqJYJTR1hMcBGwFgW8GEQbhVjdwROTELCbB1mTiTerOV8X0IXO
         nbNyBfkS4GQZe7O24vDzh4VtPTMRY0F2Ksk96M9NFWtZnmqdjm0qWG1eeT9cQ7hJvXRB
         Kb9g==
X-Gm-Message-State: AOJu0YytqqHpaDUwQr1lP3LWe6Q/vulmclMc99697j9yKaGNFojAjd7O
        RD+AmEwRVZxv/mqP+5rF0XLLKf1XkF7eS7AL5wmWLQ==
X-Google-Smtp-Source: AGHT+IE4JE9GLBbOu78KNMBIvAZsPKZ30wmFMBJhVsQiY/NhN+vDMII7uY55LkCXBQg5Akt5Fs7o3MXXfuTUwIhvOjY=
X-Received: by 2002:a81:4e09:0:b0:5a7:c97e:39e3 with SMTP id
 c9-20020a814e09000000b005a7c97e39e3mr2492221ywb.15.1697721200975; Thu, 19 Oct
 2023 06:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697694811.git.quic_varada@quicinc.com> <9ea8deab1c8b49008acb91510e9e1b1c1e0b4f3d.1697694811.git.quic_varada@quicinc.com>
In-Reply-To: <9ea8deab1c8b49008acb91510e9e1b1c1e0b4f3d.1697694811.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 19 Oct 2023 16:13:10 +0300
Message-ID: <CAA8EJprd818gCFBSOWPiLhPq0O4hPnGbwBPWQougqwmuUg1kqw@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] clk: qcom: apss-ipq-pll: Use stromer plus ops for
 stromer plus pll
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        sivaprak@codeaurora.org, quic_kathirav@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 19 Oct 2023 at 11:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The set rate and determine rate operations are different between
> Stromer and Stromer Plus PLLs. Since the programming sequence is
> different, the PLLs dont get configured properly and random,
> inexplicable crash/freeze is seen. Hence, use stromer plus ops
> for ipq_pll_stromer_plus.
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Fixes: c7ef7fbb1ccf ("clk: qcom: apss-ipq-pll: add support for IPQ5332")
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4:     Update commit log to include
>                 "What goes wrong if we don't have this patch?"
> v2:     Add Fixes tag
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
