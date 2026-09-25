Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B49E4E66DE;
	Fri, 25 Sep 2026 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354650; cv=none; b=hnNJEezKscv2rBmMBrhjfuVieN846JQTuVf4r8LKun+vkXMdH9XX+W6XNBHtS7cj1ns5MdEg8E+vuZalsDP3GrM0TS1MukHF9k56/g3J2jVSFiuxELqry3p/swed5wLFUZ7YkAbzk+mB6XSKXR2hlc5LbgasbM7RXfygGqQniXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354650; c=relaxed/simple;
	bh=b8XichCeKiftsg2WfYzA3wPPvvAfZ7KmRREYDWCxVyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkEETJG2sMgFJDR59FPy7ndk8/BfNFHG8D+IpvpqeoKcFD9RGLl4ocBxHKc4slEJTtvuDLNXgGD1RilLciq71ThQU3QTUlW9EOH4x5sqb/vQLv1Bqa5UUHgQZsu3L0WT7DaTPAmmC6nR73qXPgPle2S3tU16OWsTZxQM5InjQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkSqbA/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkSqbA/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758CA1F0089A;
	Fri, 25 Sep 2026 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354628;
	bh=rTGzckcjTROiNgCLtij5y8K7HvNox6fkm0iUlayx6Os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OkSqbA/88yfyXMtPB3RT5cpjf6xqSyfzYEzSWX5/YeP9jRk/COtNDDQa5Ej60/KCD
	 XcN/BpqlIXW6yOKHWv9lAFDEzgLNzhqBFY9DQk4tyM5+Otsxc4NA7SRvOGfhDB4QPJ
	 q7b26uJGjlBZWqdfS3SoH5x0EXgvGx9dze6kquC7SWHB56RjE3QJVczJ8bMtcQaKrG
	 w+vGLpqT46yOta7nrc2TtMFWWE95N6BKfKhDr03t9bSI8tiGt9paGAddAT1eRUphzJ
	 4JoBD3CjErthKbTyIrAE/ubenliN1IyjQOplYOr7O61aqD2ovE3M07XVB7sQcDkIwM
	 ep+O5gbYBsa0A==
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
Date: Fri, 25 Sep 2026 11:43:24 -0500
Message-ID: <179035461215.1296652.13047689320991053383.b4-ty@b4>
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

[01/42] dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
        commit: 55388f587b3301dffdb30074d00f069d80d29341
[02/42] dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
        commit: 80d35f528a46b5f1e9777ce83de48fd9efa7c422
[03/42] dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
        commit: 98e936c9d46a25b4eceacf907fe5d87b3999040e
[04/42] dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
        commit: 534af057998b59a4813fd2eba524f2f523f356d6
[05/42] dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
        commit: 4de0860a340888fd2582681facbceda71b375617
[06/42] dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
        commit: 779dd957c4c8a7d7d0fd8ac03caa27fe6db23514
[07/42] dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
        commit: 5a577a480dd3d764cc2f55a112efc92d59ad59ec
[08/42] dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
        commit: 76615e10462c425f926e50dce52e9d23bb2f9428
[09/42] dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
        commit: f9c74b6ed57922b1fdb1ed6835665e06b5ba01a5
[10/42] dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
        commit: df3faa0e74e433304f9a6f33d3ac4d3376fcdc06
[11/42] dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
        commit: 3d4f3414300bba79d517585ac10181e285ca6be3
[12/42] dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
        commit: fcf1810fede27777f9b708a9cef431bcac1d8e38
[13/42] dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
        commit: 6df1fd0bfa649c0f13abd026a01dbed5f1727fea
[14/42] clk: qcom: gcc-eliza: Tie the CX power domain to controller
        commit: 4eb8f2ad36888e5b29aa0a5e7e0bc60e382312ea
[15/42] clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
        commit: 18c75784e4a9db5ed8cf6818a29ec0ac15ea2c8b
[16/42] clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
        commit: 2d948e428c77b8764fe96537c70e5500b29f9c4e
[17/42] clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
        commit: eed0a644a28a39d9da91a10d51b8f3247302a533
[18/42] clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
        commit: 40537977a0ff9a6a1bcc489863e5656914b1ac53
[19/42] clk: qcom: gcc-sc7280: Tie the CX power domain to controller
        commit: 503de100eb2823519b82d759ead69ee377289a9e
[20/42] clk: qcom: gcc-sdx75: Tie the CX power domain to controller
        commit: 563b9aceb53ea15f2ada9417809d1d9e9a2c1fd1
[21/42] clk: qcom: gcc-sm4450: Tie the CX power domain to controller
        commit: 9965e30e827665e2fc9f0b3271733feaee809d48
[22/42] clk: qcom: gcc-sm8350: Tie the CX power domain to controller
        commit: 4572e9c0c4d48447d22a25037cbd2fbfda74a8c2
[23/42] clk: qcom: gcc-sm8450: Tie the CX power domain to controller
        commit: 6742c3ce04e5d52f718e4b562d0a1d817e1d76db
[24/42] clk: qcom: gcc-sm8550: Tie the CX power domain to controller
        commit: fe2a50974f4a0c78a68931f156d99e0479a4f00a
[25/42] clk: qcom: gcc-sm8650: Tie the CX power domain to controller
        commit: e4e6177235c6e0342357c48497d6b1a546c0ae57
[26/42] clk: qcom: gcc-sm8750: Tie the CX power domain to controller
        commit: f593d28a9193f1b5a96eb69bc5eb4dda2eaebebf
[27/42] clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
        commit: 965dd2be7d35b2474251ee60d44addb257c9c85f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
