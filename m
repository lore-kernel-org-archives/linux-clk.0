Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2734B1A7;
	Thu, 26 Mar 2026 05:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501481; cv=none; b=sEjwhSGy4a1mYwnruK1iyXdFMw5M4Q730W1ywwDGcsp1BSJ1RsAfsCh48t+WWKwdt8ZBLjTB30M2I1emaWXSxpJcYUSkRAb6Y057RI6xCWCIQGHY1SKkpXY8+JAIKiXaVP1IKkm726MNTRM5bFFmUJNn1wNnTDbQOxQBO/sxpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501481; c=relaxed/simple;
	bh=iFRNieBwy70eYK4iTBlR3AXf//nBc9stROyMfBHjJT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO//m/zgUJaswxqmYumoVADP6bFJW0mZNl9MSTXH2BBhlR6MDwKLezHD3li82cJicrOEbaHfggluPeIrQSFVHCUR1M+jVjtu7f3uMgOCq1btHlD6upcySSAhylDE5/erXBwmRCEnb9R5mAHFr/o/FKlu0BAfKaPwojvCEWvx578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AD0O91W6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AD0O91W6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WOoteiBiG++L2NH8GdlWRlWgdt0rYx+y4dr3RBlQkfg=; b=AD0O91W6SrxNidI7NjgTDmn9Xw
	XxATB1XFA9JZrqP+eVHxJqNp/lSCksxaq/z3kAuhcJWIFi4F31WH0O3N6VqZmdCGgVuTU/9VD/qvK
	PtcToSLnsAPXR3OEleRdoaJ4zhfh7BhkAAoM9ODpxmpSLDZQkj8GSCrX6rpbBukdnF/Hw2gc2QzUC
	7ZcLAbLryobGtyQpxbb9OZuAhiob+B9p5Hx3agjEqtLGTshhc28LRceGbzSe/tyP1uIyRaTReHLfn
	UO9Yq6YkmXOH+OkFRXi+vdbh2kF01CFIAUTukyuNEW1nXHOLkvEkFHav7zDERbWqhv4PhsH0Yn8YZ
	5qG0gJ8g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ctR-00000004hwq-0Y5o;
	Thu, 26 Mar 2026 05:04:29 +0000
Message-ID: <1379cd60-2201-4b63-9b4a-069beef23433@infradead.org>
Date: Wed, 25 Mar 2026 22:04:27 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs: clk: include some identifiers to keep
 documentation up to date
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
 <20260325-clk-docs-v2-3-bcf660e1ceb5@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260325-clk-docs-v2-3-bcf660e1ceb5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/26 4:52 PM, Brian Masney wrote:
> The clk documentation currently has a separate list of some members of
> struct clk_core and struct clk_ops. Now that all of these structures
> have proper kernel docs, let's go ahead and just include them here via
> the identifiers statement in kerneldoc.
> 
> While changes are being made here, let's also include the newly-added
> enum clk_core_flags.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  Documentation/driver-api/clk.rst | 58 +++++++---------------------------------
>  1 file changed, 9 insertions(+), 49 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
