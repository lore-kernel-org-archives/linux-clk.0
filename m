Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD174399EB;
	Mon, 10 Aug 2026 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387574; cv=none; b=R5yb5RxPNUG1x/cz+W2NF0dOBha+E0098eBG+MvMkpfTNj+Rqx0Bly7IUePFe+GMN51Onr/zrZPWhMZWccxbK2IreYBiMcpAH3vXaV1m6Yhb/Nyz5DDYE6RBwXLM8UoRkya8NNhcMiTLw5OB9xAdFFZz5NdGSc9YJG8W0g4S88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387574; c=relaxed/simple;
	bh=qcZk27rvu0FTK2Zs/bQ7pah3i4h32raLpqKprOBAW9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrVXmRpPv04wtkDXQiYgQ2aIHmWwdsIqQ+l6AFlN53aslCvJCXDq6791AR/AdPWoO7jIxryI+ak4867MaTZXzJhL2HmEnFD0Js5kQROPsvyDP+L+kZih+EW/+Ak6WmM+l2Umf69Jcmv86kMNfPrVDdNYPFudNyxojBplnsjxZsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aprai57+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aprai57+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D851F00A3D;
	Mon, 10 Aug 2026 18:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387572;
	bh=+19ewWZC2J3ju8yR1FTsLn1tNMPqz4RrgcBeVDxa6Bk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aprai57+OJ7qH8MXi4KX+7tPZZTbFz/OsG4k4heARfHrZAzO1V0qXumS/onHxSj3o
	 EIddHRh0a0Xr9r1ycZdqq7eKGBxUqifL45je+o5eyp3vy0avTfB+ADtAt1/rFpxIzp
	 cwR+Kfk86nLHYOluNazMi0FD0Lkc8vbgxKdUXht56QEJHmx2PL4zEbFUEUk/X62Nwc
	 mmvwEhaVH39cX1iw39PWi5yvaLRwRmhu4F4CSXvjeqmw18Zh65tC872KaU5qKzpSra
	 st28+7IlvEkmfKtXDQ3lMZuwV/R5UqBpeT67ZrXcEUbDcy8GrERqzUhbjym8V1/vY5
	 jcj7vT9kwexIw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add Graphics clock controllers support for Qualcomm Maili SoC
Date: Mon, 10 Aug 2026 13:45:57 -0500
Message-ID: <178638756031.656675.7950362663756191055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 00:42:44 +0530, Jagadeesh Kona wrote:
> This series adds support for the Graphics clock controllers on the
> upcoming Qualcomm Maili SoC.
> 
> This series is dependent on Hawi GPUCC series:
> https://lore.kernel.org/all/20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com/
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      commit: cad0a4a809447fbcb6559a5e52f4414d3bc26d8c
[2/2] clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC
      commit: 2b28e5befef171218253ac83c864bb2ecbf09643

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
