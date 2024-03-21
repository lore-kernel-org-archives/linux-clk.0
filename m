Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1CA54FA9
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711015427; cv=none; b=bvPmdIcBJeNewU39oeYZIhxfhoI3GBEtajpfI/0KSRX4Cy0IBcGhpu2ofhrRvF1Y+F+UwIad0JaIiqpjSClQdpbPG8fIABegafxrJHo+7kSTyptfpL6evbSQ9BIwg2nzvH0gs28Rv1qFiawTIHulJEe+dyODwTtyvH5q6+Po03c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711015427; c=relaxed/simple;
	bh=9mBsSCywB1UYVK5EIoAzSbSWRc36LYtQG7L15yc7v9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bgqlos2EelK0lijl5ftTfU7Qt98xhNPj9xiyCJu92MUdoaFEUiUR4jwicjVFYyAuxz7D0vFrVC75uWTljM8jvgIR6jokKHpqYToVSEX8YkchyImNM+q9OqLrwuO49XCQ1r/x7QVRlb11nF5EKqCPJZ1+/87TsnOVNasw76QTKRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k19gMiE8; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k19gMiE8"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dd161eb03afso611996276.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711015424; x=1711620224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QSqCEacDmuyhGjW4tIZGQOCZnmnjyg2MSjCQM9ns3PM=;
        b=k19gMiE8HnSOcxpo/+oGc6con8ZQSioz148eupvUPE8htxpUkuWXuVoBNjC8TazZBG
         TfqoiNaKwPg8AbXIg9lX/SRUY5nm7NRpHpvpMwBcuWKf0v3aii2REGgayDcCNmUzzlJd
         mZ6aHzMtQZteyfV/Bz0IB5F/q5Tg1Znzp0SXQquQSpP3SWIdGqIS4D49ttwPf19+b760
         qokZWazG/6NqXnzpGA/ds8Ke0mUkKvaNYmP1S1drQZKUO0Q5IIs7wvJJFy2GJAzXCKpb
         UQ10iul7c0m9z2f2VSLZ6pKs6AW0d3ZJe5DAyJthxn6lXrZ1HYTNB16Mpz4td/8Dhtph
         NzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711015424; x=1711620224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSqCEacDmuyhGjW4tIZGQOCZnmnjyg2MSjCQM9ns3PM=;
        b=QCrogdHvlHSEYlTG0wmuNpqhuGOX91w8PycZUyFVEGhCW8Kt0KgpiKJD+R4EiSovjE
         jPG+FkX4IeJXD1b3jfCgywRKuo6ACagtw6DZqLJ5KEqDvznYz/3CpPjKGflxFjxg2Qv2
         6CQTPrMst2NuOHomjBcRF5pmEFwaTJg9MFF8XgyLEB8Ir4lcQb4hPAJ+1DoQ0+Swj8iU
         6dJS8avQBXMUnRjM6mPVAEk4oIdKHuRmyP4CMRQ8ENfwdTfpw7bt6NmeIMl09PWio6iH
         SUPEJMJ54zz9XbGUQH+XwCJWjfCc3KFT+tpW8QKbMlJ9dlrW9Lj2Sm4yDTZHok2y1T9Q
         iGLA==
X-Forwarded-Encrypted: i=1; AJvYcCVtW18aUztc2UquIQJ8zQCSqQpoi03f64RVQebZ8ZQx2JmoyxuivTqQJh3BqNN1EmQMa8fexvfU6Zc12jFQvNFXlgXOGBXrtMa5
X-Gm-Message-State: AOJu0YwpRsbGcBsCd4VBEyHGU9gLn0hMjjF7OUP44aj6ltbY2Z5IBM4H
	2EBOG0pOHPYZ2mxr9By+6jgYP0kPYI3VVOkbg/AYQBXKcDJ28vR4i9TWbKePAz1dAjmU/eceew8
	0678h2tlBq+a6R8cOMukvRnvLFZllRyF6kpvFEA==
X-Google-Smtp-Source: AGHT+IE9o5xv1E+a+C5db8AW+UAGMIBoieSfVU/7OhyJYyIyX0EhBpq7st4JqdhP6/XI91PKF3215+N4PdtJ8bZCO4Y=
X-Received: by 2002:a05:6902:4c4:b0:dc7:465d:c06d with SMTP id
 v4-20020a05690204c400b00dc7465dc06dmr17513281ybs.28.1711015424255; Thu, 21
 Mar 2024 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com> <20240321092529.13362-4-quic_jkona@quicinc.com>
In-Reply-To: <20240321092529.13362-4-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:03:32 +0200
Message-ID: <CAA8EJpq11ZeYrMqdKWrcs3=cx_Pr7wc1Y87SHMqP6B_9XtusVg@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 3/6] clk: qcom: videocc-sm8550: Add SM8650 video
 clock controller
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:27, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support to the SM8650 video clock controller by extending
> the SM8550 video clock controller, which is mostly identical
> but SM8650 has few additional clocks and minor differences.
>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



> @@ -411,6 +540,7 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>  {
>         struct regmap *regmap;
>         int ret;
> +       u32 offset = 0x8140;

Nit: this variable seems misnamed. Please rename to something like
sleep_clk_offset;

>
>         ret = devm_pm_runtime_enable(&pdev->dev);
>         if (ret)
> @@ -426,12 +556,27 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>                 return PTR_ERR(regmap);
>         }
>
> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
> +               offset = 0x8150;
> +               video_cc_pll0_config.l = 0x1e;
> +               video_cc_pll0_config.alpha = 0xa000;
> +               video_cc_pll1_config.l = 0x2b;
> +               video_cc_pll1_config.alpha = 0xc000;
> +               video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_sm8650;
> +               video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_sm8650;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr;
> +               video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr;
> +       }
> +
>         clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
>         clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
>
>         /* Keep some clocks always-on */
>         qcom_branch_set_clk_en(regmap, 0x80f4); /* VIDEO_CC_AHB_CLK */
> -       qcom_branch_set_clk_en(regmap, 0x8140); /* VIDEO_CC_SLEEP_CLK */
> +       qcom_branch_set_clk_en(regmap, offset); /* VIDEO_CC_SLEEP_CLK */
>         qcom_branch_set_clk_en(regmap, 0x8124); /* VIDEO_CC_XO_CLK */
>
>         ret = qcom_cc_really_probe(pdev, &video_cc_sm8550_desc, regmap);
> --
> 2.43.0
>
>


-- 
With best wishes
Dmitry
