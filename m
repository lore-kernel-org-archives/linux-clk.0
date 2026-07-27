Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263B3EFFBD
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145306; cv=none; b=D9gGRYx5eI7o+S18cSq30UFjmw0Cjh0UiugCBaTk6s1QMqB691xbz3JL1XeYQhNJM9re+CqOCiaF7lqn7o23BClCHDND16YoTImNHxkqCNZvsrmpH3WcFLbgMN86kbgJN05VoTGmXAAbNahCphXiKzaCR1+d2pqEIJslpwwNK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145306; c=relaxed/simple;
	bh=Y5Xn8qE7LpNOzTT8++pEzgKR0yaA8en+5bwEYjw3AC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyxHFZtk1EzdFLksyqp5iE40FQ759lHWGVVtskkc0BTbeJY+hP463BlE47KKMWOr8oqECa2Fx6q4JgBCFOdo5NR/Uop6oec2kjeXlp71l/Dl6rkFzLIWKWziHKf7fiFcoP334v81Q+f+jivHl4W5RzS6NDSDisdQ3J8mpcTZoig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0FB+cBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQkQ4DD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0FB+cBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQkQ4DD7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9bZ9b2846523
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 09:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTc9/pF/S1BGmHsWWo0LXh7x2vLZLHXs+ToLsh0cTy4=; b=F0FB+cBvDbVl2sRz
	hsVrjp8FpZT906w/GYcq7Zr2q3U+nPtPLR6FSBLTo2Vg33LRdSiHVw4T975JUAMQ
	b4Ky1t+JfZgiCxznzezQ8I+nFv+EMLlZswIob2Pb/rpgVBdwTsJMPzclPcejsH0+
	+W3TE+nwGonT/r1+x0aji5mHD2UY88p91SEehOYSEOAVi5sq97mUNx5wPcwDz1e5
	hZaG2cH4tC45sULIrx3yJ6g+Kl7HANQCMAy5Y7O5PgfUfj6MvMKmbF/Czm//3tQW
	7ojcFkQDyCiJL/cX8gMD2C/s69qRA4X/r6p5Q9Td8e27B61vJGX3/t59JnS0oWYD
	me2jlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v680m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 09:41:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso50705105ad.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785145303; x=1785750103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTc9/pF/S1BGmHsWWo0LXh7x2vLZLHXs+ToLsh0cTy4=;
        b=JQkQ4DD7GnSF/BkvUx2tCoOeFT09BP4RAaePfPqLJKJII2OvgZ/VC8rjbwdGWRJwfz
         YOlDfcKte8fQoLoFDzMmeoeN/WX0ua7vnntaRldNR5+zh72nSy5nWaYbNtL0igi4t1yl
         rE/ZHjpoZltYO+mU+uNTidSBEEXnWh2qj7een9PqY/ncjVYui6K22OHj6ynhFiMHi7zZ
         tsZSrNyxOqQXQUyr1RdQeIOf0eH5/XoUNHxSd+ie8ar2u9BIonbH14Qf8UYIaQgKIDgD
         AisqVf4KdiwBTDy9vzgxiiQIjb6i1pIBcBjNkzbR1CxrSbC2FxMNu3pg2mAVHyCwjT9i
         oiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145303; x=1785750103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTc9/pF/S1BGmHsWWo0LXh7x2vLZLHXs+ToLsh0cTy4=;
        b=gVcrOhI60b7jPNSL581hzr+kOamFGbD6WJe3ACBsMhECw66gJBxDOW6Til5CXX9ltY
         6psZflXNXuIndidCRmG0VO8soLedaJQpQL/CKMUMSCr8+d4dxCXwv4l3nR24ggTf6Nw/
         /8pcUL7MJ1YKfHLivfOSn+p6OPogqdzpzrvkenvqZ41Nl9cPc9SYmciaGBt6ljUfbgEO
         x1M9J3c295NVPWef3ByzWVMM2dFaXax2lTKOo/Oez422fWR/Wttdj4lb6PAKxiHnrw//
         CVD2sY5NsYoBECd/FARUrTY0LuVseQENMpfVmh8Dv4LhLzaLPGHlfqNDmdz8FQUsBZe+
         YTqg==
