Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDB1E0DB9
	for <linux-clk@vger.kernel.org>; Tue,  8 Oct 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398219; cv=none; b=TLsCUYhKk/xCYN7nnHli6JMQluL2V18QLl6xoUfIJegc5eDbLDTdXf811exGAl5KrScgcHIFI6ho9fH5MRqB6P/itX40kD7nyh7bOwkG6oNr/T9/oBjlhoeX7KvmAfDWlfb7q9ngxFjpvcXPJLBtcczrVBgLPOGAkKdTPEiaYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398219; c=relaxed/simple;
	bh=Ez1a1h8Ms+1O98dJlfS1HG3cTnUbVG7/3+aSOkVZLW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1iP/pyX/XtgIjQObK8FSFKCkZYLk5w6mb0mIkKLk5SdkoEDFISBPcsha7hkE3mG+advqYxlmzmv/D0DEl9quObjVIwWwl104Gof5j7m6QjQbo/3TnvtD2HYmOYL9k1dsmbae2wAQEWszJnG+pcZAkLYw400w0IPqWA7tun6fRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnA2a081; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnA2a081"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e28e4451e0bso1463772276.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Oct 2024 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398217; x=1729003017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0854fPv0lxGwhhEzPUBFcu+X9bL4gK6hC6tSqeFnVo=;
        b=JnA2a081KOkXDdPKkwHp/I0d0SpNvJcVPgNpQuLwmUclzZvYqOWhtocDcLJe5TYZWa
         aQroEBpRZyVCuI88ZzODdleKbuJDArEGz7LjO53mrnSiQ2anpN3TSRUFXTNcPqqjbs7O
         AWxpRFirw5Kyzc4S1tfXVDmbnbPevQdOaRoOvXzO9Om4wSJrnI4BfVR5GrfX9w4O3W+E
         MJ3ultnGwsqTaqP8Xn84k8QUYANxmTGMWV8k8vPBhzJFBk3GlqSeH+XFavHlNRvIJdG4
         IBYOEVzcmHJ0d5XAPQa2lgSa0DG4PkaQ5RJDGG3sKrQofUgPrTyhtMQrJMcx53LjxKLF
         1l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398217; x=1729003017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0854fPv0lxGwhhEzPUBFcu+X9bL4gK6hC6tSqeFnVo=;
        b=RFMJhYFk2UD3xIwE2mabbpJLVRXLpfU4+6H1759Yf+hiTfxkkwxKOrOncv4BeXBHYu
         CJccavImLHxSoLOP0lkjRq8lQ1+nSuTlyaAfQeubPwkoBjYW2J/DwS7iezlOGD6mpxtk
         qwQnZ9BaJ1cpsjLaF82fkFspirOaJX8gGujkOpIV1lUiv/6r879vdwsU4Upz16Rm4hyE
         HUBuervuGYwyyrxPwNb7o0bXB+hlyfVyjeepU70VTs2Lw+08nvdwNd7nmpX/9Q/vb2Xi
         hYV7FiiMWULPQplJMsaTCL2TNCumbcCBysZcAkKcylr3GwNtREHtPaSY0K0D7Y6aj6aa
         cjuA==
X-Forwarded-Encrypted: i=1; AJvYcCXuYyn+af5o9l44DvM8B+ycZb28+2uiUY9SCVRFzEEIi6wJKVqSQACycLZtf6Htkpjs+ySabF7cZqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxa0e3W0WSqQEPNY+vJL7u3/dQZOkCK00DbEXCJfAvuIFWmFSS
	Xjh52VMjQ/7WpDD+ZIOyXaLsZgPvXdvDnE6qAAy4VyA4dtGA/8Vw6at+OnLAZUAufHncawMlqbt
	uvZ+LPNJPb+mAAbwIn7bscS+KzWI/osKCJjx6Ig==
X-Google-Smtp-Source: AGHT+IEpdZ58qdVQo5cCccRj1bt7ZYLuIPFt7p/LlY0sT9qZJ20yILj6veCoP8QqMxVxSPJujYJBI+RkTcFSBtzbu/I=
X-Received: by 2002:a05:6902:2209:b0:e25:b49f:c8b7 with SMTP id
 3f1490d57ef6-e28939555d3mr10923158276.50.1728398217034; Tue, 08 Oct 2024
 07:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004102342.2414317-1-quic_srichara@quicinc.com> <20241004102342.2414317-4-quic_srichara@quicinc.com>
In-Reply-To: <20241004102342.2414317-4-quic_srichara@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:36:15 +0200
Message-ID: <CAPDyKFo-x5RDPwh1XxsCqzofMvspux7qt-mrxWXF7c9Sp3D8ew@mail.gmail.com>
Subject: Re: [PATCH V3 3/7] dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Oct 2024 at 12:24, Sricharan R <quic_srichara@quicinc.com> wrote:
>
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>
> The IPQ5424 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 11979b026d21..2b66c0f3129e 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -38,6 +38,7 @@ properties:
>            - enum:
>                - qcom,ipq5018-sdhci
>                - qcom,ipq5332-sdhci
> +              - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>                - qcom,ipq9574-sdhci
>                - qcom,qcm2290-sdhci
> --
> 2.34.1
>
