Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75132E8DEB;
	Sat, 17 Oct 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255776; cv=none; b=AzNNhguYPPj6k570Kjt1T0O8FQJaHgFbHft17c+1aVttdQGVBOoHd5zs03MtjcqaSFyczL+vw1PGOk5L483lNxHKhm0CEflADTkbTY3CbhqTPNgBzB7+ERWOYZJ9J9kRgjub6QULpw3JXfxOvwh3je446MmanIDXp2uKj72gjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255776; c=relaxed/simple;
	bh=fK09GASih0/JskyQqKhQP/WPQPSqfTMo+0kzj53zvmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Perg4mz9cMPnfjDGm4LlG4lNWjLpIbi12oMa4djvGX+ztKgR123/dfBSpXeY/AHqTBzSiBLT++FCR6WVvEQ8e8CRWJLRnjq0qZoJVoeibPVA0PpGA/58Jxm65HG4ZdsIaX1VenKPuMDqR7BnG5OLD/loy8IljRcbGgQ2LQJwZkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E133SB8q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E133SB8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980C71F000C5;
	Sat, 17 Oct 2026 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792255775;
	bh=fsxfwPT4wg9h/H7lXA4Tp784s/lYWDhqVFN6GgNrPTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E133SB8qnYVQ4b7RgVUDQIcA5BOIkKdr6FBPyQzSjmYCk5+qnjhm+a4aeJsbPeQrJ
	 Rd+e9QxDV3Uzsal2VAstZVCrDjo86x7LX7RxoF1SK7xAi7DV29bxUUqgFxAHH/u5NT
	 idlIx4pt21YPgq8Giird2TKdk4RD8cbULQhn3sA7QmUVFCq9XMgvGtpkw+JA/1/3+a
	 mjKeNECI43Fbjdd8A87cRlrpSJQ000jVFib9ibNlrSdTk+6Nil80zpTBBwGKQu+jnh
	 V+t1xjb+I1NBmVVsE0nAAfls56MvsU980jH/GvUucQaROfjJNMjIUOtJEFq2nK9Bo3
	 Cyis6OCQDalSg==
Date: Sat, 17 Oct 2026 18:49:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add AV1E clock controller
 on Glymur SoC
Message-ID: <20261017-sapphire-barracuda-of-unity-7b95f8@quoll>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-2-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-2-448a476d54af@oss.qualcomm.com>

On Thu, Oct 15, 2026 at 07:05:02PM +0530, Jagadeesh Kona wrote:
> Add compatible string for video AV1 encoder clock controller (AV1ECC)
> and the corresponding bindings for Qualcomm Glymur SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
>  include/dt-bindings/clock/qcom,glymur-av1ecc.h     | 35 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

