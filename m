Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE33D9DA9;
	Wed,  9 Sep 2026 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939025; cv=none; b=A+45von2MRc7v7O4BlFfWawd0PN6U2zreYlArYF4D9AoKeyNCwRACcqQ//0J/3yN75XGLHHmgyIyHsRyTF5h0CRSfsLIFsRs5TEWvQLZHBjiS2AYmnyOh6nR6I6MQ80Lq6KVhHys6BqwmPUU3RE3SPFJk3v200Q49qJEIDPOlKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939025; c=relaxed/simple;
	bh=r8Pt05tOLsQVDNpEjrnfBltDznJH3HlN+GGjwIt/5vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdIuNtKw/0GHZmP9ks+NE7XUiG+g821MsI4s26a8UsDj+hCK4pcYoBwQrBbhJ3wXI5YqCZZgVGqJUZg0VrQ0HOWRbbMD5UuIhUyzqrOAxDWsatnuMOubtaJKuxOQou/FExNmo/NhyuZ0AvXBiIL0ifOWzF1rD5G21uw2MMRZCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ry05l2AG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ry05l2AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D461F00A3A;
	Wed,  9 Sep 2026 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939012;
	bh=sMcLwJpcSb7+w22fu/uKQDJRMv/mZfHVYmTvM3dJGyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ry05l2AGPFbuEm3vj0K0mvu4uXnh5I+6d1lM7v1nOmwOTaU6RuQ7hqG+ECd7vtgU/
	 /TBIEDK2f5OCl2rPtlgxhlh53/bPEOZWDDdB4s8IaeeNlRADr0z8PvbuJYNRwxySsf
	 WOK8X5VMWCFXoFN0nXZYEhm4FDkEqYRpV7YQbqhm78W08ttcQ1NEkaKEkLAzaesMWE
	 5pKNtzEclT9zsSvAeFfsah9udo+v0U4oqsP1KJk/LSs/2utD8JVHzehON6jL5UfZGT
	 HxiGJkgGTKXzg5410y9pDrT0k5OHPBHLMd8Z7OU32XcUcBg9Pr/77DGyT8Iibs1yEe
	 IxJMdxI7EvT5A==
Date: Wed, 9 Sep 2026 09:30:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
Message-ID: <20260909-devout-generous-oyster-0efdef@quoll>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 12:20:42AM +0530, Jagadeesh Kona wrote:
> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
> to reference the shared clkref on Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
> index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
> --- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
> +++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
> @@ -20,5 +20,6 @@
>  #define TCSR_USB3_1_CLKREF_EN					10
>  #define TCSR_USB4_1_CLKREF_EN					11
>  #define TCSR_USB4_2_CLKREF_EN					12
> +#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN

I could not find usage of this new ABI in your patches. Can you point me?

Best regards,
Krzysztof

