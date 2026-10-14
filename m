Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E172E7185
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972110; cv=none; b=T2KW0Ab1iERknzxo0JoMVpYqMZhb2PAwYHqp/Y2cEZB2OjCyVdgzmgBBObh4rzAabAEvWJbDwvjueYo/tyUa68UWFR70C/FYTAqKhPwf6OxtkmT9F+fe2Y16JATMR0npuUKu4wsexhmp/dLMSbCzlVKqkfazoUNyJwV1vs0cXVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972110; c=relaxed/simple;
	bh=6d/UIzTNO4PGpvU6zUKQTm3VSdyNyiyJlAiPyVaR+Mo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cMcrkPd7RWQnmhVaU5mOTsFImJkzDTOay6w94OpCQlVuIp3ItM2cg6NQJ8ItFu6YwZD5xpq9WggPqmpnCuH+eaO30My4VR/RDT9DbywqA+cdk3QnQiOnnphtAle88rZCWqyucPiIpvu4gc655aWlNNoXnhvw4IPLh8Hw0J7y6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nJTV03GY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nJTV03GY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso253619f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791972105; x=1792576905; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3rrqUome2Jzz/+Lzjh+2BhRN6W7W+niGSV25HDIhDs=;
        b=nJTV03GYacXA1WkMVlbEBXNVNTIzuBIPOKPAGssCKp+rbr/ygSO6e9AhZ3SpWmp6or
         khD+b8w5sW23CqhQm2OMO8BOsjDKXh4s8KYT9f3V4qwGG+9upduwdv2ZU6zY/ZIFJxQJ
         c/hU+tbywx4UOnAC5nkkds2SbIS8JIt4MG9L+1aT4ycfUZmjrrSfWczazvpfmfKKwol7
         qWk7fjJrA1KmeWoZZdan12BlghQgh5QTwsWJnV+K7C/g2AXps0O0rxYrDzEQkdwMobYG
         fbGPEfk5BJkoKZUutjJB20yAi907T5RmQotht0P4HgeLbOxkQQXQfoCoGnsJjX9bqxhK
         ZSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972105; x=1792576905;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3rrqUome2Jzz/+Lzjh+2BhRN6W7W+niGSV25HDIhDs=;
        b=xE1xZLrVxyNrvEZzdH3ha7E/y90KqItspMBCmm402VGV/ixTxXIB8+hLMRmFtRYeYq
         JvwoIjwDkPynmV15gbmWONtQrfNb4hvI2HZmTOy22z8hvFz9433MleyBRHIroAOp6xpR
         DalRy0uv92aVzcebS2E5JgTdn6/Hjsu7cHJYdIWhtl+tEkoo/AYriNIcYIsTTPBdirzN
         zSdb7iGTw/2A+apvccvkcE1bF7MOPRhwt34sxpMu6cri1h16TaJSxMoyZB6LB/oLHEIG
         EPXA+tAoU+RHEYOrOZWTHIUt5TJLfvk6xGYMqxkzOp9iG25Jz6NpmTcWX4RpBvGsJKa1
         sbjw==
X-Forwarded-Encrypted: i=1; AKwUvBx2Hi2vsLLzJbrjaVZOp5LT1Bzr3LUXhnkuxB6sJb7COuARh3MUohYZ0YiJyfCsxUDdtCKs0tlmCDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0bcuPlvwafta6lmfFMHfxcTJIshZZuH+n7nySwVbpKDGuJTka
	Mwy+R3Gw5XPtKsGeUjuWqutuQ6PfXtUkkUj0pMMa25c//QvyCscbDCLprbsu/WOv3eU=
