Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E5311C2F;
	Sat,  4 Apr 2026 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775300085; cv=none; b=PGn19DN9ZkY8PmYBhpVUKyRd5tWlg2Ah0L5mO7mLd2veNY3Hj1MKSqe7RWkubd5A6uEYoAf8PVFLe99kRtYaE94GNyx7AURLWX1PC85uIdMUj5mLFb+W3EDJbmCxamNyvaTn3rZ1C23RwHJGL1rb5FlZ8FXR44hwGwIhYMo9IlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775300085; c=relaxed/simple;
	bh=YqzmCL22FDJ4H6tdl281//P3VCxuaCjuBv+eWpZFmtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LscB3Ki/9AzmkDlpLhJFQv1RHA/Ct8fGXdNEbpHeJs2L5n04S+JuMvs2M3FEm5Q6MP/v7brHGNuGcw7sMtjvmKNryJvSmSdGgmTGm+3mUF/xZi8ZeuueUHdyPQZ+HgL5AoXGGxX7LYzYOswnq3/dEZgFnOmCR5qdqrA3rW4GHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaMoR2+S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaMoR2+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A590DC2BCB2;
	Sat,  4 Apr 2026 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775300085;
	bh=YqzmCL22FDJ4H6tdl281//P3VCxuaCjuBv+eWpZFmtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaMoR2+ScBc4ICdiqeig5Z1XIETvaTw2J6yAaHLB37fYMsnV+OVyWjfpZd1NImod8
	 Tq99EwhH1QWkDi5WH1ihjgcMnDiVSCO6bxizOBlozhoHpRN7lXqtaOtOw7tR+h18kL
	 DxJ33b2QNBBPJ1m8MVC8zHs1oloLsC02RpdujZHeY1AeQLgho4+3fIk7sHTiGZaRnx
	 myJJE06bAZ9Yaf6ybeQibi1w/dQ9SvPb+LTj5VpPRlAMDSuJ3OKeAOPxUBkMlMy5Wq
	 UnUH1HMRvTuvLErMgZbhGrZHWKW7EGq7Z+CouS9DA8v+yTPJX8Uxxgan9ibX2FS/Y0
	 EjN0s3RnJI/DQ==
Date: Sat, 4 Apr 2026 12:54:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Message-ID: <20260404-enigmatic-nightingale-of-hail-223a7d@quoll>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
 <20260403-milos-gxclkctl-v2-1-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-milos-gxclkctl-v2-1-95eb94a7d0a4@fairphone.com>

On Fri, Apr 03, 2026 at 02:03:46PM +0200, Luca Weiss wrote:
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false

additionalProperties instead. I will fix the other file.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

