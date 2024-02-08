Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB360692FB
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707375617; cv=none; b=jgBToAdZS3JZwr0N2FAOos5Qc8G9GuN0PjduOF5P5VChOWkyHSEnC45It4IdonnInbTUYReX9wCCgOm/+kNRk7UmBMfSnwGHWMv8MB0gRN70xxPPZKc+qhBlAUvTsjYsz9xrWfdoSHXZ4sBIvKoKNToJmT5GS5FXjUUP4WdEUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707375617; c=relaxed/simple;
	bh=HdW46PmYFY/U2koHlqQYLlKz8MMgMac1hAcgaMNd+Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKPDJvO27VXQIOXSjMry2n7IrBPU/qhG6//kQP2KYN4yxHlVwktFn3JjW6Osuq4iVIf8YoQp0dVHYdzQq7wkIo9VzySccc1cewjFIsynQ9hh0as8EuDK6+rraY8Fv1CGNCSM3AIHeTjQLreP5WCY6UA3U9JW+eTEWeUP/JztcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i/sI9zqb; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i/sI9zqb"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60491cb9571so15423967b3.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Feb 2024 23:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707375607; x=1707980407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eByR5GQoGX+Bs//9xgHnZ7HhZOW4ltAO5NoiyDJIpLc=;
        b=i/sI9zqb9t2vJIwU7gvZ6cRZC+/v4IeSJ24h+IZy8LcHB+vL6AokZJZFjey+7ANh7u
         89pMGfbfEz4EoKBVGGwSARl4q8nj2QzbN2wqypVYEGlwQRmcXgy7Vw6lHkP8IAWFjK/+
         6fdslD1Emj5vJgMQ6ungQJTVVdnUAu1LhgD9opzUBYADKyF8fbkzqmuauBwsIwJdoQau
         846drm5ySY0a9k+To1ynmWO295o5OH11PskAUQBTHXJkCFx2NCcN/xm+8TpDO+jdAMsN
         aGWP4+zYhBcdlu504YXoFVTT6qydB+kxiQlVpAhUfnMizagVcSTLsUoe/xxg1RKf/QPZ
         2u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707375607; x=1707980407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eByR5GQoGX+Bs//9xgHnZ7HhZOW4ltAO5NoiyDJIpLc=;
        b=m4vkGLfwACicN2B3JtkEU1WTmMkmQdpQIy/+HdsQ7uZ1BmW6HwS4ByUURc7VOdT2aF
         BSaDGbDPKZgn07f33RsHTwPQGl0SbJmhus9EiV5rYJuIWHvqpFBS4Scx97dtO9WtxAu8
         KiWD46hbNYnt5+/eEMspw8DYVdTIzJ1TpIJneIetmf4t4je/Kd3FbgUzEwIEp0ghrdj/
         U/J9xEHKXWsH0bZq5dsxd7ScvV+hZOs8P/cQr4FAOD/sX+ppgtckLCTo0xmIUkkqCXzf
         IkbvKldzVeowu64B29zPy1dOO5ECtgXAgsJRkWHhFvzjVQldZh1mTYcoqAtn9k1WDpBn
         splA==
X-Forwarded-Encrypted: i=1; AJvYcCU9wyjkdo2FjjTqeeiIZ9D/Z449J0Qixc/ZrwgHwCmZzvYj19OnMZrtBLmkNoer3wdLWViZ5Eh0/+x/UGKyW/z4TsravDFLD1+W
X-Gm-Message-State: AOJu0YypE3i9id/AyLKJvEtEK3q4VejZXTIWZNDfuDItzUGskHCgf2aH
	YXVgLkcq3CGOVB6xLGTq5xh0cc+RMdxIrsOkOxx4iAJnA634JLRQfWOXa/WA/4XtfiRYqrUFG7s
	+cbhFvhLzFvDYghl2iFkQKm8W+XVuS803mmR5qA==
X-Google-Smtp-Source: AGHT+IGm34qOlpbHetB6jIH/phC+hvmN9qPvqCv6koH3ApB3V3uhPCKOnQYCKQ/aKUMRl8jP02VpYUq/dGK1Myuht5E=
X-Received: by 2002:a0d:e504:0:b0:604:999a:3992 with SMTP id
 o4-20020a0de504000000b00604999a3992mr3591745ywe.35.1707375607622; Wed, 07 Feb
 2024 23:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-2-quic_tdas@quicinc.com>
In-Reply-To: <20240208062836.19767-2-quic_tdas@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 08:59:56 +0200
Message-ID: <CAA8EJpoF7ii59WuY0WaMkdbs3+GE8UFPmbxdvohfjUfwqC4c0Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll" property
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> When remoteproc is used to boot the LPASS the ADSP PLL should not be
> configured from the high level OS.

Why?

> Thus add support for property to
> avoid configuring the LPASS PLL.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> index deee5423d66e..358eb4a1cffd 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
> @@ -49,6 +49,11 @@ properties:
>        peripheral loader.
>      type: boolean
>
> +  qcom,adsp-skip-pll:
> +    description:
> +      Indicates if the LPASS PLL configuration is to be skipped.
> +    type: boolean

This property describes OS behaviour rather than the hardware. Such
things are generally not acceptable.

> +
>  required:
>    - compatible
>    - reg
> --
> 2.17.1
>
>


-- 
With best wishes
Dmitry
