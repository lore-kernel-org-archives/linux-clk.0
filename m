Received: from mail.chunchunmaru.org (mail.chunchunmaru.org [45.79.219.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459CD36167B;
	Thu, 23 Jul 2026 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.219.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830561; cv=none; b=jFpS+2Kr65uP0b5v5xsVRuLwYsN6XKZV0+5y4/IWiiMhg953sFPXNt0GAkoG6mcsdzhC+AhXaYr1JcQLneZdX7l9uItK6MRVZD+5UJEMeCbAyNkM0tOgoL4VbD6FN9LZ6ak3XDaaV5hLeSVzUFYdAumV0TT/iI5yvyk9sXW08Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830561; c=relaxed/simple;
	bh=0LXgM6lBnNy8A6fXRY/1YNF8xjD+3loy2Cl67PFisNg=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=r+K8tpD5uFrN702zNfTzwWcUmlVPloxxpR6nVks5dF9DxgsZsSQw5HEWqkpq+DaHE4yMMK5I7peEcN/dS15WUJ0ms6BAvfPyrK/Z3xKnC4mG6Z2aCcowV0EexgohwvslspZJ6ZEViOcb9Hsubk82N7IQmKqvUZ3CGgywNWEI9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org; spf=none smtp.mailfrom=floorchan.org; arc=none smtp.client-ip=45.79.219.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=floorchan.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05D183208F9;
	Thu, 23 Jul 2026 18:07:04 +0000 (EDT)
Message-ID: <247df8ea-49c7-46e4-acfc-e56d0ad9f8ed@floorchan.org>
Date: Thu, 23 Jul 2026 14:07:06 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola
 Moto E4 (perry)
References: <4006f966cd5f0c077c413410d79bae1e@floorchan.org>
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Catherine Frederick <serenity@floorchan.org>, linux-clk@vger.kernel.org
From: Catherine Frederick <serenity@floorchan.org>
In-Reply-To: <4006f966cd5f0c077c413410d79bae1e@floorchan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Forwarding to everyone on the list, since this didn't make it there 
(Damn you roundcube!). A lot of the errors in this PR are results of 
Claude mindlessly copy-pasting my in-progress work (bad whitespace, 
incorrect copyright assignments). Fuck man. Sorry in advance if my email 
client makes a mess on the list.

-------- Forwarded Message --------
Subject: 	Re: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and 
Motorola Moto E4 (perry)
Date: 	Thu, 23 Jul 2026 08:49:25 -0400
From: 	serenity@floorchan.org
To: 	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



On 2026-07-23 08:00, Konrad Dybcio wrote:
> On 7/23/26 3:46 AM, Aneesh Pradhan wrote:
>> Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).
>>
>> Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
>> clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.
>>
>> This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
>> rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
>> pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
>> upstream yet).
>>
>> Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
>> touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
>> Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.
>>
>> DTB build verified: msm8917-motorola-perry.dtb + 
>> msm8920-motorola-perry.dtb.
>
> Please send all series as separate threads and all revisions as separate
> threads too. You can use the b4 tool [1] which takes care of that and a
> couple other annoyances
>
> Konrad
>
> [1] https://b4.docs.kernel.org/en/latest/
Hi,

I just wanted to let you know, this is a drive-by-vibe rendition of my 
patch series from earlier this year. You aren't talking to a person, but 
claude code instead:

https://github.com/aneesh-pradhan/xylitol/commit/4bdb6eaac4724ae0071095a925795c5e5b8b9985

I can confirm both the MSM8917 and MSM8920 variants exist in the wild, 
as I own both. As for what you want to do with all this information, 
that's up to you. This also contains hacked up versions of my in 
progress DT for perry available on the msm89x7-mainline git. I was 
planning on picking up this series when I had time again.

Thanks,
Catherine
