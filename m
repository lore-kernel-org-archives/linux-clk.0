Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877506;
	b=wZnR9mW9F+FEy+2jg7mlWX5ZvUMPL4JWWH6dXrogcZx4Gio1UesgCK1Ou1Onf2xcUF4f
	 r26vLeF04EoEwuI2Xy5C6Q8adbZRUdSvpAkkin+le8Mf/WvctKHC7PjPPXwnlqpdRcuhz
	 Xmi9LjWU0Y/uHI4zkM3/K+79GpZOAt3biL/0+qBvrKp0cJhhZu3M2ujUFqrlDsBd1qRwJ
	 4QU8FflU+6BMdTLGsJOprF9eASxcsRUmlY4bSuRS/175yEyW2D7oEqkTbqm+/9O0iXFKW
	 PVyd7BnVnmLkwcd/MRPGAtN8ZLEuxgezt3r3ESmaqCaP7yFoS6c2UTIWBNGRlmX8/jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877506;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YxNXRFV2tfHnN9zjEBdLST7EXKRWTkncONoWrmBal2M=;
	b=HSCaNwB6Dpqttr8/Ej3t5bmN3Fe2ehtb6M3ethAauu71zXmrWDilojrE4L3SWoWY2eVV
	 ibnM4D0Y8ZeHmeP2udGliw9JUwxIOdUpgOKuZESsvBv9rIsLd2qNCit3k1DgrlueNLdpN
	 Ngoo7Xn+CE6ha1DW8qsNyN8WyIHpOPH5ZmoG7tw4RN/6txccI0m7d61VAePrhQ0am8TO0
	 IipxjeKC1Vi8nfNsAbxkk1u8RhSD0OEqd+sfeYTESUcAI5Gy59zRBtSMPmlZthreZRxug
	 j9r13DNjpH3yhIZMZDuH3Jc6QrU09Bo85pyZ/SLdojqzKk5PxrWkC1bAoZrxn5Q3f2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihiBjnmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D70606A334;
	Tue, 17 Nov 2026 01:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihiBjnmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4421F000CD;
	Tue, 17 Nov 2026 01:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877505;
	bh=YxNXRFV2tfHnN9zjEBdLST7EXKRWTkncONoWrmBal2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ihiBjnmRjKcU2lWBTMOD6ZsOSL23L8g7JtHfDU/jie6aoauMKrFgyB3jCWTlCEb0H
	 av/sznex8DjoOG06+ViORXzDpSAxzWglbsD3r1dNrm7ijV6DdQTBnmPpQ3WF1gaepv
	 8arGYdTFmp270YLkd3C1vhm++82NEBm06pGWjWnqv5sLIlZSqzc2Q8Td+1yjAWdDFL
	 cv9LQB4L4UJmSdPKvdXiFR2wRAvFtYzd4p4g/gpHNrAEDwz1+xtDCiA508cttz459C
	 5xYUy/wHOw4WLFNwflwdRGnVIxG60Ja++5yKAzSn1xFnyCzYdgUhjY2orbf8rVKNpJ
	 LTTf9qgzJ2Lpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abel Vesa <abelvesa@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Mon, 16 Nov 2026 19:04:42 -0600
Message-ID: <179487749311.432567.13731277200090621528.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 Oct 2026 12:18:02 +0300, Dmitry Baryshkov wrote:
> Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
> for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
> version of the chip (SDA845) and provides a rich set of the peripherals
> and connectors. The DSI panel is an optional addon, so it is being split
> to a separate overlay. To (hopefully) ease merging, the overlay is split
> to a separate patch as it depends on the panel. The base DT doesn't have
> external dependencies.
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: add device tree for SDM845-HDK
      commit: 30eb04d28111e83d2ada48f46be2d314e1a47860
[5/5] arm64: dts: qcom: sdm845-hdk: add display card overlay
      commit: e0bcadc233e6f0876eb66130389db9909c831dc3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
