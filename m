Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF31428EA
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720001298; cv=none; b=dABRZf/q/klHxi1qgXeJHY63t9KXfj9JvvQZH+720OHGELHJ8PUGvNw5q+Z6hJoCE8K1pdHDUvCf75mQlgauI1/ue0Op2L31A5HXFVluGbZXyGIeCG80Eeti3Du8j//DI9eAoeqviWUycrmJ2hpUMht4Wbz4p08PGLNKBzEiXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720001298; c=relaxed/simple;
	bh=ypzrZcIwZiiS+8SrhLAXiVNNIok0NmG+vdJlnoa5bEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfXb5nfvI+xBG2QhhER1+PJimtKH03S+W3I7CeL0uZKe/7w5oQUA8uc2l/Vgk8dudcnr5CfTy08LtYXaV7e5Pg4uAHv/jFdT8tMoEJWvqdRXZj27Pz1Vk3VZ2iJLmSAytLYQ+wtrBKyPzHvAdW5qzi16e9DCnQTxv3YeKfRh4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJoCd2Ty; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJoCd2Ty"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so57922191fa.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001295; x=1720606095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4k83HUkLUmDIGlVbWOWQ6orsM1XoadeMJUgBNXrUMAg=;
        b=jJoCd2TyYmA+46A2tieUao2dTPBDhYoOJREsCpr7kaidkDboUVRfE7ZyCorFyHuFnk
         cvncfKMCA57mM/6HBHMI16aUHlKWRod7Nuf9HIPzLBbqkWsgJxbRQIA+c/TcmC/KzyIp
         DGg5AJ3MKOb+aVstjiNHLfvnzj6ZHD+Ynl354q7W4rYs2S/gDNi6c0przU3BKthcFxSC
         vvooZR0T9VEp/NxeofAcQw7s2GENN7zIZa5SoVpreCTlsNhJczN9FXfTLwp5f0F0q7Oi
         kQAsxvarjMHFmoyOtkEIJwHK7HtUr3IVfYYuSAU81iZW+EY/xyY+X4LsOkNT5Mq5c5dt
         aiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001295; x=1720606095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k83HUkLUmDIGlVbWOWQ6orsM1XoadeMJUgBNXrUMAg=;
        b=FraDuC/bCWlgCkzWtMN6TZaOEg4PSCyFkEFjeYgPeHGfSv/LovxSEbQ55/2rFhwlu6
         HkplbMuHACdNaNE7U9xo5Q3ZMFIx0nFkzrUYOfy7z1x3owjl4V1CrEYQijhf0fyLV685
         9su9nZoAUBTgntXU8cXGymbhAqL1b8bNGOi9K6m+OpJoi7xo3kR+UtGJ3g6rSTnvqRm8
         2HDlc2Di6I5gpznpUf3abt1IDhNQPRUPuQUiA9Y/cGmtR0m5IANAuYpM6B5raDvX3a5P
         D7VX84lRtau7zpmhcTG1OMgmtjPoL9x6BA/mj0WOUsF1wzPpnmyO9YC1DDJ/UcyETrwY
         pf9w==
X-Forwarded-Encrypted: i=1; AJvYcCVUa4SI2JdSQmICxGZZkR+5yHRMvrNF6ZqZl2ZU9R2XO6OrGlUE5pw7NEXa+FXRQQUzq1g50VcnxDTYU4vo5JJ40OcbaTQOzYlE
X-Gm-Message-State: AOJu0Yz7JVE/8K7A/fWsBX0kUVTgmqDxEwxOkqYdgzn4z0lVZqw8T/Jy
	wNVQz0xH39g8uVhfUc9MhwO9sE5HlwXCk1tufCSwpvRjEzC8CvTtVDp6cXrbOrY=
X-Google-Smtp-Source: AGHT+IFeGjoeFVuYs4mjQ5B1qszzT/eYdaDEn12VXFnuiHjLpsvLv38GLADABzzvIgEg3uJdpUVMZw==
X-Received: by 2002:a2e:a813:0:b0:2ee:6b86:b0ab with SMTP id 38308e7fff4ca-2ee6b86b2b9mr66901001fa.20.1720001293291;
        Wed, 03 Jul 2024 03:08:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee8758e4c2sm748241fa.110.2024.07.03.03.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:08:12 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:08:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 0/6] clk: qcom: sm8150: Add camera clock controller
 support for SM8150
Message-ID: <qf6vv2eyvhl74qylx3da5c6wa5vzz726mnwi4dflehlpfubqwd@e522wwslmgyn>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>

On Tue, Jul 02, 2024 at 09:20:38PM GMT, Satya Priya Kakitapalli wrote:
> Add camcc support and Regera PLL ops. Also, fix the pll post div mask.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
> Changes in v2:
> - As per Konrad's comments, re-use the zonda pll code for regera, as
>   both are mostly same.
> - Fix the zonda_set_rate API and also the pll_post_div shift used in
>   trion pll post div set rate API
> - Link to v1: https://lore.kernel.org/r/20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com
> 
> ---
> Satya Priya Kakitapalli (5):
>       clk: qcom: alpha-pll: Fix the pll post div mask and shift
>       clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL
>       dt-bindings: clock: qcom: Add SM8150 camera clock controller
>       clk: qcom: Add camera clock controller driver for SM8150
>       arm64: dts: qcom: Add camera clock controller for sm8150
> 
> Taniya Das (1):
>       clk: qcom: clk-alpha-pll: Add support for Regera PLL ops
> 
>  .../bindings/clock/qcom,sm8150-camcc.yaml          |   77 +
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi              |    4 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               |   13 +
>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/camcc-sm8150.c                    | 2159 ++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.c                   |   56 +-
>  drivers/clk/qcom/clk-alpha-pll.h                   |    5 +
>  include/dt-bindings/clock/qcom,sm8150-camcc.h      |  135 ++
>  9 files changed, 2455 insertions(+), 4 deletions(-)
> ---
> base-commit: 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e

20240228 is very very old. Please don't base your changes on historical
linux-next trees. Currently your patchset doesn't even apply cleanly.

> change-id: 20240229-camcc-support-sm8150-d3f72a4a1a2b
> 
> Best regards,
> -- 
> Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 

-- 
With best wishes
Dmitry
