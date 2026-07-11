Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095E33B6D3;
	Sat, 11 Jul 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799411; cv=none; b=VG7nbm6le7YVJYTDjgpZEkGay7khHjT/ZRvNvwXdHgiUDqKEIcIeezXcmDUIqiYKLL1xfLMdgolTPPDVIX7IU7PJ9qONT6PQJgM6iulEvvauta0/S/5LNd2CjdAeA3i2pYsgsSw/hXzElog2twGqlyikKtOEYiYs+bxCBSSxEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799411; c=relaxed/simple;
	bh=JpmCUbWyn7ZBnWxlF29dqjkzD2PMwtwhp2dC4dh7x5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0Ai4rrMyDU9+pGaOhBYfIq2T4VkAY21vIHf8AW495ERbfBPb1SMYChhT+TJpmHzbou2hcY+9LNipLupP/RWJsXaIy1V5/vgaaELw0221llg1pS0isKMl86yOUbGhcp0Ig+PIakSh37R8b8HsfPDIt9wbklj1wV/ZyoZQvid0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HU677xkP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HU677xkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7201F00ADF;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799409;
	bh=OADxrFJ+t4Dx8VgY9XZpFEf7YPrxIZ1wR6HGIT2FrNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HU677xkPvltNInibF8s6G8JYgYtJocTIpDyXLUFACvIVvNkOFcQaxjFvWcD/DytJQ
	 9evA707BQqf0wpHB0gKhGYvgO9cqsKmcHK4u3Z1plDllAiNITFiHpcRrZzxDlX2JOC
	 c+WWEZxB8sz+Xbv8FLBO4e/rocl5EswesUV+KJliZkdoAJEA6N8qt62PqUgbQx1RDV
	 jxZLh5b58Ps7pQ+7Ir/MZSDqKabWdv2YGeEzs+qSPeLG+rlt9AD4ge+7igCDrpu8k2
	 av9qoCKh/ccu+lQ1BVvuSejB9iFVz/3zxO8amhk8AKMao+apTY/+08OyGEm/tqNxCC
	 P23bUYBuLJuBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Sat, 11 Jul 2026 14:49:48 -0500
Message-ID: <178379938596.163099.9873273386152252307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 12:03:58 +0200, Krzysztof Kozlowski wrote:
> Merging, Bjorn:
> ===============
> All clock changes via Qualcomm clock tree. The defconfig can wait a
> cycle or could be applied via the same branch on Qualcomm tree. In case
> of the latter, keep it on separate branch in case this needs to be
> shared with soc@ tree.
> 
> [...]

Applied, thanks!

[1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      commit: 2ce505b437e98adc3c009d22762f491cd2cb15ee
[2/7] clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      commit: 9904402cf417140f0dbdd0b9b3b5f5fd0527a447
[3/7] clk: qcom: Make important ARM64 drivers default
      commit: 5c38f9b7df7716c2ff54418d6a0aa4328133a58e
[4/7] clk: qcom: Make important ARM32 drivers default
      commit: d643934c275d83470a195a115cd16ac13d1ebbd6
[5/7] clk: qcom: Add defaults for desired arm64 drivers
      commit: 6b150572bb76dc508b0d9fbe2c5a56a67429e376

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
