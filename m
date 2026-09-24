Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AC31619C;
	Thu, 24 Sep 2026 01:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211980; cv=none; b=s9kmujuzd6VZ0yUDARPJnDD/gBHGb3k9K2/R+2vG+OO7smKjsLOf2PggJQNJHbVo6qygUFLHkKFzkZx+moLvWeN1WKF76WXH7FR5Dcl2WwwCO34Q6r4sE9qDK8exI8TZtYgBrGkEmjIWsmDmisSGJ8ceei3BijeILDHzq+vbS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211980; c=relaxed/simple;
	bh=hKisWWthgIJ05EeHf1WTfYArOSrLOYklqZFFV/KQRPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmrtGKbWJ3Z6JLHsrSc/qbZ+gyU8p9/PENI+28WfyxPo2dAECB3pxpa0YDgqrWkxa5UWbx4drbexcN0UwJ0xmMY+ElgcN+23C2wmG1fDKVYEMdayjuc0Olu8UXc1j7ucAf63AhUCJJLwKUaN/ZcIUygmqzWb4YqYQgCHyJcE9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItqBHU/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItqBHU/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AA51F00893;
	Thu, 24 Sep 2026 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211979;
	bh=YqeoSLYdALq7MaNF/Lip153sMjpfNRvuTEwdt27dlio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ItqBHU/6xrX+o5ajBfb1WeNJuzm3tcV0prkKruNTHHp+a2NiGeB2cRA/PIZPFuOPw
	 6iRYAKnr/rUh845Y7z478UEpAfp0CEkXX2TMlLGcx1rfDnLt3iraHw2TQ2xj1NA6U3
	 kYcW2NlEx47QQbNkiStiauMUN6ZW0dIxmipqwo0sAVELQ/VCjEXpyzgaKBlqoXrF5H
	 pOswLU+/24hUIKSKUqGejhzuIyf3b54xfPJqkcnGxzVS/3DVbwkyc8afsp6eWvo+7b
	 s+1xTPR4EmoobGAm+6CZZz4aA/HRm/OBdemZNtsqw9dziBBG6cU+Eotk52ZhR4ySub
	 7IcBSyeIie+dA==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] clk: qcom: add camera clock controller support for Hawi SoC
Date: Wed, 23 Sep 2026 20:06:13 -0500
Message-ID: <179021133113.298587.12180746570506133992.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
References: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 10:33:00 -0700, Vivek Aknurwar wrote:
> Add support for the camera clock controllers on the upcoming
> Qualcomm Hawi SoC.

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
      commit: 5cea6b0bbf1ca6e2b20262b4790aa7b7db48ec04
[2/2] clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi
      commit: 5e5669f4519779ac9c1ac3aa8adba62167744cfd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
