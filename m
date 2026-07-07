Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127231326B;
	Tue,  7 Jul 2026 01:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387667; cv=none; b=Zqbc+svSIksxucDgpAuCvrd3JLx1kyCO7n/9oaIk5pHeJx7vlbnPMKpzzkWih43ZoqmG6P9275Wcn4J/9HRasSMz+agMjLLrzK4t8gAIsqF3rMlvW7SfSV0L43JSysQJrLxUCSjaFhIiKr1wdJ/tbBPkQnmqLV3GAbUUJvsrRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387667; c=relaxed/simple;
	bh=f25h+csVmfKSnqhYObuMgXHJ8lG0awKdL89Vcb6pR64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKYSjAo+cItj/VwwVIQYFYBQroMazbsJabPLdQDdwAEyvHr0LV/8acD120+qAoPspTTRwBj66vXM4gYRq1lGvp6pZVWN2pIEYnR5k1OLe8PofzjF/xoco7g+zBCtCO/c3QCbx78GNHXNXhYPMUzg742Y3362ZCb2azsh7Lo51hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqI4oX+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqI4oX+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CAB1F00A3F;
	Tue,  7 Jul 2026 01:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387665;
	bh=GBn2l3iCjIWokc3qkGy1EHIjMHgxLeHlSFT8FB4zHHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZqI4oX+xQRRVaioGvZEkbTW2cpckGe8RBMpCsU40cZl2Lh/lM0IRhKXmx1/1wZiBx
	 oAXauGK45B3StXtIKOt3diIUWKQ4xKp8YuKmP66fNj13RaKjqfEG7DVkMwqak4+DtS
	 Czq2UvSrrmDRYszyaXkB3lv0TV25Jqi+v6JFNQJuPTK9Jx+Qg8bfGwTjHkrtBFrfs7
	 dAt8c4BqqR8xGhqcaRK8988a/BsZIGpCTMOUybrQBgVQaGm/+8Qlr6Xx7cXrD3+TY9
	 sXCazRTZKiu9Ou7WG38JkHLIevNAF676mjQfcam7qHvF0XoM8hWdPfjCLW8BGYit4Q
	 hKUos6po7YjgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: (subset) [PATCH v2 0/6] qcom: Refactor GPU GX GDSC handling and IFPC behavior on A8x GPUs
Date: Mon,  6 Jul 2026 20:27:27 -0500
Message-ID: <178338764560.1558388.7832610679796697421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Apr 2026 12:08:54 +0530, Taniya Das wrote:
> This series fixes two closely related issues around GX GDSC ownership and
> rail control on A8x GPUs, where recent hardware changes and runtime PM
> interactions violate GMU and IFPC(Inter Frame Power Collapse) architectural
> expectations.
> 
> Problem statement 1: Incorrect GX GDSC disable by OS
> ----------------------------------------------------
> GX GDSC is a special GPU power domain that must be exclusively controlled
> by GMU firmware during normal operation. The OS is expected to force‑
> disable GX GDSC only during GPU/GMU recovery.
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: gdsc: Add custom disable callback for GX GDSC
      commit: 0661ee1d650facefdf61401c7d00eb96fad40b10
[2/6] clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
      commit: badf361c00c802738c776fb5f4e8b08b4d0bad1c
[3/6] clk: qcom: common: ensure runtime PM suspend completes on probe
      commit: a5da6c5697a50a5956ae7645e52d0007ac8b3395
[4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC
      commit: 1c99638642c2137d7e699e7b2ab400df7ef15774

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