X-Gm-Gg: AYBFou08aAUK1/trBdnbTfd1rt3oDjWAaGXX3waUTQct9XzC84ChmIsYcNdZyqCDXgI
	8dM6tc+sLbp2DmNSwzGiZdxsZBUmiWIy7WvCcWlfGobNSfdAWOuydOXvL70gJQGqpxHN/cAbNlY
	eSfNLZiT9aVyjMnHQRNr020D8EjwDVSrBZ9UHJe6ur25N/bJsPrBNPqp6ZgG/dDRblsKeTe03ul
	e2jX9GYcNDotBK6gFOn61RhC2VQIcJx6oLQkhPYIYrT5F4yzBsGBMB0ocFWd7fWZu/fBT/fQJde
	VOt51xFZzEYpGuPHNnNtBTj5QcAuYKCnPBSH94zfXp/mXtEHfdjxZhuVm8TaQiN4QGcYefYN6gO
	EYUaseYOMxCkkGJ7iMmhYzB/MFBbfT3V5DCHu0cKjKyZjJSFlxzmzpabgO38rNKlqdAI0h4brGQ
	xCoHzcm/lqT++U10db36f5jaZmtbwN38tm0MRgkLRlHL7PU4YMhC5gKY/jrLBtqXSNM/W6Z2qcH
	jBsDRJmQ81LNVDwWw==
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr305869615e9.16.1791972104897;
        Wed, 14 Oct 2026 03:01:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm774693805e9.9.2026.10.14.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:01:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, Taniya Das
 <taniya.das@oss.qualcomm.com>, Luo Jie <jie.luo@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Kathiravan Thirumoorthy
 <kathiravan.thirumoorthy@oss.qualcomm.com>, Brian Masney
 <bmasney@redhat.com>, Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>, Esteban Urrutia <esteuwu@proton.me>,
 Muzaffer Kadir <muzafferkadir@mainlining.org>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Dongfang Zhao
 <dongfang.zhao@oss.qualcomm.com>, Imran Shaik
 <imran.shaik@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Sreeshankar K <sreeshankar0910@gmail.com>, Vivek Aknurwar
 <vivek.aknurwar@oss.qualcomm.com>, Aamir Ahmed <elb12345@hotmail.co.uk>,
 Erikas Bitovtas <xerikasxx@gmail.com>, Gabor Juhos <j4g8y7@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Shawn Guo
 <shengchao.guo@oss.qualcomm.com>, Sivansh Gupta
 <sivansh.gupta@oss.qualcomm.com>, Srinivas Kandagatla
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.4 (second attempt)
In-Reply-To: <20261013194514.325658-1-andersson@kernel.org>
References: <20261013194514.325658-1-andersson@kernel.org>
Date: Wed, 14 Oct 2026 12:01:41 +0200
Message-ID: <1jecdsfvne.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 13 oct. 2026 at 14:45, Bjorn Andersson <andersson@kernel.org> wrote:

