Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D63783BB;
	Mon, 30 Mar 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886513; cv=none; b=YwchhBnPRiD7amdKASbvdRp5NqyRSloSVUoABI17a8Rdop/vv5JqmG9+BwbzZGWNeh4qwxcc98ffoT475go5/zJuJ2FloWyOwtIcz8efXIQ7AXwn36psZgvz+BQL0Zmm7Vd42ouy2kx9F2wN1BZHoFtVqqohfxiwKY08o+9+JSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886513; c=relaxed/simple;
	bh=dkL6dv1UZ6tEvEkiK8k3OFHYmWohEXDgOHsN7TaAXo8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUFRhMcxm3N6vRkez2dxNI9nPdOgcb+6nR597nRjX6KP/XZ1zYvfV4Ni3aZ+ztDjnCL5MMRQKYVb7uueDjTMRCFGdyUKav3FSwAR9BZf4oMsANeiXHJpIdHO2gl9I9YgRbmtEe8slJemm1BuSIvv7apPK09OZOZE/VAZi+Q2QXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peTvHo4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peTvHo4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D64C19423;
	Mon, 30 Mar 2026 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886512;
	bh=dkL6dv1UZ6tEvEkiK8k3OFHYmWohEXDgOHsN7TaAXo8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=peTvHo4wMPfXlvDCs2e71U/I/369QNfdTRy+2ixgLbfcFE1m2O1tewtKUYet6WZ9y
	 EdfjyyCWuYUvDA12a43gIpdl2mh8U/WT32/+5778ADO2wLEA2BWFgSLwnzcJmd0sOI
	 Jj/AmhylDLg2bpPAjhHfJ+vTm6yhKUSddCGP6qZTEIbI2//eEQDxP5Y3cBea8c1y6D
	 q2NFecVehN7YPdCR5ZHywBK746D6eS2i7erU1Q9+B2mNxRJ8c20CXIWZSC9q2tem6I
	 yDRZiTRPCG8VIN88z5jsd0fycdp7JYnQBiDJE49fuSxUGH3mOECEfZWzj3SyW/dGbO
	 KTcxbnnNSf1Rg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH 0/4] clk: qcom: ipq-cmn-pll: Add IPQ6018/IPQ8074 SoC support
Date: Mon, 30 Mar 2026 11:01:12 -0500
Message-ID: <177488647778.633011.8836589484278812193.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311183942.10134-1-ansuelsmth@gmail.com>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Mar 2026 19:39:37 +0100, Christian Marangi wrote:
> Simple series that adds support for the common PLL for
> IPQ6018/IPQ8074 SoC support.
> 
> This is an initial effort to try to support the Ethernet Switch
> present on the QualcommAX platform upstream.
> 
> John Crispin (4):
>   dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
>   clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
>   dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
>   clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
      commit: a57666004f49fa5031d6bf388834213e6f961922
[2/4] clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
      commit: 97eb2ac52726fbb702ced40d552a3f6f2683b664
[3/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
      commit: 7156c65030006e6930dd99c5b8c5e84e69ca5f0b
[4/4] clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support
      commit: 4e36f8ab45c406420f2c2ce6ee3988e0d13ba1c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
