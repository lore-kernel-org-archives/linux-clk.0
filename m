Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963753876B3;
	Fri, 31 Jul 2026 03:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468302; cv=none; b=j5OHXLn+LsyoKLJS65+YNdEMLjIb+sWhjBFT9BuHzYW+UHMtdesS/z4cPPuyNuDIQ3ytVUWFTzm9mASOskWZwennVMGg66RMD99dgwE8uAKWwcsrqjr+jb778KTEjv4MUgvcnN1bkfPXf5cpWMjQr5L0aMQEXgCnJDdiMNpxajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468302; c=relaxed/simple;
	bh=Ibse90SFtRLbX3d9noaVSm6E5EDfYz1zA+u4QbpgtJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzzID6yb9oa/b9yFCBxFQN7a3MBKV/4YyuM/tTGjnyh0dYc3TRrPzvkwjfaou6mtVR8SOL4vtM2lpBkwWpnaA2bvoh+gha2voZGchva41ZNQkHDRmX1TetFQipcvfMvbXf0OuaMZX+N2a0PAaPrldA55NJt7AU+dz6rNEvsG1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9hgn9xq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9hgn9xq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC301F000E9;
	Fri, 31 Jul 2026 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468301;
	bh=UsgQFt8pBCkdU3EfWQEuycOOMNNYipVweSaCHKL1HlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h9hgn9xqlVAb2XBvCIeN+l4sjXH9haTsEc8O+kODRb/ohoWQwRd6THCGpazokcmwo
	 DIt3C+cpnn258HneZIZqa2ifAcSzA8RqRFnqvHIYa9joZPXjlIJLpXbSwqjACPNMwP
	 ww2PKPke530lrnR3uj+zs11i7iHt8gx8yuqoNuIi/THa+edowuC2CRPD9fKZcr36MS
	 ZXlol7IYOlSgeDCkJ4yrOi9IErvHWIx8nmrd19qzkAKFqPGtwKTd1EK68PPx0yT4sJ
	 Zw0rvWCfETkASf8E3EhrFTbBT/bqdYS6+Cf1q1FdJ3Qm+GNOaGc9Yiy2pOErVC8PEZ
	 5GyMCAo2dyP3g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/5] clk: qcom: Introduce initial clock controllers for Maili SoC
Date: Thu, 30 Jul 2026 22:24:33 -0500
Message-ID: <178546826840.316815.1279868171936945261.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 23:24:33 +0530, Taniya Das wrote:
> Introduce the initial set of clock controller bindings and driver
> support for the upcoming Qualcomm Maili SoC.
> 
> Maili is a new mobile SoC from Qualcomm. It is a derivative of the
> Hawi SoC and shares most of its clock topology. Where the hardware is
> identical, Maili reuses the existing Hawi drivers via fallback
> compatible strings. Where Maili diverges — specifically in the Global
> Clock Controller (GCC), which carries an additional QUPv3 wrapper
> (WRAP5) — the Hawi GCC driver is extended to handle both SoCs.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      commit: 126ee572d04e537394e16dbf6bf0702436af87d0
[2/5] dt-bindings: clock: qcom: Add Maili TCSR clock controller
      commit: 2f4a1d2ed50514ca19a370aa7bf6005ca3f913ff
[3/5] dt-bindings: clock: qcom: Add Maili global clock controller
      commit: 86ea9de5fae96051b468ab87a67b7a8f7a1e324d
[4/5] clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      commit: cc881afb66ab91cfdb32dc68078d843679d88baa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
