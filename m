Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508964DB552;
	Fri,  5 Jun 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661286; cv=none; b=KWhQM4allZT/WEVnCDTHJoA/wwCSwIM0NO09HUUjILIyBk8M+nT2swJs32LA6sL46ktiQgRYSqxlXxTg7MRTjTgeOTXP7FTmB9FBqCtQSTMWJjN1xGYYZgdLLw51wCVQ66Ax78U+GExv0tAaMKQTRaICPNKxixgiJK1LizPSRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661286; c=relaxed/simple;
	bh=bYsyRN80rvVzphfl8X2OOPltOjWP8DNcraQMnD0hGgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBwgo+oqUu943tsE3TDx6PMozwM3MA3pByHNcgekTisdQAMO0cxl8SmcMAXpKgSQDbjnwSwdwdUs9WsjMReA/0m82IMi5f7KbW17vKieCJnU+PCBdc96HVyD/jnK4L9fVL7Ga1yBSl4UsOba4fwAkq0uYUiJnIBkozuWrBxdnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUDrTJsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUDrTJsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10481F00893;
	Fri,  5 Jun 2026 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661284;
	bh=dBLrAWW8qiox8auUietWNKNjQCGQzgV8a+fU6w2DVjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IUDrTJsTJgk18m5Sigl67dc8ooZq3Rwk6WX5c9qIPK3fVVNPMGNLPPOzE2keyUg9Q
	 TdkBM3QckvnuiwGnjU8Qo9MmKROM3D6VC+ZZTxD+8HwR9Ln35EoltFFujPfzqxNMo+
	 +YoVbl554bfrBoW4eLURGLgtQGRFPEGV7wIWhtfJdAzGmQkTwhsPCNelOD/Z8MjAio
	 A8enw5gSvkRgr2X3Rktxj1zHtXNvt4RRa1o2vrd3OAd5y1y+dLCDxx+XOpCGSnqFuj
	 D6z5xSEwRYYeNjFf8NYCAwqzItIfrvtkAFqpfn13wa0RFNwghrDFFiCoQp2bUScoEH
	 kZGX6bu7KB2nw==
Date: Fri, 5 Jun 2026 14:07:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <20260605-quiet-affable-mackerel-0c0a97@quoll>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-1-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-1-fec6ac8dba02@smankusors.com>

On Mon, Jun 01, 2026 at 03:51:14PM +0700, Antony Kurniawan Soemardi wrote:
> Document the qcom,rpmcc-msm8960 compatible.
> 
> The MSM8960 platform shares the same RPM clock definitions as
> APQ8064, so extend the existing conditional schema to treat
> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml      | 63 ++++++++++++----------
>  1 file changed, 34 insertions(+), 29 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

