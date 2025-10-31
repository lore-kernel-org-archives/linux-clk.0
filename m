Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30234311C21
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914579; cv=none; b=A4nY56wowXGhutwkMN53EEhySJfVolyxZLbJuYKHS5iR7+r469U1XBQY72whLoVlE/kCXBPypNqmroeWZVDyK6m7PW9kH/G3sNgHW4XlDAfl6eu9Tlfs7Au8qUwznkkm9DVK3BxYTJdn/WWbv3OsQem/mxPBBg2RhKxvk8dY00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914579; c=relaxed/simple;
	bh=PLD/9RwCyc/wENbahoWPvbxicWmVeAGz1BL3RIu9cxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6mG61CWsuBjRmkUB/rB0n0nWF3GDs8WezRgsWvQD8kweLBc3bltLS5HnHFB+nVU/853hxeOqOmx0aG3baXZjFJFQaKbdaqLUd9z8/h1yciRlSQ4Frk2OU5stfaB4QJYW3QxgBDW4ngXIG5V1bDBO69BD2FToAJcaELO2w5kAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=KIY/eR+q; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="KIY/eR+q"
Message-ID: <722a6cf2-7109-47e9-9957-cde5171d7053@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1761914574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBcoDhvBiRpbFrBHTGJxuS/5uthc7Xf+aqUT566+UzE=;
	b=KIY/eR+qz/ils6v60wWH3T/RCgqwFResSB+xZ1PPuel1IdiFSAwnlBnEUY9hsUabolKn8r
	4HD2rjsTLdTDtihF8ClUe0eGCsZvEr7xz5A4+iynARIoRSy/BuANrfHHp3zU0x6uQ7boy1
	5KabZw0ZcOxGQV1ZmXK0H/yroDAbfmfn7EBFBxZvdqblnqkfSUQmNS9lTK9Bo5Se0rIvuH
	99yRWEYAcxiCYNRLZT+Jyqtwg+wgpEwUTVmPrjhfS/bq2CzUHD9xrfLhozdvVQsW5yiVPW
	YmcF+Zynh7HLDEKdZCXwv6bYGmBBJqqhdmolF/XUiiEWjQN4uNdmK4AO8Z2VSQ==
Date: Fri, 31 Oct 2025 15:42:47 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] SDM630/660: Add missing MDSS reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
 <25579815-5727-41e8-a858-5cddcc2897b7@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <25579815-5727-41e8-a858-5cddcc2897b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 31.10.2025 12:21, Konrad Dybcio wrote:
> On 10/31/25 3:27 AM, Alexey@web.codeaurora.org wrote:
>> Since kernel 6.17 display stack needs to reset the hardware properly to
>> ensure that we don't run into issues with the hardware configured by the
>> bootloader. MDSS reset is necessary to have working display when the
>> bootloader has already initialized it for the boot splash screen.
>>
>> Signed-off-by: Alexey Minnekhanov <<alexeymin@postmarketos.org>>
> 
> You git identity has two less/greater than symbols
> 
> Also.. thunderbird argues there's two of you:
> 
> 
> Alexey@web.codeaurora.org
> Minnekhanov@web.codeaurora.org
> 
> plus.. I thought codeaurora was long dead!?
> 
> My DNS certainly doesn't know about web.codeaurora.org specifically
> 
> Konrad

This is a result of me first time trying to use b4 and misconfiguration
of git: user.email contained my email inside '<' and '>' which somehow
caused the prep/send process to generate emails with broken half-empty
"From:" field, containing only name and surname without email. And then
perhaps email server closer to your side decided to "fill the gaps" and
append some non-existent web.codeaurora.org part? At least I don't have
any better guess.

I will send v2 later and hopefully get this all fixed.

--
Regards,
Alexey Minnekhanov
