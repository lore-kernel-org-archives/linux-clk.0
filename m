Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ECF1A0AF1
	for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346328; cv=none; b=ASW0FzUGKbgpTE/GGwfJBlHZ3k3H7xNTAiC/7bnMwYwzCLPD/AoR7poDD3wXOGmO1IHHml5MplrNKEh7+t1lTqGp0CkmDUwdvZyfuFLjECnoIXBD2bbibznNUD47YPg4Up+Wc2KBUnpJ4t+tZf3YafMwhRWgJ28ub27rWe/a1Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346328; c=relaxed/simple;
	bh=tUrlKqmrYQCyGY7WLDONsGKgWWhSlS7S5SKygFkIWN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Je54lzJFsuOXL6JHnBIlSXwYEnZNPwss+NBc4Tu84Le+m7GjxopKNe+HP4wxOWetna/hNeUcweSw7cJk+pl+tihaCPsBoYk48jwP42Ud9V0daCa4umdRCXO6Mq5WdrhxFSuv5SZROiSjsRuak17k7/PR/0fDZNEKTAAt3WDZsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=mKvMEGC2; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="mKvMEGC2"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B751B8932C;
	Mon, 11 Nov 2024 18:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731346325;
	bh=9VnPq+DeI1kfAletOjyV/VL2RBE0BCGOhdueSpkA9mQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mKvMEGC2qXTRIpDTI8ZHQv1sRC9QW0QW+FNMcUhBHlD7/+avXgQ9GidYw6UGa5MDL
	 IFyetyBGfJq9hJPA8MdQGFAmYXbmEAR77/gQtcMdKeI2GAYaY421s6HSnL8jEupURL
	 E3W/1x/aN4TxzUoBbAdAzlMLNiYhxLNoU5/00iI8fPjEd4QH5SskGWkfuoLIjOA+Zh
	 ks+NYv7ikOcoN6H642x6ZXh5gmj1prIhzuKOzfpW6+YWXff+IcdEV7gUATNacWCIn0
	 TDbTIJ3fgxlxWti5jY3ey634KPkZoeLhLoCWcEt7jj/4Ak/HTTSl4l5EJ5B4DBty3T
	 uEYH7wS19/vrg==
Message-ID: <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
Date: Mon, 11 Nov 2024 17:25:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: "Sagar, Vishal" <vishal.sagar@amd.com>, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, parth.gajjar@amd.com,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/11/24 3:33 PM, Sagar, Vishal wrote:
> Hi Marek,
> 
> Thanks for sharing this patch.
> 
> On 10/31/2024 5:59 PM, Marek Vasut wrote:
>> The ZynqMP DT GPU node clock description is wrong and does not represent
>> the hardware correctly, it only describes BUS and PP0 clock, while it is
>> missing PP1 clock. That means PP1 clock can never be enabled when the GPU
>> should be used, which leads to expected GPU hang even with simple basic
>> tests like kmscube.
> 
> Could you please share how you tested this?

I tested this by running kmscube, see one line above.

> Please share the dt node too.

The GPU DT node is already in arch/arm64/boot/dts/xilinx/zynqmp.dtsi .

> We will also check at our end and revert for this.
I do not understand this statement . Revert what ?
