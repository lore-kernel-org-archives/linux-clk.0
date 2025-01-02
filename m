Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B627194AE8;
	Thu,  2 Jan 2025 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735806462; cv=none; b=Mbe2vsG2VbrxTIme1193lwaGNS/72xvKC5zFOERjkaT3hX6Ox7jsg5tJrpUwSk3ALE3QhnY5E+ugVpcUEuwxjyMhcjqVzPq8tVKYaGWgngRtm6SF2j1jCBJSJFSnYTNELWMUx14q92+7BjmR63+cjdbOGHpHY9abBxgo6rWlBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735806462; c=relaxed/simple;
	bh=9HDH+aESakRtnN+qhOhRNBH/fPUV3uRnajx2UO2VCJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtjRZhKW1exsdM4n3aRtH2SD1nnyk3MePwXw9ttmMxZhNtQkJfL6UKxFlz59ltzUhtlWg5M+8o+L8MJ5N19xUO1KRgr4VXeQRdPYCeSymaR61VwCOn+Ds1gDgyE/ThJc7Dbs3zXKnQI5vP5wV9sKiG75aJnHV1XZAFFT8HJZgXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10867C4CED0;
	Thu,  2 Jan 2025 08:27:40 +0000 (UTC)
Date: Thu, 2 Jan 2025 09:27:38 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8940
 compatible
Message-ID: <vnyxzlz4xo4yb3t3liz7ebiwxrxbryn7o3caqekqdkm6o76n5y@2jmjupg3dplg>
References: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
 <20241231-rpmcc-v1-3-1212df9b2042@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231-rpmcc-v1-3-1212df9b2042@mainlining.org>

On Tue, Dec 31, 2024 at 05:00:51PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> From: Daniil Titov <daniilt971@gmail.com>
>=20
> Document the qcom,rpmcc-msm8940 compatible.
>=20
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

