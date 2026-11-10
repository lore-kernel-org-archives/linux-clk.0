Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285306;
	b=stSaRsORVFB2yEtjnkNjOF+M0LJHloHRvPqeFChQMYF/0RgmKoMgOK8Z/fkBtmDu2ZaO
	 2XPxVN/1vMWcu1jPpgzhgd3v5XzGdt53kkPUDov+Ok3ZF1D18ubbaGle3DjWIFtWbqAIr
	 FSmp5WQmodQGcFQD9bRRSjdgkw6JQbeb+c9bWvA3owKNFlxqP4IXvamC21CiohuEpujeb
	 ouuH1W1xNE+/JuDAKze2lWKuQmQA85hYA7wo9nXVXMXtlM3tLuwq34lfgLUuyPPYuDrA9
	 IMx4YyAJQBGPIhBDjcOmATDhrsIrb6EoYs85rtT1ScujgspOfEAWmWPIpQYcuByJHwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285306;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zfwjN6fG8/jvSCSqDiUFOSSPXc7FFGswmXCNW9VpGbU=;
	b=5WFjbt4GilZayqpBBypVtajJ1J/SmV3LhX0L0MHM36D7bKKSQCV+J9Tip67yyFiAj08Q
	 ex/Lyvh5JDlgK212auAW5UPyFGjeuWtHiRWjm/jq9vi47ax0f+KTczBwemxW+cXsAFxWG
	 x9xfRfkQlsZos9j3PBWePVom5UFH+aTg8p8KHLb9jKyEo3vy/mgZ6r51aXYwHLPyrBBRj
	 +THAaGILDfsQvNp/W3S3/NfKtqhb0TnMRF5jVCarBeEWjLw0a4IZ6VDPmzRvy93CJAFJH
	 Pi69BwN+T6DDLCmcgM8cJEzxIS3g/Hu+62Kn/UhhYndGM+gnB9v/kz074peJ1EoRvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjZzbBPx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC7606A88A;
	Tue, 10 Nov 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjZzbBPx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783801F008A7;
	Tue, 10 Nov 2026 04:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285305;
	bh=zfwjN6fG8/jvSCSqDiUFOSSPXc7FFGswmXCNW9VpGbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TjZzbBPxrAnl+wyNQBe14auTt/X/HGI56gZQdojoqaGyK50uP/bmoS+R+rqXE14Vx
	 6TFwWyBQWhFsstYMlimHhEnXrYTuZG2qG0PBzn/trlFbRU27b2qeAFh1Ffke34H/4U
	 nNFIUj1br6CJrFmQd+MUArj13f6CtwTCV/PGQwPkIzqe81lsDmEhB7hXvVwNfpogww
	 H3OYDYaxI1aWzrzmb2e66/LhDK1EvyIl8XmN50mMKqQ4FlcE0VcgsLQ7z4AdYFs2F3
	 Lom/NX8cYqIEt6RdE6zJm0i63276IjxXb1O7SM3WG4sVZrbPT8waRTCPFTY+nDFeuU
	 3Pev26d2PfadQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL support
Date: Mon,  9 Nov 2026 22:34:46 -0600
Message-ID: <179428529342.1061455.1754522824154624445.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
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


On Sun, 06 Sep 2026 07:18:06 -0700, Luo Jie wrote:
> The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
> which is currently supported by the driver. It accepts a 48 MHz reference
> clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
> The difference is in the output clocks.
> 
> This patch series adds support for IPQ5210 into the CMN PLL clock driver.
> On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
> to the networking hardware and GCC:
> 
> [...]

Applied, thanks!

[11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device node
        commit: 4a155c4e88e0d5189724c799fbe8e610d22cb277
[12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock
        commit: 1d6abd242b45fb772190641fae374fd45ce0086b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
