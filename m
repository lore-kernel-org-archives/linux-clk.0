Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24F439917;
	Mon, 10 Aug 2026 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387574; cv=none; b=OJcugo3zM5MSpOqdbOvEAppX/gKHNvgEzEJHnphFAtsLH0dU1xi+ZnHMhDs6TC3HXMNBK08zCX5+/VJUkek+0Y6vHYLXJmHCZDmVGv3M7or4gNrDPZgQOkkK9RINnStoIEprNp/2K4pNBjAlnJw9on1vmENUBGfWz2gwJUdIxZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387574; c=relaxed/simple;
	bh=B4iJAKqHl4+nzDu6M5v92Due6iMY3gTThKpMVYoNOKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EF7eqZ2VwKM1bh2grpfPBpSEeRmMNVL3RlfLuS56a9FQfnBzq1vgrtg3Nr7BOy553ZBR2+W5vGWUTWVXerU3oUInMzCDwZHUuqq2isj86zUurdM4vk6QZD6HkIAJAUKllKLjoZ7Csh+Rm/fk4qzfybXXBDv2hxHX4j9Wyet89xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJbV+zX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJbV+zX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582031F00ACA;
	Mon, 10 Aug 2026 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387573;
	bh=MbzK7k9QqNd/yiKuq9Uo1D7PrRgwqev/pKrzCFbaHjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KJbV+zX6LgGnu0vNiF5rn2l1Z0D7qtzg0gfBPsEiQNbrxUBEkSseedTSfgOmLDdRI
	 rA2to5E3ZethCmhrnquErtIR41+QkLTrL8Muh2U8cb7GtgyQpsJe1sF0yWS01u32D/
	 j+GwY/HhdSEcsm+VloVOPV4/gPSMt/Bcwohe21lFKOG3K+qg14TMzwmz3W7BDr5aFB
	 /kJtSbGv9yf5Ika+PEnzfwhKJ5lod0/Ud58MqQfrzYX4JgB+LHMeuILpYN8pWu2Cnr
	 Lkq8ao+7zxKzUvRSAbQRtZvunDMXvy+bipMKHvPxsm+EGF+fqUiOCzTHWa7WG8OSP9
	 XMtyyEymIVAAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
Date: Mon, 10 Aug 2026 13:45:58 -0500
Message-ID: <178638756042.656675.10550174478318858559.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 01:15:07 +0530, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.
> 
> Add a clk_regs_configure() callback to ensure these rivian PLL registers
> are correctly initialized on Glymur, SM8750, and Kaanapali platforms.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Fix camera rivian PLL configuration settings
      commit: c4b84911eac4493f7b6639cb9d109a768f1dd4af

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
