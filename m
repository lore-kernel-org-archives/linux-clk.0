Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305C332614;
	Thu, 10 Sep 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030068; cv=none; b=ZRBTndd+Jpsby4OZhA1BpwxJKry1Afgq/LLmr3/5olrDm5P4D81iu7TG33j7ZNyzPIfpa6dl7Xydxlr2cqJ1b1RnY+0DbsqdxGC8iRkFmpAepoCQKFa5mph173qYuEoaAI2yScHXsfCINXyp4qPIGeobESeWUDc8KB9Jjj3yUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030068; c=relaxed/simple;
	bh=TzdfLYVdvc/uqvvlLjeZqyr1HCP76+9LY/efm22qI1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqHirfe/YW8UuAeADWPtPIJrHumg29WJ/IZENlZXRmS/NQFFw9iS8RwD1e7FKF8XyOX8mcu2O+Ub8Xua2bm9sSqnEhsCvJqUl9NgNaKAwQw+KF1GKE0C+ZxWwM22/Ic/BZSdwXO/E8SqqX9urQq47kSU249qrsB0QvRajkk2cgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAG2DK2b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAG2DK2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B891F0089A;
	Thu, 10 Sep 2026 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030067;
	bh=B8EBdbpG51Uq4wdWZPtFB02CvwXvIeKHC+8GQIDP0r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAG2DK2bZ/zdrqdTLFo0/P5NcJoT07bCPc6J6NT6+Llsnn+qaWHyQr62f91u5t7Zz
	 DukqGeXzpFmZYflHoH0cm15SnCWqeX3s9mLHmg/ivsTWO5MTGppYnebAplynOwHt/Y
	 jOBN1Z+afz5bytcuJnRw+2yINoraSnNxpBFVcl+nxI43kQWZlg3EbNXZiRzAbam3HV
	 xNSkzLSxwDrUhATaj+7TGXe6HgxN4etrLSgL1NrY/o5YWtE47J0N7mlL+6SFLPGHsp
	 9L3Ajad1fS2dH6m4qyy93p+LZRwDKbmin2b0d6d6wKUGgjDQERQEoJS4TEQsIcu+bi
	 KKCCldgPGQpFg==
Date: Thu, 10 Sep 2026 10:47:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC
 compatible strings
Message-ID: <20260910-bright-spotted-cuttlefish-8d6b5a@quoll>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 11:01:22PM -0700, Vivek Aknurwar wrote:
> The Hawi SoC is a derivative of Kaanapali  with an updated camera
> clock controller (CAMCC). While the overall block structure is
> similar, Hawi's CAMCC differs from Kaanapali in the following ways:
> 
>   - Uses Taycan EHA-T PLLs instead of Taycan EKO-T PLLs, with an
>     additional ninth PLL (PLL8)
>   - Adds a SQPF block with its own GDSC, AHB clock, and BCR reset
>   - Adds a CX GDSC (CAM_CC_TITAN_TOP_CX_GDSC) for the camera subsystem
>   - Expands ICP from one to two instances (ICP_0 and ICP_1)
> 
> Due to these differences, Hawi requires its own 'qcom,hawi-camcc'
> compatible string and a dedicated driver.
> 
> The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
> Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
> driver to support both SoCs without modification.
> 
> Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
> strings to the binding, along with the corresponding clock ID header.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  27 ++--
>  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

