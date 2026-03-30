Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5C375F81;
	Mon, 30 Mar 2026 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886509; cv=none; b=Jhv4LTkFflSLORD8iqyNp1jtScg2ChQV7EklA3eXrnuuF19kl3L037Ktm/ZTsBYmK/vERThbXULd7IANdKqOPvBF3kArUMh9DEExzNopfBSWp+MmUBbcbhzD4Z0ABpYjk4fxYLihJI8p9L11s+1YioyfYRISisiLDDs74jH8yyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886509; c=relaxed/simple;
	bh=eJoGxf8C83JiT4xSJVWRFQKPm7QGlNKOim7BgMSCUIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwk7YHKvjMudrIjAChQ2/6NbJdiZjOeXviLrHnXYVhuH1jXP1d03zr2qHiwne3tY7K6gDcObngClLmpnkiOSMQdC2122GcPaHSxqS3VvQUYxX+wHEakBVaURqZAcFDTYZ87HaDL1O1dEkHXc4cgDAXJUOyKyzZUkvquotoLNJ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkOYmp3f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkOYmp3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CEAC2BCB1;
	Mon, 30 Mar 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886508;
	bh=eJoGxf8C83JiT4xSJVWRFQKPm7QGlNKOim7BgMSCUIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nkOYmp3fIn6xF/B6P97RVQ/Cq0lCpyuocrRsvpNiI3lfSpSlBGtfCAQcYPJKB8u3U
	 Pwl3LJnsJpphdC96fJA2OMoHslTd2B37n9cILcQlKhajVNS1X4w11gnawnjfI0Naso
	 ga8SplExl+HHFCSHg68+ELwsNerq4wukBr10Q0FaNiH5SJQDpq9DJpBM6Sv4EmVA8m
	 uMlc9KckZMq3ypePntoO6rHUYBYERyOGXLDBZqeBvO5gHd1qZNxBziM+nEp5DWM8aB
	 CEzE/QYh56C94615f0MfmZ8II91Qx2gU/jcj7fBF3awAEZsa7VNSBtFgpRVd1Pw/63
	 dJLluTwXKudsQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
Date: Mon, 30 Mar 2026 11:01:07 -0500
Message-ID: <177488647736.633011.9930860140361417185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 23 Mar 2026 20:57:12 +0200, Abel Vesa wrote:
> According to internal documentation, the UFS AXI PHY clock requires
> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
> the UFS controller fails when operating in MCQ mode, which is already
> enabled in the device tree.
> 
> The UFS PHY ICE core clock already has this bit set, so apply the same
> configuration to the UFS PHY AXI clock.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
      commit: 3006f7fbc7ef53bf8316b02d7f23f647b24c3eca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
