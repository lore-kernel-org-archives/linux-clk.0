Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE78730B53A;
	Tue,  4 Aug 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832083; cv=none; b=TGeudhee5byB4vHIyW9Ju+kcexatwAR7JAg7vwDSTuDuBxJ+4mVPOqKjTtwE2k2HXLqqiRd6E0dN+Zx4yldbKLUwoAUEnOtJ20AJFHZE+aj1BcxnjQ0tpyX58DwnbPL/KPQsPA747NXxVmUu1LFZ7LPccSw5vaw8Y8iugS4Uk6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832083; c=relaxed/simple;
	bh=Jy8MhVmpRBrgpJEVbB4mVg/9TaRNz4Z9JQHBwgbzusY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5lqziL/nWzSiNiNHFB9FmC1GKnsGovIUZYXxia4dFj3Vzktb0gJkXd7XOwND/KeAOIRbYI30ZdWRccBmYs+FK7worobRDlcBSIs+8Y6JWrDuHvvOgAhCXCTqwiQVe7OxXqHz2sUwEScSYq6BnHQWURbupGgiswiBPU7Xj4C7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfL8d+a0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfL8d+a0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E981F000E9;
	Tue,  4 Aug 2026 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832075;
	bh=whF1zVe6y7/APDHkqht7Ez4x9m78Aw/LGPXXXhXclE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EfL8d+a039pSNiK9B+HVpElg2Y2HYjIVUqVfvSGGi1B/RQrh2JduPDDMaGg/f9Xed
	 QVyTtsrPoF2hEwHXinl0SU/b9S1egGZokSmhwN8yHa6JOwFvuf0u6OXAOM45k9rYjS
	 gFpQx8NUIK1VZnh4kmtiXtdtWDwr8ryPiRnItm5cNcAZvs2DiR4tfAWow8LIUO06jD
	 rpP0xchnApyNxuImqM2kTGVi/Rj9wpSrbjSBI3Nr2BdZtMBTWBsF37bSfdMQdDbGua
	 nNtQLnAMDCxmNX49hdX0qd4TCViF9wTCPVPWryaVO6alrDlxBLBzfoR6Icf37HZCSK
	 1kcXpWGeKwddQ==
Date: Tue, 4 Aug 2026 10:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Maili Graphics Clock
 Controllers
Message-ID: <20260804-aromatic-married-ibis-bc5a7e@quoll>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-1-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801-maili_gpucc-v1-1-9d8c37bded69@oss.qualcomm.com>

On Sat, Aug 01, 2026 at 12:42:45AM +0530, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration
> change, and hence reuses the Hawi gpucc driver with Maili fixup.
> Maili gxclkctl is the same as Kaanapali gxclkctl and falls back to
> it. Add the compatibles for the graphics clock controllers on the
> Qualcomm Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml         | 4 +++-
>  Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

