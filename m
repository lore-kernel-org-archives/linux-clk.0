Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794773968;
	b=ejQ3HdK/hfJP9pKQSR+wSYt1fDXh7ezVCuO4xLsX8EB1PDJOtYqewTI+Ap60TLqJsWdD
	 n2bACMcSbC1Ne5+56hZ1/BBNvi7UhzgcaVh69ESy2HYcNw1nxiiBY0hcerRho9SjMP9j6
	 zxhdQCDjUnsThIbzPoFq9u7HTYaaVID4qjALzHlfmfuk65ZgZC/uhLO/G1LBpF+OTK1Gf
	 3CP1kNXAnrpSgCW+sBBd38NSi5MB/Tqb6f9UCVAEuIXVc/pP7LLs8FQF2GvZdRBmKzuR7
	 aeeYG4fZUihJNENl48BGodbblmzDrRS9syNITboIYWm2PxxLigwPBNDAxBEWP5S8k+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773968;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=N/I/0Pxndct9nS3tOyPfTo1LC1fR11t5dySOMgpU4YU=;
	b=Tdhkb7oQxEp9qgSkMBsIAyd3eHu3hcpAkyzLCq60bdaI0/jenk2FQ1JTe63s/H3hVTKU
	 0NW7kc3iTcdOUqGZOvPe9dyWEbk4IEpu1eNAlro66dNcFZnKKjX9VIPpRZSQI7oJt2UHc
	 wXBDYLwIzH4nAIv5mXaVJkd1A8qmsNjMZGOg4JgVPMzdt95qXVJCyaa/TB88N4/SjM3DR
	 vIa7k5Ny3lJxSHc/5EMCvLWaHaYVfYz6lx62SvuQx3luszyqdcZnmN1t5xEuVIj+lDf3V
	 ytu4ytLGK1OOUaAoqjMxxETxC2vK0V1JIfIAd9uJXheRowZuF6XoTEWJumD7ewPR6VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgDwSDwk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3C606A331;
	Sun, 15 Nov 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgDwSDwk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773968;
	b=mzWd6KPVmfNz8Ax96TiamCjTslekw9wXkANac1I0q8DDi4j0XymE3lheB7VOYqPZ4ipo
	 a143g/RDBQXykYgRxbXKQ3hHubRBXP7pixHOo5aptNij5PVyDfFTRl/DOSFATMem/RghI
	 Q1Wulu2cghYDFgkCOwaTinIUae53RctjOrPyIj/MQberGDqtEZvzpUp+czShg8cfpE8jp
	 59fI2Me7RLHHUy2eKHlz1Ddfj7vILYo5q9COKpOj74bV8iEI5CxY08wrhuDhEzQkIx7v5
	 jj3IWc/s9JPH4elFOSFrQcb8/jP6wPuhP0CSBbW9A3V9UjpBs1C24GYmIpVLF8Afw1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773968;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=N/I/0Pxndct9nS3tOyPfTo1LC1fR11t5dySOMgpU4YU=;
	b=uAepX4tAwhKJpHGNBicGMwEWogg7djKf7HUWseaHS5si+ddAVjRrfGBZsyx/5+11RFXj
	 S0JUWXri4q5iOYptsUzNs6Tq5MsL9+v44bAhzzDSgyUavPRKcIJ50jLGjYKuwHO4Mj7PO
	 QQ7enof0BGzvL9k5vDEOcocuEYeiz6Pms1oyKEeC/+iBjeidytMCjUlDMu/etkTNe73vu
	 3LXrbjUuMoL/t+rzjs0V+AtZj79cKODEPSE88n4sJg7DQVLJw0ZAc4n/jO7o4uyXqaxjY
	 CfmL56N6MyEhS+y+lOa695jIGvW+0d3OvLDgmwSbgVAyaRcK6G69uD256V3E2SF/dAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C86DD1F000CD;
	Sun, 15 Nov 2026 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773968;
	bh=N/I/0Pxndct9nS3tOyPfTo1LC1fR11t5dySOMgpU4YU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AgDwSDwk+Nh4obmkzysM9Wgij7eBZP/h5CxYfgnAgbbj7q/1ENNjyPMTXlnFb+TEg
	 p6zv2ZD1uEZLhnpQcjzbWSztDY2TfkI8n9kPO8AdMMvy3sdHJxNCRW3BqOxHUB6inH
	 /ZKcCmx5bwQMRt/R9a1e60xkIwM/X/NC2xwItxdEXRogr9QCkO9MhsAjKzgeehDhNy
	 NrlYj3c5tNbRUeExvOUDA/SoPuNsiXH8U39R8gG/CVnyBfpNIxMlXY6Ot9udBoCGsf
	 kyRgYEZetpWLQZEwTvfMAlawVc7ysZjrWfm30ChYsbYNUxh+EzVvzgpjO3/klJgDYJ
	 T/LL7x423Og3A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 59C414A17E;
	Sun, 15 Nov 2026 20:19:27 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH 0/2] clk: qcom: Add the Molokai GPU clock controller
Date: Mon, 16 Nov 2026 01:49:26 +0530
Message-Id: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOQqAMBBA0avI1AZMwAWvIhZZRh23SGJEEO9u1
 PIV/1/g0RF6qJMLHB7kya4RPE1AD3LtkZGJBpGJgnNesMXOdpLE+i1ozYxEZUSZVyo3EJvNYUf
 n92va3z6oEfX+TuC+H7asA8pxAAAA
X-Change-ID: 20261116-molokai-gpucc-daebd2758b5d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773966; l=1228;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=7bCsfM7c1Cgrcs1XC/fQ/iOLDVlgSCphsmSr/082ak4=;
 b=MaAwnUUSajp+ZCWlFfSL3p07s8gH2w1ka58g1gXrOVAkwJRoAjIFe5keenY83dNY1bdCNhcjM
 DGFQz/BJBO9AHGXsZXntiSpVOp8rHPXwnXvANTsKjmlIK5WX6E06CCA
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The graphics clock controller of the Qualcomm Molokai (SM8845) SoC is the
Kaanapali one, except for the PLL0 CONFIG_CTL_HI value and three branch
clocks that sit one register further. This documents a compatible for it
and handles it in the Kaanapali driver.

The SoC devicetree that uses it is sent separately in "Add support for
the Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature: the GPU clocks come up and the Adreno
829 runs.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Venkat Yadlapati (2):
      dt-bindings: clock: qcom: sm8450-gpucc: Add Molokai GPU clock controller
      clk: qcom: gpucc-kaanapali: Add support for Molokai

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  1 +
 drivers/clk/qcom/Kconfig                           |  3 ++-
 drivers/clk/qcom/gpucc-kaanapali.c                 | 25 ++++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)
---
base-commit: 6a876df4686788cd39128b62d7fcbff62f39278f
change-id: 20261116-molokai-gpucc-daebd2758b5d

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


