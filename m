Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B533793D9
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139895; cv=none; b=qH1XJzMIaHEps/5mgZxP2hp4APSJaWDjnxWYk3fyu84KpITu5ZsqqWRenaJvEFdwllKvQ7asUdZ3yRDCh3Jazf1DpDmVLkVX81ps+vtSFHtwCB27EPmX/mNgCeE/mBgicUJMSX+B50AC7H8QeQev6Egk4bv/9DIdqHfWUTZd4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139895; c=relaxed/simple;
	bh=XhpZp1QKBJ4YKSocqV9F4TLkXLx6k7iyL0hajesjqLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl8pGst3IHmCqRvJr10/wWBICO/3UznTo0A6mnvszE95NZ73j6B/4eHriJJWPHLs+dRu1e6VI5k6amfYzLYFhwJ7GvCRcTW8T8d2GBHMoGu+ik+SmWUddycPxe0/GWqi4ogjXZsIo6Ko/zRlvwAlwHrhm1YTyB7EAcHmTUi6MQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axvnG9Nv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcUSdF3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axvnG9Nv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcUSdF3b"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wbNF3124736
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qiq7UaTgraz2ZufUPcfLIhtGpZMBr5Zft0ZDlFR6CpM=; b=axvnG9Nv0oBcGrf9
	HiKVhU8nk+iLpH6zyRnpsHUsCO2CDcfvVcRGl/dVIug2wYgZZWACketgKE2NjCsi
	Pggs+FPOl0jK1UJWYDxI4FM2ZXw23gNY+LvxFV82wYLZnDAcopQl5hrwgS7SGnGV
	sdMwksdjuihfZhE1/vYctEUIOb7O4SJcO6OOthK/2dLcKBXxjbKdMLBn8PQ+921E
	0QMn+4RdYJfovl3UeynSoIbuH5xMLMwfXptomAWFAjdsYjD3C4RjOpWXpmdCWfNZ
	oCkHcDXjAtMuP2TQMLdg86W5Q7vHPbhyJwkTroLZ4O0ZqVHD0BThrcpHpyFyEFcq
	OW5eVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0qa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:51:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso775639185a.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139893; x=1773744693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qiq7UaTgraz2ZufUPcfLIhtGpZMBr5Zft0ZDlFR6CpM=;
        b=YcUSdF3b4RqCpTLMm6nS53oLRuuIghafaOeRcJELQY+tbMXmNlLt0Sihghozs0kqb4
         8O/P6kPY/b62HhE6GmLdvsfxmW1Fj44devhuiKQBy5EftGDvophD3U+AQLTSIjx1+z2X
         9Lp9cXrb5imQfaUoJuWU+XnEICxVNwmWM7Xgv6+FyJNhUE7E10BKd36Od3+JtxRtqZAc
         vC+EbdCcZt+Ra6f934yfsYADvYB1IYS5+Q0JLddPCYvfhGN/oYFFGflpZcReTulUdjLd
         4AJlR2oFgqVVviaaTgOwd+DQK7qS+BUYTKU2vPeiI0uMioR/1D8ntA46mTCmSnA88Ey1
         zBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139893; x=1773744693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qiq7UaTgraz2ZufUPcfLIhtGpZMBr5Zft0ZDlFR6CpM=;
        b=BNt0D2X/D4lw0YGMjClKK8tQ3paQpvG47hxeibNZrScMZRfQsHrI7PHKC9FUYUZ5Rn
         ttLqLSIoA/kH1AtOkQ5bnvVVM7aiCzBdgxIWtBC47j0Pmh65jVLHGvyYh/xJ6LftNQFq
         5Ws+FPvIKkdsyQ94HFKLgFLgd1KiZFLtA8o3lwWDpa61q1bD9Sttw3RANIKyW7WKz1iN
         jZFvcRT3D3S5qqUAPBh8h+Q+w6jX4NsjrFa/d+pGkmH+SzLwG+my5NRwcsA5TmNk3H3m
         ICY8iSV57A95ZDyg6EFFJkl13+wMxPg2V+fsCOlfm2uOVBS0k5C2pqO9igPn1dCs9uDH
         rfeg==
X-Forwarded-Encrypted: i=1; AJvYcCVKA477kz9ua9WBh8LPQ16AjreeLLn/KnL365ROYq+LU4ioBvCHctZAtrChTFhy42c5g5bERakv818=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZBx21E5NonMQ01kkdcZCYu50h/1H5Ylhuk8DZZ30XjRnL5WRQ
	ZX1moIjI2A+Uo3raXTgE0lWi5LLuRhNwl3GF/5turYuha095qnJ5U/ZscDIlXUVyiNjVYR3vx2K
	DaA17j8N9Lqh6HwFGJg9d/s2alVMKr0kHhszXnRTzgrr0mJN35bx3KOdj0fN7nNU=
