Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78491BC07A
	for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236580; cv=none; b=GnREUqx2hu0ieYCuheg76RHPXtKgLyhrVlrYGtxXBEiIVwPO+o+FnqJjLX8cchrZjrKCnYCREc1jJGsUpLXP4PziVH3oWQndm4cpAEofCKX56TgjxvwlwzRwbJuV3QhVo1BMuOr8gT4gvdy4qADlwcMCf3xrT3CEcUivEC1CpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236580; c=relaxed/simple;
	bh=Rl6iPZmIsx5OB3kYzIg7Sny9tKV0nIuvvUeFWacwWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WM7WDYnxPc030wrWQWq65r2jt8HSWaZpBzSHKxx1kyVYeLeub8UbpakLnuZVUjfc4RGHDWTbpTzzc2vQd96J8Y/YWee8ypK434shJsF//Nzks3bJNVjMvZ8mQlDsS419z093oG+88KuAVkJe8mDASAhMmMeHZ1kpusG3UCKXnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=UmYWfAn2; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="UmYWfAn2"
Message-ID: <6312f316-f407-494b-91c4-04d761396e22@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738236575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWcktz/MAlG+7TUszakeV42NRt0QCMjIbkWs7JIUlnc=;
	b=UmYWfAn2PY7GbBqgM2bvR3M3BGIvRxBLwTdLL03KqT6k9W6yZhuuWH1+O6P9+NbIkGg0v8
	GDRLR5kYDO1zU04XJLduOqC/IL04cLHg2V14heyxHHU5abBZG8qssdLzFtIyc5sR7GAcol
	Qk63nLb6Px5ph4FeVeNsf1tnrIyGbzgRpupKFefmY4ADu8KKTalFIRuW4XZ6iiiBd/Q/ip
	yBka6oXCYdxnZ0HVNQ44+S3ha/kiIM/Sp4MeSK1TF5MB8xgb3LkCcG5WHG1KwIlZQ5Vng1
	RCPU8S0AGYVFrjSiE9m825Pl/ae6ZQTipi/x25me7FvzTcBcYmXXdPc7iyfQxw==
Date: Thu, 30 Jan 2025 14:29:31 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gcc-sdm660: Add missing SDCC
 resets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Craig Tatlor <ctatlor97@gmail.com>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250130-cheerful-splendid-cockatoo-d833f6@krzk-bin>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20250130-cheerful-splendid-cockatoo-d833f6@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/30/25 11:35 AM, Krzysztof Kozlowski wrote:
> On Thu, Jan 30, 2025 at 12:23:25AM +0300, Alexey Minnekhanov wrote:
>> Add resets for eMMC/SD card blocks that were missed during initial
>> driver submission.
>>
>> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
>> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
> 
> Your SoB is always the last tag, but repeating what I asked during
> previous review - what sort of bug is here? Missing feature is not a bug
> per se.
> 
> Best regards,
> Krzysztof
> 

I was hesitant about adding fixes tag myself, because there is no any 
user-observable bug being fixed here. In fact the behavior is unchanged, 
eMMC and SD worked fine before this and still work fine with this patch.
 From Linux side this is mostly for consistency with other 
younger/sibling SoCs, like MSM8998 & 8996 all have these resets 
specified. This will probably be much more useful for U-Boot port.

Perhaps fixes tag should be removed completely?

--
Regards,
Alexey
