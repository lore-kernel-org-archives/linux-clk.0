Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A0BE5D
	for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 07:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7iXb+7g"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbd4608121fso496495276.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 23:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142196; x=1703746996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lPoWLPGRoJ8TAvIq3rSYSVRoLky2Dc/xP/dnXpyq+Us=;
        b=p7iXb+7gJpq7FyH+kVjU13oWnAQG8uvCwO7I2BJAmdEwKu9RBX00URJPtYOwWnNGLE
         YgaWTYBlZpk5Dq+GVISIdNPvQK3wSuiy1ot0Lv/7LuhUlPdYtNn3qF8GpRStxwBbxXXY
         3StcrA55Z2VVrIWeocN9pbWEQ720WddLBV3iSu2x/PGo1Zc9kQ25wHkd+oI7xZZ0WKBa
         P8MwxTurJBWDDFPIEHKkn47tx9b5hmu19rh7aKNxb3E7cqgaajpP1ogJgqB08IZtMcwg
         B0AeMXPueKbSUZHJ8CLI/dFtaOl4hUDuHIneBxldnlT8LvY+CPU/gk4tRIdXPW4T18JU
         7kHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142196; x=1703746996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPoWLPGRoJ8TAvIq3rSYSVRoLky2Dc/xP/dnXpyq+Us=;
        b=eEei6+uLr3CE+jL2krwkgHtUlFT6dU81ZR7cC3hg0lN+evInPNeM3B0+QZomOjE3ek
         WB2pS3Nxuxig60MRfCB7+ruj0ToSWEwAXzt2By/7lj6iQje5JZc3uDW6+3z2nCPU4HrA
         KkHGOOGoSoxcAPfa7p7i51q4i32CIrClVy7iA2ruT8w0a1Gd1iGNyvCZROM2C/nGpRMw
         7jyimdodPtJhByTFLTUmC+x60t08tgSer/2XVINVDM5KWirKYv3qkQcgI5kTveoQEbY9
         YcX+VhKi3fWs3Ml9inhKcsVA/KDjAnt1WxOa115jg7yxhxwva8IYx+MACHKab4ur8NVk
         hORg==
X-Gm-Message-State: AOJu0YyBlupogvy6HTz+Vcpx0zPkRh06sYqKs1aSi5dz/y2BXaRgB3qw
	NaOAV2yd7zPQSvLVa8JaQEVS/9cCJY95Np4ThJWH7g==
X-Google-Smtp-Source: AGHT+IE47ttPlc1KbdGexvuAvgW1TXDOsv8bQFFLJoQS4RKAcV1L1htOBKX1GvBebXBNn/zwxaqzOiFyJMcGHWWhFQQ=
X-Received: by 2002:a25:c510:0:b0:dbd:5bfa:9681 with SMTP id
 v16-20020a25c510000000b00dbd5bfa9681mr713526ybe.37.1703142196127; Wed, 20 Dec
 2023 23:03:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-1-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-1-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:03:04 +0200
Message-ID: <CAA8EJprRjRJsV5hPR6mzjgucKa8UEthJd-y573aYJH0P8QRWqw@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clock: qcom: Allow VDD_GFX supply to GX
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
> In some designs the SoC's VDD_GFX pads are supplied by an external
> regulator, rather than a power-domain. Allow this to be described in the
> GPU clock controller binding.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gpucc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> index f369fa34e00c..013ef78d2b31 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -53,6 +53,9 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  vdd-gfx-supply:
> +    description: Regulator supply for the VDD_GFX pads
> +
>    '#clock-cells':
>      const: 1

I think it might be good to restrict this property to a particular
platform (via if:not:properties:compatible:contains
then:properties:vdd-gfx-supply:false).


-- 
With best wishes
Dmitry
