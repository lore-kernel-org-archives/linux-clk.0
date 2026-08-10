Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FBCA6F;
	Mon, 10 Aug 2026 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387568; cv=none; b=pSoGlSgqCYH8N/wvQfer+8bLDEERhsodjVPthL/XeI3gY9ZBAZFS1FQyaiM7Ewt8Wa4lHf+/QOszCNJ7yLpBO80v/WNgEnCMsuqof9VxjQKD3bza1LjagGAZ3kjkCVF8SnYa0dL9FYT6uwKRu+45h1eUpm40MnQ6g0f9AtcZObw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387568; c=relaxed/simple;
	bh=Ewb69KXlhKlpRhtemVLFNt/6wn+xM665oAuGGOZfOEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CkwJtwZc/8oWzdme9idQUYBkMH8XjfQq8pQmLgPRhXTGbuN6r+CagIIKnRwO/qIrcLfY/Xw3FOEevzReV1Sw8K29fTIgzeBUnbt8lUZHYJEi5sAyvibZ7gwG+LxscKfUez/9m1cciJkhSmf1nV6gWYmNXfxoGE2kkN3CWDPFMWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUQ3AEm8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUQ3AEm8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410541F000E9;
	Mon, 10 Aug 2026 18:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387567;
	bh=UIt/rIF33wagRLQ8ALnt7TFY+g5oumKP3oybShPaJ/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XUQ3AEm8sYEqJAKxZF6vIX0niwfcKQsWvrlzjdBtV1Xe5kErzMYX2O180888hz2vJ
	 x9rRfRf9urI347H6X2mhmY3V8o/y1Lpets6DpLgytQ4E3yS4Ouia3aitUxM/6JHIe1
	 ZXfSLZg9Ih37+Ahibisi3/sB5SxKyyATfT+ry8yEKRnSqtHKc8B4evQ2iGW+5Jbe4b
	 f+7odhqJmJbBjzWTy65yUyOo4Q0SpzYqyvUOpWVJ+AggXY9TEWJsmRWtb6WxJju8ln
	 N/AgUNXP8sYxmc/xbew/KUQRvmArav3SeoLfs0543rxJRKRK8nvT3UXZrV/93s+PTU
	 epJCUVw7Zn/RA==
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
Subject: Re: [PATCH v2 0/2] clk: qcom: Add GPUCC and GXCLK support for Hawi
Date: Mon, 10 Aug 2026 13:45:53 -0500
Message-ID: <178638756029.656675.18342202737822518982.b4-ty@kernel.org>
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

[1/2] dt-bindings: clock: qcom: Add Hawi GPU clock controllers
      commit: bfe412a7a3ffc01abe84549f7851c32c81574340
[2/2] clk: qcom: Add support for Hawi GPUCC
      commit: 21e33a757766223ceb82648ac41c00c29939aa53

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
