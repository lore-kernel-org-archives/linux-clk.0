Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F338A733;
	Mon, 31 Aug 2026 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207697; cv=none; b=BG3PRjVgTMAxA0nBnCAiu/h9JOUihhl7hyKUzMwaVHdxAtCukF+llax66hGnrO0NrLSssKrKUq+53K9ns51dBSnSSEC2mUde1v4f1Hk26h6T3o7OfhIRatCT/2rzTxXk59yDYzZrVjeP5MAWFyqnMViGgDFByFm2TQVBvroShIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207697; c=relaxed/simple;
	bh=8ADW9jWXA3kGmDvN0mqg5L3WXKz0sI1yFYdveSLfdcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSN8XtTO0BjpxsBg14rEflqU76eMs61NdxJHwYTUm0oEdhT5C3Nvwkdkhp52ZFINTDL7pqw5AgxtyQS1Jgh+RIBLZY2XeJ29aAr0ipwpmvAYSmATRAznLN068mz7n6e909k1QhPJSt+FevD39holCzw+gPLw+Joj8FzM4Ht2hyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwqcBY3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwqcBY3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2CE1F00A3F;
	Mon, 31 Aug 2026 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207695;
	bh=Y0Zsp6oQBU3Qs9P4/Bmp/3Ybjnl0DhT2IcRZwIPCcho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZwqcBY3J24ZlCw9UdOgCawRyVV2EveSsRi7RaadBgEGQMI+oWKGUsInmwoS+WLM5j
	 ZxjBEQiKZY6lqHv4sgndhPJIo7vY8HPQvPXuNdZ5+UI+ynXFoAQDaYYPQUZpE6+Kc7
	 0bA7xZXdim7+EVNnjzfmF14RnEhiPWYcQVhmztg+LePP/XdzA0MF10bW5P6BRnP63V
	 augMcaKaz9f3GCE2bXo93Pzh9MdVkl1SLZQNhq05rWCGf6K7EVr7u3FQwzQapvuv7I
	 yZSHYAiVEF+7ibTouVKhvdc44qmrj41J94J5G92PlVMLXawch4kDUBCbDfUzevwmhN
	 Jn8uWLfAu+zMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	krzk+dt@kernel.org,
	Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	taniya.das@oss.qualcomm.com,
	bmasney@redhat.com
Subject: Re: (subset) [PATCH v2 0/2] clk: qcom: Add GPUCC and GXCLK support for Hawi
Date: Mon, 31 Aug 2026 15:21:14 -0500
Message-ID: <178820768660.1699313.17347540515197728651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
References: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 22:53:47 -0700, Dongfang Zhao wrote:
> Add GPU clock controller (GPUCC) and GX clock controller (GXCLKCTL)
> support for the Qualcomm Hawi SoC.
> 
> The GPUCC provides clocks, resets and power domains for the GPU
> subsystem. The GXCLKCTL manages only the GX GDSC; remaining resources
> are handled by firmware. Hawi's GX clock controller reuses the existing
> gxclkctl-kaanapali driver via a fallback compatible
> ("qcom,hawi-gxclkctl", "qcom,kaanapali-gxclkctl"), so no driver change
> is needed unless Hawi-specific behaviour is required later.
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: Add support for Hawi GPUCC
      commit: 1450a68f30a163d5cc2b1f1009797b357bec33e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
