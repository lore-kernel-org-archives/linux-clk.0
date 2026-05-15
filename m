Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA83F0A81;
	Fri, 15 May 2026 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832662; cv=none; b=eYMFrnRuXiAc4OYaAGpIthpTLmZPHtV1KzcchoBodJDMwClo/DFN5njJt2OwowwFYZlsFnod2xAZPKZkYGCyZdYk0Bf1zOfZ1iX6gTrsI3fNYf5Md7xanmtIRV1vXX+7bvmc8KivdniKFXW8Tv66E3+TtVusS9IOILTan1uPpDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832662; c=relaxed/simple;
	bh=dY87oxcNd6Plp17E/7k3+AqTR4VAYLZgpmp+DlDQquc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TR9+gKAWXAAawHjoowrlU1XtcWgG314+2vvcVrwFAOq8HeOBC32CZ5XkYcimSmOXAZdeH4Eq4H5+/T1kGPECz4LwqwQfZnYFQoUzPMvTJonm0YNmIZFqAkb8pEOglR9FEuCiTArygdiIJxVJoExykQd4rybbN/1em9amX3CCiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oi/UuL1L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oi/UuL1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC60C2BCB0;
	Fri, 15 May 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832662;
	bh=dY87oxcNd6Plp17E/7k3+AqTR4VAYLZgpmp+DlDQquc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oi/UuL1LieUa7RCIK/099R2KfxRQxtNVVvuqv7V6a5QXlf4EpSLfD1Cq3yqekWzvV
	 MiCuerQyqg6H0oLcbHVMcWSy1EY7OyLnPk36DDtyosritaAITa2g60jAGanGoTZsnm
	 29ItWZFesltRiqZZVSq9a6yI1N53rkV2q+XaoH6qLbDoke9fMz4y6rCVH/R4eZnPF7
	 SVtyAkyCWBreWqIHKuhdVZbsnfZl1UfiPxj4Wd7CAJOBPK8mSFnosRKa2umf5FH2wo
	 eIuTcqaiaiXfb2xfDypx+R7RDt+XCDQ2sIRBzSWa3a6pFXQ9zJ6sRHnTKS3OaPzbpN
	 ou9iPZ8j3uohw==
Date: Fri, 15 May 2026 10:10:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
Message-ID: <20260515-resourceful-diligent-hound-b666e5@quoll>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-4-41cb4071b7c9@amlogic.com>

On Mon, May 11, 2026 at 08:47:26PM +0800, Jian Hu wrote:
> Add the Always-On clock controller dt-bindings for the Amlogic A9
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          | 76 ++++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      | 76 ++++++++++++++++++++++
>  2 files changed, 152 insertions(+)

All comments apply.

Best regards,
Krzysztof

