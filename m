Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB7543C04A;
	Mon, 10 Aug 2026 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387580; cv=none; b=ad3Tj2w9/awde1FkIx9F6yIPxl2MdMd/JD0t5+ucDTdsGVHDk22fhFP3cRUFu6Dr4IUXxT3j27lzPzRoV9RBlctNGIrIh7SBlZ1OpP7u4mvwIXDaygfODkRE/nzB2Om/Vh00pHd3DD+cmDsCgbQEBmefqQNf1A6xS0OQTLWtMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387580; c=relaxed/simple;
	bh=4yhgMJYTT6lmFkichXcshJJHWMjSlowpn8bD79KeQys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEZujzF6Z7LFc0rtT48+rXgeVULLkRSci02uspcyfmtAIJkCHCKJPD0M+czMV1jxH+RHeFwqtwoRMDpLOwMhMplH8+djVTrdlBfjWOhNR1AzoL9aT+WmOGcquMnWkH7s8OhtCsAdfXwSZsmXzhDZG1BDVbC4hqcTGJz0y37whFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEIucpHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEIucpHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DDB1F00A3D;
	Mon, 10 Aug 2026 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387578;
	bh=zSSqywIliztw6kS7DBQ6x5A3Uj3Fw5VlCx8gq5UNvLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HEIucpHsy35eKBBwtgJQq5q74YJa1leB2xi6R7EIv9LfNTi9WMxp8i0KYY87Es686
	 1CJvHu52/aFHdiGj7FKhkY2QfBoU2rJsiN4TYU5sdcW8ocE8w2xb3SgOAKUzYsmjAu
	 gZn4X3/aXqCpxwxCA45Jq4jWlmKPfISdnFl6ia1YnmRKOgEh7wlv29o7hmZM/2zg/g
	 sUphtHEuFWDFBAqPvvNgyxWK1KMh51PxIKl0DCPigUCcPQRop4QpQkjdsKuYVDRksJ
	 hjBS175t8jC7h5thNrZLbZzcgMv8wEO5cE2SfWmmyL19AcftOZ7QYwzcr+QqsMyn1f
	 CnjAWMy7AEebA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] clk: qcom: Add video and camera clock controller support for Nord
Date: Mon, 10 Aug 2026 13:46:02 -0500
Message-ID: <178638756040.656675.11312792997507541507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 19:43:51 +0530, Taniya Das wrote:
> Add the DT bindings and clock drivers for the Video Clock Controller
> (VIDEOCC) and Camera Clock Controller (CAMCC) on the Qualcomm
> Technologies, Inc. Nord SoC.
> 
> The VIDEOCC driver enables video clients to request clocks required
> for video encode/decode, and the CAMCC driver enables camera clients
> to request clocks required for image capture and camera processing
> on Nord.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
      commit: aedbea142f69b3aa45af341350ba3df7f2a5581d
[2/6] clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
      commit: 493fc5d2db097c4ce0702195de74d08936584d5f
[3/6] dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      commit: a193d0caef5000b9a8c55db49d05480f32a973ab
[4/6] dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      commit: 25d3c4a19021056aef36115b98b7defbcdd502e3
[5/6] clk: qcom: videocc-glymur: Add video clock controller support for Nord
      commit: e51014984c05bbf2eb10ea6922670e3719c6447e
[6/6] clk: qcom: camcc: Add support for camera clock controller for Nord
      commit: 39345cc871d6d685fde9c5e527d7a8f090fe4169

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
