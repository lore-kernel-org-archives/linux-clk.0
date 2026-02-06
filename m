Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F38521FF2E;
	Fri,  6 Feb 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389912; cv=none; b=f3dlqpaONMT/W7Zp3qkNjmJWPg//sgrbr6XafERXCMquc1OQ8X10H2ThnSPHIstD8mScvtIndwPIjTqYToFhrzAOlC+hLP5jJmUNfOFTxd5MohTfvHeEABsjd2/FymDzxwRLkGWDnj344e0Bujl8Zwm1RDOu3Pt/BGjXQhYvXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389912; c=relaxed/simple;
	bh=A7w99RlUohTzQbjniag2fcE+Kru5TGI2LXHZ+g9fFqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyocnvDfgSg7p/own8MMBX13lJ3rjD+/VvkCMyfN0MsF79y22yY+LcR4Vni1CkgTzr0psfyZmGNa9VsRZPUXZ9GWXurBTZfM8BKIlzj5ALI5+gmoLsZVXfTysItFPqmRzEygW6ggwVoVzHwbBvnma/hxkHYj/aUtKMK0K7Wqn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rD33lXQx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rD33lXQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12E6C116C6;
	Fri,  6 Feb 2026 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770389912;
	bh=A7w99RlUohTzQbjniag2fcE+Kru5TGI2LXHZ+g9fFqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rD33lXQx5ZbnaKEuI7uEMJJnSP96Z1sGjyJ9++bwE3VUw9WB6R7+iJO/98tAqpbGH
	 0QTnYyE7GzEABW/WdAK/HP2XwHWxbseklwiiranyrjOJSw1vKCEBhKrDIMH77izd1k
	 Y0UogBrTdYHcWoC00E3CowxDWVzDPkn72Gzaa8DJOTvsSMUEbLlvld7vQZCXlGqBB9
	 jVeX30A6Apsh0vYDGH3qor2zOUDOaVTD5tMi9JjkyKaeO1+rUGInPeUbIZcRFSSpDc
	 YlWZTRLsh6U5BzG4ODIJqe3nqtJwrvoXhDPZPt6kdrTkm8O8qDJmrGqOYjHC2RUFcU
	 x6phyRTD6U+8Q==
Date: Fri, 6 Feb 2026 08:58:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: document the Glymur GPU
 Clock Controller
Message-ID: <177038991044.218483.745119211272432032.robh@kernel.org>
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-1-547334c81ba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-glymur_gpucc-v1-1-547334c81ba2@oss.qualcomm.com>


On Tue, 27 Jan 2026 12:45:49 +0530, Taniya Das wrote:
> Glymur SoC has Qualcomm GX(graphics) clock controller and also the
> Graphics clock controller. The GX graphics clock controller helps in the
> recovery of the Graphics subsystem.
> 
> Add bindings documentation for the Glymur Graphics Clock and Graphics
> power domain Controller for Glymur SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  1 +
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  4 +-
>  include/dt-bindings/clock/qcom,glymur-gpucc.h      | 51 ++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

