Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7C376BC8;
	Mon, 23 Feb 2026 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876598; cv=none; b=uSrmwm1/A6yXy5S0hzafWO6IfVKP69K5ZYWNNmpMJ4HY/XA32gUUMOdtqaI/44vdqiQEHpg9U7o/uQ36LaLC9qh3+uqv2iV1lt0iuTJLJvpn53/bKfN3fTv2/jIPJBLYzzn9ZGX0ThYoCng0bbLpG1db98I5un4C+wGPHdo3v2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876598; c=relaxed/simple;
	bh=dnRpMFsb7ZTjjKsx2F+Kna24qD6t7bHJxXoyqAL3+dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5sOwFd5AeehtCQ5ztuJjPcMmSWxbdHplC1m45bf+gCWtPQud1TTJ//7B6sV4d9UhHkMiQWg22p3AwcGSxzXtKnBmVal4f+p7lvNQcBptvbAWCIut/ZKJ9iQ9rOWM9vIXLNZRb+MdgbubqvEA9/HcNNvzseaHNCyaeyA3gzGZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgM9ffZw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgM9ffZw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93134C19423;
	Mon, 23 Feb 2026 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876597;
	bh=dnRpMFsb7ZTjjKsx2F+Kna24qD6t7bHJxXoyqAL3+dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgM9ffZwmTGdy37b0zyHP4Rcg9FzXjA0uMLjaYG+yQmXkKKFf8GMXBd+2clZbneWG
	 g/Gt4qJY2zpLbdAipCw4H7nNpV5gUCKkwrw6fJCpx7f8EKV2lsOZMPXjk3tDujpcRr
	 9koJGWns4RwtD2uZE2jx0pNmtTP9xfIP6BPBh8k3qqhvlW720yVqd1ouF+bETv+iv6
	 iy1TnbJGu0977eOP/F9ZMGDmNOwWey1HLk2mAghKHiXgn+WzBaNVSU61OXB79CirL8
	 njsokB8+Gm5NA7nyUJEMP7qPjDKK3SWQWSCMNV3cQnj5BTODu96WmWsA4E8Irj+Iqu
	 6LM4uq0gSckiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add the support for Glymur Video clock controller
Date: Mon, 23 Feb 2026 13:56:15 -0600
Message-ID: <177187657321.166046.9412927042622683168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Feb 2026 16:26:49 +0530, Taniya Das wrote:
> Support the Video clock controller for Glymur Qualcomm SoC.
> 
> Changes in v2:
> - Split the GCC reset clock additions in a separate patches[Dmitry].
> - Link to v1: https://lore.kernel.org/r/20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com
> 
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Add GCC video axi reset clock for Glymur
      commit: 7c3260327fc874b7c89d7bb230cd569d2e78aff7
[2/4] dt-bindings: clock: qcom: Add video clock controller on Glymur SoC
      commit: ed9ca829614735ab0de0c97af9239bd20a618de1
[3/4] clk: qcom: gcc-glymur: Add video axi clock resets for glymur
      commit: 1c8ce43e1e07ecc531fb517f95620ed85e998608
[4/4] clk: qcom: videocc-glymur: Add video clock controller driver for Glymur
      commit: e2e0d2f3dab4e9838cfe3d94a5cb42aa7b51fddb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
