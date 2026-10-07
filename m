Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9738C2D0;
	Wed,  7 Oct 2026 21:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407517; cv=none; b=G+mcIl3jJdT1jZc8Q6zRTPnEBLoZiuobnvO1qFwlZgRbgPaus4/Xq/BEiTwOYl4OAGkyflA/Rm0Qcf/Ata7G5D0XE442QpkdtoJxSYNFcEXHHU3eaSewP1Ssmkvj5zwCmSjxDMxt14VweO9g3tBbxLoo23YAzHQM3T/j2zz6mEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407517; c=relaxed/simple;
	bh=p+y5MZMyztvaGHvfyJzMY1K1FZc/4/6kA+O2IYhTg9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcPbg/Ov68OJcG2lC6PicT8FFBHZbX6BwYdtuD8/XhzRvZvtiCu8MCXwcAEK+tUWJr4gG1mnSBQEnCpPupdsjP4HltS0fhgCQ6U8cpBH3B5ScFQGF88kXGPmM/HyV8ZEseXtjL/4Yy2c5gFeI6gj4btNGgV/8V47Z5K13EHG45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4QPIa8M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4QPIa8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F551F000FF;
	Wed,  7 Oct 2026 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407515;
	bh=BzU8x+SPy2a1IL9W39gebfqElPmYWCnwhTkyiMGPHos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4QPIa8M2CQO7Cl6tddfxI5Q9hGEX4nOAClU0VfDfKpyLPcfC5i9xcsdUhcaBtuea
	 frTALhQPyfjxxkYukFMTfN63pZwj3pzwyuOaEHd/OFQKp63cT+NuKaKoibI+aqpHYm
	 q+i6PXJv+GeXlvuXOLtap9Aug/h7+lIigVKLrlBK2kwPwNTTNKnr+cYhs3Plf47Z0E
	 8NU6AN9Cn4s1mcNBW+hr4Ccvs0hx/yyqfpsnev+4WrMyo+JoA1XEV9CNffxi1tzpbn
	 5J/Ikn3lkua+dGsuozENgYDEQe76zDX+xCOQThruVRuZKX6955GG3X5U+wiBZSw6Rx
	 Ew4Ab18sTVuRA==
Date: Wed, 7 Oct 2026 16:11:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, jbrunet+clk@baylibre.com,
	abel.vesa@oss.qualcomm.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, bmasney+clk@redhat.com, conor+dt@kernel.org,
	abelvesa@kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller
 for Glymur
Message-ID: <179140751448.316929.17362617907866339761.robh@kernel.org>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>


On Fri, 02 Oct 2026 20:44:33 +0100, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) clock controller on Glymur
> provides reset support for the SoundWire TX master when LPASS is under
> the control of Q6DSP.
> 
> Add the qcom,glymur-lpasscc compatible to the existing
> qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
> reset-ID header.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
>  include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
>  2 files changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

