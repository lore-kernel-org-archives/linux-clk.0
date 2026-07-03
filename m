Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EF3655EA;
	Fri,  3 Jul 2026 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059305; cv=none; b=nme+MGf2lCymQXrQedNXwztnuDaL9UDyEUNcGw2rMImFWOIgXwvC61qavL6nkFzBxDYjqB54muNOhmED2jDMJbo8JIUJrZONYKbqfAg5yC8YIIFxraRlpKa+A01iy8HNxonEhojdZQmJHNWlzYrTEAaHR5faVtAdeDNQ36DcheE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059305; c=relaxed/simple;
	bh=L+4iroaOfzvGxTCm9wETyvgyxQIFQYC+jb17XbfCWXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcI79cDKTLlVeDeODWDf7vQfr/AdOqh+APyHz9sBLD6HEzmckEzHOJu4RlsRJrdygJKqIZqM9jMZKKwaaVBmVATqIJ6V+X0UmqoZrKQEIKEZNO/n5bL+YfGX520T0xSI+H3IV/ntQdRblF5g5gcVgVC/6PkgSSpFUPyymlGCTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OI8jr39f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OI8jr39f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE641F000E9;
	Fri,  3 Jul 2026 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783059303;
	bh=SGoMkYtFvd8537NB6N2ZevKIBXlFAf3B0daz+uuIhEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OI8jr39f6g03sMLaoDOYc9iA4M1tfSCSaEO1NktYab+8RRuaF9X1BuE6271t0jVVP
	 0rHcn9Kz+6ICEjuaTFnIKgWbkcPcPtfVkPccZgHQd6uZZV0DC41Q3+W5/1XICJYzuT
	 GJn3C+If7dsrKxIuBI2drE1pRq8AYgameq8zDmbyhtepxB2xFV5fDOYHCO5z4OVsei
	 PvogLYS2MPhlH70Ifh/4KePw/0SE5KW9PBvGBdC0Nlcq5FKKf5dceQdnxdj5eFiIFA
	 WlFtfI3xZZyj5F6M2hObpRIypSJXH75qCQN6MQHdYzkAkSn/W5xFh0AZyimerhNOdY
	 i/oreJUjqmpbA==
Date: Fri, 3 Jul 2026 08:14:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/19] dt-bindings: clock: qcom: Add Qualcomm Shikra
 GPU clock controller
Message-ID: <20260703-exceptional-refined-wolverine-c224e9@quoll>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-5-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-5-cc13826d4d5a@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 12:01:27AM +0530, Imran Shaik wrote:
> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
> hardware block, with same set of clocks and minor other differences.
> Hence reuse the QCM2290 header file for Shikra and document the
> Qualcomm Shikra GPUCC compatible.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

