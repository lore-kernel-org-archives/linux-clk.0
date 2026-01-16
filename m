Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423573164D3;
	Fri, 16 Jan 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554488; cv=none; b=CYcHjQJuwnISHcjd3oAvpviUivVc1tnrbtLl4rYD4ECBFwZrtHkismQdZd9fbalOLqUJyjTgcPTyjFlPnc1G6hQ/eBzh/EH7IfeZhB+LaYLcObRi4IVzMaFZb3/UuIydXIUF5IN1TI97eRDA0h1P+hOv1dNwZAIABUnGp5YnlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554488; c=relaxed/simple;
	bh=TOF4GAlmY1WDg3xIdWRzUey0EKZgIyHzsAISslRGFF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc/07qvZqqxCQ2Qz/UW2qqotk5dinhqZltfRhpSj/q/eJZi7095AfQGLUJ777dhgJwZmhlR5qckkAYawl1j05sdkJVPjuYPIlVIgeIADLH5ZAVngw1HSve/C8t/wDGrh1Qk9y+vdBJUE87Q2aW9FSo3Rp11I6kXYcSYHgM9wmrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppedPxBF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppedPxBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B88EC116C6;
	Fri, 16 Jan 2026 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554487;
	bh=TOF4GAlmY1WDg3xIdWRzUey0EKZgIyHzsAISslRGFF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppedPxBFdX7m92njKvJHrxJMadmvYRzmJjPcIaYZOeUmoMjClXn6IzDN5t2qwed6Q
	 e1utOmmJr71/Rv9gg95IBitzgF9Vwdb0oNpbrOF1QkGm5IpUgsmc+oPdnbD2u7YptJ
	 CmoAi9reGBqr0PBpt62+6nVDZqaiQehJCfVG6tkkU78L2QM1tRKFsRBjd9dKjPe1id
	 Nliv7Xm3xv37WmHTkBaPY5SA+MQaXk+1iiLXSVku5Iw44eLguAw8rPrqACD2+eN0Vm
	 1zJWCN/pOm5ZLLGPChbuvCybAMUyUaFQXWQtfsKaP2Pf3jXE0f3dzONDnSCqVVC3Fn
	 MBTHk3+tlrxdw==
Date: Fri, 16 Jan 2026 10:08:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 8/8] clk: tenstorrent: Add reset controller to Atlantis
 clock controller probe
Message-ID: <20260116-pretty-maize-cuscus-fd1cbf@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com>

On Thu, Jan 15, 2026 at 05:42:07PM -0600, Anirudh Srinivasan wrote:
> Create a reset auxiliary device during probe of clock controller
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  drivers/clk/tenstorrent/atlantis-ccu.c | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
> index f3a2ea49a82e..e4f56018907f 100644
> --- a/drivers/clk/tenstorrent/atlantis-ccu.c
> +++ b/drivers/clk/tenstorrent/atlantis-ccu.c
> @@ -491,6 +491,7 @@ struct atlantis_ccu {
>  struct atlantis_ccu_data {
>  	struct clk_hw **hws;
>  	size_t num;
> +	const char *reset_name;

You just added this file! Why are you adding incomplete or even buggy
code which immediately you fix?

Best regards,
Krzysztof

