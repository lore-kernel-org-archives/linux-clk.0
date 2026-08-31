Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21739CCF7;
	Mon, 31 Aug 2026 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207711; cv=none; b=eVJYH0NrclRUgLTIvIJGBJ8cFs+WhaohDtpKNHL9Lz2iS8JH6sMYmx9YHyo5kpbonyQ50koGwz0ImrftRqW43fN5XbOqo1Ojw+td6jbm+70+idWkMzLFHPIn1VYdAtRIuf8CjGsdnPDIRm0A9dQIkCJP2othRl14fb2bpaRBom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207711; c=relaxed/simple;
	bh=vXB1s0Oei1Sjbt0uFBUNJVFSLZvNL+G/kALxXq0y35Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hk8MgNalNDIgYGNeZGIv94TyjNOgmdxFB3319Dw+jL9olvZoWjzGEFVB8Pony6c3zfeq0qeUPqgO3NZiN2ah0zp9ThaBxwoIvDccYai17M4FZ5+vwp6lUQnE4zvYdMCXtd8R4qr0ASTBucnPcYGTBvNKP04DgorfngHtEFL69hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yi9JMxh0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yi9JMxh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1101F000E9;
	Mon, 31 Aug 2026 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207709;
	bh=+3MkC7/OJkG2lZaGoswMifFvZ+BYQeGYGSsNu0SAWC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yi9JMxh0SZnpmEUtRBL9FVVw4rXrQpnY5RzmQ1dr+DJ1b/z4rNutpP/k8AHIsG+Yi
	 ubpHrlT2lNS/2EbNCKK2ElOHSkcSiDpbGP11PxQXuKgpvYd59PTU0CktZyHHCqAqLf
	 Igr91a/fjxfG/s29q9ETG2qNSExfuGG4ky1clyIhdODvNK/xnxbtPzwmThK/UGTY0T
	 w2Xwiwhhd8QBPEc1n/34VS1K2V6ZMyC3o/mkP4AUyoc+qnAdPkBUKAZsCzMX89xzmR
	 jiYytPl3dbZVG2d4WwPnsGDGxLuqmSMcWI8MNawalGl9C4mXmKyuE5HtTFEJdo529V
	 FrmOC1AXXCK5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] clk: qcom: Mark the GPU CX GDSC as votable for Glymur and Kaanapali
Date: Mon, 31 Aug 2026 15:21:25 -0500
Message-ID: <178820768665.1699313.7933731912668367148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:01:16 +0530, Taniya Das wrote:
> The GPU CX GDSC on both Glymur and Kaanapali is a votable power
> domain, but it was configured with POLL_CFG_GDSCR instead of VOTABLE
> when the respective GPUCC drivers were added. Fix both drivers to set
> the VOTABLE flag so the GDSC driver correctly treats collapse requests
> as always successful, matching other platforms with a votable GPU CX
> GDSC (e.g. SM8750, Milos).
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      commit: 8f3f88309fa4e975ac27368ee945c2c202251a7c
[2/2] clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable
      commit: 55981579b27b6541aeeab81c768f248dba0491ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