X-Forwarded-Encrypted: i=1; AHgh+RrRAvWZKKkP2ydj2wC/2L/D3AZnD/PR8jxmPchNiuG8K3HSR1ovPy0CDPdeHm/S1R1BGyGQJx6q2Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHy8k/Pd+HnlgR2ODX4oFpBKTJj9iC8dze2wzjWvAg9vkYjOy
	eHqtQvMbK6TCH/ep1OtFejB58mbKNcTXC+Z0cnepTDLP/MUkC1A3E83+1OZUbHInoKUnxYdh1Jx
	tC9XTcW9dxk7rBNfgaxjKF2ZyKHrMWsuMOIUT43WVDa63UeZ/z4iJI7GiQOCNOyY=
X-Gm-Gg: AR+sD10p3XD68dnQ4elEm/NlqXBZxn13nvqpDIBoe2ofmk2YNRgvn2nVq9ccvStLf3i
	ujcDY3n/gi5aFcUAS5OdAftixypZ4GCUP8/+w2NXd8mBisyjp2T1KOw3ZddY/bvrkt+EKktg/Qu
	6yaI27D1OdOP5NWPNR4E0T2Fmn2r+kiZSTRjwZZth3t0+j2XK6Cv1ZPgJSvW/colxNISHSdFQpN
	naSO5DeVj3RNpbcW22Rh7+7A4HRB/c56az/TraC5FH0jSot3e1fy4tKXimiz1tcZnacvHgtnMS+
	h2Utz4cXycvBNBeiONhI+J0XAWzp3Xv0qyq6B3vVkHJDTGkgGRyV/kOIK8N14CiO5fPuCz9+r1v
	1ByCzwH0a//iMyipZ9XK+s9ElDawwgCw=
X-Received: by 2002:a17:903:1a24:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cfde795581mr78353395ad.3.1785145303312;
        Mon, 27 Jul 2026 02:41:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a24:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cfde795581mr78353235ad.3.1785145302847;
        Mon, 27 Jul 2026 02:41:42 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e29sm30948601eec.15.2026.07.27.02.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:41:42 -0700 (PDT)
Message-ID: <f4a3c2a7-0732-4d4c-b252-2ac5ea3db35a@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:11:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] opp: Use clk_get_optional() to avoid leaving
 opp_table->clk as an error pointer
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com,
        Sebastian Reichel <sre@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org
References: <20260727-fix_ptr_check_on_clk-v3-1-94629ac7aaae@oss.qualcomm.com>
 <sl7wx7n2bocrfcsqj72vp3snchbgvtkuahq4pjzpor54bg46ek@ar62czwob4j5>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <sl7wx7n2bocrfcsqj72vp3snchbgvtkuahq4pjzpor54bg46ek@ar62czwob4j5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NSBTYWx0ZWRfX+dhE3/zQFQg7
 VkjvyIWEH1PZaGpZ6xK08C6E6M6lbXpsWQKomRn6cVIdghUbSdOgnHoS7Y01DjaKm4IxlUObT93
 4tZQsIjX07eY5fyoUoLTMHxrXxrqCm8=
X-Proofpoint-GUID: CzJdTl0jGwMX6PQQSnXGCUc4_PFGD9tL
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6727d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aVMEk7OLGE4JoB244ZkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CzJdTl0jGwMX6PQQSnXGCUc4_PFGD9tL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NSBTYWx0ZWRfX1WkdbV+roIBo
 9LiJzLS6bEd16t+S4AQM13Tl5iSUXnxepeTRItRhhvlCqDWRL7/WavHV2g23s+Kve2kshehuAt5
 LAuVlmdXoLw+xGLejp317Z6c0pgW06s3XpyrAk6KHyrumRugKkIPqfsG8yJ7LGimQaAkvn35/vL
 4EK7Dz+oe1cEpQ9pS4HZAHf0V9fglVJ+yC05vDjx12napJTT5OJLKyK+bjevL/m55b/zph0q+P6
 OgfkEDFFCyKXGsVHHK9vD7wMh26P/1aJn/gcG+5H+w78i9sSAyF1levMXCNciWixtwxjdj6Z2fv
 3IO/oTLGdh4Y6fAhcI2302y3cs2X/eaWh5m//CeMh5SqNWnl4gMHF8j8kPYs+FaZKdKcaDUw7Gs
 GFUh1sQgoCX4AxLiyuG5eQrh6R+GcIXWUya9ehsthZDb03npywv+WIdNvJkfkT4Au9hN+CSXHAz
 PTD4UDQydLbUr2532RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270095