X-Gm-Gg: ATEYQzzRad4zpF5YoN6WWuAyw/d0EF6eBpVTg4UgRnKaIvetCqZnmfsOZ7mbIPpH2Gn
	4SjIJbtGsdYu02PBYevoSpHAJWFPNFQsZPl6iqVvlt0XnRznuP71f30+8+B6/QGEdzvl/nwAfT2
	lo89IdbplRKI6aW+aivF9+YKJ3kbptbYmK4BAuTkjmq5ex8xRsEkDIC5L+BjQ2ghydzacS/di2G
	P/6vr15faCRcUACzrh+ramImgKLrSaCVPQS426YQ8TfxjhwYu6cejVmIs7CqezL52YBQtg8w4Zy
	1yxsJpQNc32szRNayMxmLwGez2KrGyfnnFW/CI+oQNOLbje/M/J1T0ssseL6fJZ77PqiSx8QlP4
	WKJNkjENtxV3tTQLy1Dyc/OWYSyJcYfnaiBpNLVkp+eoVb7Jex95PP/T3FCdXsSLU0Aq+0OAwiI
	B2GIA=
X-Received: by 2002:a05:620a:454d:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cd8ee7483emr458762385a.4.1773139892725;
        Tue, 10 Mar 2026 03:51:32 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cd8ee7483emr458760185a.4.1773139892270;
        Tue, 10 Mar 2026 03:51:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629311736asm1364434a12.24.2026.03.10.03.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:51:31 -0700 (PDT)
Message-ID: <bc56780b-6ad1-4c24-94d2-f3233aa0c460@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:51:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
 <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
 <CABx5tq+D4OeApjYv8VkcbMv6-Atc=Ob1e=7f+xqt0k0CUoJbbw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tq+D4OeApjYv8VkcbMv6-Atc=Ob1e=7f+xqt0k0CUoJbbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69aff7b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=C6zI-uKJOvtAozOgxp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: 3mjWfCBkbED0T260gu9VVNs3ONSsuH3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MyBTYWx0ZWRfX9HZPLaXLflcy
 KT1MsprA8kMdVh0oDrmDepDQ1ASTiBwYTn66O0Czi3IzDx+ir5MOrM9UHd6o7awO69ufq5SfElZ
 iTS4VJejUPMPxzPBPd7oV6UlHoBxhhrnOoaD0mUkIbFnZUf9LwMQfdMF54oTju2UHKAg7/AkfCK
 O3YRXkX5kmq8hM9cwKWY9mXdwxPX8/9+5WOVYCrB+6JEAxtEQxp3kYVVtCUootjAi8OyxjYsL5x
 1C9gK0wB5T645FiTOw79dohVQ3QTz0KRSm1RvExLhY6L4oAzbykUeTXhxgqQC0dSJ0MVvoB2jxn
 9RTFReERz3p2o1EcyZ4zjVu5TZt7EvWS9gtMfO5Fa1JQJ6KyxsNzElrvSmXnVB7BN4aD+9ExKph
 99LCyh3ISLZkBMj6QvhdqgYgSDTpXNXr6Px8JP6gIYnVMHSdDbUz4xgXeR6IGPO8SPjnxZbFPc/
 m3q1Uni5VyQKI1wsNiw==
X-Proofpoint-ORIG-GUID: 3mjWfCBkbED0T260gu9VVNs3ONSsuH3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100093

On 3/10/26 11:36 AM, Brian Masney wrote:
> On Tue, Mar 10, 2026 at 6:17 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/9/26 3:38 PM, Brian Masney wrote:
>>> This clk driver has a noop determine_rate clk op. Drop this empty
>>> function, and enable the CLK_ROUNDING_NOOP flag.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>> To: Bjorn Andersson <andersson@kernel.org>
>>> To: Michael Turquette <mturquette@baylibre.com>
>>> To: Stephen Boyd <sboyd@kernel.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
>>>  1 file changed, 2 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>> index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43872bf2f9065e5d6d4 100644
>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>> @@ -35,6 +35,7 @@
>>>                                       .name = "xo_board",                   \
>>>                       },                                                    \
>>>                       .num_parents = 1,                                     \
>>> +                     .flags = CLK_ROUNDING_NOOP,                   \
>>>               },                                                            \
>>>       };                                                                    \
>>>       static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {          \
>>> @@ -52,7 +53,7 @@
>>>                                       .name = "xo_board",                   \
>>>                       },                                                    \
>>>                       .num_parents = 1,                                     \
>>> -                     .flags = (ao_flags),                                  \
>>> +                     .flags = (CLK_ROUNDING_NOOP | (ao_flags)),            \
>>>               },                                                            \
>>
>> The other two definitions (using clk_smd_rpm_branch_ops) also need this
> 
> Are you sure? clk_smd_rpm_branch_ops doesn't have a set_rate() op, and
> it's been like this for years. If I add NOOP flag to this ops
> structure, then clk_core_can_round() will return true with this
> series, and it'll change the behavior of this driver.

Right, I mistook .recalc_rate for .determine_rate

Konrad
