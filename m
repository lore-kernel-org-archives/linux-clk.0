Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A53B14D3;
	Sun, 27 Sep 2026 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532720; cv=none; b=c9aaTBqjBWDGFY3QgwvVXVnlq3qZyvvFNngfnUvP7UV4FiwFYbUbqeCmj3MCZWE358TnEafGCL27EK4Ay4pEyxeqIUoU/zSD5qHJGSzxIk8g3HQqrrZOOH7b5lXPfB8ArEDVudwZc75Q+WbtOb3KYq6lFHm5gRiPPSN3/TXijJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532720; c=relaxed/simple;
	bh=2Esxm5IQ/OaMm9xYfs2PBn6j7bmVrN1jXWogkX7iQ7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb9CYhTHMzau5Cz7NSfwXbTEXli8ENvpy/0Mb/hRX1KfKuAODM5ajU6Yvc7nvMoRKZ8Fsp3xIH9lhat6mjtdGIcy2zhaGH4VJMpNxmo6cLCcGYFzvCaF5n4TzhvmOb6BXp8323Lgs+QM5ROn5rPSj/vBkxkYr6BE9B9JdncD/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXrTLxm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXrTLxm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3B81F000FF;
	Sun, 27 Sep 2026 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532718;
	bh=NpTnnXBBOYDdRey2JbY5SApjxruDOBTL3cw3NiGbLS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MXrTLxm2iD5iUcGuNQarAdR69HxqBdTbYBf0GB/v85NSJmdeyxlmXehnwNa2wed7L
	 ECEppyxLtm2oU4Blt1CnNWAGPlVHOmwC7CJbSNpuoKA3t5qxUUO206NiBvHxsYRnxW
	 X/P++D6WmOtjSoDBMf3Uhefy3tpkRHjJ+RezYIm29zB9SCdmO7gV1CmMMWu0pvQLKD
	 raVmZhdobc2Tf3axav1FcXMKqUtKr7Eo9gUCqc350B74CU1sCWcKw5mTrmvX4SzP3x
	 iwBhOA8XS/aabQk5ZwIRtBK4EfAGbxMWCpHth0aoqekiy4ogiovzDeI57OnjNNSxY3
	 qyo+IisrxCVbg==
Date: Sun, 27 Sep 2026 20:11:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Message-ID: <20260927-slim-tunneling-seagull-eeb3e6@quoll>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
 <20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 09:26:37AM +0530, Jagadeesh Kona wrote:
> Maili camcc is a derivative of Hawi camcc with minor changes, and
> hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
> as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
> for the camera clock controllers on the Qualcomm Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

