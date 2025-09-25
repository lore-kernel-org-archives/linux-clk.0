Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC0221558
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806098; cv=none; b=MaVhcG1/7+HWMD5/JaWV5OTwQjd85taKQ6/FCGcp42Vdx0yQcXHEdCRRnp54JGTfGVSD0KIgOddcX5I7oRv0DZOdxeywlEVcjvzIwZQpArGv4X2XaRihI/aBni4QFemH/vXQzZDAvn6MuOfyTQP6We+Tju0J1poHnOEa+t03t0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806098; c=relaxed/simple;
	bh=062M6/8j4NBzg2XWFjfBe/0J/9992fP3Zjk0wG8eK8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDoguZyYXBXL54NbU/Ev9AV4xOay1AzhWIlHWA0TBonheODWJTo+lUU3c9frkA1quZ3vXCEgjAfgv+EHt+y9D/lLa7ol3n6/CkG16tcqUVA7kBxUeD/7GtClYgSE+Jp/48EbYSEr8v6ykmikRt5faANXAlWXRgFovZzfEjeBTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3jlgsRY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3jlgsRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7FDC113D0
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758806098;
	bh=062M6/8j4NBzg2XWFjfBe/0J/9992fP3Zjk0wG8eK8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J3jlgsRY0/E6Z4oiW+LnGS/HJQC3hSvvTz3GdG2WpmcNMywVtx5FgvBYswTN0y63A
	 CY7WZCYcrAvR9n5JYYhPld9yuB0K9R3zwKH5JMCrQLvqq+Tpqc8+aJft2R8pZ/YDjO
	 xKYKkvQlXMv2dLj6FRuMFAlZqaguPnpSCv/FmuQ7egNRDcziNADCPrnI0FfuG4fe6t
	 SHS7/m5vr0YzA1bm5ZraTT9wnwijSpxEKS7+nwVNJ+wqNmkIf9zjXEKZm9xpVaJota
	 ESagvtM5tb0GlYoHqxN4kwYAVVve2IhoFrMwNApJ1J2+O0RxOZpJx+Gqbiz0BfskDv
	 kxT3RDlfI7/wA==
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2698384978dso7355985ad.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 06:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj9u+Fpp+/bEqZKnlYnaeNZVKhPqLWZW1Pl1CNtEyz4qLFk8yVBnNy43AgKpMKxowXvNx1ZpWyGfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhG3nvHzwKGP2hYh1jiStzUHn1IW4epVQVi3LwzZ73+K13pCF
	/kCBAG0y+PFBlVzKrp4ssDJqD0p7iYDB3v3RngIjhlIzp+HcTBBoYR3zMQ915n8nGzI7DfIDKzT
	QrPmVMhHfpwLDz36iBRUdigKxfKUw3Jk=
X-Google-Smtp-Source: AGHT+IEZTnk4r2+Yb8GhN2efY3oHv0w7Pj85s3V/DNwMNZqwPOEwouLCSWf6XxrASX7zuc/9JwLdyD/Xi3x6JTBBRwk=
X-Received: by 2002:a17:902:ebca:b0:269:ba77:4eea with SMTP id
 d9443c01a7336-27ed4a92b47mr39799145ad.46.1758806097880; Thu, 25 Sep 2025
 06:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com> <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 22:14:44 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc2LwFCW8w5kDEZPAOPz1Y_ix0=jjUHQDHXW03wdcufsg@mail.gmail.com>
X-Gm-Features: AS18NWCtGqOMFzAGGyQqpY8JXXlJLDCy6kxa6YEKNYiE0F2TiXpsp24xv7MAzJw
Message-ID: <CAJKOXPc2LwFCW8w5kDEZPAOPz1Y_ix0=jjUHQDHXW03wdcufsg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 08:57, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Taniya Das <taniya.das@oss.qualcomm.com>
>
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.
>
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")

Trim your cc list. You do not have to send it to 50 people.

The patch is obviously NAK, if you bothered to test it, you would see warnings
