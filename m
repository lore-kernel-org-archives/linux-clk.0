Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE365BD1
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054389; cv=none; b=hgIj0b/AACStfzV9au0RdQ2Y2G3+iz9BdckiW8FZ3Iq5nkuanUOaOzuZNHklO4Z3T1H6ozRUlmEd4ycae0fLPYHhRlK/GjUTxwL6OJHvwz1+4t3+Jn16SRbWJ6SC3h+0HtB71c0bV0SjeoVX/8QFrbQrDQOqIGO79WkpBDsvQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054389; c=relaxed/simple;
	bh=HhEFB0IGRWmX+BEHDfO8KYBrrkkM8mY4tpZ16mAQ2nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5m+IFcA6GSqwLf/9LpDnkilnygc8q4qguSZCLyi3IVf/oBqBZkQrLFGL8nsqtUG4LRxRwG0yHGgghW+SBPrRxf4yq8tQMynHtgegc7CifRfqAOBpVgUUvtkLt8gVp+IaBLJIGqLeE95k0AawHdJM/+Str9mbThYoaFJxALb1pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8Vzfiqs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8Vzfiqs"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61448d00c59so25051957b3.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054386; x=1712659186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+1mQHP/C9wtu+pPXviceegNYIKTTtoExeoBTWfttgk=;
        b=n8VzfiqsuWOr93E0ssGrVoPf/59FBcfuZMN3XmPUEZdGoRrJ4WtKwbJqg0X6vqn7wj
         5c2nPYP3QUagIBWBAGIrXb7rZF5mSmE8lUuedV+tXmbi3iokOFQ/gegSoddd/wo0vAaw
         u0cCCvRjOuKITkzfl05CwtyJm0AQG5T6x3Qg4QAjbq2+p4+i5j8+JXqtNc96aU7UEham
         cjhg3OUgnY7hmoKQdABZtbi5ykfUnD6QtdA4NxeFwyujSU5PkvnNIgBc3B5H6D78M9RX
         OGGrPNILVGPstrLEjpvMc7qN6IPG4FkANwxNt9J/HxyKiEWt+VDBPcQGY0shMNsK4ezh
         n7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054386; x=1712659186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+1mQHP/C9wtu+pPXviceegNYIKTTtoExeoBTWfttgk=;
        b=jIQJqvNTxY9as1vBw6X0XYapdFWFzi3sz2I8CdD+fY2ML3oeFx1eJZD+QnldhdgNbZ
         9KU7LADBlHYf8YxyjqN0B1OKkzkp1ABx8gJrjoAPmfcV4+HelC6EWeBbk3BAJ4Qr0Rre
         FGNzqwSi8DM0UCW+HZ//RbPLtmnNhLwl2dkj3CQVRjy+9573I3QpmfDlRpPH4+NB+Atg
         hT1P8b9bo9yr94anLES2c9wZ8cvg6MeFzA170yBb54C0ik83vqNqPiGlw4AY7I5qV/9i
         qDcsYc0d4jBj5zZnMKyFftLrm58GKuHAbPC5kO2GHeG4blYMqPkCQoX079f32ECBGCpF
         0bGA==
X-Forwarded-Encrypted: i=1; AJvYcCUpji9CPxsT3gfwawRIaThpN7Ln3F3Gj0UZNFWY3oTjErtQ48Y1lARUDJV55Hrlel9TuKFJ11EhMvOCSfjOEfLihVh38qKa1KxK
X-Gm-Message-State: AOJu0YwpFj7BQZkrgUdE/fleMvwt+b8Hqk/sKbQkJ265+AcnaAx4jfR0
	0crEMIUVeDJkRWv9wGnM17ClGmItziCZPulHatv4zg3IvYGq2YaLiHM23e9GN4naPRtqS9ShvUs
	n/1z4nLwn9fHVqnAns31fDLbNiTH2MwkRNUvaCQ==
X-Google-Smtp-Source: AGHT+IFBCL4yjfbf9P6S4J9vEGaxrXR9oX+B1iTse1Th7FUTQ5eAJxtybDGU8x6mh7uftc+KDUharfT5L6xDsM1B8Ic=
X-Received: by 2002:a25:aa89:0:b0:dc6:dc58:8785 with SMTP id
 t9-20020a25aa89000000b00dc6dc588785mr10269779ybi.62.1712054386067; Tue, 02
 Apr 2024 03:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com> <20240402103406.3638821-3-quic_varada@quicinc.com>
In-Reply-To: <20240402103406.3638821-3-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 13:39:34 +0300
Message-ID: <CAA8EJppyuagb5zkP4LCjjJwConw3mw3iS-+dO7YB01=7-waRTw@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] interconnect: icc-clk: Remove tristate from INTERCONNECT_CLK
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> drivers/clk/qcom/common.c uses devm_icc_clk_register under
> IS_ENABLED(CONFIG_INTERCONNECT_CLK). However, in kernel bot
> random config build test, with the following combination
>
>         CONFIG_COMMON_CLK_QCOM=y
>                 and
>         CONFIG_INTERCONNECT_CLK=m
>
> the following error is seen as devm_icc_clk_register is in a
> module and being referenced from vmlinux.
>
>         powerpc64-linux-ld: drivers/clk/qcom/common.o: in function `qcom_cc_really_probe':
>         >> common.c:(.text+0x980): undefined reference to `devm_icc_clk_register'
>
> Hence, ensure INTERCONNECT_CLK is not selected as a module.

NAK. Please use `depends on INTERCONNECT_CLK || !INTERCONNECT_CLK` in
your Kconfig dependencies.


>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404012258.MFriF5BV-lkp@intel.com/
> Fixes: 0ac2a08f42ce ("interconnect: add clk-based icc provider support")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/interconnect/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
> index 5faa8d2aecff..f44be5469382 100644
> --- a/drivers/interconnect/Kconfig
> +++ b/drivers/interconnect/Kconfig
> @@ -16,7 +16,6 @@ source "drivers/interconnect/qcom/Kconfig"
>  source "drivers/interconnect/samsung/Kconfig"
>
>  config INTERCONNECT_CLK
> -       tristate
>         depends on COMMON_CLK
>         help
>           Support for wrapping clocks into the interconnect nodes.
> --
> 2.34.1
>


--
With best wishes

Dmitry
