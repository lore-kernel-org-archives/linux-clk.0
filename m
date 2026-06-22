Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2722F3B52E6;
	Mon, 22 Jun 2026 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136723; cv=none; b=XKy5WxZrWtiyDZIzMiw/8wMPzmuHfpqRlHWGYmbqmbo7WqMDmbHPPQ5FFgtJLc1Ipq7+EzmaQIv299UjzU+C9v25ZddSJC55ZKSB4hagq/HUirFfjWpCa6K9ZL5Dd2VTfkI3nvbGRAoZDB05Fsst8yo3wU7kJ3+RKCKHEHSIgpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136723; c=relaxed/simple;
	bh=bH/xcw5K7GJShWcVWL3KYu9u8gPe+vn9MQbYu4v47Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6hiIRt6VOENCRSx/X1BL/zk0tXQqjI7tV58hwYcPEwVvo7kHGS8hzIJqaS9EbRl4YolxqYXlizt5y9duX/0kFrSywI9vnzd54D6RfncpRVrWAU+xZUwbInhRONpsIW1Z8tl/9WWtyfqZ69ZZ7hy4+G+wbXO0q/tEQFa8N3a7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnNVSOQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnNVSOQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51741F000E9;
	Mon, 22 Jun 2026 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136722;
	bh=am+wTx4UFWjmOrlNd0YbxrEFpH2wlRpzURyKfJls7IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TnNVSOQllJN8DYP8SG+rg47vLAVBwLi1oC2SEzuWM/z+XU39TMsRDa2vVOvuBsjI2
	 32Bhla415ZKv5dZH1hqRJ05p5IiEbY1xYirBR1ImE7MGoa6uyR7+4lGH2/1Bj00uqN
	 RJsp6Dfr+UMp1yvcxOW5yc3bHDQje5kM6wmW3bi2+8Y0LLFu84a6V0AjkJaZYlhMS+
	 vLbl1czCp1/LA7/P2g1VZSJJRIFjRf3UqIDcXl3laRQopH80OUNsmou9nyi0PWL0Z0
	 q3+4kGkxIVdFaWj862IfCF++Mv26R1cAiw+5A/XQwlGGWN6jQEo7otzNM0QShxxEet
	 fr2hKdVpmKqVw==
Date: Mon, 22 Jun 2026 15:58:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Message-ID: <20260622-complex-dashing-gopher-9f43a3@quoll>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 10:51:18PM +0530, Taniya Das wrote:
>    clocks:
>      items:
> diff --git a/include/dt-bindings/clock/qcom,hawi-gcc.h b/include/dt-bindings/clock/qcom,hawi-gcc.h
> index 6cd7fa0884f535efce90b60997662ca90cfb9b7e..9e0e382af3112b980997f0c7e223720517f12b02 100644
> --- a/include/dt-bindings/clock/qcom,hawi-gcc.h
> +++ b/include/dt-bindings/clock/qcom,hawi-gcc.h
> @@ -196,6 +196,16 @@
>  #define GCC_VIDEO_AXI0C_CLK					186
>  #define GCC_VIDEO_XO_CLK					187
>  
> +/* Maili has below additional clocks on top of Hawi */
> +#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
> +#define GCC_QUPV3_WRAP5_CORE_CLK				189
> +#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
> +#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
> +#define GCC_QUPV3_WRAP5_S0_CLK					192
> +#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
> +#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
> +#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195

I think this should be moved to its own header which will include the
qcom,hawi-gcc.h. We already do it for
include/dt-bindings/clock/qcom,sm8650-videocc.h.


Best regards,
Krzysztof

