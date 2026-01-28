Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F860D531;
	Wed, 28 Jan 2026 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598940; cv=none; b=JLMDGNky1jgBZEO5DR+J1vhLBwjWZIJmE4JsxALfG9ys31A5RnnRy6gmebLvFoGEPMEdOJFjUyBZ44FG6B0hyGJPpC5n1jfZSSBF2Z2MuhFFr+yaKyT4hoGgd4/LiWoHpZafgTMedeZgBgGo46xD9ol+pfuhkEmksrjmFayAwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598940; c=relaxed/simple;
	bh=4QJmbrdWGC21YXom0HQYBpYjBnKXGyaZihiwnMkdg9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAM8AqWu5jbnPSOQ9nVC0H/FimVDO4nmtpbeN0b7r4kPgCiNwx4/6BvHM146SaBiaKkcF/x+WkEi1gLuyX04CZ9dqig9E7New9SUNY1av9VsKcMtKibZPGYvRXeKdhtcdwQyv7Z5yyEt9OxEhPlOai+YCYnDUpGh1wG9YCNVfKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGHCTUyX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGHCTUyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCEBC4CEF1;
	Wed, 28 Jan 2026 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598940;
	bh=4QJmbrdWGC21YXom0HQYBpYjBnKXGyaZihiwnMkdg9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGHCTUyXgo5tnhKxdk6bT/+qKK01G4VrFD1N5o1MKKXJk/n1wA/Vqs5zmMBa0A9Bk
	 MeW+LTNfm5x9thAOGPx3Qy/2IMU4CXubRRJOEGEWKn8xZOaU2cPh6z0AZ7MLYhvEHV
	 HmfzWsYQ8HQBdbqtcvNa0rNwk0q95YRJdgBEgIzSTrLwtue8MDSrqzBUtUgWo5yGSG
	 ljxiTQXzwcRZj9OuSRc03utSmsfVMGCpFLFN2baHHCT3F0mg8WJ9r2gvtJp1crlTek
	 WBsyDr/U7MyHERXh2+yR5z7JQXDShQF2OaB1yZJxkalyFx0P42fcKz75tXTBDnDKv+
	 SVw7vontn+kyw==
Date: Wed, 28 Jan 2026 12:15:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Message-ID: <20260128-electric-wonderful-ermine-bdf67a@quoll>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-3-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-3-ccee9438b5c8@oss.qualcomm.com>

On Tue, Jan 27, 2026 at 05:03:21PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Update the documentation for RPMH clock controller for Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

