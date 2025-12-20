Received: from mail5.out.flockmail.com (mail5.out.flockmail.com [54.161.96.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA191C84A0
	for <linux-clk@vger.kernel.org>; Sat, 20 Dec 2025 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.161.96.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766199417; cv=none; b=V5CSa4QBaMgu3XHxyzmSDO8IjafqMyjJS1KjcovCUmrRN/eSX+zChwR+WxCV8xWPZx5aLGzTO3RoAcMCnyEVhVVHeCghECYyKrnN0EjBEPtUsi24xku+RnEaeEXt0iXaYvSDmakP5yDA2DHsGZziWTKE+2ozo9yzUnzo/zOzPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766199417; c=relaxed/simple;
	bh=0EUIjb/VY8iaB+oqYc/1jCz1JlY4M5G1NKjhuSLy4mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaPnu9Xa+3Edv8NW4Re8xWQI189noZuNn9V9dFGTJvK3moI8C6HU6LpZAo6e9p3Il6+MUKi+PmCZC20aSqwto6wBVnGZCrVuUYKi/R3KYTYQZMI4TVT0VbMc6fBuXHormUbZAHE9AQkTspBGlldBTKbFH9p8sFrD0Z9YHLMUr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=QCynwGtC; arc=none smtp.client-ip=54.161.96.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="QCynwGtC"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dY7tL4Kk7z9rvT;
	Sat, 20 Dec 2025 02:40:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=0EUIjb/VY8iaB+oqYc/1jCz1JlY4M5G1NKjhuSLy4mk=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=to:in-reply-to:subject:message-id:date:from:cc:references:mime-version:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766198426; v=1;
	b=QCynwGtCzyb9C/CmaKTWW4Y3oNkRJztG201MaW3RB/FFthdKHYU32W2IgpnDhjrbueSFxxze
	taOf4bivWGRy/Dd8+EMVEq91QzABQrWGo0nfbYAznVlR7M4j4bKg3DbFhY83PUhYU8t0MGv9sAj
	uqGwVljJQH1mRAR6TCbRncYg=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dY7tF68PPz9rvQ;
	Sat, 20 Dec 2025 02:40:21 +0000 (UTC)
Date: Sat, 20 Dec 2025 02:40:12 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <aUYMjAi8YIqValwb@pie>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766198426463720322.21635.3765431148171030953@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=WtDRMcfv c=1 sm=1 tr=0 ts=69460c9a
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=posyo3T4zH_C_FV0dzsA:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22

On Sat, Dec 20, 2025 at 09:11:20AM +0800, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.

Does it mean the reset driver fails to probe with only PATCH 1 in the
series applied? If so these two patches should probably be merged, or we
will get unfunctional commits.

Regards,
Yao Zi

> Signed-off-by: Yixun Lan <dlan@gentoo.org>
