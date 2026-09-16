Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65EB4A9D7B;
	Wed, 16 Sep 2026 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596411; cv=none; b=mp03hq1wMc/riwFO6pODKRGTOlRM2EfgeilCvFjB9dnLzWp/q8DyDpbpnPHfcekOWw1VNB2Z6Ji9XBRatHyh6lKUcS+y1Mb/0ggWFMhAGixB/Bs/V1VVm3lmNDVLHLtbTtOA1dmqpjYzokQb1/kNkdOKi0hDWOYNee3pMV693UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596411; c=relaxed/simple;
	bh=8jR3qXJDsRDhpRo2+hKqYNpQs7xwIeWBynYjDXLVyqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCRagBhmIuA+ZcaQLMSDFymeWIgcD/1PMv4LYtszgsl98nED0i5zttAHth/Oz3ebYreQUo5uOr8em/2+y2q6NY0Xd7mST9e47gruq65arMxNSR6wJ6kCIaslZhD9GFoNFPQAb/kx47ESLteHVu9DmZXooxoONKPqSMyQtuJ9uOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaAS6O1s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaAS6O1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835381F000FF;
	Wed, 16 Sep 2026 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789596402;
	bh=ny09sGuz62R7zzgPJNiGubj3ISECT0ngvJE9U9Sh5CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PaAS6O1seQoDoHbebs1MD+5RjJ0uBa37UI44pZikkQNKW/3s0B56qDJcTo0irzBgJ
	 T3z7XzdxVRCjgB1gqKi0cWKv07EY5zpmF2+qTqpqLuVk6ojY9enq2EAkEYFZbUbjQ4
	 RtYwE+WYP38tlPL5I39dT3ssTouyuomnaQT6VAoop9HkDtsKAfAouCOhzTAP/aicTS
	 NT4VPfYfteyCD+NuRGWiH5QxsvVgbkJfDD8AGlhvTgD7IEV7T/6C2b/EypMhVbSCbz
	 Xx94wjoqwii+v2vC/BK+humVsc9J+qZ3x/7pZ1EMsUK6Y/LXzUcXoWx0Dk2RqaRSyu
	 3yNlIPh1zO5eQ==
Date: Wed, 16 Sep 2026 17:06:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
Message-ID: <aqsS3KIl59RdeEQb@baldur>
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
 <0b371ca0-e91f-4ede-921f-9610961bbd6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b371ca0-e91f-4ede-921f-9610961bbd6b@oss.qualcomm.com>

On Wed, Sep 16, 2026 at 02:40:31PM +0530, Pankaj Patil wrote:
> On 9/15/2026 12:28 PM, Taniya Das wrote:
> > The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> > 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> > statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> > was missing the 'default m if ARCH_QCOM' line altogether.
> > 
> > Drop the duplicate on EVACC and add the missing default on GPUCC so both
> > Qualcomm Glymur clock controllers follow the same
> > depends on / select / default / help ordering used by the other entries.
> > 
> > Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> > Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > ---
> > Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> > controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> > duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> > 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> > was missing the 'default m if ARCH_QCOM' line altogether.
> > 
> > With this change both entries follow the same
> > depends on / select / default / help ordering used by the other Glymur
> > clock controller Kconfig entries.
> 
> Fix was posted by Sivansh and has been reviewed, should get picked up.
> https://lore.kernel.org/all/20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com/
> 

Thanks for pointing that out, Pankaj.

Regards,
Bjorn

> > ---
> >  drivers/clk/qcom/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..b3ffe1dced017e6f4bd3f0fa9c11bed5948391fc 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
> >  config CLK_GLYMUR_EVACC
> >  	tristate "Glymur EVA Clock Controller"
> >  	depends on ARM64 || COMPILE_TEST
> > -	default m if ARCH_QCOM
> >  	select CLK_GLYMUR_GCC
> >  	default m if ARCH_QCOM
> >  	help
> > @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
> >  	tristate "Glymur Graphics Clock Controller"
> >  	depends on ARM64 || COMPILE_TEST
> >  	select CLK_GLYMUR_GCC
> > +	default m if ARCH_QCOM
> >  	help
> >  	  Support for the graphics clock controller on Glymur devices.
> >  	  Say Y if you want to support graphics controller devices and
> > 
> > ---
> > base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> > change-id: 20260915-kconfig_updates-39a684a748d0
> > 
> > Best regards,
> 
