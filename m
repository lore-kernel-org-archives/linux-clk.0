Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9B837187E;
	Fri, 18 Sep 2026 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789713067; cv=none; b=YMTS8lszXyp/7yxEJkyGNo8URCBELU1epyhuBW9j8oQCN1IngBStB9epfDGsN0ueGLYoo2Kopws804z8nYXR8zy7rN01gOTtPC4tY5s3dPPblivbuA8qXiogJHoMGnHUn5i8e7k/BL2S8rddf55Vi8Fw/BX+0ow63JVDlkIEMeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789713067; c=relaxed/simple;
	bh=s5CEQy+nL6LfMBHyxDfMdNFJ4CsknmnDRVvNTCjhKaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAYSP4fPb88BAv1OaXlHYp+TXljtJ2EZDIWM5VlgiQDi/SOuBfwYJeK34jXq13M8VaplECRmuDVLYNF+Id6mW4YlrsRdskVHXYrEl6X+KPqVG+b5X4UTkQER4rfXUOrm1ub28nZqVccdk4XO5clqYVo3U9plkN6WpQh66kBzqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBf5VMFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBf5VMFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD1F1F00893;
	Fri, 18 Sep 2026 06:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789713066;
	bh=CKU6ET3Uj7fCsqAsOw05GOIlxnGottq5Z+nZx7nRJZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gBf5VMFtGUiZ8tsSJyL+gcDfInRkd8Em8gNqekitZnmqarX7P7jRseWovJpfKUh24
	 92cLT8hAZiP43Pd2qbpUzhFyiAr2GKM8NNEgVVwwVjmPIM6HPjQXgDVVTixZDEmP3G
	 LDq34lj/t78InaFWIJgsJ6zytueRoIowhwOAdP4cLCF5aCewIO4vWTuf+osMqg74V6
	 0WegR1Yl7D1ueiEdEgGS990k4Gxgo2o6fLJkA0RH0N2yHIq6MByaUZFY6cGJjFPJt3
	 QARqeOCE4k7JM0cKksr9tRAs6gXpIUVSxJCwrBl7eDxXow7/hfeI/YoZHMFp6s3JeA
	 rjh+UAct9pcsg==
Date: Fri, 18 Sep 2026 08:30:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Set
 FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
Message-ID: <zzzrsuvqc6mmctiefjs732kirrg35ae5kqzlnkzhzjlyjhphtp@n2yekkaqiows>
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 11:23:13PM -0700, Qiang Yu wrote:
> Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> clocks so that the inbound data path works correctly.
> 
> Without this, the PCIe link can come up but the endpoint can not access
> host memory, with the host sometimes seeing a completion timeout
> reported by the EP, even though the host can still read the EP's config
> space.
> 
> This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
> FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
> platforms.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
