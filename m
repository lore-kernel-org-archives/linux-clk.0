Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408B4398ED;
	Mon, 10 Aug 2026 18:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387575; cv=none; b=Mjjhw+cpae7Ff2l5pxfLbMS6vooePvH0M5ABw0jNU2r4G/hlQHJvuBW25qUA3/hHB0m0XjSkNxgc++Cu0yh2A3/V9sIoRlCu/CrxOdtGP88Ys51VumVQbPUE9ujvHAJi7urDXjWlEwVLljcOq9wg7Dx6yeLVcjjeIy4TdZt9t5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387575; c=relaxed/simple;
	bh=j+Le6IshhwvpfRaKcxwDEvYRdzy/CZB6SflJxt9yt+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwuN1NbmdDbHlvoijczLUL78IabteYJdpB4qeEkRT3+f1XpV+va0070NTTBN45LAdciZ58reE3v1W2N2Hm6vHzW+XBuufuMe9wG4L85Ha/uPojIWq7hH5B0wyBauzG8K8AE4Z9cRx5S26Tm9YGcMNfPnJFpaa3Yt32HRJfGLJIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTfVRsDf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTfVRsDf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C001F00A3F;
	Mon, 10 Aug 2026 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387574;
	bh=OIzmiiqhmGY51hvmpZvHOxSrDbG1EGLxtEpxOxUiAw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fTfVRsDfIp1YVhJzrSDsobXry/S/gqCMrDRB0sKxwNwywhT9nvRBkT+msOwNESdrL
	 WBXERqxBI+J5TNp9c8TLvErCE7v3eeTsAQ+nLaZ6321n+czuf8GZEbKTo1llpjUiN+
	 tR5iRJEzZClcpF3/ljzNf0Dvkn2H4/WfHA1lBU7eC7iGtrcbTwIUBDSmvwBYij4fsG
	 VhOYKYbAxCg5c4xiq86eXOmtjlkVh6clE1JewajBkwdPmkoZH2Sh5ZUFs8JZQMS5Tf
	 2RxcFLjlG+sfKedQp5h/XrNorbbF+7CvC6qRO8MJsSxGuhGSASG/OIGkNyP+FQXTmG
	 Tqh6ClXP0U9WQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/3] Fix always-enabling PCIE_RSCC clocks for multiple clk drivers
Date: Mon, 10 Aug 2026 13:45:59 -0500
Message-ID: <178638756034.656675.3330999499469928207.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Aug 2026 09:46:03 +0200, Luca Weiss wrote:
> I've noticed that the .clk_cbcrs list in multiple clock drivers enable
> the GCC_PCIE_RSCC_CFG_AHB_CLK and GCC_PCIE_RSCC_XO_CLK wrongly.
> 
> qcom_branch_set_clk_en() will be called on each entry which will set
> BIT(0) to enable the clock, but this is wrong for these two clocks which
> -- this is also why this is marked RFT -- at least for kaanapali
> needs BIT(20) and BIT(21) set to enable them.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gcc-eliza: Fix always-enabling PCIE_RSCC clocks
      commit: 34e0ef622cd41eb5ee77d6aae79276c12de7c20f
[2/3] clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC clocks
      commit: c83e1427064e6fe95604b469f4c670e1839f409a
[3/3] clk: qcom: gcc-kaanapali: Fix always-enabling PCIE_RSCC clocks
      commit: 7f6869e53f73c4ca0e622a6a1b5ac2598fee5931

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
