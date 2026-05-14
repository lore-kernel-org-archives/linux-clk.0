Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA5397E80;
	Thu, 14 May 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754140; cv=none; b=T4j+cZFkGrWKIp1O5f/kwIPuLX5emVq3cN4I3F0Q51Q0YMqw60QoqgHGh6vYccHEXZvF9nLab+pPe+pHAJvUo3bQR5VBRhZMnl9ul7c6R0SO3F8OolYZagzGYkkFIG0u3LxLxxqxzwaxvwDHFXGWu1Xhc9V8L9LiN09E1Rot+mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754140; c=relaxed/simple;
	bh=FtRbZ01KpPe7RoZcygOR6S/KKJge6UxcovG2oSv3GME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0Adem75NE6gyRipe6LchL4mWlguJdOdYQwpcKi9vvnezCwcdBSayr2SUtd5JHHH1X4p+Zp9J+rlNMWiRSb5EoWOS7R2XyOSxHwuKbcC6rFGGRP8Bo7Oj595l6z78iaHg9Be8nplNmpP0St8yRb/a3RxfL9E/0K/7j1pmn/tVhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUJvu313; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUJvu313"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9767C2BCB3;
	Thu, 14 May 2026 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754139;
	bh=FtRbZ01KpPe7RoZcygOR6S/KKJge6UxcovG2oSv3GME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUJvu313ULp0O4s/WSpjv1qEtO2qZteX9/qPvn4uH+0GVDU1NaJ7fl1LRV/IG/N07
	 m4qWHZCwZU9cJAA1JwiYXbNQioI1LgC5+Vcn/d6rYfZ1D/RFM8ROlHtPbRb3kj4cn6
	 YzS9SGXZ0bgqCBPQHNVjlXpwd3SNGLISSHqF47DRmf8JAM2y9Ch1420KwNUDG5AOwF
	 370CE+Vlm5cgvukm13QxfBh+ZSpzGSa529fI3vZ0l9BlPFW2XFeXt/kbzsMhaQO0Ow
	 MKUSE2YhxVy908zz/YFCZu2nAfuocHOF7Tq5GMfytNOGr36obii/ed7R+5mIjaJhc/
	 98bx/iS0tbDVQ==
Date: Thu, 14 May 2026 12:22:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <20260514-outgoing-literate-dove-2e2a73@quoll>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>

On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> required by clkref clocks.
> 
> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> differ. Document them here for qcom,glymur-tcsr.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> index 1ccdf4b0f5dd..57921cb63230 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> @@ -51,6 +51,63 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  vdda-refgen-0p9-supply: true
> +  vdda-refgen-1p2-supply: true
> +  vdda-qrefrx0-0p9-supply: true
> +  vdda-qrefrx1-0p9-supply: true
> +  vdda-qrefrx2-0p9-supply: true
> +  vdda-qrefrx4-0p9-supply: true
> +  vdda-qrefrx5-0p9-supply: true
> +  vdda-qreftx0-0p9-supply: true
> +  vdda-qreftx0-1p2-supply: true
> +  vdda-qreftx1-0p9-supply: true
> +  vdda-qrefrpt0-0p9-supply: true
> +  vdda-qrefrpt1-0p9-supply: true
> +  vdda-qrefrpt2-0p9-supply: true
> +  vdda-qrefrpt3-0p9-supply: true
> +  vdda-qrefrpt4-0p9-supply: true

Either I do not understand your previous explanation:
CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY

or this is still wrong. There is no TCSR here, so this proves nothing.
If TCSR is TX0, then you do not have five of them...

My previous comment stay - you are not describing the actual hardware
here.

Best regards,
Krzysztof

