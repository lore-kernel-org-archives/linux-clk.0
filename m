Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E0539EF0A;
	Mon, 31 Aug 2026 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207712; cv=none; b=d5Z/+2dubAaa8XHbv7XHTbWc76cmKOsIsZMGd8iizK4tmvs/uet57+Frkl8Y1xatkhaxuVgLvSHuYrld8CHZvCZBCJTaghXah0LEoGLQWliyKkdoXdCzu2FniAguz3s91RcoCMoutj5rAlJmAwUTtaOoNHLpuiWn1lvNAo2qevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207712; c=relaxed/simple;
	bh=sMpKEe2vZtleE9sBwibG7el4oQdzd1NeYpqC9c+jZo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUceiKLbAXBad3sk+0zrs10LWC/A8XTNVnkxh1hlfOtzuu0Xg/OJZ+JnybAqE1b8kiu8lnmTiVx8CQxZLFD5s2sdbAfWwe0qMYTqz6apM1Pf0TqRIUtXnYDuJTeJ5QJC+IIqlqxoq7FcP4PNufNicy1MRQfvTATgnO4+Qta/U1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZabFlf+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZabFlf+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773541F00A3D;
	Mon, 31 Aug 2026 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207711;
	bh=49Ald9KJwatu8KbCg55GF4r1JrPt/AXEue5I5Kqlbx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NZabFlf+JTz1tv9m8SjNdokfX05IXB3NC9MpHW3Jpo6EtZocUsJ7ui+Jvvbjn7V18
	 x6fnpzv3mV4JE9JUd+ragcS+f2TNwNSva555nfr28eZRZD4eBvKtVHqf3a4BKxZmET
	 D2QDoWpLXb8396/+BiCKQL5KnHreWiADM3pzDNSwwWF0Qx9RN13kEnpmkQWnipa7Ll
	 PBlf0+iJRHrrLSc3ZuEvkqLQtViMacR0j8OKfoZ/ygfmpwArYwcMZRvciMIFNJOBbA
	 4VbltGVz4vymOAwl4sN8Bm1o9dVpMZ/ARiAsfwuu3Lm+wjt3txvB0ybeQ/CDe8wTCB
	 cfZOQgGtNipWA==
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
Date: Mon, 31 Aug 2026 15:21:26 -0500
Message-ID: <178820768650.1699313.8829513297811537129.b4-ty@kernel.org>
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

[07/10] clk: qcom: videocc: Add video clock controller driver for Eliza
        commit: 223228051cdbdc6c8786b311b431ed162ee2be45
[08/10] clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
        commit: 10089c1832c993a2dcc689f2ddc934440390561f
[09/10] clk: qcom: camcc: Add support for camera clock controller for Eliza
        commit: 115631176f8aba9e281a3599c10f2d51263e057c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
