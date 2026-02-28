Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87525F78F;
	Sat, 28 Feb 2026 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772241709; cv=none; b=IVjgK9J9jdfRrw7Ym2Af4U9W/UjZBn5HUMElRBxppUECU5MHE+hN66c5MuXp+iqResf5HBN5uuRt5ndkVaNAWc1kiM2wQfr0iXEn06gkZpqtWaHRlxvEmvOxoZyNzi0YZRAqyWeF0jOeiBzK66M8ebP5ZnmuNXwnC1UYr8BIlcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772241709; c=relaxed/simple;
	bh=560pz722u0kmHP3nR6xpDHBPEv+1wxjHOQQC03qjMME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FE9nSoXpIx8H4Q44GTkd8K4ifSl1VxdIeEEX/1i0dlbDRvyfqLidVghcTxGZ572pJN/HyesKrKK0g92hn+cE7X5luLH079quUfWxlEd2mz9q6ontB5n9T20bez7tF9hbo3puak7AJkbzofeksViveG0wdkBb6UfGF5ouSEU62ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=c7NKEmmp; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="c7NKEmmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=IVtwgUEgU7viJhk9iZiDp027XYkfTYNp3airlT7p+P4=;
	b=c7NKEmmpmGseHyrobxDU25LdmCA0lhUitkXjxWgCPl3goVF2/0IpRQmv/HMlKa
	hZkf7MipfWkAzZu2FEGHyNW+if36YcSqUzRPzWrtYGe9LX1OS5uLVODrnL1lk5ay
	HE4fQGhqocnre53PwTfQ9mP8UMHWCRwtMfRRFQBO+Q7iY=
Received: from [192.168.11.65] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBn3935QqJp+sDLTQ--.20842S2;
	Sat, 28 Feb 2026 09:20:58 +0800 (CST)
Message-ID: <16a430a2-fdc9-41eb-945c-0727feb7b9d6@163.com>
Date: Sat, 28 Feb 2026 09:20:56 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ast2600: Add reset definition
 for video
To: Conor Dooley <conor@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260227151602.829-1-haiyuewa@163.com>
 <20260227-smooth-carefully-f427e242ce58@spud>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <20260227-smooth-carefully-f427e242ce58@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgBn3935QqJp+sDLTQ--.20842S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxZFW3Gw4fZr4fGFy5XFb_yoW8WFyUpF
	sYyF1ktr4UZFWYk3yIq3WxtF1kWw15JF1Ygry5Wa4jya1rW3Wjg3yIgryY9a4DWr4fur12
	yFnFgFWDCFyIy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsjjgUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzRrRPWmiQvoI7gAA3u



On 2/28/2026 1:33 AM, Conor Dooley wrote:
> On Fri, Feb 27, 2026 at 11:13:14PM +0800, Haiyue Wang wrote:
>> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
>> header. It is required for proper reset control of the video on the
>> AST2600 SoC for aspeed-video driver.
>>
>> Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
> 
> How can a binding change be a fix for a driver one?
> 

https://git.kernel.org/torvalds/c/9897831de614

If squashed into one patch as v1 does, it will have patch format warning:
./scripts/checkpatch.pl ...patch
WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst

>> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
>> ---
>> v2:
>>    - Fix checkpatch.pl warning, and send dt-bindings as single patch as
>>      the submitting-patches guide.
>> v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
>> ---
>>   include/dt-bindings/clock/ast2600-clock.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
>> index f60fff261130..7b9b80c38a8b 100644
>> --- a/include/dt-bindings/clock/ast2600-clock.h
>> +++ b/include/dt-bindings/clock/ast2600-clock.h
>> @@ -124,6 +124,7 @@
>>   #define ASPEED_RESET_PCIE_RC_OEN	18
>>   #define ASPEED_RESET_MAC2		12
>>   #define ASPEED_RESET_MAC1		11
>> +#define ASPEED_RESET_VIDEO		6
>>   #define ASPEED_RESET_PCI_DP		5
>>   #define ASPEED_RESET_HACE		4
>>   #define ASPEED_RESET_AHB		1
>> -- 
>> 2.53.0
>>

