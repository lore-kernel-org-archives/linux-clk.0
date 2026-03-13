Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F232720C;
	Fri, 13 Mar 2026 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396572; cv=none; b=WXQ3I/OgfYLoXV1E6e2rSA2Skwuf7h51W0c2sDX2sF1P2gtj4HW+14wpBgfull4sBnen82rTTmUaC+xO85u2xJC/tLp4ysNl/p7I7GBs07fheTrrABe6dtTtMTvKjhP5MRegbJme8pwOYbLW4/YeZNZ05Luel3R6NdHGZvev2U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396572; c=relaxed/simple;
	bh=tlqVEgXi+9Hgl30aJj8IATCLNvFeia9pSzMeIWgH9lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqddO4c57ETiwvpFEGFzMPHeigBWQczMeGEebUfuR47SzEom4DcukgATkbIFebFGaFc8gw+ytF4pxM1bn4ohw5UuS530zvD5+nwCZantDkzHqEwx1I743tz/2yzTTa18ijDUMJTizpGTnkrRRH//wcUUabZrTazw5/ZbGA75A3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sck4RHDV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sck4RHDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E64C19421;
	Fri, 13 Mar 2026 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773396572;
	bh=tlqVEgXi+9Hgl30aJj8IATCLNvFeia9pSzMeIWgH9lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sck4RHDVsIxRPBOWi2y7E3DRuHpLE1gaVtMelT7kIGf5sGs56JOuYOYnOdr8YAJlg
	 5RVGr7Nlr8NJ2Jy/ZzvFZMYxqb35/zxm9Yo0F49zoFH2r1RnJQ2+FibeQAWCAG8SK9
	 brNTFMftBgRQc4J08CUEcqyOgNUKEx4pAdPSJVKEWGkei5jj4YV7vhcsK0VdNfbSh8
	 PXKEGLmnQuAOddr8ce9PnyXOdH+SYLX9YRxIXpA2yA3Q4wt6GsfJoSZJBUrZIKdDTS
	 YyPc8rc3ka4N6ESlq81yPbJ6guazPQMFvtazxg7/2JdQC+g651RGKgH++qsIteZLdb
	 iO0elfnOCYakw==
Date: Fri, 13 Mar 2026 11:09:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: qcom,gcc-sc8180x: Add
 missing GDSCs
Message-ID: <20260313-hilarious-peculiar-goose-fdaaa7@quoll>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-2-val@packett.cool>

On Thu, Mar 12, 2026 at 08:12:06AM -0300, Val Packett wrote:
> There are 5 more GDSCs that we were ignoring and not putting to sleep,
> which are listed in downstream DTS. Add them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

