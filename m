Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906D4EBAFE;
	Fri, 25 Sep 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354662; cv=none; b=bN97Zb5tJn06bKtLsqI5Av3dpvVqhQyUy7SThX3/GVP5nTa8JY90Vlsz8MCWNIX0FCD7lLqnhd7gk49rrUM1to01axwvCtDCHhQGyaFFCjwkSWQUYd/YlXHcahp0oyQqCMTSCGtJiTG4IwU/5GU2mVIRVRXu91YWFWjR/WyKbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354662; c=relaxed/simple;
	bh=vd99hyWNus1dm3oNFqRTzpiSro/ntSK6czeXELiAWPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkP8lsQq/R6tKGWu+FM0RiubfAXWL0oq2CFKMcXWl1TUEUhZZSaJjjU/HKooiNcJjUEFbB1nMc9bXVvVWs24YsLkweC2nd8izjSRNR1SdAZ5kUudxN5IEhUshQxpHFque/DMyzVye8jnAjjxs1I0XCS6A9eGSLSN6CPJjwLuhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dS4jWHfb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dS4jWHfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F591F008A1;
	Fri, 25 Sep 2026 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354647;
	bh=OtwTEtGy/sZ5uARp6+XkngBBWu7fVpXfGdOgzB4S3u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dS4jWHfbirl+7BBk2uS/nChT9khObIgQhgVVe7UrtMEB7cZheYTXJgsR1e8HgDxSM
	 MP7GnEJ2GxYZYIPA5EHpBAVVPn3lFYP/CSNIJ60L/He+GBi9ooBf/de3IDbEFeSLCS
	 Wa5ZbYgSPpeQx1oq7iD9BEbhn9n4Na4agP+2COJmFUtoRVTpXV5BHpHVT/aa69Doul
	 sLtaQ6tAj2fWQtBfnCJW+E2fP8orpLBxkqMZ+KlB5UjgkWIkfY/CSQ7+9XjHt2NJip
	 WvhljE3EKLBxKeMvfVY/nZIvcB3z3je97b2f/woaxrMfrqkoREi91XFvK2eg/GDFpm
	 auhUYzvx5lg4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] clk: qcom: Add EMAC CNOC APB clocks for Nord SoC
Date: Fri, 25 Sep 2026 11:43:34 -0500
Message-ID: <179035461224.1296652.13012448466686030720.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Aug 2026 12:23:28 +0530, Taniya Das wrote:
> Add support for the EMAC0 and EMAC1 config NoC (CNOC) APB clocks in the
> SE_GCC clock controller on the Qualcomm Nord SoC. These branch clocks
> gate the config NoC APB access path to the two EMAC (Ethernet MAC)
> controllers and must be enabled for register access to the Ethernet
> MACs.
> 
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC
      commit: 4abe035a0ff25081564ff3a5932c59200e9e2aa5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
