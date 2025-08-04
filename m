Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5EC242D6D
	for <linux-clk@vger.kernel.org>; Mon,  4 Aug 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298012; cv=none; b=kxzljyiBy4APLDHdtpY9Q5PmhLXYppGSgEJ02BDgIWKlnM0l0qtZ6+gG0AXCezV152upLCOhHDoh3MeTFbtddlt4w5F7j9NGmrbDT5fQWd6IKG7IVvemiiRUUe9ND163smN+pgadmVyWTbulS+PISJLVfCQOJPqnYMIqV2e+RkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298012; c=relaxed/simple;
	bh=KCH1pCdiGwOBI5qtyR9u3CbnJsjZm2nAIh6QkzgzEH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lILIqZjyiOXT1LC99qkdk6s2SOQ2cKUareCMvFjEXZuBsvHO4zbIOoHvcS7LTA/KMz2G/xzTL+UxtV6ZDPdMC3cvlQFZdCknLNTDKfYj/HSgPTH6sYh/0tLfcV36TZnpYKE5IOpyThHbnR9vLR1ncS0XSMMpYN5RVqcwWvlfERw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KI+qPv7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KI+qPv7l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748NreR030930
	for <linux-clk@vger.kernel.org>; Mon, 4 Aug 2025 09:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLD6PUFRLMN+HbgpajUIIfX4iIztYiU2uFQ6pIPAkPo=; b=KI+qPv7ljAiWwRSm
	o+cTfcCfWGnY/0Y7m3Jfv2DmhiCiaDPeiJGy1xoHbXe2I3sC5W4LOuioQeqLGD7U
	qQrgnp+DSuOLR26mT4Cdj4Tj2Gkd/34BeEjQnYHQE7C8yb/MXz6ljYKuiVW6dz/i
	pi0GBqIClcvpgCBHTsvQ/1XgECoogSsx8i/9iD+lTGzojO5lKrj0+WZEmubfTO4B
	0i80RAGj6dzOuWyF8OPwe26bXlVxQ5dOwU/bfnGtiymAOpvgkaVu441P7QnHHe3z
	Z9C5zmZ4Ud69/2Qjea+n8RarwaDlQGbFEnVtxbe2+f91iE+3DJ9BcNxdk+p4HiSo
	brRGXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke2aj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 09:00:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3510c0cfc7so3043031a12.2
        for <linux-clk@vger.kernel.org>; Mon, 04 Aug 2025 02:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298008; x=1754902808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLD6PUFRLMN+HbgpajUIIfX4iIztYiU2uFQ6pIPAkPo=;
        b=ut9nP37L9oljZjyTmgdtiy5kIsVKrWTovBlMADRjXR0vqRaHEa4mRqC/NbO9O7vSGq
         JFske19O7ZFrgulil8kShva1k/Wovv3Anz5FES0OWH1fxbdZL7j6pI0c24SIay+gsE/l
         4St4wXvihWVBWNozm2xe+91WGveh+WV63LJ2jKaFspi8cGzGGHYvx0sM7I1TOffCauOW
         fEbzmzawH/ZjHrjMuqct4WItTOLJzm6F/pr1DOSLN/1gk7dGPTT0gzjKlbWTWepg+DU1
         17yLb5/4zjFnHKtZDFTTuX207afs1egbWoXRCgh4H/S7Z1XS2l1xFxeBWUghaMd3vG0E
         P6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV2vP0rWpNJwSt0DGwPix1xVwmcG3b1viQXQc7qZ8ynAN+tu8xrgVzzVbKhEIv9hgDvnZy1HtvGJbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytE7gdsD69yP7qmAPm3nOlYbJdkAl9Jmdiwdk8EW30mumVdNZn
	Ls4MaB+j4ZW+FKcZIPJPFumshqq61R/QtcIXTP5AHJdkoEI9nvK/z9mlG2Whu+VHuDJgcIn42NY
	IyQ+3dvWpwjr0eyEmz64Oe+YSOvXFZckCPq3b4rdwH4QyQxiNUOSA9HUQryb0P6Ko++3dglo=
X-Gm-Gg: ASbGnctLTEdDG9YritTmGVqcK8MsKQ3Flen0HkrnrUJmK66rjhGL5ImFwoqnRz1VZwT
	OoRO0oHElpJsSwEisHEqQ40xIbRdcmTYkhotj+aW80qYoRHxx3BrXqm5UuCWwwabUcPIkUkfgh5
	7A2eDAaSEwxNKH8hlvPFvJjPa3va/7HrS7gzQn5uLFlZnXWbtclmIi/4iQ8QI7IeeLzYVH5PR+G
	dSTBgz5l6a73OrMaN4HxAfi7TMIE7ManqbMRMd0Kz4vCMkiF0J/bnSYO89Bn8DrVilwqQu40POE
	q+AN0azyWG97ljAxXdTJ721OqY3Ib9CaRRhQ1YbQFrt9lHYM4uvQ5DhCCnNGy9zZCu0=
