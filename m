Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F312E11A6;
	Fri, 19 Dec 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138013; cv=none; b=nC74Q1MqMoYexY1DNDb01r0AqHoliLmnUsghM7y0jEoHsZqVCrs9X3AnUZ9oUgcioxqw7JEfhD9e2CsbAjCvcZj0Mk0nVRxTGlfCHr8vWia/KeO/2Mkax8cpjX8n2eyNxWbj1Ttyh6gYEzO1mtPwgLQByfn3p93T8KajQCscEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138013; c=relaxed/simple;
	bh=8+N8pVJDcIg79r/If67g6J87QMpo0At90GWAphJW2ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buqjlyc2eyh90PbwNnAXbAaH7ZEMWkXdxQ7MPR/95GDXtCI6kfXugdnM2ajqiFqHXW4hyeK0NRUWNz9tt43Vxix3Kbl/HN7+E31J5zXLoNbd65CKDnfoboVFkFW4L35O++cssKB/nvtVHU2SltYFp2BARZPdOrE83b1KPlws3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1D6B03420CA;
	Fri, 19 Dec 2025 09:53:29 +0000 (UTC)
Date: Fri, 19 Dec 2025 17:53:19 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit
 common ccu driver
Message-ID: <20251219095319-GYA1955339@gentoo.org>
References: <20251219012819.440972-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>

Hi Inochi, 

On 09:28 Fri 19 Dec     , Inochi Amaoto wrote:
> Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
> SPACEMIT_K1_CCU. It does not guide the build for common clock codes
> even if it is a tristate entry. This makes this entry useless.
> 
> Change the Makefile to add a separate build for common clock logic,
> so the SPACEMIT_CCU entry takes effect, also add necessary
> MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
> build.
> 
> This patch mostly fix the build problem, and it should serve as a
> basic for the incoming K3 clock driver. See link.
> 
> Link: https://lore.kernel.org/all/20251217001833-GYE1903981@gentoo.org
> 
this series looks good to me, so

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
