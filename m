Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A28331A63;
	Sat, 11 Jul 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799407; cv=none; b=DPbfeYi2ORC5CXs/ANyBR32G0Cq3PdmuJ0cLPcEdxoGatTHlUIAm5cYdXnoyKrdSiGJ3J0PsnbniQ5ENPgaB5exBRJNtCiCc9IWTi3Mhe8yvgW93BdQlehoQmVjlAmQ4u14O4wr2AtGn8nPkt2ahOrif3nGUdi4H1eEla4hAg4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799407; c=relaxed/simple;
	bh=xQROGWA/C3Y5rSOB/8ZeKXnE4A//GanDiJtHSljVUvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0ZStdoTGeDgaTrUDfk0uvaLHAildWyFl/MOq/QkdhBGEyqOnPChMVRLjblRO7zHlkKgaSoYh5KpMN//ME5O2afH80tl5/R6qqV69g4BBRUTXEL3i3Gefdr4bVFsWH6xyF6haIpj/sQXLwWPtm4ynV9oLwkapodJZpev4G/my8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fz1Ms/aM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fz1Ms/aM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00AD1F00AC4;
	Sat, 11 Jul 2026 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799406;
	bh=9Bf96eOE11LfisdbELmHvkebawDN0vbCBm+iTV+nvFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fz1Ms/aM3YnXq0in7a2GYwMepZRu3nSqTAMYnm48K/dyZeliNAEUIaORAmZmAwKyl
	 eIJOigF1of6PCHsHbNSwye7iBcGnwzmQHokZmkrj7R9PvZu13euBN6RvR+xl4GKELy
	 +3/pRDtL437172TkyUxCThL+m0muV9Nfu7GlIZ9qPn+/j6yL3XHKPn8QpgXkAP6OCQ
	 ds3RbItM833GIOv9KLZibwzG6IPpgzNqZcp77H+TVgxuenRtfHIFACr6isph597jMn
	 AXitp1oeG5WSPC+P9dzPhqeiP6iElzl53eK1GnuHhJtJz0vLBUHl2T0IxBQadWuFOm
	 07BMNMO04PiQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] Add the clocks needed for the REFGEN block
Date: Sat, 11 Jul 2026 14:49:45 -0500
Message-ID: <178379938604.163099.11555426083133941686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jul 2026 12:25:22 +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
> the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
> is enabled on power up but that's not the case for IPQ9650 and we have
> to explicitly enable those clocks. Add the required clocks for the same.
> 
> 

Applied, thanks!

[2/2] clk: qcom: ipq9650: Add clocks for the REFGEN block
      commit: e27e02fff418d713bc52c2d929ea29aa6ac4530c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
