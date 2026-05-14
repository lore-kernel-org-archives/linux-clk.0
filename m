Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957838D68F;
	Thu, 14 May 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753917; cv=none; b=akBzyySvweADKvrBuZVLzkJmvwlVppvXgybOWXR76XQKR7u6DgDwNRSHvbRGl4qkXLiuNF15F+SL1PNDjHuKvPzMmyKPMa1ltX4aLHLgyFChaiGn6cnHGGuzTEk+CgHjv1rBT1BH+40dOe0QkVlNPFwKYPVT3Yp5z9nlG7lx08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753917; c=relaxed/simple;
	bh=ZGWiAPbTqoxuhJhRPMeTnGjOAtHOa3jNZ5ZiMKaEnxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELsDRcthANMuXvcc2FIp4NmlNcCCCpiKJfSTmdoaDXV1kW+HmfAVkOmh+5GSRaRpcuILXSh/Af+AGuSD0TuRb70Zk3ff92MSIJNGdyiBI2JqyiR/bMLWEankQQAaZmxDNzCwO1O/cuipUhBYE4SDNQy6p1HS6HvPObiqGT68E4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fp4rGbat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fp4rGbat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8261C2BCB3;
	Thu, 14 May 2026 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753917;
	bh=ZGWiAPbTqoxuhJhRPMeTnGjOAtHOa3jNZ5ZiMKaEnxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fp4rGbatiaMOWKd4wH4cmd0T542EPya70ORRMod5CQ24BC2eKMW3AT2LM+cNqlxzN
	 ixzWb8VKTQa5vqphpiA5O/ivx9+BKluroUUGXhIxmTnEo4eYYc7peeJzK2azj9IKeG
	 6vX0OeCyo9GTQCeDEccmjrUrMCAB2ZfFjFnLLHmyCrU3mZe6LyS08xoWuT9yEayW8b
	 2iN2hxLFvcOtHVVL6iMU6Tb9avBr+NFXZJNysP59U9TYcGc1b+k5ONqjtsehdUkLy+
	 QDrn0D92+HPBQG5ZCLd0UPuDX7PM2vVSEg6EYP5TmTmgottHFXvi6x1FwesAqG/LYk
	 9Q3tW8mGsKZYA==
Date: Thu, 14 May 2026 12:18:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Message-ID: <20260514-obedient-crouching-bulldog-7d63a8@quoll>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
 <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>

On Wed, May 13, 2026 at 08:57:36PM +0530, Taniya Das wrote:
> Eliza Video clock controller is on CX and MX rails similar to Milos.
> Add compatible string for Eliza video clock controller to the existing
> Milos videocc binding and add the dt-bindings header for Eliza.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 2 deletions(-)

Please allow others to actually review your patchsets. You sent v4
immediately without waiting for v3 review.... which did happen. So now
please address somewhere comments for v3.

Best regards,
Krzysztof