> Same content as qcom-clk-for-7.4 [1], but with the one Fixes hash corrected.
>
> Regards,
> Bjorn
>
> [1] https://lore.kernel.org/all/20261012220017.65733-1-andersson@kernel.org/
>
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-7.4-2
>
> for you to fetch changes up to 5c32769895e75914e03031b3483775dabcfac264:
>
>   clk: qcom: Add support for camera clock controller on Maili (2026-10-13 09:49:59 -0500)
>
> ----------------------------------------------------------------
> Qualcomm clock updates for v7.4 (second attempt)
>
> Add new clock support for Eliza, Kuno, MSM8952, Nord, Hawi, Maili, and
> IPQ5210. Rework common probe and CX power-domain handling.
> Add generic subsystem-init helpers and clean up the initcall setup.
>
> - Add camera, camera BIST, GPU, and video clock controllers for Eliza,
>   and complete the Milos camera and video power-domain bindings.
> - Add Nord camera and video clocks, video AXI and QUSB2 PHY resets,
>   EMAC interconnect clocks, and the corrected GCC GPLL enable offset.
> - Add Hawi camera and GPU clock controllers, extend them for Maili,
>   and correct the camera Rivian PLL configuration.
> - Add global and RPMh clock controllers for Kuno.
> - Add the MSM8952 global clock controller and RPM clock binding.
> - Extend the IPQ common PLL driver with all IPQ5210 networking clock
>   outputs, divider flags, and safe bounds handling.
> - Add IPQ9650 NoC clock management through the interconnect framework,
>   add 24 MHz USB UTMI rates for three IPQ SoCs, and correct IPQ5018 and
>   IPQ5424 clock and reset handling.
> - Add QCS8300 TSCSS clocks and resets, SM7250 RPMh clocks, and Glymur
>   LNBB clocks.
> - Model GCC CX power-domain dependencies and runtime PM across the
>   affected application, compute, and modem platforms.
> - Move always-on clock and GCC initialization into common Qualcomm
>   probe handling across 47 camera, display, GPU, video, audio, and
>   global clock controller drivers.
> - Add generic subsys_driver and subsys_platform_driver helpers, then
>   convert the Qualcomm and Renesas clock drivers to use them.
> - Fix shared RCG initialization, status error propagation, and cleanup
>   after failed rate changes.
> - Correct clock and reset register offsets for SM6115, QCS615, MSM8996,
>   SDM660, and IPQ5424.
> - Correct APQ8064 PLL15 setup, MSM8939 Venus GDSC flags, SM8450 display
>   clock ops, Glymur clock IDs and UFS mux ops, X1E80100 USB4 polling,
>   and Lucid Ole PLL status handling.
> - Split out the X1E80100 TCSR binding and use the clk_ref helper, merge
>   SM7150 into the SM6375 GCC binding, sort the Nord Kconfig entries,
>   and migrate the SM8450 display controller to common driver data.
> - Add Abel Vesa as a reviewer for Qualcomm clock drivers.
>
> ----------------------------------------------------------------
> Aamir Ahmed (1):
>       clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
>
> Abel Vesa (80):
>       MAINTAINERS: add Abel as reviewer for Qualcomm clocks drivers
>       clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
>       dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
>       dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
>       dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
>       dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
>       dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
>       dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
>       dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
>       dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
>       dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
>       dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
>       dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
>       dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
>       dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
>       clk: qcom: gcc-eliza: Tie the CX power domain to controller
>       clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
>       clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
>       clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
>       clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
>       clk: qcom: gcc-sc7280: Tie the CX power domain to controller
>       clk: qcom: gcc-sdx75: Tie the CX power domain to controller
>       clk: qcom: gcc-sm4450: Tie the CX power domain to controller
>       clk: qcom: gcc-sm8350: Tie the CX power domain to controller
>       clk: qcom: gcc-sm8450: Tie the CX power domain to controller
>       clk: qcom: gcc-sm8550: Tie the CX power domain to controller
>       clk: qcom: gcc-sm8650: Tie the CX power domain to controller
>       clk: qcom: gcc-sm8750: Tie the CX power domain to controller
>       clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
>       clk: qcom: gcc-ipq5424: Fix TME reset register offsets
>       clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
>       clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register offset
>       clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
>       clk: qcom: camcc-sa8775p: Use common probe handling for always-on clocks
>       clk: qcom: camcc-sc8280xp: Use common probe handling for always-on clocks
>       clk: qcom: camcc-sm7150: Use common probe handling for always-on clocks
>       clk: qcom: camcc-sm8150: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sc7280: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sc8280xp: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sm4450: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sm6115: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sm7150: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sm8250: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sm8550: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-sm8750: Use common probe handling for always-on clocks
>       clk: qcom: dispcc-x1e80100: Use common probe handling for always-on clocks
>       clk: qcom: dispcc0-sa8775p: Use common probe handling for always-on clocks
>       clk: qcom: dispcc1-sa8775p: Use common probe handling for always-on clocks
>       clk: qcom: gcc-qcs615: Use common clock controller probe data
>       clk: qcom: gcc-qcs8300: Use common clock controller probe data
>       clk: qcom: gcc-sa8775p: Use common clock controller probe data
>       clk: qcom: gcc-sar2130p: Use common clock controller probe data
>       clk: qcom: gcc-sc7180: Use common clock controller probe data
>       clk: qcom: gcc-sc7280: Use common clock controller probe data
>       clk: qcom: gcc-sc8280xp: Use common clock controller probe data
>       clk: qcom: gcc-sdx55: Use common clock controller probe data
>       clk: qcom: gcc-sdx65: Use common clock controller probe data
>       clk: qcom: gcc-sdx75: Use common clock controller probe data
>       clk: qcom: gcc-sm4450: Use common clock controller probe data
>       clk: qcom: gcc-sm7150: Use common clock controller probe data
>       clk: qcom: gcc-sm8250: Use common clock controller probe data
>       clk: qcom: gcc-sm8350: Use common clock controller probe data
>       clk: qcom: gcc-sm8450: Use common clock controller probe data
>       clk: qcom: gcc-sm8550: Use common clock controller probe data
>       clk: qcom: gcc-sm8650: Use common clock controller probe data
>       clk: qcom: gcc-sm8750: Use common clock controller probe data
>       clk: qcom: gcc-x1e80100: Use common clock controller probe data
>       clk: qcom: gpucc-sar2130p: Use common probe handling for always-on clocks
>       clk: qcom: gpucc-sc7280: Use common probe handling for always-on clocks
>       clk: qcom: gpucc-sc8280xp: Use common probe handling for always-on clocks
>       clk: qcom: gpucc-sm4450: Use common probe handling for always-on clocks
>       clk: qcom: gpucc-sm8550: Use common probe handling for always-on clocks
>       clk: qcom: gpucc-x1e80100: Use common probe handling for always-on clocks
>       clk: qcom: gpucc-x1p42100: Use common probe handling for always-on clocks
>       clk: qcom: lpasscorecc-sc7180: Use common probe handling for always-on clocks
>       clk: qcom: videocc-sa8775p: Use common probe handling for always-on clocks
>       clk: qcom: videocc-sm6350: Use common probe handling for always-on clocks
>       clk: qcom: videocc-sm7150: Use common probe handling for always-on clocks
>       clk: qcom: videocc-sm8250: Use common probe handling for always-on clocks
>       clk: qcom: videocc-sm8350: Use common probe handling for always-on clocks
>
> Bartosz Golaszewski (2):
>       dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY reset
>       clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
>
> Bjorn Andersson (10):
>       Merge branch '20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260805-qcs8300-tsc-clks-v1-1-e7a5101ed479@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260827-kuno-soc-support-v5-10-6d47636a8f09@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com' into HEAD
>       Merge branch '20260921-msm8952-initial-support-v3-1-b96fd3fe298b@mainlining.org' into clk-for-7.4
>       Merge branch '20260811-ipq9650_icc-v2-1-55b8efbd62c6@oss.qualcomm.com' into clk-for-7.4
>       Merge branch '20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com' into clk-for-7.4
>
> Brian Masney (4):
>       driver: core: add subsys_driver() macro
>       driver: core: platform: add subsys_platform_driver() macro
>       clk: qcom: convert drivers over to use subsys_platform_driver()
>       clk: renesas: convert drivers over to use subsys_platform_driver()
>
> Dongfang Zhao (2):
>       dt-bindings: clock: qcom: Add Hawi GPU clock controllers
>       clk: qcom: Add support for Hawi GPUCC
>
> Erikas Bitovtas (1):
>       clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
>
> Esteban Urrutia (3):
>       clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
>       clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
>       clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring
>
> Gabor Juhos (1):
>       clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical
>
> Hardeep Sharma (4):
>       dt-bindings: clock: qcom: Add Kuno Global Clock Controller
>       dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>       clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>       clk: qcom: Add Global Clock Controller driver for Kuno
>
> Imran Shaik (2):
>       dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
>       clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets
>
> Jagadeesh Kona (7):
>       dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
>       clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC
>       dt-bindings: clock: qcom: Add Maili camera clock controllers
>       clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
>       clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes
>       clk: qcom: Fix camera rivian PLL configuration settings
>       clk: qcom: Add support for camera clock controller on Maili
>
> Kathiravan Thirumoorthy (5):
>       dt-bindings: interconnect: Add Qualcomm IPQ9650 support
>       clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
>       clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
>       clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
>       clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
>
> Konrad Dybcio (4):
>       clk: qcom: gcc-x1e80100: Don't poll the status bit of GCC_USB4_n_SYS_CLK
>       clk: qcom: rcg2: Initialize shared floor clock state
>       clk: qcom: rcg2: Propagate force-enable status errors
>       clk: qcom: rcg2: Clear force enable after rate failure
>
> Krzysztof Kozlowski (1):
>       dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
>
> Luo Jie (10):
>       dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
>       clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
>       clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
>       clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
>       clk: qcom: ipq-cmn-pll: Add NSS clock support
>       clk: qcom: ipq-cmn-pll: Add PPE clock support
>       clk: qcom: ipq-cmn-pll: Add PON reference clock support
>       clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
>       clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
>       clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
>
> Muzaffer Kadir (3):
>       dt-bindings: clock: qcom: Add MSM8952 global clock controller
>       clk: qcom: Add global clock controller driver for MSM8952
>       dt-bindings: clock: qcom,rpmcc: Add MSM8952 compatible
>
> Qiang Yu (2):
>       dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
>       clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
>
> Shawn Guo (1):
>       clk: qcom: Sort Nord clock driver entries in Kconfig
>
> Sivansh Gupta (1):
>       clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate
>
> Sreeshankar K (2):
>       dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
>       clk: qcom: rpmh: Add SM7250 rpmh clocks
>
> Srinivas Kandagatla (1):
>       clk: qcom: fix SM6115 lpasscc register offset
>
> Taniya Das (17):
>       dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
>       dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
>       dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>       clk: qcom: videocc: Add video clock controller driver for Eliza
>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>       dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
>       dt-bindings: clock: qcom: Add video clock controller on Nord SoC
>       dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
>       clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
>       clk: qcom: videocc-glymur: Add video clock controller support for Nord
>       clk: qcom: camcc: Add support for camera clock controller for Nord
>       clk: qcom: gcc: Fix GPLL enable register offset for Nord SoC
>       dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
>       clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC
>
> Vivek Aknurwar (2):
>       dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
>       clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi
>
>  .../bindings/clock/qcom,gcc-msm8952.yaml           |   65 +
>  .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    6 +-
>  .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |   80 +
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |    1 +
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   23 +-
>  .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
>  .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
>  .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
>  .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |    7 +
>  .../bindings/clock/qcom,qcs8300-gcc.yaml           |    7 +
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    5 +
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
>  .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |    7 +
>  .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |    9 +-
>  .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |   53 -
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |   47 +-
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
>  .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |    7 +
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 -
>  .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |    7 +
>  .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    7 +
>  .../bindings/clock/qcom,x1e80100-tcsr.yaml         |  114 +
>  MAINTAINERS                                        |    1 +
>  drivers/clk/qcom/Kconfig                           |  149 +-
>  drivers/clk/qcom/Makefile                          |    9 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 +++
>  drivers/clk/qcom/cambistmclkcc-kaanapali.c         |    7 +
>  drivers/clk/qcom/cambistmclkcc-sm8750.c            |    7 +
>  drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++
>  drivers/clk/qcom/camcc-glymur.c                    |    7 +
>  drivers/clk/qcom/camcc-hawi.c                      | 3152 +++++++++++++++++
>  drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++
>  drivers/clk/qcom/camcc-sa8775p.c                   |   36 +-
>  drivers/clk/qcom/camcc-sc8280xp.c                  |   13 +-
>  drivers/clk/qcom/camcc-sm7150.c                    |   13 +-
>  drivers/clk/qcom/camcc-sm8150.c                    |   13 +-
>  drivers/clk/qcom/clk-alpha-pll.c                   |    9 +
>  drivers/clk/qcom/clk-rcg2.c                        |   35 +-
>  drivers/clk/qcom/clk-regmap-divider.c              |   16 +-
>  drivers/clk/qcom/clk-regmap-divider.h              |    1 +
>  drivers/clk/qcom/clk-rpmh.c                        |   44 +
>  drivers/clk/qcom/dispcc-sc7280.c                   |   13 +-
>  drivers/clk/qcom/dispcc-sc8280xp.c                 |   18 +-
>  drivers/clk/qcom/dispcc-sm4450.c                   |   15 +-
>  drivers/clk/qcom/dispcc-sm6115.c                   |   13 +-
>  drivers/clk/qcom/dispcc-sm7150.c                   |   13 +-
>  drivers/clk/qcom/dispcc-sm8250.c                   |   13 +-
>  drivers/clk/qcom/dispcc-sm8450.c                   |   40 +-
>  drivers/clk/qcom/dispcc-sm8550.c                   |   13 +-
>  drivers/clk/qcom/dispcc-sm8750.c                   |   19 +-
>  drivers/clk/qcom/dispcc-x1e80100.c                 |   27 +-
>  drivers/clk/qcom/dispcc0-sa8775p.c                 |   15 +-
>  drivers/clk/qcom/dispcc1-sa8775p.c                 |   15 +-
>  drivers/clk/qcom/gcc-eliza.c                       |   13 +-
>  drivers/clk/qcom/gcc-glymur.c                      |   81 +-
>  drivers/clk/qcom/gcc-hawi.c                        |   12 +-
>  drivers/clk/qcom/gcc-ipq5018.c                     |   10 +
>  drivers/clk/qcom/gcc-ipq5210.c                     |    1 +
>  drivers/clk/qcom/gcc-ipq5332.c                     |    1 +
>  drivers/clk/qcom/gcc-ipq5424.c                     |    4 +-
>  drivers/clk/qcom/gcc-ipq9650.c                     |   22 +
>  drivers/clk/qcom/gcc-kaanapali.c                   |   13 +-
>  drivers/clk/qcom/gcc-kuno.c                        | 1473 ++++++++
>  drivers/clk/qcom/gcc-milos.c                       |   12 +-
>  drivers/clk/qcom/gcc-msm8939.c                     |    4 +
>  drivers/clk/qcom/gcc-msm8952.c                     | 3548 ++++++++++++++++++++
>  drivers/clk/qcom/gcc-nord.c                        |   12 +-
>  drivers/clk/qcom/gcc-qcm2290.c                     |   12 +-
>  drivers/clk/qcom/gcc-qcs615.c                      |   69 +-
>  drivers/clk/qcom/gcc-qcs8300.c                     |  167 +-
>  drivers/clk/qcom/gcc-qdu1000.c                     |   12 +-
>  drivers/clk/qcom/gcc-sa8775p.c                     |   56 +-
>  drivers/clk/qcom/gcc-sar2130p.c                    |   58 +-
>  drivers/clk/qcom/gcc-sc7180.c                      |   60 +-
>  drivers/clk/qcom/gcc-sc7280.c                      |   67 +-
>  drivers/clk/qcom/gcc-sc8280xp.c                    |   47 +-
>  drivers/clk/qcom/gcc-sdx55.c                       |   43 +-
>  drivers/clk/qcom/gcc-sdx65.c                       |   43 +-
>  drivers/clk/qcom/gcc-sdx75.c                       |   44 +-
>  drivers/clk/qcom/gcc-shikra.c                      |   12 +-
>  drivers/clk/qcom/gcc-sm4450.c                      |   77 +-
>  drivers/clk/qcom/gcc-sm6115.c                      |   12 +-
>  drivers/clk/qcom/gcc-sm6125.c                      |   12 +-
>  drivers/clk/qcom/gcc-sm6375.c                      |   12 +-
>  drivers/clk/qcom/gcc-sm7150.c                      |   72 +-
>  drivers/clk/qcom/gcc-sm8150.c                      |   12 +-
>  drivers/clk/qcom/gcc-sm8250.c                      |   69 +-
>  drivers/clk/qcom/gcc-sm8350.c                      |   65 +-
>  drivers/clk/qcom/gcc-sm8450.c                      |   64 +-
>  drivers/clk/qcom/gcc-sm8550.c                      |   70 +-
>  drivers/clk/qcom/gcc-sm8650.c                      |   72 +-
>  drivers/clk/qcom/gcc-sm8750.c                      |   89 +-
>  drivers/clk/qcom/gcc-x1e80100.c                    |   80 +-
>  drivers/clk/qcom/gpucc-eliza.c                     |  606 ++++
>  drivers/clk/qcom/gpucc-hawi.c                      |  477 +++
>  drivers/clk/qcom/gpucc-sar2130p.c                  |   13 +-
>  drivers/clk/qcom/gpucc-sc7280.c                    |   22 +-
>  drivers/clk/qcom/gpucc-sc8280xp.c                  |   15 +-
>  drivers/clk/qcom/gpucc-sm4450.c                    |   17 +-
>  drivers/clk/qcom/gpucc-sm8550.c                    |   15 +-
>  drivers/clk/qcom/gpucc-x1e80100.c                  |   13 +-
>  drivers/clk/qcom/gpucc-x1p42100.c                  |   17 +-
>  drivers/clk/qcom/ipq-cmn-pll.c                     |  538 ++-
>  drivers/clk/qcom/lpasscc-sc7280.c                  |   12 +-
>  drivers/clk/qcom/lpasscc-sdm845.c                  |   12 +-
>  drivers/clk/qcom/lpasscc-sm6115.c                  |    4 +-
>  drivers/clk/qcom/lpasscorecc-sc7180.c              |   31 +-
>  drivers/clk/qcom/mmcc-msm8960.c                    |    3 +-
>  drivers/clk/qcom/mmcc-msm8996.c                    |    4 +-
>  drivers/clk/qcom/mmcc-sdm660.c                     |    2 +-
>  drivers/clk/qcom/negcc-nord.c                      |    5 +-
>  drivers/clk/qcom/nwgcc-nord.c                      |    5 +-
>  drivers/clk/qcom/segcc-nord.c                      |   40 +-
>  drivers/clk/qcom/tcsrcc-eliza.c                    |   12 +-
>  drivers/clk/qcom/tcsrcc-glymur.c                   |   12 +-
>  drivers/clk/qcom/tcsrcc-kaanapali.c                |   12 +-
>  drivers/clk/qcom/tcsrcc-sm8550.c                   |   12 +-
>  drivers/clk/qcom/tcsrcc-sm8650.c                   |   12 +-
>  drivers/clk/qcom/tcsrcc-sm8750.c                   |   12 +-
>  drivers/clk/qcom/tcsrcc-x1e80100.c                 |  347 +-
>  drivers/clk/qcom/videocc-eliza.c                   |  404 +++
>  drivers/clk/qcom/videocc-glymur.c                  |   38 +
>  drivers/clk/qcom/videocc-sa8775p.c                 |   17 +-
>  drivers/clk/qcom/videocc-sm6350.c                  |   13 +-
>  drivers/clk/qcom/videocc-sm7150.c                  |   13 +-
>  drivers/clk/qcom/videocc-sm8250.c                  |   15 +-
>  drivers/clk/qcom/videocc-sm8350.c                  |   31 +-
>  drivers/clk/qcom/videocc-sm8750.c                  |   12 +-
>  drivers/clk/renesas/r9a06g032-clocks.c             |    8 +-
>  drivers/clk/renesas/renesas-cpg-mssr.c             |    7 +-
>  drivers/clk/renesas/rzg2l-cpg.c                    |    7 +-
>  drivers/clk/renesas/rzv2h-cpg.c                    |    7 +-
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
>  include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 +
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
>  include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
>  include/dt-bindings/clock/qcom,gcc-msm8952.h       |  215 ++
>  include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 +
>  include/dt-bindings/clock/qcom,hawi-gpucc.h        |   47 +
>  include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |   30 +
>  include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 +
>  include/dt-bindings/clock/qcom,nord-camcc.h        |  167 +
>  include/dt-bindings/clock/qcom,nord-negcc.h        |    1 +
>  include/dt-bindings/clock/qcom,nord-nwgcc.h        |    3 +
>  include/dt-bindings/clock/qcom,nord-segcc.h        |    2 +
>  include/dt-bindings/clock/qcom,qcs8300-gcc.h       |    6 +
>  include/dt-bindings/interconnect/qcom,ipq9650.h    |   28 +
>  include/linux/device/driver.h                      |   31 +
>  include/linux/platform_device.h                    |   30 +
>  156 files changed, 19545 insertions(+), 1544 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8952.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
>  create mode 100644 drivers/clk/qcom/cambistmclkcc-eliza.c
>  create mode 100644 drivers/clk/qcom/camcc-eliza.c
>  create mode 100644 drivers/clk/qcom/camcc-hawi.c
>  create mode 100644 drivers/clk/qcom/camcc-nord.c
>  create mode 100644 drivers/clk/qcom/gcc-kuno.c
>  create mode 100644 drivers/clk/qcom/gcc-msm8952.c
>  create mode 100644 drivers/clk/qcom/gpucc-eliza.c
>  create mode 100644 drivers/clk/qcom/gpucc-hawi.c
>  create mode 100644 drivers/clk/qcom/videocc-eliza.c
>  create mode 100644 include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,eliza-camcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,eliza-gpucc.h
>  create mode 100644 include/dt-bindings/clock/qcom,eliza-videocc.h
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8952.h
>  create mode 100644 include/dt-bindings/clock/qcom,hawi-camcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,hawi-gpucc.h
>  create mode 100644 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
>  create mode 100644 include/dt-bindings/clock/qcom,kuno-gcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,nord-camcc.h
>  create mode 100644 include/dt-bindings/interconnect/qcom,ipq9650.h

Thanks for the fix.

Merged into clk-next.

-- 
Jerome
