Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A424EBAF9;
	Fri, 25 Sep 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354660; cv=none; b=cHD/xz2nXgUU/+H9sQOA5tQFN4d2IzmIVo9qiwtxJKOm3aQIgryKrRjmYy43mvPaop4qkGxxhw6Ev0Fjg9mZ+IKTpUgczAN3pc8As9rQk3Bofui27R6KcpOs0cN3dmnqjswpblb6niiaHpWLV6Kl44lyNRvrJ2uqDDSJS7qCmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354660; c=relaxed/simple;
	bh=gjohcdPGiYL7nwDam/SpJP7ttDdTdJ3RNPcZMPG/yzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSC9qPFA+tgp3bpsgHqz5uIPxwf9rRC+llxQ2y7TtvcnyiatOmJAEQ7DBqK9rebhvY4kH2L25xZMYrCA9sw5K4h0iwIUwY7nPUs8jHWQpbxsnwGblCkGnWAIn2nW6/AIkjRLYLHiRBqjtwG0JMW9FLRltDEHSfdJQxhiDsBdN/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTYduPqu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTYduPqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A3D1F008A2;
	Fri, 25 Sep 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354645;
	bh=5j0426lKs8YxQsfCYvCrdp7iBo9AjRLpYEF6ZpaZ04A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BTYduPqutypUiyXWnnt38KbtWtOUbVLy8NufG+AGwnYI7V0TM9wYNiQbhTRLRVQwH
	 THmpJzLdN2qYTYPpem+g2VN+j9cLHeSfMmDM9zSQ5EbIQQTwA+8OO4OB6eYNo0254R
	 dxNnOeqr6kqI9rpAVzioQT4DwngGD/pHkh8CbCojBMygcwKGbyz2iPqQAUpLUE05Ct
	 xeZZ7/a12ywBPvH0pmBC689FoPoZ8zXIJsm4HWlB5D3OF/6+GNRWVrpYqJa+DNbu3E
	 o7VpvUMlWkxPQiEmWTPbLOpUCApAAomDPSO0twW+FBD3snxb/R9sPY2sqgB2nsL6JL
	 mjQ1pmlG6o1Yg==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Sreeshankar K <sreeshankar0910@gmail.com>
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add SM7250 rpmh clocks
Date: Fri, 25 Sep 2026 11:43:33 -0500
Message-ID: <179035461221.1296652.1014512238937356307.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 16 Aug 2026 13:16:43 +0000, Sreeshankar K wrote:
> Qualcomm SM7250 is known as lito.
> Add the RPMH clocks present in SM7250 SoC.
> 
> Sreeshankar K (2):
>   clk: qcom: rpmh: Add SM7250 rpmh clocks
>   dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
      commit: d98bd51a6dc6d62df12bee0ae29db9bb1013bc3e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
