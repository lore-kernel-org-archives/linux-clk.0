Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169348;
	b=fl74B1DtxvDCfGAhKw3GRNjEf2SShOucE5F0gWzB3Cbo4js26uJlYPpACDGKxCso9tsf
	 rcqzbEgMNNCw3/Xh0qJHFDA0vvwJxepnZxs8mr0mhonnzTg4V9MEzw5mhfIaiqJ00cLiC
	 qGCWvKVMpX4R4oIFJapKJtm8K/DUqdgyRXOCGyZ0DfpdhbGfjd2o+8PBFMsFp6ICzbxGq
	 LG71F85utIkULIXnZyu9+7X6ICauRJXOZnkJrQTxrlXn+0EcFb18lNhAAYPGz8gV2f8cX
	 qW3dtcbmRfTlzDiE7/t8YAZkXksH577JmV/V+83mmEQL2oPl6gsZLPIkhsVIGCs/eyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169348;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+03jTVGIFZ0Ku5cXK7wtacYgGz6NzL+g69qARhp8Fy4=;
	b=tGzr/sjul4jZJ3abLr/U7ZGTxt3DCS7Er/cdeKsh+mnIw6Vm82wB6XnZFwv3FylTbc0L
	 ZszfGzWyeQlHXeqW4dzRPJc7DSJMeDZm/HxotScmudWtZpOeh+ZnvxP0SBfIXteIMpZtj
	 AcmCmJpliQEsJiDtSuhkSfMhfRKYZkno2naGsgLYIqEeYfgO9AHJ2l3W4QjJSapQWBa+V
	 uChauQUhq2ksReb1w1zSJDpIw+Lh6VPcuUcCTnsuErZJIOFByxtKnAnqQ0Md+BUOhkARt
	 vkh8GsTr148gYaHGPr1RkTOnEeih7unpxgc2AQBthzlsLpRWHk7KnGX/Bl6+3MLnNng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcDvXr0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37860A381C;
	Sun,  8 Nov 2026 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcDvXr0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1AF1F00901;
	Sun,  8 Nov 2026 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169348;
	bh=+03jTVGIFZ0Ku5cXK7wtacYgGz6NzL+g69qARhp8Fy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gcDvXr0xVLxLCrEjipigauQxpwf57I/2DdGp7aX+/aMzEi8hpwA/MRqRcvwr269lH
	 C7RiqYLLdrpRQ/tTa88M2CuZJ5T4H1zCgTkc0ZZTp8dMfjgrVyzsb8xuirfdSN1MRr
	 v/2KtyEPDqXYEL2lS/qnl3GF1+jZ7FcnjDVs+sW6JnkkJCRVyVBkB7bxL0fCBGFj1b
	 GtYT8wp9TYJvm/Z8tfrpL1PXLsNrBED+qn7nZwRq9IJ3Aptska4EU6z65M6nwkkVyx
	 McbxNVgkWYTMCA7b92nQRCRiPMtOS80gprYhyI4IwNON58nb+D/ZAZxafWP4M79wMT
	 oIZo7myGggWRQ==
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
Date: Sun,  8 Nov 2026 14:19:36 -0600
Message-ID: <179416929424.628393.17771350398079284903.b4-ty@b4>
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

[3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      commit: 930173f0332cc16656996756a5351560a4cf6068

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
