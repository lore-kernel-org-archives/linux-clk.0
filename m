Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78E3537C8;
	Mon,  3 Aug 2026 03:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727460; cv=none; b=YsSZgTNbvauGrtwv59r+gj/v7YodWUkogrT/BaKpH0j+bt6+JzyQxbXRfcVvv3eDZyrmS6WhAwcWOdhrXeiCUMjeLVfQKngH6KeUAvXkKRFAbrSVU+XztiEucDrP0+6QSBKSTZb0fxkWgH+7ZUcewm3dyLAEPT9zg/FCvwiZ36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727460; c=relaxed/simple;
	bh=rmSwFZYieCCB3HU/Mq/Z44EUtCRL4rTCrMkdn70BjNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOzLXmwNvVfVBmcIfY6Ke9H4n7fzVqamPuB+9J5RDvVCa9M1d3JW7g6vSP9hDnzbx5EDGWuXXQ/TxWpfzj8h32PyAClCJqKdLRIONzoCjvF4RM4jB1mVUD5JBoFsVHldXgV/KwHX/5KgMZR3clSZ9tktfnQPmcEUGLtBoYl5+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/5qX1No; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/5qX1No"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79241F000E9;
	Mon,  3 Aug 2026 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727458;
	bh=gSf+qHES2BIHMyxrJxoyk8yZx2EVwDFcawqT9JJWDfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S/5qX1No628ZhWh4k0pqxvqT4qJaMp15Lnl4c0L5OuuYha4VqEq/P6QpCUVfdETjB
	 TrOfRIRk3QhMo+t0dcvoWzaj7AsZJXtP32p5WWVHR1lBO95R6PQ+vGgV3mb1GGpuaI
	 0fCs3uSjkU8860ZKUfkrpxo4IthebNmQynlkNcpXn7YbgJGgCmIlhIiX3k9AXx8JXd
	 r0evxSO0C2F+1+3Jds+xfvoYRgnHbZNsgr+y43PZS6mJncJrl0aHan/DotFDOsNmXW
	 hu600wcsKGmcUnmytPmLtAMDiC3gNFX1dqZmVt14uZnOOyuJTN6wlRa6uYVWxwKrmi
	 oc9biZgp+eLng==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/16] clk: qcom: Add DISPCC and GPUCC support for the Qualcomm Shikra SoC
Date: Sun,  2 Aug 2026 22:23:57 -0500
Message-ID: <178572744553.408250.18300678058452023245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 18 Jul 2026 18:26:07 +0530, Imran Shaik wrote:
> This series adds support for the Display clock controller (DISPCC) and
> GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC, by reusing the
> respective QCM2290 SoC drivers, and adds fix-ups for the QCM2290 Clock
> drivers.
> 
> 

Applied, thanks!

[01/16] dt-bindings: clock: qcom,qcm2290-dispcc: Add missing power-domains property
        commit: 70ef527b483f6373c4b954e81bbb73f3bdc3184a
[02/16] clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
        commit: b4ae34a7e6618618666e0df325d59a634efe5753
[03/16] clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
        commit: b8b5b26aa10e57c154ceb7d32d573afb864823aa
[04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM support
        commit: 11345cbf17cacc3828f7bcb021ecc07c687d04f2
[05/16] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for DISPCC and GPUCC GDSCs
        commit: 6b0044bc75b04374c58d082d4cd59f57db83e8dc
[06/16] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs
        commit: 899dfd90229e3d83aa85a27b3d5d1d78bdb7385d
[07/16] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC *wait_val values
        commit: 08cfbfd81dd6e27167b1331e0c485bd0414cf5fe
[08/16] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
        commit: 1b2e1f5a37dd4c856a9269bc7e5988c642db5847
[09/16] clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
        commit: 1b4599bc20e98d61c274b3449ca392b8e2b07b4a
[10/16] clk: qcom: gpucc-qcm2290: Keep the critical clocks always-on from probe
        commit: 7274ea68d2b4be491de0ece45fdce709cfde3154
[11/16] clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
        commit: ab46b5fb668b8b9b848a8f036fc4c06ce86b7e3b
[13/16] dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
        commit: 99c28d653aac038111afb452151f222b4efec047
[14/16] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
        commit: 46d50405c96905043aaa6a9626e1a42b5c56563e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
