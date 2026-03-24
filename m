Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D338D003;
	Tue, 24 Mar 2026 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321574; cv=none; b=YJFCz7R+WrXSlfpcWpprAVKvIbnA//JoclEJSVe5VK+PlGzmfLk1DNwRBnNdAZ7QkrLPBj6ylggXdofA4yLsLHWO7OeexBI+YbM7ieTojCP06jV8edJ1J6ODJnNVPR9rMaUQgO/30vJD3ujfCxgvoz4+GdwJDUJnghevS3a76Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321574; c=relaxed/simple;
	bh=Otm54ASjK0RBr3RF1WMY+rTCVZWTsGG5X2KkiI/YJWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrleA79xCerMr8K0NcIbctt1n10kZcttuBHd+okxS1nCzuPW87BdE8ikF65KlawCuZkxBaKiMt06NLdZykMcmtCyjRNBPpWPTEhl32MaQpZ11jyG8808ZkQFAUr86GgjgWxEOxRKWYCVWZHuflXk45RCFIBTpj7pn8I/xvIT42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDVoeMVy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDVoeMVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185F3C4CEF7;
	Tue, 24 Mar 2026 03:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321573;
	bh=Otm54ASjK0RBr3RF1WMY+rTCVZWTsGG5X2KkiI/YJWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kDVoeMVyHlzDjb1MG2i3Sk2cqpg9URr2b9Qo2PPBUHplp3XWfoZKuG33MiAgY2APB
	 X9nyHYVV0GcMmp3BN88KnZFqToMQTL4jHqvtSOMG67lYgYqSphdU3sbSBKTmucjurv
	 Ced//Q5oSZxorPGPrgOottyrSX/wBhkZm9rsiSBaaHKL8iu6bD95lSkvGQxAXPkFwz
	 HrIrjYPCwR8OT/j4w2yQOrYKFRRD/4EZat2wtObm7EsKY4RyQ6I14t0cdzXuzcuaAD
	 NX3LgjWap56ct2klzwLnH6qBnPKBJ/O2WiITuimK1ITc41Rc0yPdpOEt7P1mRQW0MO
	 zGuP7rCQ7mHsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Date: Mon, 23 Mar 2026 22:05:56 -0500
Message-ID: <177432155620.28714.11572958087082246865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Mar 2026 17:50:28 +0800, Pengyu Luo wrote:
> Recently, when testing 10-bit dsi C-PHY panel, clks are different
> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
> 
> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
> 
> byteclk was set first to 108120000, so the vco rate was set to
> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
> 172992000 on mdss_pixel_clk_src later.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
      commit: 0f5c8f03d990f9be9908a08a701c324e113554d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
