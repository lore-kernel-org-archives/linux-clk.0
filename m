Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7503376FE
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354487; cv=none; b=kKE4G4B5oPtygjR5tWL6XOrHPR1udU0Hq/lae8Q8tecwL+cNcWV6eXwcIxTDRz3Wf9DnqxWaCCPcvcWxE/wscNxDB0gd+Nyihg3IJfIhgVt+z+lO+EEhfAccCnTv90gT1bFF/L5nzj+jg5SiWA1VnwSuozJa7ylvoW4gp1h5Pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354487; c=relaxed/simple;
	bh=rIE0IP0T9iSOPWSlThQHOn9NtZrcV1Ogn8zpUtpc8js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlWWkyE42sD1v/LrhHlSpXhCT9lTH73ZlIXSee35bgZDu8aQ3T7BrJdd9uRxLe3PvOWhMa1iVOpYB30BcTcGofWn7U0gbEvEVlMCx7QY6gx31t4tZIqm1sbqAjlK+V2vGbE3O1akedmNlxroIxgp40wkYn85oCKKGM+Rn/3x8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9BZQrte; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9BZQrte"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6084e809788so3197257b3.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354484; x=1708959284; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
        b=u9BZQrteEfrrR3r7IcyNbow5D73SHZ5BaLxnuMZdhkspfSLFm6DpB1kvbgYYabfLBD
         3Zi/MC5drv2x+vt1wBPCS3OI2yzd3axgnw5Y/PQsu6xsichkNyOYhfp1+Tdktzy8NL0a
         CrWVxzIaJwid4rXlhcWpNcR6CYU/8ptrtn2YWGZjHK9CP0xAjYXOkuEhhDNURI/LI3o8
         svEhklmqdIGDjm/DoUyzcJWyX2M4Qd8VPDePUJ23njm64YgFPQdRNtLmnXKibzXZ9R1d
         RV/6rdlN6ZlMyICoSqbEGgOFFWXxFgXQpiidlMGGCcq8OtSXXrg2bPKZMsIoKkoJgSuw
         Ocsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354484; x=1708959284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
        b=wcEIJUjqtU5QfSP93heMo7CnJAWm7ejJr17TwwNeMnxvd5sR3CEwVtJW6OQqdWMH+G
         c5jPAW2uPHRMhN/5BSRDRigOc6pbFyiMdcgKmSLMDQ6e3PHrcyHulq/fpA9H7ju6QDXW
         JKy0DF9VL75Xbv752/KIXCjEyGFv4KvlRUoOhikRispNaRMmitUJr2YffUTKL3NVgpOS
         4ONLbrUumT1/CEG4aFtx5ZiDBVxaqigO0pwYfVaqXei1WRudWE8TVI1JJAgrscPpejhC
         2e57sqQ0I8tGgAvPS2MrAFP3eWasGgR05D6IJKGObmmnJxACQAJPN14TarmGIEOevVMc
         cyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDsv/uHkz0bI5G4dWVAjecBUyDpXym0l2jDe8hlKKIm2ynMaOf1GPztL+pQv4KTMFYJIguM+qlSyZgXAAFPYT6ZmfRQLdDIDh5
X-Gm-Message-State: AOJu0YyKxbvo5XJDA0CZtdOXYsaA0K4ClNiMXN89MzqG0zO5Vp7Hc7uZ
	fGCdu3+pJm7ba+hGQ0dCmfQKcEuCFBaZUq5pAF1CTPl+Lvw5J+dYB/fZsQUgYsXP9mNF9NFae3Z
	TTlmNc/nJzI6i3CuyC5P67nshvWEmo50Evsz2NQ==
X-Google-Smtp-Source: AGHT+IHg7XEOTTrtpgQqphtP3Xw9sPuPWwJbqow3gZN5qRELJzU++tbN2bRulnySBEDH7nL4PxT+8aS1knEIIJLBbCc=
X-Received: by 2002:a81:a185:0:b0:608:59a5:4ad1 with SMTP id
 y127-20020a81a185000000b0060859a54ad1mr39629ywg.22.1708354483969; Mon, 19 Feb
 2024 06:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org> <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:54:33 +0200
Message-ID: <CAA8EJpq46Wn+gWKL81_zMxyddUpJRuKHDrx=4Q2DvbwufmWHWA@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: qcom: Add QCM2290 GPU clock controller driver
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
> Add a driver for the GPU clock controller block found on the QCM2290 SoC.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |   9 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/gpucc-qcm2290.c | 423 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 433 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
