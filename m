Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCDD3D333A;
	Wed, 20 May 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266492; cv=none; b=NYb8nCrryV1/repg0Grv86GLPAqKLWSByxgpinlDo61DcCxu4Knh6bF00wVur7NO17MrYCAM0TQoGI/rqANlEzIAVRdU6+VhRlA0LmeZCSlCzsaPL5XMOOCwp7N96Wjrv1A3FmAkoZKSC1SRXRwX7eSYF5moqP/rSVBMEopkD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266492; c=relaxed/simple;
	bh=3T8iGxPV0ilx5UkYwFNQwHVEKr9CZY/QH+rtKyldj+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p37vV6bAqzwAOTDwPxYII7iXT4iEVuUBKOu7LNlkcgnc9sztp3gybijntE/E9sjjF9WuMZpUWfCBDD21OjFYqNBJfqyJpOWRs5lij0138HlTf/sfcIu+IGgxffa49sIkppP0dxsUzKvPGmmQg13/NpMi7AFUJEOjlDaiGBWfSTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sd4C8Sds; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sd4C8Sds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E651F00894;
	Wed, 20 May 2026 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779266490;
	bh=WFWgfSAOZlEOghZi2XE0lrCha2ZqizOPC4Z9eGRFv6A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Sd4C8SdsKaQPTlls4eWpHrQMqmDK9l/Q2i6rSzb+SLE32XDZaW1nk8Uc9nqthxqIR
	 U3e0lhXo0vdTxgSScgtE3/XMs1hD13DuHPWHlrP7TlKq6O4b1faYq2ormtaLBd7zYu
	 CBWlphAezq2i8b3mB7dD/MIzSs/8z3h2eScpH99OUX0iQZ/RmKlEZHV1XccGkS9Rrm
	 zYbzikq2fm8zb1xjAgkJokVztUTm5bRKLBr3Xb8zJwCxF2wp+Low4J/hkXm4obkJOr
	 XM86k1QzFfYXMTiz/s2W+1AmL1knm55HDcMxXTFPkGldL8np8CYRWKrocRNdtbStFA
	 AGEZlHXeaQzQw==
Message-ID: <211cac59-21c5-43f7-b99e-486ab103853b@kernel.org>
Date: Wed, 20 May 2026 09:41:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
From: Bryan O'Donoghue <bod@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Content-Language: en-US
In-Reply-To: <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/05/2026 09:32, Bryan O'Donoghue wrote:
> On 19/05/2026 16:10, Erikas Bitovtas wrote:
>> Allow Venus core GDSCs to have their control passed to hardware, so they
>> can be powered on by Venus firmware.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc- 
>> msm8939.c
>> index 45193b3d714b..243d31a32e92 100644
>> --- a/drivers/clk/qcom/gcc-msm8939.c
>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>       .halt_reg = 0x4c02c,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c02c,
>>           .enable_mask = BIT(0),
>> @@ -3681,6 +3682,7 @@ static struct clk_branch 
>> gcc_venus0_core0_vcodec0_clk = {
>>
>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>       .halt_reg = 0x4c034,
>> +    .halt_check = BRANCH_HALT_SKIP,
>>       .clkr = {
>>           .enable_reg = 0x4c034,
>>           .enable_mask = BIT(0),
>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>       .pd = {
>>           .name = "venus_core0",
>>       },
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>       .pd = {
>>           .name = "venus_core1",
>>       },
>> +    .flags = HW_CTRL_TRIGGER,
>>       .pwrsts = PWRSTS_OFF_ON,
>>   };
>>
>>
>> -- 
>> 2.54.0
>>
> 
> @Tanyia
> 
> Can you confirm this change please ?
> 
> ---
> bod

This series looks good to go but we need to get the clock change agreed 
and merged first.

---
bod
