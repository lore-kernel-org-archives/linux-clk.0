Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DBF3D413B;
	Mon, 25 May 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695392; cv=none; b=MZVUMj0nkpTd/xYMO/vcxzMP+b+9dZ+0NOqv6DuC9b+nunjWbWhcjaEDGbfjQktdWDJVKqZ85CnvUCyoJD3PKb9JAyrJy2803VoQ8a9Tpqh0UXDMJD/w4KjheAU4EhtHqqpoctfTvYeTm4fRzZP2t4+dkg0C4t1Zh0YvnX6qifc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695392; c=relaxed/simple;
	bh=MG5VQdE8wH9duQMq6GRWZ/icXsNufIafal21mAh2S5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6TtGZ2tz4iD4V/EN+HtwMOeFw+J3NSg/pdRyWa2iU0uhk0463Mx+rP2eJiKGSqPIdr0lDB3TqQZpxzcdyB8lodjSLrHnauvD/J+NSi2SODZ1V8zNtScCoxUo+mlNYl9ePnMoiscDEmj4jXtQY4ZOWICannoJL88SzvYuNArxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGP5Q6N4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGP5Q6N4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371D41F000E9;
	Mon, 25 May 2026 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779695390;
	bh=I7vMJj5EtpdgmLSXjR+hKtvIpjLBCA8z3OnWj07DlmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jGP5Q6N4zoAVCKIIpzFCpdo+Xy1zHeo1dbQSwrNUyQxirtJIgAxBT//taizMKjs3M
	 an1aNHzbSpWhRC/2OJimJkti7tGnY5fcLSkjwVZgNR4UgOkpsFPHLkZKZyex0TpgLN
	 gvVPVe4gcmyV/6G1oR2Y6dtYpcTwpWikPEQwqExAB25W8qO0WnaOj2AOLtmu01j9UG
	 vF6Qi6rfHSg7br0DVE+a9wTq+qmkR4kIwGsxyPS9Ejcr0ruQcvOS98XT1QjFIqIlhz
	 Jb8P95PxKovAD4JTuzCo+meu9QaY8ffhfjdJK+Yh1w0/PkmwZPJIQ6Dyk71YccfUr5
	 5jaWX+upuMJug==
Message-ID: <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
Date: Mon, 25 May 2026 08:49:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/05/2026 08:06, Jagadeesh Kona wrote:
>> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
>>
>> They are no less magic numbers that way.
>>
>> What exactly is the resistance to defining the bits ?
>>
>> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
>>
>> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
>>
> Hi Bryan,
> 
> There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
> So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
> are not reused elsewhere

- Asking for named bits not common macros
- Reuse isn't why you name a bit

, IMO directly using values from the hardware documentation keeps the
> implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
> comparison with the hardware spec easier.

How are hex values in upstream code easier to debug ?

Without the spec you can't change or understand hex values in upstream 
code, which is the whole point I'm making here.

---
bod
