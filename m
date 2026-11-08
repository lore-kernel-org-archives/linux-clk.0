Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169360;
	b=JMuybmAvqMNYbkarPysP99UKjlHoVsg+xfgeGoxMpfxti17zKvkycH8l9GJOkEodxhmL
	 anMMhyJGh1yBxyaGvjaRj37S/VkWTLOML8mulFP22NRDN+DG8j5ZzXxadANunlpRm11xJ
	 blbbEqh14BSoIzCNmJDlRkkW8kAbUDuJvo7WgL5kQ74LFohf/OAiG62moVHhIgmJ5dgXd
	 tPb1NRPuSHwoLo/FnZTLhPjQnhbhFGiJ67gSgTl+dDWGO6UamLkWzBfivJQLlvVsuJyfq
	 GWjFX9S9fJpjo7ERqR5I3LvpI1iYow858IUjKITML1a8eUDuWYptsu91mN9VZ5lA/Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169360;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3B/ezaNWqJACgBgjt8jbMHpfCZF0rKokrSlN3ICis1o=;
	b=oFYo5/9H0qvf66gt1EPkh1dJQfv73WBUIOtjFheiOZC/FnykKGrmCTctHE2/AbMjfGC1
	 9cEtNZ3asTL4iRQSDd2GAOb2uKa+dUB3um86Ph9Q+5DpudVoorjh+djCQe5xA23A8M00S
	 oWmbv1NtAPbkjEKJIC0HqOxqLsQRJiD6sy4rya+t5TVhHdMaucdWLx9iFlNt7cc3vuWH+
	 4YUAYGqODLgJg3fshgQJFAb9Yw7MV2asqvSS1oR6JJjvugkk0zXUo1fmv78eDt0XbXDLy
	 HPgErXY0yFNGtKF/CD5ot5Bb9V3ce++NzX1Ul17yU1li8S8i2uKnfXhfCN3LmdkYZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCE77e71;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C93606A9D4;
	Sun,  8 Nov 2026 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCE77e71
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81C11F008A5;
	Sun,  8 Nov 2026 20:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169359;
	bh=3B/ezaNWqJACgBgjt8jbMHpfCZF0rKokrSlN3ICis1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KCE77e71MEVSlFKYqzsHTvjNw/H2lO7UEv2x9p3BnGAy+uxX4gNNlPpt2peyB/nqg
	 bnklz8vLOtu/XnggCnYwOtno6G/P1Gaz9trfZ1y2OJM5TU4ISx4WSLwuO1anBvYf/d
	 4ignG3AJsPMJtm55FfsDAJTFtRXtvRE2EH4GG7kmZriZ68j8tvmMAhdW1pgkI/yuEu
	 X9RMqZ9tJBWkwTBCD4YNGT0y3huVDqqmEsN47rm9GbcmrNgd4GkX+UW/N28bcszZ41
	 vINkMxeBDsi74lCc1r6PYfMloUVOd0hSsuogGleFPpv4v4y9U1Ev0w2agazrG6Sv56
	 /0OIx1P2iEfpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Fabricio Akio <fabricioakio@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: mmcc-sdm660: enable the parents of the pixel clock sources
Date: Sun,  8 Nov 2026 14:19:44 -0600
Message-ID: <179416929322.628393.9027873794730596947.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
References: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
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


On Fri, 02 Oct 2026 13:46:24 -0300, Fabricio Akio wrote:
> pclk0_clk_src and pclk1_clk_src are fed by the DSI PHY PLLs, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: mmcc-sdm660: enable the parents of the pixel clock sources
      commit: 7e24ec7320f5e82f4f2d1809024de19bbee01871

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
