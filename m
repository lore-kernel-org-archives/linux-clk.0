Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C561346A1E;
	Wed, 11 Mar 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773262608; cv=none; b=LUGMbM6rUIIkhKuQw5qD+45lr2fdNHVK0iz79NeauOS9dts63PDv+jFPJ6/eR/s62WK7l44057h9wvF16RO2kUJIJmxQ0DQzL8wCgyUKabcpqJgCJbATm7nPFo713qWV6nsU+iNGsItl8OtPtzsgx0DkXQJdYkP4ahNG9i6asoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773262608; c=relaxed/simple;
	bh=ZuxXZ/yjRb1eh+ySxu03OG7NoBAQXQ1cGUl3riXZ3Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bb4FgsIrjm2EBIM4CoV4nwTk1t+1HZUK2XVFTVZrhA4bqkRP/oEZvixmt9sG8jcmwrTJQgpc0Ngal2S63a8fQa4Xjjz1tVB8aj4Uyj2qjfHe6b4N4B5kSHxyLndXyDKq9B3rhcosP/8tSZ3YYvX5HnIgkPxr6aJ7TExRKG3ePSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqxYFjPy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqxYFjPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA58CC2BCC4;
	Wed, 11 Mar 2026 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773262607;
	bh=ZuxXZ/yjRb1eh+ySxu03OG7NoBAQXQ1cGUl3riXZ3Us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cqxYFjPycQhd4TAYAvKz0O+2L58D8sh9n7JdQifBjuW7+KozEi6t4qxTZBvqRGb/9
	 +O7uj1Y2IAeqXt/xomuJQfPiHvrSReqItflDcoTnxArwsurlwq56QvDaEXeBBJ/n6B
	 ljrGJ8cGUXnKizUlgT9Pm8oy5AZHiVgHE1aC/n7Ep9oH8+XxlVSSP2jiPK090KelpJ
	 5jULwR+x6edMy7ARjvde99myGUHl8jvfZLVJfcUJW46bJk8qfZdAq2wxaV41502HIw
	 v5ppW7O7VYOo47RGtneNLkmjZIW+KQ1Us0Y/F/DgLJGjDp+56A7Zq1Nrdx1DIZDFXi
	 pOh6MPMGAxkaw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] SM6115/SM6125 MDSS core reset
Date: Wed, 11 Mar 2026 15:56:37 -0500
Message-ID: <177326259464.44574.2308664750619411888.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Mar 2026 00:41:19 -0300, Val Packett wrote:
> v3: Collect A-b, remove Fixes in dt-bindings and clk as requested
> v2: https://lore.kernel.org/all/20260228204638.11705-1-val@packett.cool/
> v1: https://lore.kernel.org/all/20260216233600.13098-2-val@packett.cool/
> 
> ~val
> 
> Val Packett (6):
>   dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
>   dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
>   clk: qcom: dispcc-sm6115: Add missing MDSS resets
>   clk: qcom: dispcc-sm6125: Add missing MDSS resets
>   arm64: dts: qcom: sm6115: Add missing MDSS core reset
>   arm64: dts: qcom: sm6125: Add missing MDSS core reset
> 
> [...]

Applied, thanks!

[5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
      commit: 1cc317d4188ba2d72c298b5271fb4a2fa1d84c29
[6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
      commit: bb4d28e377cf04fbee8a01322059fa14808cdfe9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
