Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD19E4E3790;
	Wed,  8 Jul 2026 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522661; cv=none; b=cKZ4abLOuYyuYV696sVVW4HgXvAgoSYRkpt91DrIDHlGzb4PgjLLFSdaXr4OPK6w6XtD4PCaLlVwR5qc786YunWZng9WVVsSJ+iMjblxNiKZHroJVtgcfbFR/tEQ+bpBk9cAQLVpZGwB08ZKrpj7zAVJ627Df8tMwp2EF8g+BQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522661; c=relaxed/simple;
	bh=LkcKDECXTCZSbHjnRB6IprW2BrEBJbQwx3aVyO1domg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RfMWldfx9QTZZJTsdnENtynBFMvCACbJw5vW9a/d1ZYAPbZT2rbaQf7dhiZ+lWC9HH/iS555A1l3wQ5k+2MuElxYXk0U+1PwMyvVZ/Gj01QjJeHSHcV8yVgmK4AxDSHh1NvmRsYPEXWwTdBC56yq8q/QOmeyhEmZXmG09qo0Sno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=infOIpIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="infOIpIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C991F00A3D;
	Wed,  8 Jul 2026 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522660;
	bh=TiO3JiFNPaOT+bDTB9B7bXbx2y5X++jlYTO2tic01PU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=infOIpIb7RFNcoyVol6WYaT5ce6TX6vg2fAQvAJ12E0yHNMw8aOXzs3VHgfrU1SwN
	 7L1cjNrw+v0EAK93wL3h+p9ESuKQsvoHG0Z6f4A2Xsvi+UzICJyZnw3crOaW9McW6u
	 Z5PAZi2ww8rOshgBbmSFc1gA6+TxOyxPiIDlnY9Biq+JCdVQrjDAFJst2I+VtB6osg
	 slwtmd0+BAV6Uzxd1rFMWaBkHP8RuKiKJ9/OlMkq2uv9mZ5Rjm4eo3ttDrnV1uirk9
	 VoFbi3pWLxprj1hw2evFXOw3WSNBrp37XCXBtJ0BoHaM638bDdFxb+oQ6+AG2hg9z3
	 IXeq28uzDdfZg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: gcc-qcs8300: Fix suspend/resume issues for USB and PCIe
Date: Wed,  8 Jul 2026 09:56:41 -0500
Message-ID: <178352261649.2235436.12630128388941493118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 21:22:54 +0200, Loic Poulain wrote:
> Neither the USB nor PCIe host controller drivers currently handle
> state loss across suspend on this platform. To address this, switch the
> corresponding GDSCs to retention mode (PWRSTS_RET_ON), matching the
> behavior already used on similar Qualcomm SoCs.
> 
> 

Applied, thanks!

[1/2] clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
      commit: 11b170abe4d324cac0d15a410282d1ec2b6bafa0
[2/2] clk: qcom: gcc-qcs8300: Use retention for USB power domains
      commit: d8638610e0c9ebab2800b7ad6c2c2a3737090da9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
