Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169384;
	b=uNuY1i678Iw9VoNdHB6RWYkAkZaZW7iB0A/5yf8FhKWiFTtw4bmcrsgM6EHefj6PAoPG
	 gTrA1HKdCSAmKA3+7V1nK8fejpHz8RcgZd3g22ha8A8GWnrvmw1fZNc1LbXXMKaYTUx8e
	 RG5PqdCtaFOCrYL0HtRSiIoCfsONf98IIg4cSd00ymiuyT1bkIm7QPH6Mk9Z+P8fsNtJj
	 2e+nomcZl2sAQ5QnFUv5G8FM/NgrcLU9l7EQz7N2j1Dcnaqm/lNaj+LG3bW+lbWJjI5sX
	 3AiF1OPErBQ4slyTnYdn22xsbKMJFx01+Bk62gB7hGYlcNx/BaiAawRXwDnzabkAzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169384;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uOdj+LCGkUSdpj58vrEitqjzSgwqN0eEuoUdTrdn7sY=;
	b=ysQlf3Cx5oazqSprkux49cTzMz/am3AbwZo6fFCdRQ2bIgIbi8fEx8P0Od6/X9A9ADrg
	 vHM90/RjG6je5kA6sSTM5KAWgisBwd/KeYoSzJHcbTZq6woqJgUhjo7BdaUH9LwF4TxxY
	 /z4GP2rK1WGUkNXGovh/fTmqef6Pce30JP0serfTVop/WWNN3aOLSZ2wEuWhD+Oemg6cm
	 eRSkB8UaZ9Xh5NlQWZQEnTRdelIwB/eZgyVKhlNlVoOF59wcrl0TEJha34SnGFLoFNcD0
	 4+WuxTswPgcNEVGw/BYYYaeQ8CSF9EsK2yjJ3Y880JJ18Eq/Jgi8MCohkZDzZUPrKig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kBG5zsCj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673C606D101;
	Sun,  8 Nov 2026 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kBG5zsCj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE7D1F008BD;
	Sun,  8 Nov 2026 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169383;
	bh=uOdj+LCGkUSdpj58vrEitqjzSgwqN0eEuoUdTrdn7sY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kBG5zsCjpqGCont84sHcyVQRg63m1NOcflsEulc6NhqHcHXyrBC8iluQKQXElUk0u
	 dfOAmtk6Eo38YNSQoJ6XmbcK/6qWLwvBXr0Pgk5U2CmHTQyYLg24WNbEKDaePmV7dz
	 Y81f6ze673y//ooq4pARvzrhcvIwOrLabbBLN+jiPdObZYRtHnNSrOJ4iYD9bwfYWa
	 Nc3V/JoTmKJ/xWvzMCrxlJVRZRaA/6mNbhQkMItLHKm1bzVgiR9LasXyd2mqoJS1H8
	 H67IUsEMddz/9/U/qdWft5fkY+0QivP2qvyX1liVQW/3Yr40UpM8uUJx6C96P2IT++
	 ehbgrJ24sabJw==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Add additional frequencies for GP clocks
Date: Sun,  8 Nov 2026 14:19:55 -0600
Message-ID: <179416929401.628393.3615974621730593014.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
References: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
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


On Fri, 16 Oct 2026 14:42:20 +0530, Imran Shaik wrote:
> Add support for 10kHz and 100kHz GCC GP clock frequencies required for
> display backlight PWM functionality on Qualcomm QCS615 (Talos) SoC.

Applied, thanks!

[1/1] clk: qcom: gcc-qcs615: Add additional frequencies for GP clocks
      commit: 23ce9f87cfc56b6ddbd683725720448dd4fb200f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
