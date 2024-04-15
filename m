Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED63156652
	for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 20:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211471; cv=none; b=R8tiA7/eaglGADp+hZfbx3LtPiWu8JyadqGl0+/GGIUvQsexBba7DWaZDIuX/LLFKCnNh/S5qu2K1Mp+XjNdJzxpoPdnkoRxGxA1PjZPmuQxuEZ64ASxC/hSmOXnWd6sv6OfC7bB611LZSZzu+cBfkfvIeDW1CVR9Q78K4hjcDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211471; c=relaxed/simple;
	bh=HKevHeXkZGuoEWykBFrnnyLmHY+4admTUN+lZ7NyEtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqKmTvoxtcCuuR2VSpfjcE+9Ngn4a9Ro3ts8mu+5InKgXiGunw319AUVi3lyOP7yRFVEWGHMy82xl3BZTVh3dkODNqHzht3CNMIOK2nCCRHoZCnTDiVhuDRHykNoI64NPGlde0cHXAXDeSiomfTAiEGvNWDmXLhl3oG8ZKJ1f9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2+kMCpI; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2+kMCpI"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc71031680so3522956276.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Apr 2024 13:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211467; x=1713816267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x+n4yDNeHcrTCJc7XCA965ghIKCFi6oK1ygO6iYz34Q=;
        b=a2+kMCpIIVUrD/mzkxfLOFdfjNSVCTHrvIByBROGwHnn8ZyCZCe4K/QxjDGPx9A3yx
         mHX/UG2DygM/BznGHKBgqdN0M4wrOf830WA6PajdZa7lNamXACjNSpz6TdaYbOz3h6lR
         RJ4/qpr70Jsi5boycQTlvJKEM/LmHY8Ry18EGIa6JWizEunDhBTuyaIvdUE9lArlXOhX
         itvNy8l76aSpUqQaEKOTBZtAGOtxqP6/eNSq0rYoij6oayP/+gjP6yFgAcDEpv77QR9l
         vQI4IswKAzFbwZ4Vh8QWlBVreTDMxOq9zWEUBekG56C1cnWEuWkOJPleqLWsyuDpCFzP
         d9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211467; x=1713816267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+n4yDNeHcrTCJc7XCA965ghIKCFi6oK1ygO6iYz34Q=;
        b=Pi3kZvHql48U8t31DKhnW5Zti5g/aklIgFahUvHKAvh3E76hkfx2MaxLexn8an0DNy
         /JWBeFX+F1X6ZGl10r6z/Zwp2PP1tobtdhQlPG1XjUmCimRfTGM4KIzyMQM6wF+7MPyb
         7HGmfMY+4Bd+y433VAIN3YD+nMUcol5jvUeNAEt0LFFa0snSabahlVTAyNyZeB5v33oH
         1QG5ZoEsWhiRtrGGko5x5EcE2Cdb6CIzqCIg3AkgL9VsnjRQIYA0DOtJd6raRYqpm+1X
         n3KZrMTCedK5Pk8W85jzd1vLNd5WzGUuFneT/XJHWXuW9AFuo5N6qq9E1rfLBR04oFu7
         itRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFffgsascjx+9vTJt9xUdSWiXl0+KIg42zy007ZYCpVdlLlvFzx2IaYagesvio6FcQXvymmsnCwyh7EfjaSxQ+3omsg+WyUT5X
X-Gm-Message-State: AOJu0Yw5kXrPhECU62s6zzgas/93kHNIwXWq3ancX7epDxonI7nVcphg
	HqGNc2r1xSPdsrXA2vgIhnKFsoBr3pj28F3tkXSff62TGOY9y8WwRhXohXHNJRQw/MNwNz3H/A3
	Kl5dNtGyISlI9NCd9bwKwfiWhptbHnGxW/uk2OA==
X-Google-Smtp-Source: AGHT+IFgChYQoIbtXVFNn5dpONcRCuNNKjt9lSve7LdO+2SQ5EoJ4jqt3753eEsEcQ7mld6BIqWcJDJtBnxGz7Zk5/k=
X-Received: by 2002:a25:2e0d:0:b0:dc6:dd80:430e with SMTP id
 u13-20020a252e0d000000b00dc6dd80430emr9293179ybu.27.1713211467602; Mon, 15
 Apr 2024 13:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-3-mr.nuke.me@gmail.com>
In-Reply-To: <20240415182052.374494-3-mr.nuke.me@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 23:04:16 +0300
Message-ID: <CAA8EJpq-UOd4dcuLyEvJNW4zckSGq1LSdq4eDMWPHX_98U8F=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] clk: qcom: gcc-ipq9574: Add PCIe pipe clocks
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 21:21, Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
>
> The IPQ9574 has four PCIe "pipe" clocks. These clocks are required by
> PCIe PHYs. Port the pipe clocks from the downstream 5.4 kernel.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq9574.c | 76 ++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
