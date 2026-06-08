Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490A3E0258;
	Mon,  8 Jun 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931404; cv=none; b=lk0PB0E+HcAqa7NgCnG8uRmqKq4tWW35bQ9TSD/4zXPrYA5FW+3INlG+dt9EvedDSCLSAUwuD7gQt7BH3Jzq0xxPKfU9k5bUtDdN5scEO5WjwhZwwR21SrNTu0pqQcmTD31jayQ/7ce1riIyj6lSYgHujJT/k2WWF4dGe9Mp6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931404; c=relaxed/simple;
	bh=lXKFYYj8fWN66Btae4jWvy7jW/waZAZvIR1T9Z//2Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rmg8FR7IMeIn38RS9p4EHtfnvZuV56pWbFj+RRWpUdiL1ubwX0Gfuu6XkM6SW5T6X2RwH1oNu7ILZ5tJdC+xQ1cAPZIdAt/FvpKauI284bWnKSzYRcj1xnTEEvfjqWiEr1PL6Nwbs5/vk2Bftq2JxUCeLG6DS4PQYPK9EcZA2ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvPUq4l7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvPUq4l7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455031F00893;
	Mon,  8 Jun 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931403;
	bh=WoPmnZwGksa0gV99/tFnhEoJaknJZPJyFNF84ueiGrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UvPUq4l7u5HFGGQFAfNSUhM9KA0o6q45l3BRD1uwzFoNA9FKtmGDpBjg4rgViqDFv
	 bTLa6TIQ8havBe+MKW2y9xopgGI786SBY0qCZ8IrcRQ+nkWemQ4PgS+GK/vFJxxc4W
	 nMnjVS+Tfx9ptPx8mnKItlVe9A24ggNSdopd4aN52wtCLJgYkt8n6uWjwjnwcHUjRC
	 tXd+40F+u6e21A0XyxNTakMBPhO4BNSFqK8yENFa7OUmsGVrRzBOfSllXAwbkdRAsc
	 UckKL/cCmEPly9J2gelCo2WMeMVqFzhHGgSZtQAIRt1aHiK4TlKEQIIoJEif3JHdTL
	 /t+pXIM+MSWLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/6] Add support for videocc and camcc on X1P42100 platform
Date: Mon,  8 Jun 2026 10:09:54 -0500
Message-ID: <178093139440.244194.708127474354141769.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 May 2026 11:08:25 +0530, Jagadeesh Kona wrote:
> Add support for video and camera clock controllers on
> X1P42100 platform.
> 
> The purwa(X1P42100) platform includes the hamoa dtsi file
> and camcc node is already posted upstream on hamoa(X1E80100)
> platform in Bryan's series[1]. Hence included the camcc node
> patch[PATCH 06/15] from Bryan's series[1] and extended it for
> purwa(X1P42100).
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: qcom: Add X1P42100 video clock controller
      commit: 9ae38c69196e7edd367fe55a3db676a33cc735dc
[2/6] dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      commit: 97a5e120be5d3d7cf7d221b8703921046b73f0d2
[3/6] clk: qcom: videocc-x1p42100: Add support for video clock controller
      commit: cfc34906768cb8ee2c6ab0dc83f0a57cc6410d59
[4/6] clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      commit: 1e6ae74ac6f28ace7a0eb84897c6e17bb044e5de
[5/6] clk: qcom: camcc-x1p42100: Add support for camera clock controller
      commit: 10524682d1b8e1cf2e83afe3bcabd2cc69a0a5c4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
