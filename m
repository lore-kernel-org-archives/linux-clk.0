Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB784E3EFC;
	Fri, 25 Sep 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354653; cv=none; b=TjZ7cDu+YtUjU8Hp9ojc+UB7IyTtAJMMbdsZmKm+q7Auw2XbLV0MYki8hjRPjNV6SRo6atKlrV8zz7AzY+fvaqIjDnmJ8m6wSX/eHNs3fWcWvG9Fmivi9bSrnAd2ZUVfIyJ2uznHTF/BklNTXvX7/UVVv7RLtK1RPT+ufYqi1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354653; c=relaxed/simple;
	bh=dOBEGIQtMJi3KyEd0JisrI5Up/OLmXa+pw1vErLI0b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhd5c50VgrU3kDTJCrIFqzppc98BrDm2qsJnuQK4i0kQfPSwe4Qu6+SRyg0xH1fSsAHM5diE3VNXW8IXlNVLwW/wgUGUsB9OmXN5vDJMieMzM3MVLaSNvTTH4wI3XMYbVtwxVOP8tTStWVD+Z4hIXE3m4X4RPbEAP3RqzOYLLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkOvw2/K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkOvw2/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D65C1F00893;
	Fri, 25 Sep 2026 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354637;
	bh=kn0obPV5ydy5Ru9WFgJv0zuDn2drdBWekrb5BDSICjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DkOvw2/KzOz4PlNqA/ENeTOh2L8cm028uE0yNfu73UlW16nNjVkGYpWC6yJdHL/EA
	 YzrFlGMyCkVrSZt0/iFIcVabUnFVmv/6xWL50WHHnXYLU49BkUDunZB7RCoVIN88EE
	 dRMUljUc80PhW/rJJT/rAwYAQoIkxb3KDgiJ55I7Ttk3BVNMmxiefP18uyGwLgRsLn
	 O3D5u+xjR9ARTt+TzhOHiSW17nTwn/UTm0veOuXJmRiXloQlHgjW0h+V2camEX29jZ
	 LnLQjCEPZcfZSxHuaAAThHbkA7mBUAlF8DrhmnsPL3VC6uerOmD6TjzWmW0mcd2D73
	 h00li36nbsGsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Amit Nischal <quic_anischal@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Assorted fix-ups for clk/qcom/rcg2
Date: Fri, 25 Sep 2026 11:43:28 -0500
Message-ID: <179035461249.1296652.15594940609307519440.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 11:06:52 +0200, Konrad Dybcio wrote:
> The robot found a couple of small issues that I believe are valid.
> Compile-tested only.

Applied, thanks!

[1/3] clk: qcom: rcg2: Initialize shared floor clock state
      commit: b9a14395e6edfeb3ce241f19f84991106efcd3b3
[2/3] clk: qcom: rcg2: Propagate force-enable status errors
      commit: 396e900a120db686c3fe375df3b9fb6a62f173a6
[3/3] clk: qcom: rcg2: Clear force enable after rate failure
      commit: ae881bdb1b1d081ea3febcc16fe6ee16d3a2a0d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
