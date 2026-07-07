Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28138352005;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394531; cv=none; b=AFN0OVbofAUmU44tRaUCVjiL2vhCpfQ1wUPgGv/pp6lCjbJhgYpUALLBpTfG8xMLdXe/cWQRsb2kfk8jH7BY9B6ptsZiQWbpuUxY56fo3rpPBLbododyIL7hcapYO0gF4EJrAKYwjbP6U5GPLtj7nYmei46XCL1veEIoVfjnb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394531; c=relaxed/simple;
	bh=vYTupzQSvgPWt8PcUwfJO6cbQYYph/+J9IOnCW5TIGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbP0yQ0R0SXI1buC3pAk1A70NDcSVKjEAr4K6Co3bHsXoy8yH8Jy4TZL0a6OMsAIono/+HsU7pb3z6zUTVNkeNfEoeoBk/SEfl8/7k81EKnnFHlt/+HZI/pQrK0nmtyUe9Nuf/p8JMDC/lyjyDziRW+1yG8KyFRCBhdd2Du2r4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZSLyDEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZSLyDEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF561F00ADF;
	Tue,  7 Jul 2026 03:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394528;
	bh=5gWzG0+HWgVZbxjFj069WpF26GbvtN+pMH1FDKn1SH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZZSLyDEQxyES23hQV7wA7vxillaNiRPQZvw1xCgJKDZfvFt9HKdrmACZa4DvU49nE
	 yRWTPFDn0LRuwrbJpEJr0foEPod7oqwW7kzbeLKT3mMbt9RFFXYYegQLhmHBYoaDSZ
	 2+EfhmeJohHmXvfEWYGyEMrW4lA1Cuwv9Fkir3uZu1oQay8nLEjpFEP2wjpD84syzq
	 U5GMOn2CxDswthAlhAV8LWn3tbxDyvbSWzU8m752isj65zx8QFGpDRLYRnfNakgdGh
	 cA4EG8ajt9Ad9fGNDPoTC3vyOcDjt9Kpm1O4roOp2tPOkd4RYuVskPfcMm7IbAPFAX
	 9uMY/Kd9qSTmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Lin Li <zhuolin.li@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] clk: qcom: Add video clock controller support for Hawi
Date: Mon,  6 Jul 2026 22:21:41 -0500
Message-ID: <178339449928.1938770.5009440185841702031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 02 Jul 2026 10:08:06 -0700, Lin Li wrote:
> This series adds support for the video clock controller (videocc)
> required by the upcoming Qualcomm Hawi SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Add Hawi video clock controller
      commit: d9ef4ed45866531d37a2e9c62dc795cd678b5b0c
[2/2] clk: qcom: Add support for VideoCC driver for Hawi
      commit: edbd5d323183ca15676fac30344ec0713b98dc46

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
