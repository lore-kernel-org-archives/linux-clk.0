Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3B3F926D
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534685; cv=none; b=Rb0y6K3jLU0zkDNZSs7WmzM82mirgg4kWFavmu8/2z7IxhuvLN0W52602dj0qZ84sxLlvDinB+OcF7YQREbzeWsNI02a7gaw8rvsWpjOVU3LEZ/i36rj4juKJhRDqVMBpVZz6ezlk/EmZXeqCcfXx1Z5X0AlxDSXU7AfPuZJPuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534685; c=relaxed/simple;
	bh=wVczAE4BvCr1c1Rw732n0oj3annxMP38/RrvE0NcFkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LduwD0wdfpyG1YrJSHX+tHQDAJ3eKaFvESHiFoZWsc63Ci+P+yG0m22CzFklLqRzme5Y/xLSNUs9KrQYhFKqSgjvyRnPbocfUgPnLdlxD9+u4ohGEfziBMuIFl4k4jlegM508TYinoMQmhm6xK9rE1RCVMgfN/kDJMK6SLmbuSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aROvyvhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGyf2VVi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aROvyvhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGyf2VVi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEYB44290569
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=; b=aROvyvhH+/QCNVQG
	moNQovKnv5N6axedtHmISUAwJ6CZxHo6rI/6f9KxQnc+Y/cI4KKbe6YPsM7D89oU
	FWK6PkDu8jNt0/xguAZbsYDtOgtwOB2PXAXKFE0l27sDjdkwagHUN7PegiiPVHq7
	in3QXDIVemj2+7SpJHlIsDFaEYdNXbfXooCzr/MysCMoN8KL6FS2MUzkdB5Dpnnd
	Q6UGf3xEZYPFmioh/rMqu1sBA0ycwVqBOuMpF9D5VRROBZxkCcXySIZkT9JbnvBr
	v9OKjWdhnXm2EL7w6T6d6wgxgHBSLE6nilMGnCn5SaTbA0Cn4gzGbtcah7Z7Tmwd
	SXmZWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa713uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:44:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51757324dcdso4722301cf.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534681; x=1782139481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=;
        b=DGyf2VViXRaHwm2o8k1Dzx16LBeK8KzZ6wCUFxFoIyTDpXCE2HhkwFVuk/7LPm8btR
         YrMxrpajA6kjvjEWVUcH+NeMwVWxWSIfrf4kZKc/3JE68ltDhX5OArAY5jp8xHM7c7Nv
         TQy4R7/ZQvwqh0Bm0WOjYtqipMLTMW08pkJ6aGGVUX9Pg0She4J8of4tnlr2m4g42B3p
         r+WyF2qdvWsAofMa4cH5alYGBNMmri96NeOrJztRS+NaAH/P67OpNyYlcv3EWPuQYmeQ
         tcDhbQAKuK6Kxxq2L+rofLxzBVAm6DTnGmjIUjmShCYbi1gNzpkeVRch6QCQDqBe5hXf
         cByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534681; x=1782139481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=;
        b=BJLWKEN8iy5e6FEDZwMcdeCUI9aEWz6VBV8HTuOYRry5tHPgpI7MEui1jx7PexxpXl
         tEK/amevJe8gS7utculDCywr7FtX6gG2CKj5JFzOy2qXFoSWeAEZHEYHyjs7I5yxmyiJ
         7gDPgnLysg6XGzN3YTbC+Zb79podiZRnd98U2bLlOgyvtY3TMr62UI3rt1UJ7ERq82lw
         SgHco2zWyxxF7S/DQmE0WNuHVObw2XSgFOGXajdilMn4g/fqjmz27xVaTJPP5x4LOcrb
         oEUOj1WDts9R3T3hIYAIekOANWX+ZIbw2yCTf7No+cJfqtvccC4tveq4SErQ+DIHwHYo
         99Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9vZMxIWg2V+5b8Uuv4L7ue8gPMGxWEovFuPMsOWyWaJJ9VkiYzv47DR22rv+BJXqc+w05mdTeVRc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjS5A+fi/oW5+kEaT9NFj8ZIRpB/HRL7TergfVhxW8JemNTGj
	gip1qQbloizKTW8d32i8lfC2xRjjoQDf8A7/NdubyqkW/zAr4hIn254sxG39hIS/Y4ARRq8sVwL
	iyv8A7NIh6xdU4f1hqFemzLCbaR98SbsEyJrm07OohpwS7xIb+UbZLWlM7NFoBWI=
