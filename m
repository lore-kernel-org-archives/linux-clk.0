Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9643515DE;
	Mon,  3 Aug 2026 03:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727463; cv=none; b=hdIhDsiqoGdL/Ln+A64x5wSnKOLsbMSnz8uwP40gItZRG1f4gS/ILK/0G+imqYEKApLY5gfgUKJWY6hq9V8+r3mqeOC8vuwAZhwCu5HSQ7IkAtfEsQqcCnLpmpKWLliZx8y9QjyjyhUaIbD7dHXqDtx+2By80qPUjkUfAIS4c2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727463; c=relaxed/simple;
	bh=Ahu0MMQGnT9Z7bAzN/7C5XKZ9OcA7OuH4s/nh3oMNrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RRboLQMUmDKdm0Rfx81QZFBlkwGhHgcmupJEB3/pnksROCHbF/Mj9IKKR2KRh9HLFNfqd72mEcs0Bhv7L0mwBrk3QYpowFY4NJ79yIp22+cVWk9G2tfsBtCd8ldGs+65rZXakH3fgEaUy3TZxqqUlziaqlAMjDHnLbQfQ4Dy+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHleeoU7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHleeoU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272451F00A3D;
	Mon,  3 Aug 2026 03:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727460;
	bh=oxZLeNiksAbuDa5TdWS+yGjTQkPKyUiiJoCnufkyXdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hHleeoU72bvQngkhJPFMMpQC8Q+nSdcU1XLPv18yyOIwAA4MC+cb6buZFzNlxSfTo
	 LT5A4h1lXqHnqxAPRrGx8oNvFz+vud+YjitB+o1bQEiTMz7+TQQ6gKVmKfEHOLt4fv
	 H3Qd9DkLU/PeaMdhVxr7EbKC/NInzcmzYtD1unModZ0AiCy+MOnt15fWCLzM2Tl1pX
	 qlL/VItY3yeF6rw+81VYMDzKi3KkhGS6STPDADSRlD1gAptDXuWX5U9Z87eNCtywBZ
	 KT48M0dyZLYJKrWB4fvdyCZTOaCKGPXOGINSxlirheN12yn71SFEtlZM9edde1lVXb
	 8GRY1bVBq7Ymg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] clk: qcom: Add video clock controller support for Qualcomm Maili SoC
Date: Sun,  2 Aug 2026 22:23:58 -0500
Message-ID: <178572744554.408250.3637992253039168972.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
References: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jul 2026 09:44:43 +0530, Jagadeesh Kona wrote:
> This series adds support for the video clock controller (videocc)
> required by the upcoming Qualcomm Maili SoC.
> 
> This series is dependent on Maili GCC clock series:
> https://lore.kernel.org/all/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com/
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      commit: 58410321dbdc6e11037158b16f889fdb076774b0
[2/2] clk: qcom: Add support for videocc driver on Qualcomm Maili SoC
      commit: 778149217dc01becdca9df2b004ba1b6dd939e27

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