X-Received: by 2002:a05:6a20:558f:b0:23f:f712:411c with SMTP id adf61e73a8af0-23ff71244dcmr6640473637.36.1754298008001;
        Mon, 04 Aug 2025 02:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdxtGwnA/c48xKrIO/+id4y5Pj73li5eoGe6GJBL7RnkEfq1PIi9CDpV3qk/9Rh+1G6mWGHw==
X-Received: by 2002:a05:6a20:558f:b0:23f:f712:411c with SMTP id adf61e73a8af0-23ff71244dcmr6640428637.36.1754298007371;
        Mon, 04 Aug 2025 02:00:07 -0700 (PDT)
Received: from [10.218.30.152] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c0a952525sm1455674b3a.79.2025.08.04.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:00:06 -0700 (PDT)
Message-ID: <b2f219d6-d441-45d0-a168-b2cdbc01b852@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:30:00 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
 <aIoBFeo00PPZncCs@linaro.org>
 <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
 <aIxRKHKdBHDefDs2@linaro.org>
 <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3cGro4x0ovSdLTIJV9s0MeGwXvXPD9ma
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=68907699 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=xkFCAPjOK7Wg2B_RzJ4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0OCBTYWx0ZWRfX33Go0UkSEhgL
 y4euj76RwR7TaWYx7/VK84nkjUHxT0gINLJActvrKOiWtBZo82TFvBR/NBzrtxuBADr+6a1JtmR
 A044KElG8zJi/bmdGx0hwJU/eGdTA3ENZFX+hK1W11PTz2HUzOoEOyag3vgBwsgw/VQX8I52Lqb
 gE/yNj75qYz1jBEEH7Bvbc0uGK33j0zZ9lKmjdF9oQPeQ5fBr9hghMuQtZmJ+0QHvk/DGKmjkPw
 YyWeVqS5IYr3ZcjHNgAkrkJ5KVV/FKubJg0s4TBFZuGEaEkLZW3Y3Bobqbb2smuDxZNXRwSCwCD
 kxJOqIMCqflKTCD7Up/NNPTNvvjtde/zNkckgYPdso2OaxJ/ryyEIEmfknn4QyIfBiXcVtKrMKr
 Qv5MKOZ+LtqSaAy7Ku52alr9tqV4fvxRr1MwJypANmxg3+6lfqvXWwW5bUeVxCYG0tMT8qQd
X-Proofpoint-GUID: 3cGro4x0ovSdLTIJV9s0MeGwXvXPD9ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040048



On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
> On 8/1/25 7:31 AM, Abel Vesa wrote:
>> On 25-08-01 10:02:15, Taniya Das wrote:
>>>
>>>
>>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>>> provides refclks for PCIE, USB, and UFS.
>>>>>
>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 266 insertions(+)
>>>>>
>>>>
>>>> [...]
>>>>
>>>>> +
>>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>>> +	.halt_reg = 0x1c,
>>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>>> +	.clkr = {
>>>>> +		.enable_reg = 0x1c,
>>>>> +		.enable_mask = BIT(0),
>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>> +			.name = "tcsr_edp_clkref_en",
>>>>> +			.ops = &clk_branch2_ops,
>>>>
>>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>>
>>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>>> which is obviously not the case.
>>>>
>>>> Bringing this here since there is a disconnect between X Elite and
>>>> Glymur w.r.t this now.
>>>
>>>
>>> The ref clocks are not required to be have a parent of bi_tcxo as these
>>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>>> HLOS/APSS will not allow APSS to collapse.
>>
>> Is there a scenario where the APSS is collapsed and still the ref clock
>> needs to stay enabled ? Sorry, this doesn't make sense to me.
> 
> MDSS is capable of displaying things from a buffer when the CPU is off,
> AFAICU
> 
> We can do CXO_AO instead to have it auto-collapse if it's just Linux
> requesting it to stay on, I think.
> 

Thanks Konrad for adding the display use case.
Abel, we earlier also had some PCIe, USB use cases where we had to leave
the ref clocks ON and APSS could collapse.


-- 
Thanks,
Taniya Das

