Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C017E4BD7B7;
	Wed, 16 Sep 2026 22:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597934; cv=none; b=kkMcywLJtvjxhXg12+xB6MKdrH+29iT8GBgKrga69+3RNoJlo/txou7St2CE29ElfAQTFynLwNULnGf12qOtQOJqFxz42LYkSmAcX+pgK/0/Ar7BPeCv7X8cS/afcP8nGGFG+I29AXcaMY/xFljzvW3ftZ1iryxUVA1FH9I+1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597934; c=relaxed/simple;
	bh=sbVzSJLW3oX5KtM7Go0Cq+/WWnngD20gRbN+GP16BZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5GQFNLD9I3bHluSRb/NcxzLWtXexNpIqD7LbONGlSyJoVSiLHJNy//iu80ZLRzLz5GsTiPocELjnGEqfN21EWoI8rW1XOEH94DH/+Ux11LrgvCFKECS8Ya86qN8ztrOF3dULbmMeZ2HssbwFFnaxGUuJ2rWw+Mo6kRGAmcN3/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNFbeDCn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNFbeDCn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14211F0089C;
	Wed, 16 Sep 2026 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789597927;
	bh=Ae/A1vxdV1gmMxQqD2Q1btqKzFyjmSlJCGakMquo+xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mNFbeDCnj2j3EZyaftPmpXQHfuFUtX2lKOlq1tlUW6Ze1DGEeWJvchCD0uW6K378K
	 jg4Yr4TYvKhYVxfJyGvo3RZLYLpqVvo1InCCIsXU0fZY3tJ1z7bmRLAQzh2o7UgrJd
	 VaZ9vycLHuw/MFRBncBaCTHPTiOWwVxBJmkm84/2Xy48N91EvTgY/5Qfk7hRQ4TgYm
	 WFFDl1FM5/BmFSh0aN7IMI0gaipgyTL+IG+M4+zBzcxZA8KrDTZkPKYdkx1YlptWQv
	 rK5Mje9rdjNA/8MOTPN1hzp/u33/E/j1auG3Ls9wRAVdGwvB4F4LbtkUYbN3tkfkfh
	 kEMI1gqsw/lGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate
Date: Wed, 16 Sep 2026 17:31:55 -0500
Message-ID: <178959783408.1336377.16132938816078163121.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
References: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Aug 2026 10:22:15 +0530, Sivansh Gupta wrote:
> Commit 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> missed adding a defaults for CLK_GLYMUR_GPUCC and created a duplicated
> for CLK_GLYMUR_EVACC instead. The original patch series did't have this
> problem and was introduced during the merge. Fix this by removing the
> duplicate and adding a default for CLK_GLYMUR_GPUCC.
> 
> Fixes: 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate
      commit: 364709a9d450ae3814726768aec6611e5f003467

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
