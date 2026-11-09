Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228260;
	b=NnAMFUbPlbA7+VliNU9CBo4SdxffrWPJbXGLm94k1uLgmVVVD+1G2qfzftuoJkrQpaaa
	 K/bZKyHj0q2+fxnC7+8L6TJMDle318sHIzDL8qzUCJIeMj+4FQvFbTYW+pY2jRs4gOXS7
	 ZWeD8hV5FiDSUpKknlX1EeZoY9d3cqflhrvuTZNwxuuA8av11vHfWG5rm9t+93d4hNnad
	 rtbkAOvpzjXAHGE/yXzDUTEv6mjuwBH1feARmCZKnUgeI/+fw6WWAoG2W5U/wr7zPmQP1
	 M1wU4ylFMecLoqOj1EhjswS3dlHNRynR2yxBhf2MV1sHYSDPxB35fx1/auiaf3P9TjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228260;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uUpSNvbnctQ9ovE4UEZk5M1h/k2Nqmh6RWvn+1R5NG8=;
	b=Q81k3WTXiXxnRy4A3TgLd4IOZ+4euCK7pH6j4O5V07y85Ns4xfHucaJgYKiEq47QL3YJ
	 Q915uZGtGvmMZGKr1bORHcrm3z9uMSfOHem3Cjz8260h77aeJh9xxUVDv/HhFDSz42Q+l
	 0UIjcFM/n7Rs8vYJD6rb5tyD/Ut6giFKhFBTCmAqEnJH3K85i7WWalZmtdGn5SGU3r0zb
	 oGk+j8e07/KHRC4dSS+kcd+xeL5fKQD4xT07Y7+vgpPNn4OzS35eI6g9D17ILHn0o/pDp
	 lQ3Lqsmfpp/Uc7gbsEdGWyJ+RBcArHD9x1LUU9ln+ok4p2j51XNHiSfpsP1djnXUlEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9Nrjbhn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915A9606A321;
	Mon,  9 Nov 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9Nrjbhn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9281F0089F;
	Mon,  9 Nov 2026 12:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228260;
	bh=uUpSNvbnctQ9ovE4UEZk5M1h/k2Nqmh6RWvn+1R5NG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G9NrjbhnP8br50tY5m6MyZMXj9KlwSCftIARGa/eJybRYTBPZXkcQLfQ3aSLGk54O
	 pY+YMqNPL4BWUgcV3c+cy4ZJlYmmRL8jmkEABZ+fH/QdOGuFMNHE24fNXzaogVAPmZ
	 GbDR0sBKN/IqJMo5tbwaVtmJOe18Uk8tA17of3XvSmG0krsRfip9lfO+Qi9NCkMJFY
	 0vVI2nYLdjU8zR4Dns1dkHTUZwhVJ7LuylGDLr0DiXcR6X4ab4g9Go8XFoG5QvXOmz
	 MrhdhU4lPbN3AFUOiQbTRBzuednDK9M3+hpt5H8gCxgOJTzSaTNpnRgalDRjH8UUgs
	 Jk18cWES+ecpQ==
Date: Mon, 9 Nov 2026 13:44:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add SM8350 camera clock
 controller
Message-ID: <20261109-sceptical-guan-of-charisma-48c6f3@quoll>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-2-vz@kernel.org>
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
In-Reply-To: <20261107173621.3538964-2-vz@kernel.org>

On Sat, Nov 07, 2026 at 07:36:18PM +0200, Vladimir Zapolskiy wrote:
> Add device tree bindings for the camera clock controller on Qualcomm
> SM8350 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  .../bindings/clock/qcom,sm8350-camcc.yaml     |  69 ++++++++
>  include/dt-bindings/clock/qcom,sm8350-camcc.h | 149 ++++++++++++++++++
>  2 files changed, 218 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8350-camcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8350-camcc.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