X-Gm-Gg: Acq92OH1zrQyN8m0KEKC90Id+RQ7+a4esCzIjfOlalGfqlm4O3tFXTpPXRlcAOqXpLW
	J0aJkW0jKHaCHwlrDZlbwCJnjCvKjZbTRiU+ukKA2oVmbAToGP4+EgB4K/RBfnWbN2ot24ijs2/
	LEY6C8NIIQArKxO38wBgLKLaTkIzxcleDzK+5bmjBBbfN/IWzi6C7n9cmRObB1HxXe6aVcVeMNV
	tSJipbm2A3VOS+1xQ69o2C5vl9bNZAqqBPfndAlmZqgebi2LLHrUyCMWp3Z27WTyupiJUW1Knj6
	nH2hlJ1xddf3vfxSG+o8ldlHxsXtbiGEzq7S6iHjOuY6iKV5xBY2WZfr1OZ0Vi/cKO4rbOsuhzh
	YjRECHiUTan5qmigBM1UlbYOGPemrUXR0LoD6+GECf8r0vQ==
X-Received: by 2002:ac8:5e06:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-517fe50c57dmr138011201cf.3.1781534680827;
        Mon, 15 Jun 2026 07:44:40 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-517fe50c57dmr138010891cf.3.1781534680347;
        Mon, 15 Jun 2026 07:44:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb910f89bsm500939966b.61.2026.06.15.07.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:44:39 -0700 (PDT)
Message-ID: <294012ad-1030-4c5f-8910-30ae4962b65a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
 <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
 <ailwFPgY13_7dZ-C@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ailwFPgY13_7dZ-C@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9DFqIRBVl7-oeXNgZKENz6ZylhbnJ5Gm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1NSBTYWx0ZWRfX4MhKeh/V06c1
 6NjB2ciPqUuMv6yUXv/BAqkPqkXoNbMLTWEcSWUseXo1iqI9EVGau5vEom+/Vs61NUpPeo6PZ4V
 bDIGOPRfvJk3GOouv4fPcQWWI10m1TE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1NSBTYWx0ZWRfX/jJ6t0dHqJo8
 aF1Qtb6mh8d0l48Je6jucOjsSaDTgVO61R+CKGImb219bfmF306E6MiWcK/JTZ8eBu9luts7cT7
 BRLa4aftnoYLqowWkG4j5xfvyu3jJ6bSdBf++kP2eBANb6i15oc64L/rhJyHiMAHOwXg2Mfnve9
 BwLoYhMJvl6PTPT2otVeuljnrPTLvOnZFsjX5KeI1XsXFUT7OdMQ9ZfN0f9B29gJD2+UPVni617
 nxXWTL2Yo3sa+qPvUkSrG7+aRzENbt8Vl//2/esGeZi+zqrgsVEqNY1OwyPnrjr1aYerN6Jjsa8
 7Pc0mpxw9Sj6g7Ttk9iphk94E7v2dlHERxpvAJDUJWadVEwAHcKYQvdPEmSLobxyvWPRsAz+fpC
 n1HCBx5UdUfzT+rlIA+CZQOG/z7aZVfBiaCoKnr3C4YEgFY8eFvp4dyzFL94DI4HL/x8YvZNUE2
 rg7nP2tjqfkhma1hn5Q==
X-Proofpoint-GUID: 9DFqIRBVl7-oeXNgZKENz6ZylhbnJ5Gm
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a300fd9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ck7eFbc12gNnvPpTPzYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150155

On 6/10/26 4:09 PM, Stephan Gerhold wrote:
> On Wed, Jun 10, 2026 at 03:50:11PM +0200, Konrad Dybcio wrote:
>> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
>>> From: Stephan Gerhold <stephan@gerhold.net>
>>>
>>> This clock does not seem to exist on MDM9607. Reading/writing the registers
>>> always results in 0 or crashes. The math in the frequency table is also
>>> broken. GPLL2 on MDM9607 runs at 480 MHz, so:
>>>
>>>  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
>>>  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
>>>
>>> Presumably, this definition was mistakenly copied as-is from gcc-msm8916
>>> (which uses 930 MHz for GPLL2). There are no branch consumers of this root
>>> clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
>>> parent instead of this clock), so we can just drop it.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
>>
>> It does, CMD_RCGR @ 0x37000
>>
>> Interestingly, there's also an SMMU instance.. although downstream doesn't
>> seem bothered with it
>>
> 
> Thanks for checking, but that still doesn't give us enough to work with
> it. In particular:
> 
>  - What are the frequency tables? Which parents exist with which IDs?
>  - What is the hid_width?
>  - Where do we hook it up to some children?
> 
> The way it is right now it's definitely wrong. I don't think we'll need
> it so removing it like this patch is probably the easiest thing to do...
> 
> Thanks,
> Stephan
> 
> PS: This platform has the weird TZ-managed SMMU (like MSM8916), so there
> isn't much you can do with it from Linux. Unless you are running TF-A,
> then you can describe it as "arm,mmu-500" and use it for everything
> pretty much exactly like you would normally expect. But you still don't
> need to do anything with this clock.

Alright then, let's just get rid of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
