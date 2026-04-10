Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FB1C862D;
	Fri, 10 Apr 2026 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807089; cv=none; b=g9j/3Mz86Hje8mKJwsbDajxQf6LjHA6y1eUJdwPanHI/FJD5Z9cWiCllPPjio2SJwLKzpMwCZa1IF4UAIZMtCySIZuMjv3A3uJMCUjMMpqYQvs6CQT3gcZpCm/0D+0kt57+eFeFTmezpZmR34oeN6wyoEElqtOCuSRoV/Ih5+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807089; c=relaxed/simple;
	bh=JsZglFfqp60/OymRyVjYka9YiyjQ22XOenDQYcWCKIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckQ8YiGNoqQm6AJMpamdZvYGbQBbDUO9ga5BaGEpxN5NpPglMUcXEMU3CI+8k1dJ077EdohU8t3nXF+mIHmCLVH4F2GZbaQ3RBTQV8p+ASxORE1eTiwpoUJg/IfwFUKxU7v3i31AOrTZvG+Z+F+R2g2DkEBOTErnsNTbr5Pw5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuhGltJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuhGltJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB7FC19421;
	Fri, 10 Apr 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775807088;
	bh=JsZglFfqp60/OymRyVjYka9YiyjQ22XOenDQYcWCKIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WuhGltJPPqIHbF4Qlipkz2YJ6f43KKOCc+Q0lxqz5otlnGKb1EpmmWsUYUQByS0o6
	 REMrCi++66bRLgcaBgggl2ldR9nKnfsQrzkqqT6qj+1UOrt55OvGNx+1gq5tnhXRBV
	 mDQp7Q9xxpx39MXGnbeLXM+aJRsAAEut8QPLPc1ayyB9imbfuwZCArmKp0aUW2v3ya
	 iNVTzdpr/jhElhSaWJya23KXX/r5DokpCKhmufjY9Q1stfrg1kxOR4RqZFkIqgDOBB
	 z/RKYCklU9GX6Ap8aJ/Iz88Rq+mkx++ZhetWI8WJUk50wm4u3MiFtM11IWv+UViUN6
	 lSdIpIsctQdVg==
Date: Fri, 10 Apr 2026 09:44:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Message-ID: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Note that this patch and drivers parches were likely not tested.

Please mark patches you wish others to test as RFT.

Best regards,
Krzysztof

