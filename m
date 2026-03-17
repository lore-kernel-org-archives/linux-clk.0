Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187A30F532;
	Tue, 17 Mar 2026 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764496; cv=none; b=VNirnzXSEgb/etwz5+OUVescxufyOEvQ726swDMtmQ6CY8A0rwz4F9yr2SNG3iQm2Nh3HZBK4ChGHh+rhfdFVPdXx9967dtHpicoUMeG41kRW4CDjbxfDPc6BdXh4x12BKMxfRBsyp6SmCo7TLsZi3+KarX7DFtUT3gu4zOcRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764496; c=relaxed/simple;
	bh=J1v8Hyap7NgYzIxn9FRPCJOoEzVrpM2OKSc4546V6Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBFDC1sva7jc/u0asS+pWdozTTVtrSjR+8xPDgIxUe70L/HJXMYpwHIcDCZHjILUAWKhZl5JNh+6BotwvLFXip6fS9AcjM2193fItn1tSfZrjWn9uCPDAfJxldm4sz2Kq/Glo4j8oQdimJrAZmBnwuiK7SfeJL1eDhjgenbcY1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoBwx3CD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoBwx3CD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BBAC4CEF7;
	Tue, 17 Mar 2026 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773764496;
	bh=J1v8Hyap7NgYzIxn9FRPCJOoEzVrpM2OKSc4546V6Wk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RoBwx3CDrWCyiSLYRHylu25mY96QFesjd8WX331l4dyQDSJIz9HJEAFW6ty5NUwGs
	 dPlLXKzQKsXOoEJTmyaqZJCrtd0RPryVjWwg6fYOhBgqWsfKMEwfAcEX0lTrXgC1h4
	 OFuMpmChvwCz2dEXz79BIyDDWZnBgxdRPcxr4aRDDWMpMgndnD7x4M2EHVh3plh9zI
	 UilFq53k51IFG+MoL4qJS1lkPz05K9D8YcaqgJEclxcB8kUzHz5n0916vwi07EL3TE
	 lxBk02/xpkQTRV95PWebmmd3mG+PqWQa7T+K3MUxli7aXRT3nsv4DjUSPNZU2/RVuD
	 SCBeL48HsUioA==
Message-ID: <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Date: Tue, 17 Mar 2026 16:21:31 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2026 16:00, Krzysztof Kozlowski wrote:
>>> I actually got the idea from:
>>>
>>> commit fe6a952b567f6a771d087d2e969914f31574d6ab
>>> Author: Krzysztof Kozlowski<krzk@kernel.org>
>>> Date:   Fri Jan 27 20:40:50 2023 +0100
>> If you refer to my commits, at least read them. Do you see children
>> there? Yes. You have none.
>>
>> Plus trying to get 13 year old legacy device without dtbs_check warnings
>> is different thing than correcting a recently introduced bindings.
>> Terrible example to take... And if you find example from 20 years ago,
>> it will be even worse.
>>
> One more thing, that commit was still correct because it fulfilled the
> simple-mfd requirement of lack of dependency on the parent. I do not
> believe your code fulfills it. I am pretty sure it does not.

Yeah I take the logic of that point:

CSIPHY here depends on the GDSC, power-domains and clocks we've listed, 
its not being supplied by any of the other blocks that live inside of 
the rest.

They don't require any resources from the parent and the parent consumes 
the child phys via phandles.

To my mind that fits the criteria you've set of !depends on parent.

---
bod
