Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AEC316193;
	Mon, 15 Dec 2025 02:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765767315; cv=none; b=qiigZFXPk/u6y+QkbBABuS1sFG8zCch1Ch7AvMPH57AI4/zpB41NE5i++ch/5QVEAikg2mYl7BNLnb4c95GTGAoKTbB0PHR0efbQu3PTfrxegcShmXlDKwBzfuM+tytMel6iDUA7fttcDdiX1gnLedIYD7duAqHHRsyMCVfvCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765767315; c=relaxed/simple;
	bh=02le5Uu03CIFhEGQZ7SxFE873qcp7iGtRff7fvnppxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeFbHfoJNjlwkcr09KETLDhV3JE2BIjsEYSAAW7Sl7bO7WEJSR8h5cZF3HEqQSJP8XrUEyS1bSXnhZIxXjEfilDyJJm/reP/RxTFqsqqubrumljZoMaF+M0fdO9xdZUUxCu44xzaOMSUHSIjWZxmCOQ8B4Frkc+CmUIiF2sFEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Efh0bpLe; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Efh0bpLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765767286;
	bh=ePccDOthFyLYtm90K2o9nMjYsKD7YRLlY05U0kQc0FE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Efh0bpLeuXSTkZKvr0HhCCrcIpQcO3kj4K9l4z6MqPdsqpA1Sq61MjLMbBeozLwAM
	 qWMfPtIzYTGuo5LeWAyhT8de4Cn8yKFl8rn3sBVWBqPmcUL5VVPuPU2lV8Cfy7gpsd
	 J99bd0Az0tVPS8Cs5dVVzvdPLi/Ht6zd56LYEzOk=
X-QQ-mid: zesmtpsz6t1765767284t6cf729bf
X-QQ-Originating-IP: 9pTzAVsmuC6mHETYV41cHodoDPvc/PLgk8GGdyTolFM=
Received: from = ( [183.48.246.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 10:54:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2478898065667183843
EX-QQ-RecipientCnt: 14
Date: Mon, 15 Dec 2025 10:54:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>, Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>
References: <20251214232938.668293-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214232938.668293-1-inochiama@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ODZtkAeLQPF7KGrX8GTJ/EmDRg4qjEBlQxJ4bwZGo14ZR4kFK6VdrWZb
	g5DHEzXLdOzDcvbQ0Fsr/AiOKsRcNfc62FIgLinR7UH3kh19Over0kC2rGyPTONzhKiAvfy
	ljddvp8cHrSEd89l59YHtWAFNX3IwS1M7Jj3yDI+XUAXK0KxbZEgQPqfuOHHFH5BkxgNma6
	5qWcQzgLBJCCjI3wva298xE8W2vPTUKWxq/ma7fUq/kbvWE6ISnKB6CaVgO67//Y9TTYoco
	758Kelcc4S1aSFK681oFyOn5HkfapgbpAAdFSqy57sbmCTiKjP7H5e3rZmZAqb66SZTZDUR
	foPy2Gfpk+FXCl1F0092M0p9amXGsDGuQJ6atCc9tGwuPqTbU65kzoidCTbCBceGHckst0W
	8yu7fVSCl/sSYgVVpJl2FMJ9+gCF/+hUvKsteZQP5eMJrpZGBeJJPpca3AD9hYFJe1yKM1k
	n59nROMvvVus30hWhY/TjTMcdFeoqXg6SZL8wCMzF4GKwzkn5BSOfP3p1WjxcFYf230Mfb/
	Wje+w7BS2TmubJPcreO5+0I6lFoL5ySg5n8WUTxI3OS32tsEjTyte05F3bpZX9nzewbTkIl
	UqqE9JZg7g2z59ZgjdXI5jsZ+AfA6oIB3RNIM0Qu2naMud2yzt/ug7Gq7zBs//JwzpHF/8O
	Kvkfpvzrjp9hYwftqcZQV6uMgtyoHPuI3ERqQAFrzjDuRRxbGy+nKwmmo/TZCFMp/L3q0nd
	jb9ZkpR0Qxnk7R1O+ZNTnunhdcOwWjLlXTaExLgFsV1IYwspa++aycUpB0S7HON9en/FW1q
	y6GXpX6/b2MJdkXUzYFFvs6hNt80eLOmsqOXto026WxfODy+KXlLBget4UChnh66llL+gqE
	jxJU463Sj4ITefEdsdaW+5vy376bnT7I3Nuc4AekTkZPKXe8xwcpXubI6k+sGoO6fmICxDm
	ghPEEfiY2cxEH6EnmNpqPzwewNZ4FcuQAcTwSVRrGrm3otT6uAK+lrnLBGAN7xZ+l2Z9ESY
	fRlT6YKeC/WYVA8jMa8gJv+HUIg97KUfRQk3dcuzd0Rv5b/GvO1ySpdvRkmLRIrAvDei2BI
	37p3vJGvsoKRVpE+Ytu7Avzlzp7POPi1w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Mon, Dec 15, 2025 at 07:29:37AM +0800, Inochi Amaoto wrote:
> For build spacemit common clock driver as a module, the build
> process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> build will fail.
> 
> Add these missing hints, so the driver can be built as a module.
> 
> Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Thanks.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
