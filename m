Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435A43BDBA;
	Mon, 10 Aug 2026 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387578; cv=none; b=hJ8EBWNoOwWa/dOUPlgDibRPIqy2rBe1dHVPk+MRP9zpnEDOo1bklU/emCboH3J8mZcKPJCWesgWe58OLbRSYCcrFCWo58YJsH37jHhCUI0HJBkPY7rBRQrQ78K/ZgrDA/qDo02zQ9nFUwR4o6UajvXqKuFUYe9CsXON9WJfaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387578; c=relaxed/simple;
	bh=a0LlIP+HMU3eOFnLe/5T+Py6YsXXNbldccXpdhkTIaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LgorCiK1yXytBC5pQZqZJqVcKsFzEtlg0j69MqaUrTy7Hf+xEio7TvPFik3qN/JaF10vFib+vAZ+o5fx/gAJEKp+H6nTcJzBFcRl1TSLk6lNZZrNVcgCOfBceFflHQpQ+8q7oHTpMqCTGfowXgfhJnjnnJUB+QA7yXdnTtxdz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4h8IEw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4h8IEw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E133D1F00A3E;
	Mon, 10 Aug 2026 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387577;
	bh=upR4Vi3xNazhK1I/FkGMlrEXJVnoArbM4XHLEs7N1WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d4h8IEw1CmuBqx0QEoap6yBmZMWkxLTEpwoGhXHNYRS8d2WA/eSeAPr4sASylKQgo
	 kZb7p34HkS4KgRO6u3balWNonE9f9OVpn7ZWjipe1Wn3A4QpnhAYixUXRUUnHfTOT7
	 XH/8tRN4KOjNTqnXIjXD9Cm1M89yK/AH8Wm6FiPsk1VaGYEru2g6c/2OZWPxadqs/o
	 p20b6r1Q6JIy12SFVJQ0mDlcqhX3184zpqSvS/toP+8KLy9ux5vledkvVqiaJGX4iQ
	 +tnjs1WLMRwEZ3TUGnNZbdhvcqHalfwbQuruP3NQghnnjbB7fd0bh0TS9KSnd87UYS
	 La/cLU+w8aWcg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Add support for Video, Camera, Graphics clock controllers on Eliza
Date: Mon, 10 Aug 2026 13:46:01 -0500
Message-ID: <178638756037.656675.11284989692153277495.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Aug 2026 16:04:05 +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Add explicit power-domain voting for Milos
> which are required. Hence extended the Milos camcc & videocc
> documentation bindings for Eliza.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
        commit: 13688b7326f7c32c1e9353052e704a3832a3ffdd
[02/10] dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
        commit: 87a346905e8f86b71e3a6550f91487c08bbbf8f2
[04/10] dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
        commit: ee2c9844cbc19a37d7ff0983c35235be23d9935d
[05/10] dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
        commit: 26461dcf5de1a3645bf9bdb1558f12ea20df991f
[06/10] dt-bindings: clock: qcom: Add support for CAMCC for Eliza
        commit: 741cf4c3e4bea26815deaaeb4a2408586759bee2
[07/10] clk: qcom: videocc: Add video clock controller driver for Eliza
        commit: 6b56dd100d66c7d9e0716402510950704f41ad2a
[08/10] clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
        commit: 4cfe35f2ef21c4b6281d8b73fdbabaa6a8aa1440
[09/10] clk: qcom: camcc: Add support for camera clock controller for Eliza
        commit: 17755aed77456b1425575f7b3874c47ff5b88ce1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
