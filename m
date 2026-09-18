Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D7A51A75D;
	Fri, 18 Sep 2026 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750617; cv=none; b=CGpxkORszjScT7jGS1uMolf+9pYOuKROqSkazSi+xVYaIpOECjEvux4kxB4aWRc/EcMboMIOdIOYpynNxe9ZOqV90ve4GJreYWw4bBW33bPaOlJoFXSZ2Y5L+e4I40/SLN8fGfy1mUo3/EbHOhd8f3Sc7u7trTaBiT2dFv+mlVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750617; c=relaxed/simple;
	bh=MbovEWrsKQOf3HbwdVxgqrUqtCvg9UF/wwVzhM9nbpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Tl/x9XklXY3pVWYwvtPlRIlQmq6UFDByCL4fIIwxWlJQtePnZ7rVxraEMD27Ttm7lAuNM1dr6rGIFjqEsq4l1t4BO0C8MWmbAl6eATTtIMrIQm1zqpXZxXARKcRyCSnRAb9peWgTleq3ppUoGW0EcoDAy4ypsfB9WBCP2LSt2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/51VNLT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/51VNLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DF81F0089D;
	Fri, 18 Sep 2026 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750615;
	bh=Tkh8StBLrIR798qullxHP+gv6+qnLT+lMNbe5AiUb/4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=B/51VNLT3GT/VPjS6AlDjXV0+FmDMLzzyMRWYKLASHBiw5deZDugCQhuMx8Z84T58
	 YgW7UmdNY7rrpsae6IVk9uBIlSAU4ozUOW95bgn766HcRW/XUtwmUFWnA01o+6sQJU
	 IWApHCWhD5X7XwRk95LMfgg1Lz1fwohTOI6DNebxUp/W4csj3Q7IzChS96bmo9WINk
	 J4306L1ajWDsYdopYY6lvwBlTM8TEuDnYJ1d/esBmHIB3iNBmAiHCVzv98OIi1KvXX
	 VUQkWhBPbukhyef9P5ZNYUSwSdOB3YC+WzWMxtNSYujqeOsxFCenFxAhhsIwgC7gQa
	 zy3UrKeVP8nmQ==
Message-ID: <bbfa8707-7362-44fb-bd8e-5f948be02e8f@kernel.org>
Date: Fri, 18 Sep 2026 11:56:54 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] clk: socfpga: convert clock managers to
 CLK_OF_DECLARE()
Content-Language: en-US
To: adrian.ho.yin.ng@altera.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 02:01, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> The SoCFPGA Stratix10, Agilex, and Agilex5 clock managers are currently
> registered as platform drivers via core_initcall(). That is too late for
> early OF clock consumers: TIMER_OF_DECLARE callbacks run from time_init()
> before those drivers probe, and the DW APB timer cannot defer, so
> clk_get() fails and the timer is never brought up.
> 
> As discussed on the list [1], convert these drivers to CLK_OF_DECLARE()
> so the providers are registered from of_clk_init() and clocks are
> available before platform devices probe.
> 
> This series applies the same conversion to Agilex (including eASIC N5X),
> Agilex5, and Stratix10.
> 
> Boot-tested on Agilex7 (agilex7dksiagf014eb): dw_apb_timer registers as
> clocksource early, with no clk_get() failures.
> 
Please provide these details in each of the commits.

Thanks,
Dinh
