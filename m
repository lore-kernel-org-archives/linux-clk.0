Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125360;
	b=a64ablNemHxnQq4tGOnSVKoKA3+hYVDhxGUzEQqpNugUlV5c4ik+T1gaJ0U7QSFvetRr
	 3B4QAQiJzUOGgB5MFuJhTU4q0g7cjo6towPnEOdUeBN183yuq/uiv3npZKgozHxjKx/eG
	 O3h0BmwPE4u/fElHJ4WASS/02QGkaoH94qFJNA2S6Wc9CDSmwErxoQwOQxdBTvNMF7JVD
	 uNpL7seLDhX1a81QlBLN2d/iPhBzumZoKbJQaHZ/FFh4/OW4qmDFoAKsNMWbD3Dghz0jh
	 RC9PaqOlVrfie6+u5JnTPekwyvExg34TViNe3bmY8CaByr2Z+TS6GLmKL8dmjNfCn8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125360;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8IT9wxTcuvep1bV4EOHz2sTQU8PYGB0ES2vg7dL7Drk=;
	b=lOYvVMyjbjkE588dNPGiKSW8VCDrGD0Vh2ir/8Lf97mC/sbEcuYWWWPufrDUeC/gF2kg
	 JkvCPqOjv7NQvpi1flOev8oWak/rnn+mYdQ1DYB1Cy86osMMoRTr1UossWiZ3ZxhSU4u2
	 X18OaorTRjnizaazW5SHGIywK6cqLXc1rqvhOKJ9Dzh/OwGc0b6nLaYtbc1PS4BQzy3YP
	 FV5kLPWRUQpMoNd3EKx305F1RMmOG9zqP9vgf9RirN4FJ6r78k3c5847C4UOBmGVu74hs
	 xuc/ZYJLtMFkIdT7VwZNmnRs5B+dVUqIZJoIXJI5U3aowTvJQMKxxJQw0y1oX0rk+jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Csmpuaa1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FF606A320;
	Thu, 19 Nov 2026 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Csmpuaa1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC771F000C6;
	Thu, 19 Nov 2026 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125360;
	bh=8IT9wxTcuvep1bV4EOHz2sTQU8PYGB0ES2vg7dL7Drk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Csmpuaa12EqUM+tD8yZQ+/faaE+GfSmaD2dxaZeWBDDBKc1Rt/hUnwtNS6SiU+7XH
	 +8q39zGRBKFGYAcy/oMFOmdLtBzx4aHn2bKaW64Hwj2HNiyIjP/1jH9S+xCaOoZ+bb
	 E3zVaxxRHCAlipjHLlALHAxQqI/J6+WmkbgsyFB/hMc9ZGgZYLG0Ibd5RVLMjF3xs0
	 bf3SrhI5DmY+IKyX14DLnbdsDlVvxrt2NzT0cTI8Gi8tcgXZhPlCmrkpIO5W34u9ku
	 +jqpi+NQed0fnKgPUwFRQYbotrRpx4g+Po8dPmNuEQrO04zfPmZtz1439zZXjIQQUu
	 puQ71j3igE55Q==
Date: Thu, 19 Nov 2026 15:55:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Demeter Barna <me@fromdisposition.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	Brian Masney <bmasney+clk@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: qcom,sm8250: Add SM8350 sound card
Message-ID: <179512535380.815649.8843759218597583511.robh@kernel.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-7-4c872df294fa@fromdisposition.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-b4-sm8350-sound-v1-7-4c872df294fa@fromdisposition.org>


On Wed, 04 Nov 2026 18:07:15 +0000, Demeter Barna wrote:
> The SM8350 sound card is the SM8250 one: the same DSP services (APR with
> q6afe, q6asm, q6adm), LPASS codec macros and back ends, handled by the
> sm8250 machine driver. Add its compatible with the SM8250 one as a
> fallback.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

