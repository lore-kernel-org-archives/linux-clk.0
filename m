Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C98381B0
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354167; cv=none; b=GW5Bl71CWheKsrkyi1H6S8J+ACMPZhLBte0Z0JqkCJkJ4c6hRVljH3Gx4RaD51d+B+aqMQnKEU3NU2nTM0AxaiwFZGCB5/SeOXJ4Ebw1sEKKvjb85rNlXF1aaCW395tZNupOJtvttWhAlYUNdDZ4y8dKlacYSYECD2YsbujiQMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354167; c=relaxed/simple;
	bh=cXd+iZRHyG6Z54ZlDyEkvwRUedt1tgiayxTf/h55RT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlzEILyDU6FeSngCnRK0Tc/UHe+c8dM+jrttYNoxN1gywdOt6jV1SsoCgyco2mtNN/IDUS+TyoZQV0w6UNL+ncV1mr9ov1rKMJF+xvjixl98+VU1QompIPWR+L6kL6GizCeZaEfTAnmcKmSwLO3gSyPagokvhDuRg2ofuK4oQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+7XFfNH; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+7XFfNH"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607e707a7f1so41444187b3.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354164; x=1708958964; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJI1teD2wPawZOQzTgWhX+w1Ti/ZVP+Yv2CET7JvPGw=;
        b=T+7XFfNH+2GtsSPl6mG8MdV/ceKdv1OvdsBLSf+Ewyxm0AL+v8SxbPgD2v1HonArrw
         w2OFiWkRO+QS6bU6K5kOXWuNyrVBwjZuApMC0n1K6Gh441xwBe9l2uMFwcckuEqasDvI
         9/u7T2mOpWX3VY6b2X9vyhQOnma4eBCvZHUtsqfIzhT5gi1E01mbJHf55AM5WqSB2zTL
         F7UY03EiR64zzb3YFCO8sGcNhEM+1MHE4TjsPTIsbn0Cr9NVayrv0HBgCcIGpg7niw2A
         xWf6ISKI/sGbax+kBx/u+/Ni1pIvE8cNFCcA89hMKmk035tpkxJ8jJOmwMu8/BzEGMyy
         UOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354164; x=1708958964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJI1teD2wPawZOQzTgWhX+w1Ti/ZVP+Yv2CET7JvPGw=;
        b=q/r9jJ4dKA7qbIfWuXxlqp30iMMr9RnXGBD5icGp5E0ab8L3eO7JClwYXflZ+jXgeB
         hUAtJtgWObNbgmDFArl41DiAxxsRQCU9xLLl/uSXOJ8Ir8Hzailz6Bz67ZMO+o3osJgi
         yCdrW5SFP0saj+IGZ1VSIE0RCpnkUaHEgIdqAurHo0RgD7nfc4Fxzwr0cM8I98eCeFC7
         0yDMhmNX/V6D4S96jvOPx3WnT3ts77ECMhLqdjW6DSJzinlezRn7O7UpssjUmBeolTU5
         FYJFFPTWoksdTYIJbmumB+H/QC8mOPw1KISuxWH0lysi1tFw+NbdNqBLyj/F8wsljEt/
         o2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUpTlGLkLseaSlcsw4C88DRo6WG5HSF4GbLkcyeepjfbPcadeNUCTJBqrv8YLTs7C9pRsldHX/fePEJLQ6H8a68dAax1oQVGZy0
X-Gm-Message-State: AOJu0YxklHv1nbd8Rq0ILTbsUbD5EphdUTRoVQLOAV5DM0l5RG64680L
	c4zq+WuXN4OvWJlp2zNYfTJp/Y+9LmqJW+Pe+q9SZJP6FnSN9K31/o+zZHegQKKBLAlxdAFyfKW
	fCHlCfIwHrZu0fhY/t3tknEXB1d2nO0pLRIQo7g==
X-Google-Smtp-Source: AGHT+IHr/IUKFhapXnOD7toFxlQf0Om4NTc3bUIZPM42rFzdOhQ5udZqS0lilrwVoRYH1x47luPm3EintARWerYH8fE=
X-Received: by 2002:a81:ad1d:0:b0:604:a47e:6e52 with SMTP id
 l29-20020a81ad1d000000b00604a47e6e52mr12358877ywh.32.1708354164616; Mon, 19
 Feb 2024 06:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org> <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:49:13 +0200
Message-ID: <CAA8EJppPvXfkz=wVca8aFBhFaVUe9+OiVzcQUq7D8zPbK+T1FQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

Is it not?

>
> [1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

With the exception of the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)


-- 
With best wishes
Dmitry
