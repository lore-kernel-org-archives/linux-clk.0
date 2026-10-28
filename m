Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189822;
	b=MTbJvT8DTwEpfLyYb9hAHy5Ax89h4+I3p33fol27NoqjbNIrj+0aob/5acwLlaA+oFiN
	 K9S50ozBOxWEAADYBZn4kQkDzOO+fQooPaTW3/+4E817JGKeBVsYZwFtcGbAz3O4jZBiw
	 zBjbw7xfP62FbiDYnJUXJSySE5ySvPlkzihRzyjCm8QzkMpYYq/mCrkPZzp9zAHop2jhX
	 2z4BGaETs5LyybFeTwArNGqnaW2gVLAKqHKuhyQsS2fWKv72kTB/JMPUbzpHtp/Cz7tN4
	 nORNbB+dBEbjLYY28dJVa5AGtfeZ1j4WPXVAUphr8lt7/FFq2h3wC0iELPWQMOncJCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189822;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IKJCawaanHPArR6nrUE3ABcio2rMapdl7Iao2B9hHno=;
	b=OQE0FdnscsfWMnRGHEL/Nm2bea3FlLot5EXe0eWmtDgVdF32nrVq9jrkIqqNVMDMT4nl
	 3aw3FvITzPINNgnIAtFwoUTgTbHUnTS71MjLCIBd0GVv95MnaRIWymaCmNd/YsoKIIsRg
	 AUS5rhR/tKfw2C8RQ2FZctTZcFUVz5plqJOr0SPaimnkoZyNqvJmCXe2QwMuWJ1qNU3u+
	 79Vi8hzb/ksBVoZRLrcidfHnrwk1ddKuzBAFhB9hpXoyug9Dtv+pA8M/anqlugtrPsyIg
	 kU/vHfjkPp0Y50/3sli75Wwm7yhhZjIo5LASK+1i+Al9oBiJkAziV1VeF1UwxicPr2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dVo/cSaB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA41606A31A;
	Wed, 28 Oct 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVo/cSaB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501B81F01825;
	Wed, 28 Oct 2026 12:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189822;
	bh=IKJCawaanHPArR6nrUE3ABcio2rMapdl7Iao2B9hHno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dVo/cSaB7BR1XTlwi6R3QlXwaRstCf4f2PlNH46HrNt3bebFHA6zFLEQmg36epUKf
	 w0mX8qk0K2/Ubbwwwvk4/2A7rGJsuQZQXvkeWffJfaXnw1dEHYAn1mDH/sbg/1M9wW
	 VG3iPODEEqIIlMl5lQBTl/XytGM2+k7hQui2vACtf1628fVqxkahD1pQncOxT08Vfc
	 yVvl156IB4NfuwfChtvvorGSMvLUxS0hWWGlYl/zquOGSNJnKvlQf/pa5+UUrnD6ND
	 H6jdilKsAySxLoWNCfp7Q9rp50riGvDNrIudqplpioW8x9ppj/zo+ihR2Ex6OElZBU
	 GRPEp50pG7AJA==
Date: Wed, 28 Oct 2026 13:16:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add SM7250 graphics
 clock controller
Message-ID: <20261028-spotted-outgoing-nautilus-e133be@quoll>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-1-773056e4043e@brar.si>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027-gpucc-sm7250-v2-1-773056e4043e@brar.si>

On Tue, Oct 27, 2026 at 10:05:01AM +0530, Ishu Brar wrote:
> Add the compatible for the graphics clock controller (GPU_CC) of the
> Qualcomm SM7250 SoC (Snapdragon 765/765G/768G), and the header with its
> clock, reset and GDSC indices. The clock inputs are the same as on
> SM8250, so the existing clock and clock-names constraints apply unchanged.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      |  2 ++
>  include/dt-bindings/clock/qcom,sm7250-gpucc.h      | 36 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

