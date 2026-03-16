Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90663A255D
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674165; cv=pass; b=Tgzls1VZPysp9HN/MZ81gf+CzU51BAEvmyKCDh5BAfazomWTwaEkw8dYc/4tBz+RC81yanVxJVNrlAjJFiqa/Ab03DKkPMuiJ57HQ5FbzBMneWCJPLIB8YHFcJ0HmDtkYXFuoebRFkfxQ93rNTtdffxREIMdIQO8wI4+FYzQmcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674165; c=relaxed/simple;
	bh=SGrKOh6DxyjU+GV0XnOjtJnq9uPykPDANTIFfa61QH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFGhyFm/uAwgtxxvEP99K5D16RYucnieuFNxHPSKd1xuYzxQN8o4OD5KvGM4QQje609dVqIYs+15puN+0SunLG1Igm5Ig0F0Pi07/HiMZl58xSFuNWBqNugOxNo4K+q/IzbU8xHS+jwzHedAFVpYyOl9vsjZRDg04KDIaNXpZLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jtsz07GN; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtsz07GN"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a23dd61c1so43777801fa.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674162; cv=none;
        d=google.com; s=arc-20240605;
        b=PaweIbYFXOFEBxHvJgg8FRl3HgcAQBrX/iieHeljG1ErXxmf7zdXrVVgyKrv32Zq0n
         fKcDKz4bDUlN/I0nr9X/YGdcUKLHA5w8wmxqKNSx9z16aL389eFOtLnlmBooBCjV4Qon
         0NiR9QIxzzK5HNdC/YHP9hSCfu8zBF8wbUKi/MkOzpY2CXtEdZJUnVukCHgiuYwGrC1Y
         FX8y4HGtmrETH89xgmF58bfUx/gQtPeUhA838egHLYZdARKgp+7XdWzhIZ8iCGlsauKz
         kPEhuGOT2FN3KXgeZ85dnf4EUju0xrX4u04Sy6KknWovDExaRKkXNYS1CANXteNblUFR
         f4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        fh=ivoBcnrLoW7+zmI0Nbdbwu/x9IG/etGxQI9I1UTheU4=;
        b=Z5t6r5Y+qqXa9GOzFepDf4UCUZiA+vxzVKjSS0aMbt1BZ51DZT4Ib6TmklvTddWgKv
         HmCMbwI/Mxce3kGh4RAB3DCLz87qhtlIN73xkDFKB8m99cPrDlnysQzv0hKh0t0tZhvX
         ZGyKNrwLfDxSc8EmXnZbI/U52Hg7g4zI07it6v6CwAP3ZhcmcKKZTNqZ/gmwWmbGgIJb
         w924uqvVeLY6rFf1h0ccrLj1W5oZ7iOrznbrT5j9A6KFb1f2dtW58fKxd45cTiLkYsgc
         fKY8dwALL0hjyU+ZuM23W/E1hbWabgmd2HBsjjJXrzaY1k3OcfceOfj2WM5lNuqhxihq
         RH3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674162; x=1774278962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        b=jtsz07GNFeAEXMC6uCu//Kl6N+FETjCtKU3pYIQGECDs/OEavmObeUfyyeV4xJYGAa
         JP3KQ/hR2fIxtUIi4vLy/zrESlImC2KgV8N2BWbuXtqq+lodc+6T3NnuRqHg/36XtRM8
         2jyu9oHE6oP6NpGRlGITsvzGunnEG6OnlOq+XQ97omXL/cGdtiRTfj4Xkypi8XBHzq4g
         hi+9JLBr+Fek8NouPQwdUQ8u72u5DpSMoK9DWQbPZASR7aZOntoPxVGjLJ92dI9D9ZDU
         2sTvLFOCqHr/zBXOFcAZpEH5e95dpF787Uv5voUdcW0ozL5K2Y8iC6mjSxDMc65Hf/5j
         RUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674162; x=1774278962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        b=WFk4FGAgg8C3EUYrAHggp3vo3gBt2o5NhQY17KpEYMZkVpP1e6cMxpm0JPTGtobpnt
         +QSf00akS1A1AcrR0bKsi90juUzkCSgHaT1UqF1oRff4pw/DF+qao424RwBAYWLXidVY
         awgMeRFs7iCeUIsf4QIURi8kgz0yA1mk2U9EEF3+LjstBmMJWq8mu171YYHh48GClFyE
         1UEshNrsl7mav8vIn0hU63UNJaNVCA9iDpwiPk78dZjUikTIjF4j7AB7fM5RodEf4t0z
         ccPeQqIMAPWxW1lTFUiI/gCOFAlGHylUP+irOBsdQYCJ9VkucLmBCaZTkGrzT2R0zq6v
         jwaw==
X-Forwarded-Encrypted: i=1; AJvYcCVif0z5B/yj6dZg4ffGy4MdCOr1t4ZBZXsA5JL+xuRQvHPfdPXRstdr8tsQHyvY+0sWw5uHVGPhzeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZy26P49aUYerbFtF4nEX/N22ErN/EA/1xtY0JIEqooA+h+z8
	Lpyf40rGOoHXVc+eT2xtdoMeNd7pWBiAtpiwt4TJWV0i7i7duHjnFHrU09pdolNcrWNzhx3IJ+s
	qDR9n5gbj81N6QmPUby6+4xgNMa14HCa9z/SPQAZ+rQ==
X-Gm-Gg: ATEYQzw/f8JfUFkf/n4i44id5aPs1RzSuAMxGmAIHCPu9LpNlt2jOmEbeA7adqde/2I
	qebo3Uen0zXhEkJ/RAQhxI9VY8tu2vJ8R9Ot4q3MYOtwiGojxGMspL4JAgPhL0MEJ4vefp47Y1W
	hBUT2UipOQw0NC4B/V6yRn1Tp9W2h0OIggyebiYG4O882DxQjv+6kkqUzWp9bEOIqY0U/TCdNWR
	WnUrmIU3T9PENt/+cjyAnlIaUw3QYTP+KvtYyGDGe4dV29FptpCUobTjuWtcam4R4ijC+eU/jaG
	g/8W7J8F
X-Received: by 2002:a05:651c:b1f:b0:386:7e61:5de1 with SMTP id
 38308e7fff4ca-38a8930e573mr42245921fa.0.1773674161832; Mon, 16 Mar 2026
 08:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:24 +0100
X-Gm-Features: AaiRm5153tShsk2TIyyE8TGCBjpaUzTwpROv6h6ltabxhtejv3_1C_1EaRy8Em0
Message-ID: <CAPDyKFq-pyTffu_D_eZAZQo3e=vkO3uhQ_hAjS-s2DY4TmXoXw@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 at 10:46, Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
> The IPQ5210 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 938be8228d668c87f0be95c63d4d951ebbadd4e4..fd1d5b04e7556903daffe86e455fde11be0dbd9f 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -38,6 +38,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,ipq5018-sdhci
> +              - qcom,ipq5210-sdhci
>                - qcom,ipq5332-sdhci
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>
> --
> 2.34.1
>

Applied for next, thanks!

Kind regards
Uffe
