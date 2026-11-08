Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169312;
	b=lbtayu/TIfzltt6rYagPOeyNFCJq5nWsIxaC4H+of9nAFY6F7Ncxc7sik1aVMoJXgOmF
	 MKVfuveVtj7S+4iODOGR2NE43yBBn6H+7G9sAF7mmWgQT0yue7nWFNNka+MWBuHrYLuh/
	 J0MPC+MQ2/sxPEai1tu4PHV/MWt3v0s61z2eiKTkq+LYgqZ0Y3387D9eI6lCykur+rsNt
	 TMoMOVPU+NQsf1MYPnyHeMNP3akGCPItgVmlmuodU47ZhvisZXbWI9sYVPf7MqKEXSgnC
	 qdNXtVFitNSCGY5QV0JfI0OQiavwZijtJ3MPnpmzVlW1+KX8fxR0qg9VC+WgwsxfuQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169312;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=64c+Sf28fmD6bZTZ86HbboT8grGImIb83Md3rFMbR18=;
	b=mJDxEgfaWpI27XngM+pNoPdBCqgYgestfNAPOgd5bVdNSzbpefUlH1Z59eSOOkAgYGC8
	 Bguf+CK/KtnxGUbv2iYerx5HIzEvW7RIoqfWLZk5fHHWaEWGm8//ecUjPQ51J2Zi0WwCn
	 bCzISjm8ZNeOYY9YkG2or4/ypAYIj+3KUCUxjddbQncatXU6AUJvYToY2qznFbO/cmWis
	 KFqfxFZkV0iOgWICVzUBiOPop4HuxQADmUceRQp8A1odkii23pwSoiUBjogfSpLoRfBiO
	 8ivoPJEWIzF30cF/JAsAIog1gpn/s2GhowvFufS2PB3LwIU7gesevBf4PaLr7My/H0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOm0QkXE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F56606A33B;
	Sun,  8 Nov 2026 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOm0QkXE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76DB1F008A2;
	Sun,  8 Nov 2026 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169311;
	bh=64c+Sf28fmD6bZTZ86HbboT8grGImIb83Md3rFMbR18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IOm0QkXEHVdbb1xpV364a/UPT47xH+TPCf1brxFS6BL+q0OG92aicxgqf6nJrUeSR
	 dJUzs+8mQLi6OpYxOBE83CpOFQ5c3M/ji30K+Ivbqkv/gvZPItSWCgs19nR9hz6pHO
	 DludD2BW6uJIdAkx+zn5y95uUlNwyQO11KgfXCIrK+I+SKoi/BAtHdvUt4jV9sOjue
	 Wp3YnxFb1xjo7js5f2YFq9OeLro6/w8IK0E06fuubdLV5QKkllgl8aeDBE7kEcMMWv
	 wFn+9m/t8KOH4AAy7DMD2ZJt0shFGAge2rEmiBDdQVf1qMVbZsxBaORbOz4mXp8o6u
	 F5ZQhfn5TtYvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sm6375: Use common clock controller probe data
Date: Sun,  8 Nov 2026 14:19:11 -0600
Message-ID: <179416929296.628393.2942988667247416187.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
References: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
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


On Wed, 30 Sep 2026 16:53:44 +0300, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Associate GPLL10, GPLL11, GPLL8 and GPLL9 with their existing configuration
> data and list them in alpha_plls. The common PLL helper selects the Lucid
> and Zonda configuration routines from their register layouts. This uses
> the common initialization order, configuring the PLLs before enabling
> the always-on branches, instead of the previous CBCR-before-PLL order.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sm6375: Use common clock controller probe data
      commit: f69883c5fb57f794a5545c59530241ffd97952f6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
