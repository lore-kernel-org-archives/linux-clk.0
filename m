Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670B459AF2;
	Sun, 20 Sep 2026 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921112; cv=none; b=s2ZJTFTuREkxJhhFFY6NESxsPuTI8IiBvP77iYRdPIZrOAhQMIt8O0rwxtGmPQhtjWwx/sVOysf+XoHT97/SCd5hz4aT+Mde/sjDGmYq0a0JA/3LHqDzi5qk0YKQtOPcJUL+uYxQ1IvIpAXax//91tAhdYy1faVpDGnZisXyI/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921112; c=relaxed/simple;
	bh=N+vswpgUDGCRk6/8Ow0ln0bhjks9VhFnV9YH2XIbm3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nY32NJa+mKSWVu+fVf9UJDxHXVmO2IAflygCJe3HsXMfXVmGzOtFEHjzgou27lEXlfHnSpP58IgWMb7ZnxOiU/3PeFQQYpSqAWYyATiaJNkLUouICumucurwaQ4R63w6yZa0pbvaDxXUQhKVHtGu6uQUrycIP1QzYfUNOoONl80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy+ta0Z/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy+ta0Z/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637861F00899;
	Sun, 20 Sep 2026 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789921101;
	bh=ygfSp4T2NIau647RrtwqADOfg9Si3sKLRyKxPNNmEZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hy+ta0Z/cH2sU70ovM11EVsbaexE/1WLiszSFK+/JHz/i9sQXwikcwL70giJzN7//
	 gqUMb9nrRFugbAkd4F+lsqikAgjbzgUmhmJU2LlbMw8T1q8eXy+rp/lt6OeR5NgGEx
	 676DxHZePOhU15rSxLgHWlNRE80YbevVhzOB/19STz1FVH4oX9frWU0pLuLSQRuyuW
	 AgDccMMpgM6v9Y0pBQ2riLoynqO04PBxxORPB5VjVlI8VYOlREbm3ArPxIQ0axadwK
	 wP4PbWu+1vLkZANKPFIWKe3ekNPcxzX2vhT84v3BRlD7lHMYUSYwK5ZFm9+3ciPM03
	 0Xhb05Xgp7TXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] clk: qcom: add camera clock controller support for Hawi SoC
Date: Sun, 20 Sep 2026 11:18:09 -0500
Message-ID: <178992108611.214160.10133358912987093867.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
References: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 10:33:00 -0700, Vivek Aknurwar wrote:
> Add support for the camera clock controllers on the upcoming
> Qualcomm Hawi SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
      commit: 5bf89b02b163ea04b3894e2a5beabc3f0619c2e8
[2/2] clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi
      commit: 1390fc11599b5ad3ca9bbafba04ee781b4544819

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
