Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8C447DD72;
	Wed,  8 Jul 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522646; cv=none; b=J0DCXmIVNkdwvfzGOD6CcxSgCgDUr8bUSULgC6qmXM0Rbbu9M69x/vIRpda6bffH8JWLM3XVZejHS0cwbTy6SPQOIh+36Lj2yI0ff2M/RjW3rheK2AEjsTEBXVw4rcKV7szLZhPNCvCDa4I7G7GvdT6lKQnj9qZGGv7wc5YStQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522646; c=relaxed/simple;
	bh=fttLX3iKaCxDChF0+/0ZKnnw8mVMt7IRVc3G4svwFTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxgxmBs21SOyVf08IW0j/QiEMInR6+qUfsTjejKUTA0LScF1M4N+gST+Tc07qlJ4cCeijch4ftFRF/9fKF2V6eHCoWhJI+C53JOB9a5CdUGGQsXh3ILV+PcrpyBcZV1V3mYFUmG/nZL43oizyBBqZCC9gYkl5xS4hgXRqZRwlag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REQikdde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REQikdde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE391F000E9;
	Wed,  8 Jul 2026 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522645;
	bh=L2wz6vYAZ4Nyl7pf434pDPTXvX5VPu9dp8O0Gp8UPqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=REQikddeR0v8wwaBfnqlbDcHo17cWv/qL0+LScQGWtpGt1yCU4x3T9TiX1zVdOc0O
	 X9M0XZawQ/ffob7r7DuoaeSW6eqCSyDOlvMAvRo0lQnakCVFm7sNkz5eVGfrO8/2Z5
	 oYJTT3LFNsqtrNksfQMjNXwUT+94KhOkCVtuvdgXIJaoYDs5do0eJwxHrWzao8aDli
	 oM2BUCXmUJX+yr6u/mBvOERvKAIzAWIbQgAiHi/n4woUs5LUuc2h8BtDPdZnQ5bqBs
	 ccjXunrTCg+qTRUSQLGy2WOxT+xfCGX3gDYplJxXLd9EfMOylMuCMCNUntlPO/AsBz
	 MK/q3nGu2HiDA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/6] Add support for videocc and camcc on X1P42100 platform
Date: Wed,  8 Jul 2026 09:56:25 -0500
Message-ID: <178352261592.2235436.14052879122487023719.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 May 2026 11:08:25 +0530, Jagadeesh Kona wrote:
> Add support for video and camera clock controllers on
> X1P42100 platform.
> 
> The purwa(X1P42100) platform includes the hamoa dtsi file
> and camcc node is already posted upstream on hamoa(X1E80100)
> platform in Bryan's series[1]. Hence included the camcc node
> patch[PATCH 06/15] from Bryan's series[1] and extended it for
> purwa(X1P42100).
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: x1e80100: Add CAMCC block definition
      commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
