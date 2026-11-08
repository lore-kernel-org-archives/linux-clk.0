Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169442;
	b=GsmTQo9YcqimXKgx4eIbMlr89UJJId2al4YqVOizPuo3lU8yXQiRYqBiP+qw2F/CmIfl
	 kWPgvAu7CFkJtTl5Ymi4lBpV9WIWfC50CgqUlyABjRLHUx1lfBo/SDcau5lBeXFvCRxzq
	 My5MWeecm45sfuMmMRAzjxRphkM/+oC7GBOYh2tv5mOryn6LJ00/gYeu4h65BJR8YwfDu
	 WyJjGODS9/9DkW4gB5PgzKyeQynQb3NHdCxlXwDeQxORSCDFw1+q+qsYx31fBRfReEE0s
	 ELWwYwfM1M79T1QSiO9tuNxwW2BmXygxVJcY1zgn7TfywL32RlP8Lf2blQQRC0mvc7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169442;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vrR/r3Ek6bQg2j8c20IraZaSWW4eL9t1WoWUs4dKmWE=;
	b=ei7ciLFlpkER9tHgTnmYueAzHdjkHyXEd168Y6D9mo7sE3NG2L48kUq8V278OxahbIUF
	 eTECmRzX7xjTw84NhhHs7DjYLinj4MI12SXjS1t8mRAaC8okD/VSE2oUuZ/vSjaFP5t2g
	 RFC70gCEKp7oqnBx1dlK+BkwkFfokPpC/w+L2q6m1B85c8NtbueVSLmuCPwznFZCHAzYp
	 sqfH2M/A/GjzM84PWbeibCKkdd657XLC1QMPi6By+Dz30x5uVtkKN+SIjK1iGGshrmeCk
	 vxMX2N4fgqov4xmGhz4a/U7FRKbJ/OiPYzOST25qWWX5HRIVPUMEs1MatE8Rc1kQ62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8AOGdh5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10681606A33B;
	Sun,  8 Nov 2026 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8AOGdh5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C2B1F008A5;
	Sun,  8 Nov 2026 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169441;
	bh=vrR/r3Ek6bQg2j8c20IraZaSWW4eL9t1WoWUs4dKmWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R8AOGdh5bHOunVHaTJiUsGGtgiqsbICyObmPsD4i8XI6Xt7WTJ5+bLTxYk/5Prvpl
	 zD3MUW8es887mWGjykKMi4um63nhLMsLUgq9P5RZmtU5qD3cOnMAd8+4TNnK4/hsvw
	 iiytl0aSSR3A3Eqv1JAoIJDjQXGthzT8r1/jvlSZhjfj3n8nABsCfrhcOa/zbuHHqO
	 ZT1bq1v+l/9onFMt0EWiky6cClWEqSoMs8O0FKxKoCYvCbNHTfSxcu5jxGc66NK6oB
	 2zwoTrhnWJZ1kuFGN8J6CypehFcoHUz+iXNFuKmL0E4ept1ca4R5mdDfRO5yiU61RO
	 GySPR6UP1onAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrei-Alexandru Bleortu <me@andrei-z.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: gcc-ipq5018: stop UBI0 clocks from reclocking their parents
Date: Sun,  8 Nov 2026 14:20:40 -0600
Message-ID: <179416929320.628393.11631379533983350306.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002121920.994608-1-me@andrei-z.com>
References: <20261002121920.994608-1-me@andrei-z.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 02 Oct 2026 15:19:18 +0300, Andrei-Alexandru Bleortu wrote:
> ubi0_axi_clk_src and three UBI0 bus branches (gcc_ubi0_cfg_clk,
> gcc_ubi0_utcm_clk, gcc_ubi0_nc_axi_clk) carry CLK_SET_RATE_PARENT, so a
> rate request on them is propagated to GPLL0 or to the NoC clock sources
> that the rest of the SoC runs from. The first patch is the one seen
> failing: a 400 MHz request on ubi0_axi_clk_src made GPLL0 the top of the
> rate change, re-ran set_rate on every GPLL0 consumer and hung the eMMC
> controller. The second applies the same reasoning to the bus branches.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from ubi0_axi_clk_src
      commit: 43c6655e538de45b18a42838c956f103858c1437
[2/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from UBI0 NoC branches
      commit: a36030400a2d82a81fc7f021fe4f7e2bbf229115

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
