Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F72ED843;
	Tue,  9 Jun 2026 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982880; cv=none; b=DjDPjBLReyudLaiDPk2fnHF18EUmwwVSPRuqEdQYXAyQl3BjeA+Dzw1fAu0ouVAOD/j1e+f8U7aWnR4JaL0cy2iZD1uqgjmxp4uXcnXRcTIO+SJoAcNXhvx58Skt3Wm8+NQVzM2iKBMkDL/dphRXpPm+jE1fkbt+BHNl22e27fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982880; c=relaxed/simple;
	bh=jIjuyDDY/swkMGgHEBxUn57KyJciwkMaNDsz9eSwttI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOC8hL1cJSsls2M1l9UE/xQwl3IUIF3YepKkKOmBQzfGjD4kGjFCyNzl1UETC9BCWsOojaRZr2uZvGJCe8Jm5wxE8IjIGjrKkvhWZTIcGZMhDwZg5oMggdIfqe4uFqsQqQ8I1r6xz8DJViEMCVpEnlSJg5NZoRplyXZp//Uv32Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeAck7bK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeAck7bK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F751F00893;
	Tue,  9 Jun 2026 05:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780982878;
	bh=amvQdFrwPYaDPUyhPa77D3Uuh7YWPN0pKyJ7X6sSw9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OeAck7bKeRZL6F2VXZID9SWTvGIcr4ogaPGjZY1HUT2Pr5xn0qvbzQifwA5yypuyL
	 Zv11GLdbf0m9TDDVUZ+YYy86pjan+TkXk+UU16AREDCIR1m9Auq4Re5VJzOUaeWexP
	 I/pc8v1CHtIqaQhlGCVe34ChsVXYZWIIsY4/rXcQ5yU/2Lf9AwwgiWuLX+MGtUvQ6c
	 rn6GknYyTBCiEPju6qv8PuCPVKRb5StoD8zkqBIlKp/IW//hyK6uJTLIv9klJQD4ik
	 KtpdWSndkZs7cB7m+KQSMlp5uscBO+ZxVo55m4IYfaEApLcxNgImR12FR8yNUbMGUM
	 vEd/0D9BT0ySg==
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: spacemit: k3: some clock fixes related to PCIe
Date: Tue,  9 Jun 2026 05:27:52 +0000
Message-ID: <178098282978.4045227.9791467212023885311.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 May 2026 02:59:08 +0000, Yixun Lan wrote:
> Here are some fixes for previous patch set in order to make PCIe work,
> Add PCIe DBI clock which was missing, Fix the parent clock, And correct
> the PCIe Clock CTRL register offset.

Applied, thanks!

[1/4] clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      https://github.com/spacemit-com/linux/commit/d8a4cef90b1a4ae9196a5bfba683eb9a0c75acdc
[2/4] clk: spacemit: k3: Fix PCIe clock register offset
      https://github.com/spacemit-com/linux/commit/2f20c859a82a291483a8b3f01cbfbb1642782a14
[3/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      https://github.com/spacemit-com/linux/commit/7a2db70a3196717bfb01415b6dde1f90d4291ab1
[4/4] clk: spacemit: k3: Add PCIe DBI clock
      https://github.com/spacemit-com/linux/commit/a37c75d7b5bb7f3344b0e639b313ac5ace6244ff

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
