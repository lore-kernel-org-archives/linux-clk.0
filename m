Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D511735
	for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYHsmNPu"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5e76948cda7so4852947b3.3
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 23:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142413; x=1703747213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QNHYVgnLPt/LzJzhIcgZKNBcgN77jkKMYOnDB6Gfkds=;
        b=XYHsmNPue9gGZ8BoP3Q30jWC0VwtrjYNYpNjPPAjeZE1EFiJcZUANDHL7udzKEmBWj
         g7R2qRbVBK9qw63VsCoJtfDhmbs5FrdIb3qq1EXJzUyJKynmAsd+yjl+BwidQbT0dwe3
         xGqyxPbYjwCHbyyojuoAtOzYqx0dtYpQ1ERHgF0h0w2Fn62nSfyjvyYxI0kMK0XB8Jrs
         C9XIHp/7Y/rHLJ+I0wFQWDKrPI3axxoxUhjpNdevZ6jNYvZqRqJhw2Ijb3ESMrNpTMPA
         RryxIo4ziW7RbGEjybJzGX/0zMYtIWGiWWpoJJqEqNzDBykaNtsVAgy39dJPNpvWIpXa
         sipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142413; x=1703747213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNHYVgnLPt/LzJzhIcgZKNBcgN77jkKMYOnDB6Gfkds=;
        b=SJO6mvslyiLqFzjxWKq5Q3rz7VD+o7mz7d2dpsxLqZFCxYC8kGZrpQOhgs+cCSAiYS
         az9VlXormDr7YuPs1e/zdMQK1TZk7uyUouJftrXEaMtsfpsKQ8efpXNkxwbs9FyiWWrB
         mfMC6ImcgiXuZ6zc88cexblEJmQk38CDyJuW5hOCOOji+23shJ1aHjJ44YpOh68r8Qhi
         xdI9Ujz3ELx05LVavlx5CblgmQzVKW2r0VOzG7Bg+msvxKNtcPff01ewWGTwlxDgtg5D
         4C5agDRITyMYEK5PLEugnnOkeH07MnPwf29Hguvaj0jF7yzuiwpKnaEcNuEOM0Sg6/eu
         f2+Q==
X-Gm-Message-State: AOJu0Ywj1TY6XqB3hlFxqOSgcXB34FsUzkDtBlN4TQcAZa45iZLTyFN6
	yQe8rcI3afPedFISyTJvroahAmGs99VCUW9tEcjQXw==
X-Google-Smtp-Source: AGHT+IGls0CL2Xf8mP1d+9lcPShutUPwkHMcMXXFqg50GFAV25XfU9SjO9Ug8vc9D/t/O+CnmSHm674c4KTzwGoSch8=
X-Received: by 2002:a81:6d0f:0:b0:5c9:8183:6ab7 with SMTP id
 i15-20020a816d0f000000b005c981836ab7mr857894ywc.0.1703142412886; Wed, 20 Dec
 2023 23:06:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-5-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-5-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:06:42 +0200
Message-ID: <CAA8EJpqU4On=jpjk0-KkXMmwVhzLddJchQzy=LmJHnChjNpmSQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: qcom: sa8540p: Drop gfx.lvl as
 power-domain for gpucc
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Dec 2023 at 05:51, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The SA8295P and SA8540P uses an external regulator (max20411), and
> gfx.lvl is not provided by rpmh. Drop the power-domains property of the
> gpucc node to reflect this.
>
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8540p.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p.dtsi b/arch/arm64/boot/dts/qcom/sa8540p.dtsi
> index 96b2c59ad02b..b604404ebf64 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8540p.dtsi
> @@ -168,6 +168,8 @@ opp-2592000000 {
>  };
>
>  &gpucc {
> +       /delete-property/ power-domains;

Nit: maybe this deserves a comment.

> +
>         status = "disabled";
>  };
>
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
