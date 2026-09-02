Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7894AF667;
	Wed,  2 Sep 2026 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385520; cv=none; b=c3q8P/gwZSSpQoPT1M3v/lAsXkAy7NZEMxbv+0btGoaiixmIdeNNMhNap2LahggAlX3foxawBPGTeaEw8t07KmxmDJYrn9qhgFHXjEii9RYsBEP2TVVyfiy5Tzc6XQ6HXyUA6ihGeWBVrEqpLrd4OMgzGM/GF/+HP71E4HuW/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385520; c=relaxed/simple;
	bh=q1Tx+BFAn9gHoWn2JWg8Y5O+wTf6C4ZfCt9Li+r6GsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTBHXnJzWTpSYKH0gQShHwPdIkKqh6oUGLRb9wZxiLXiwQv5Dg6WT+37ji/J0Besh/lqMk4Sv01XrP65ehoORCcf/blmNKE8j7Hr7Gtt5Lvz8xs9g16bpCuuBOO/gf3urDlrpM5OS3lhvfSWLtqFSnTYVeEPx2fsRgnB1+BS9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRxYclq+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRxYclq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB681F00ADB;
	Wed,  2 Sep 2026 21:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788385503;
	bh=imuUUCFiKsF+D8VweZLdAB5tEHRZg5l8J7XyyD5i58I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BRxYclq+L2KZk4J3mcWRTYoakDK/JsMS0JfQHJ5FX5wmEi11Im592a0m2qIO2dZSj
	 HETsC8P75D+flI3NSpHb6ZdTuZc+eIsv9pb4/T3sYJIRulGYr3F2AJJMk5sTUFBsMx
	 StYfX1ngs6RdGsYBQ3mkY2HLnoLeBgMzW6aL6aeAFYTfL2vRqrkjqU78pB8ajAZ19B
	 L0uYNGFoTDtr40KnF+6vXRJLaN05hWzcOdGM1hIoKnje2Cnw7OufJ2zuyrkB28i1cI
	 T+kdw3LL7Vaf3CYiV0pAzEQSO+szmlYsVaXhh9aifZZOZ75+bq9ThdzAE6IihEUClL
	 0y6osFeLE9BaA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Wed,  2 Sep 2026 16:44:48 -0500
Message-ID: <178838546716.167607.3600451896354681800.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 23:00:32 -0700, Qiang Yu wrote:
> The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
> PHYs and requires dedicated LDO supplies to operate. The digital
> control interface for QREF (clkref_en registers) resides in TCSR on
> X1E80100. This series migrates the x1e80100 TCSR driver to the common
> clkref_en helper introduced for Glymur/Mahua, and wires up the
> required regulator supplies.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      commit: fcbd3151c9beffca044ea7a085d7e595ebf34f74
[2/4] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      commit: 011ed2a61f44b352bda71a82213f621bbfdb40f9
[3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells from TCSR node
      commit: 4d8ff3d92241d9ae4fdd5fed7a810a116e37eb0d
[4/4] arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies
      commit: d9d07e230c45cc11a0046b46354e413f2353bdf8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
