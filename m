Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3D34EEFA;
	Tue, 16 Dec 2025 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896534; cv=none; b=g+Xb0dfsEJ7O65Pq+6UWcwPs60wfEnzrC04llE+uA94NwaWrtIhCzX/DiyHu/ffKwgJ+IBCCohfXSTZ7C4chCMQ/dojJb/OKJVv+nYWBRUbL9ZNK4r/N9XRCyWFa98SpG7EeLnQmU4kvIKKP7pl5gyV/aRsTqiOOUTyMA8hSKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896534; c=relaxed/simple;
	bh=nH/PONng9i8L7qMBp8yaZLsSE9ygyFFqxsyIqudfBxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rU1Uao7u1c4w75w0uLLntqjki/+jql3E79X12ZbJ4AFvcEuTA4cvPWVvQ+981XSuHPobRfu29E/6sTA1esBRCT/ViuRQQV181NMingUXVrTRSk3ONgr12+B4M3FU4pDnYaU8mPIoCV5xM4mzYO9kDf9OnELL4+I5mkd9f2wW3aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5DCAD340E96;
	Tue, 16 Dec 2025 14:48:51 +0000 (UTC)
Date: Tue, 16 Dec 2025 22:48:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <20251216144845-GYC1903981@gentoo.org>
References: <20251214232938.668293-1-inochiama@gmail.com>
 <20251215221202-GYA1903981@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215221202-GYA1903981@gentoo.org>

Hi

On 06:12 Tue 16 Dec     , Yixun Lan wrote:
> Hi Inochi,
> 
> On 07:29 Mon 15 Dec     , Inochi Amaoto wrote:
> > For build spacemit common clock driver as a module, the build
> > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > build will fail.
> > 
> > Add these missing hints, so the driver can be built as a module.
> > 
> > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> looks good, thanks
> 
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> 
On my second thought, since all functions only used in spacemit clock
driver, how about using symbol namespaces? please refer the doc

https://www.kernel.org/doc/Documentation/kbuild/namespaces.rst

or check drivers/clk/meson/ for example..

-- 
Yixun Lan (dlan)
