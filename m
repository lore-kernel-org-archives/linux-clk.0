Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E34973A3;
	Thu, 15 Oct 2026 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095117; cv=none; b=q/AEsi1y5AFf9zP0AntQdH/obpNNUP3Vp8TiKN1WiXkFoo+jkWg0LlpRhwyyBp0XvM+zAJc5odMRFlY9xMvSKhowiIe8G2n8HyVRhymvASEiCzFdoVYtwb1IFtCagtHtPfkKg/FhbXJRWZQ4+JIT5ywNNpd6oupDE4mb2yY6b2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095117; c=relaxed/simple;
	bh=r11FzxvZmA+RMkk7sbP3A1aU5tz6v55wmhTXPmT12vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y85n9dc9e3mCJQlW/8URdmPG43QDYxQnJ6wrVAIRRfr92L+a7j8cVq933BhURi5KdEh7TN3SLQhD1XNA5cXYGxcX0F2J0bhMKBLot9pTm2N0nhtngsFx356JiANtsxkhAbopVLxx9pPDtYOa7cvGhdFUsfu16Hix443HIdsec8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6xDSguT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6xDSguT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA151F000C4;
	Thu, 15 Oct 2026 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792095116;
	bh=XyXToTfD30NMTH56PCohND5pezL23xfEZy59DIVFNXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6xDSguTrak3YRNOzO3P9bCfFHDGlBHecCrl1SM1FdTxv63jam1YyMSHhXQv0GN4o
	 6rGjahoNHj5upzPfi504vofhlw8RCZyIkNQeatgMcv5LggFdZ7FyP+UhqOeeLNjpTW
	 6Q0vTS4wn+saw9vqG/OS4ocLo05VGXIlYen7pVNtyXwPFnDMXtfICM/IELTxQBVdjB
	 +yrGpTjWYIBaEkzTAkJ6Tb6fzfUst0WgfI4PxK/Ynxz8NRrZ4SlljjxdB43ugBqbvO
	 0S48njeULhPxDLEsf/dpwfL4GAq6TEkYbk93VbYYGPg422AOzMQfScKx+g2BWPyaiT
	 //CFc76JhSGhg==
Date: Thu, 15 Oct 2026 15:11:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: display: panel: add Truly NT36850
 WQHD panel
Message-ID: <179209511403.2867457.13660971781879980821.robh@kernel.org>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
 <20261015-sdm845-hdk-v4-1-b532b9f4029c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-sdm845-hdk-v4-1-b532b9f4029c@oss.qualcomm.com>


On Thu, 15 Oct 2026 11:39:08 +0300, Dmitry Baryshkov wrote:
> Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
> Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
> SM8150 HDKs.
> 
> The model name of the panel is not known. Neither the vendor kernel nor
> the HDK documentation mention it, and the panel block cannot be taken
> apart completely to check the label. So the compatible is built from
> the vendor, resolution, refresh rate and the controller name.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../display/panel/truly,wqhd60-nt36850.yaml        | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