Hi viresh

On 27-07-2026 10:44, Viresh Kumar wrote:
> On 27-07-26, 09:46, Praveen Talari wrote:
>> _update_opp_table_clk() uses clk_get(dev, NULL) to acquire the
>> device's clock. On platforms where the perf domain device has no
>> Linux clock and is instead managed entirely by firmware via
>> devm_pm_opp_of_add_table() (through
>> of_genpd_add_provider_simple()/onecell()), clk_get() returns
>> -ENOENT. That case is treated as valid (the OPP table can still
>> have entries sourced from firmware), but opp_table->clk is left
>> holding ERR_PTR(-ENOENT) rather than being reset to NULL:
>>
>> 	opp_table->clk = clk_get(dev, NULL);
>> 	ret = PTR_ERR_OR_ZERO(opp_table->clk);
>> 	...
>> 	if (ret == -ENOENT) {
>> 		opp_table->clk_count = 1;
>> 		return opp_table;   /* opp_table->clk is still ERR_PTR(-ENOENT) */
>> 	}
>>
>> Consumers that only check IS_ERR(opp_table->clk) treat this as a
>> valid clk and pass it straight into the clk consumer API. In
>> particular, dev_pm_opp_set_rate() calls
>> clk_round_rate(opp_table->clk, target_freq), and clk_round_rate()
>> only guards against a NULL clk, so it dereferences the error pointer
>> to read clk->exclusive_count and crashes:
>>
>>    Unable to handle kernel NULL pointer dereference at virtual
>>    address 000000000000002e
>>    ...
>>    pc : clk_round_rate+0x3c/0x188
>>    ...
>>    Call trace:
>>     clk_round_rate+0x3c/0x188 (P)
>>     dev_pm_opp_set_rate+0x114/0x33c
>>
>> Rather than teaching every clk consumer API to special-case
>> ERR_PTR(-ENOENT), fix it at the source: use clk_get_optional()
>> instead of clk_get() in _update_opp_table_clk(), which already
>> translates -ENOENT into a NULL clk. This documents that the clock is
>> genuinely optional for such devices, and keeps opp_table->clk holding
>> either a valid clk or NULL, never a lingering -ENOENT error pointer.
>> _opp_config_clk_single() is only wired up via opp_table->config_clks
>> when a clk was actually found, and every other opp_table->clk
>> consumer already tolerates NULL through the standard clk API (which
>> treats a NULL clk as a no-op), so no other call site needs to change.
>>
>> Suggested-by: Sebastian Reichel <sre@kernel.org>
>> Reviewed-by: Sebastian Reichel <sre@kernel.org>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> I am getting this with git am -3, please rebase over [1].
I have followed below steps but faced conflict while rebasing it.

git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
git remote add viresh 
https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git
git fetch viresh
git rebase viresh/cpufreq/arm/linux-next

$git rebase viresh/cpufreq/arm/linux-next
Auto-merging drivers/gpio/gpio-shared-proxy.c
CONFLICT (content): Merge conflict in drivers/gpio/gpio-shared-proxy.c
error: could not apply efecde8a254d... gpio: shared-proxy: always 
serialize with a sleeping mutex
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
hint: You can instead skip this commit: run "git rebase --skip".
hint: To abort and get back to the state before "git rebase", run "git 
rebase --abort".

Could not apply efecde8a254d... gpio: shared-proxy: always serialize 
with a sleeping mutex

How to proceed further?

>
> Applying: opp: Use clk_get_optional() to avoid leaving opp_table->clk as an error pointer
> error: unrecognized input
> error: could not build fake ancestor
>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> +	opp_table->clk = clk_get_optional(dev, NULL);
>>   
>>   	ret = PTR_ERR_OR_ZERO(opp_table->clk);
>> -	if (!ret) {
>> -		opp_table->config_clks = _opp_config_clk_single;
>> -		opp_table->clk_count = 1;
>> -		return opp_table;
>> +	if (ret) {
> Since `ret` isn't used later anymore, you can instead do this and drop
> `ret` ?
>          if (IS_ERR(opp_table->clk))

Sure, will fix in next patch.


Thanks,

Praveen Talari

>
>> +		dev_pm_opp_put_opp_table(opp_table);
>> +		dev_err_probe(dev, ret, "Couldn't find clock\n");
>> +		return ERR_PTR(ret);
>>   	}
