Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE1357CFA;
	Mon,  3 Aug 2026 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749944; cv=none; b=W8uRox6bc2sSpbcmW1e2EYsaguQFEJwcwfI0QVKTCN1Yc6+li++BRCOfcOKmtMMTsMEvdDzE+LJJJuuBQMnKHuAuGUdSFwzVaxwt42uAwS3W2kw1ujtHJYjUEmqy7bjmrChqXza8R13Lf0uACjymfKvXTyq6o9cedfInvmbJW7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749944; c=relaxed/simple;
	bh=f2Ghkosh4ARKnkVNjPtYvEOlqKjNIN7B+PauPMINOgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3g7r9Ytz4bEIgR55muHM2yLYDiPovwZIO4MVnkovPs7arxFWtPM2dcg/A4a59jgKk0Ey0VSIh3AAnFUBL/BsIJ65k/qarsSNkKkt3QO9F1nA1Q1KIEQB/pgDZ5HEsBaQmxV5PaZ1q26rYyVj3divKyCAG6lm4JUF2OWB9rM7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3po5Zqh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3po5Zqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611641F000E9;
	Mon,  3 Aug 2026 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749942;
	bh=TM74IHuZLlnVfwSlwPA16knspfwA5jupBEV3de64NNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c3po5Zqho43DL7H/DR83ZPpuj9bVvwUsd8S1ESiA9p88dRXuu1Eldp/lL3/3BK6xo
	 QeSkSj16flFHQkYCWCKXT4R+AI3L333/ZQnw1KMRgvqOc/qX1V8ru4wez3oLpSvsli
	 EywLQ4jLFXBpe8O37EilUNVl49ny1Nnu3BsTrUhrqMl7FQOqE3A3Z5psi4ep8ahy59
	 PsPwMgNq0douAXtVuXeobCE594KawrnL6nYGWM8XgM8+mThwftqCKDwfomDqERwEkm
	 8M4Qm/xRJdMWiTM/bqb2eV1pTUUypngOR3xQbJ8YuQaem5HIYIWk2w8sGwuxWQ2c7r
	 kVYHVEUydUAkA==
Date: Mon, 3 Aug 2026 11:38:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: qcom: Add support for Camera
 Clock Controller for Nord
Message-ID: <20260803-fearless-heavy-sponge-1988cd@quoll>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-4-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801-nord_videocc_camcc-v2-4-674d7718e41f@oss.qualcomm.com>

On Sat, Aug 01, 2026 at 07:43:55PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Nord
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
>  include/dt-bindings/clock/qcom,nord-camcc.h        | 167 +++++++++++++++++++++
>  2 files changed, 169 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

