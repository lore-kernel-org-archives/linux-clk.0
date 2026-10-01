Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92651A156;
	Thu,  1 Oct 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865565; cv=none; b=PB5EPPEcgIVKAVwljMW9Nc6O9mT+OXj75Chz8Fr6hYBXtLZ/hW3G89e05EtWwadlFb9o9APaFUxm9UYilWtTrpfRKm/M2IagI5DgpPTA9wgcNMXut1GxZnJAPHlAlxLj8EouIUSPXrAvqzEc4Kzed5K8TyYX0FNvlDuOcORz1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865565; c=relaxed/simple;
	bh=x1mcmFODorlLOxx+KdY14jTTfjS03g+7143QHJaWdUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHxPst7jsQdRjzvNFhLQR+eoMRagxmX/IIPCP9GV6PcbyyDaY8Evf/2CYdx/2bs2mrhOmiYCorNC9u/TxLFfPyNWuXVkM/7ucuQrF0nwVUtaV6PgTpeErVPxI3mfd0L3oJS8DYbRGdphFcP2TaslwJEfhckWf84TS6o6uTEdkjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYH1C9yi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYH1C9yi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A66A1F0089A;
	Thu,  1 Oct 2026 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865558;
	bh=Zqr944MUTAng9/MUwJsTayj4y5qkmHFfqWFHtS30VEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mYH1C9yikVsWqYZcRr/xTb/7iPJPFiAjgPh3IhJyLg2gI13xZp3Zgip6BnnRfGtiw
	 MnwipDi/KDvYR4PkVyEv5ptUCB+0RCd4aXh/Mj3g6gHRjyvwbeQoIKdqX5uxYKuAb5
	 gXxGttwLeM0uKEfo117eD7PQaJ8OYpASgDoaMSbMhIrM2Z03UtJrDGDwEmNSvqESct
	 SFwthINgMsxzSGELdHWOtYdZCKR8wkH4j7wgdIfghEhkEtOvTq3tn0vgiTiYIeTSXQ
	 yhiB6t6xy2goS89vqL89nxYzRTJg3m5NMOKX2Is+y43CEU5xP9lO29apa0TYB3zSGb
	 WV/WuPxG6IKoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/42] clk: qcom: Tie CX power domains to GCCs
Date: Thu,  1 Oct 2026 09:39:04 -0500
Message-ID: <179086553016.3495936.2028744481705242969.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Sep 2026 13:39:16 +0300, Abel Vesa wrote:
> Tie the CX power domain to GCC clock controllers for SDM670,
> SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
> SM4450, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
> X1E80100, Eliza, Kaanapali, and QCS615.
> 
> Enable runtime PM for GCC providers without critical clocks, allowing CX to
> power down when their consumers release clocks and GDSCs.
> 
> [...]

Applied, thanks!

[28/42] arm64: dts: qcom: kaanapali: Add GCC CX power domain
        commit: 9339897ad7eded77adf834e032482f7609911448
[29/42] arm64: dts: qcom: monaco: Add GCC CX power domain
        commit: f5d35c78bcb6b96a4ad9b60e31657a9a389c8de5
[30/42] arm64: dts: qcom: sar2130p: Add GCC CX power domain
        commit: 787e304c81502bdf6993270d746d482891b91f70
[31/42] arm64: dts: qcom: sdm670: Add GCC CX power domain
        commit: 56002ee061ac5a73fb280065369133bfde40396e
[32/42] arm64: dts: qcom: sdx75: Add GCC CX power domain
        commit: dbd1f3e15714b470cd5801122d6a81e02fda92bb
[33/42] arm64: dts: qcom: sm4450: Add GCC CX power domain
        commit: f1579fca044a69dae2e134b315d4ee10ca5ccdde
[34/42] arm64: dts: qcom: sm6350: Add GCC CX power domain
        commit: b00fe15b094e8d50f24d43431de5486257b2b756
[35/42] arm64: dts: qcom: sm8150: Add GCC CX power domain
        commit: b1542c3e23012ffce3b5d7a5b6e87f0faf3a015a
[36/42] arm64: dts: qcom: sm8250: Add GCC CX power domain
        commit: 389a0144c511316cf21d5dc2aa30028de87f9d00
[37/42] arm64: dts: qcom: sm8350: Add GCC CX power domain
        commit: fb1adf2ef0574dd1f9d4481dbeb0d443300d779c
[38/42] arm64: dts: qcom: sm8450: Add GCC CX power domain
        commit: f1586048fb1dabb91c82fbe11557e505587973d3
[39/42] arm64: dts: qcom: sm8550: Add GCC CX power domain
        commit: df50f5c5690a472d750a0e327ac4d05a4a9c8b79
[40/42] arm64: dts: qcom: sm8650: Add GCC CX power domain
        commit: 108a8d51fba8432c5d5253dec1c565ffe7c1edbc
[41/42] arm64: dts: qcom: sm8750: Add GCC CX power domain
        commit: ee35c132956f4797ed6be33c451decb94d1752af
[42/42] arm64: dts: qcom: talos: Add GCC CX power domain
        commit: 5ad7eb6a944eea8471f496442c9a3609a286437f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
