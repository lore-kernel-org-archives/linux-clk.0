Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229763F54C7
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357218; cv=none; b=CPaRQnOJmPJ39ubiAsasg+6fGjzplJDQk7Y6DY0FRbzi8csGu5LYChvWEaKlXgLq+TyCobFJFE2ThV0D351o9AA8G5mqLVlkfF0dx50ra6+4WeJfvVIfNAZ3Ed2GDIiH/dC+plp5rAHymOr6ry8kozDdLwPxKuyhW5LC5HuDSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357218; c=relaxed/simple;
	bh=Qo/Mik/vYS6SQbgLS8M2JqG7+aOVsZ6u8vdCMUadwzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXcUdvQwemunG9Qr2ToC/VqTsPgRZFeYX1EJXaMPJtV04C/CDp7WO5MhG+Fwr9IJsGMZaeC2/kwyoiClV64ikQy15bFUuSWu5cxIOUJ4XnPWU3BfYRvCQ1wHiqx+SR2K4uug5dxZubs0pyki+DNTEGw5qxZvu2FhyEQC/44OC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILeL5dpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrsSmxUV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILeL5dpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrsSmxUV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OACJCM1762131
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmYwnXBlvcv2hQPXBjEzajPd9eX79Z+xiIQAGDfThCY=; b=ILeL5dpM+b+Qe9eo
	u0cS2yP8SuwWXd3xtd20iF0awNgk/KKDbanZs/cUs1ne+74zEM8XYNuAPTe0Ku4Y
	MhXTLOP3boJ3yQdud9yzaLsR/lgj+xaY2J3pYWOas2jS1jiXOxQZNZT1Q9nn7sOc
	XSJoJEYc2JfbbqWLV8rlPGFZ2Sd9U56jIerDtYkCprHBZokQLHS+/pjdtLS6Td8L
	wq19ab07kWVaa1mefo65XdR5QlOT0fxUjk9ffBGw/YUSVl/joSODxMHbQU2C3LHs
	8kSNCv/gxC/m8IFozfMH7zLb5BRNqgMT9CwZKSHL2X3hU9vgGmg8WPrF1y73paX4
	8S7Oqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0cjgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 13:00:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b317c4041so34384371cf.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357213; x=1774962013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmYwnXBlvcv2hQPXBjEzajPd9eX79Z+xiIQAGDfThCY=;
        b=KrsSmxUV31Km1BEFKeD3R2vSNZ/GwjaO4Hwh/v8+Me4s68tRKBZeE1hpFLAmObxgCR
         d/1TC4fsyO+RJh1AV54boKB/dS6QASBZlIXLSOqnWZsZUHcsogkPGoPH4xU7pA6a+mCf
         yqrFcOBTzEVndgFII/dCBqxADi4hUgVkWQN97xUpnFCVljplznA0QpNIDHMkGySoHzoh
         aqnPKj+nKAg0OI28t7hYjRYfqjPkAXrdMgz9XKn/jGZSH1g8tqlGTLISCskrCe27wtco
         oVgtP1tu8vHdZ9EYeaYAU+nWoJ+1/7KImRh8HHVqbSrZjZpNLgQEzYdf7LnF4Pb/Ze/b
         YQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357213; x=1774962013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmYwnXBlvcv2hQPXBjEzajPd9eX79Z+xiIQAGDfThCY=;
        b=AwaVrjzbOyAcxIU8qqzlfxDOyTd+FV51ENmtGCUwFbHQ5hleURhWjZ9a7STMLgaSNJ
         snFlEIAzp0Kgp4poFWKehCdjDUFWX9P5vTLx0ZiUiGYFXhBo7VJ+wxKW8bGlJzE6mB1w
         0eBhvwwPjMYOAUOgGy/5PffNQYhL/MnMxxnDnqEaiE2lbtE/bleGBI7BbiCNKHUF9pIv
         J/NZTudNYacBHv+Di98WPM+mjE+GnhOucFdMNjSUP99FhlOe4CkYLMxvcZbvmdv/+XK7
         1Hu1i+u+IKDsRFNYeVqmL77HOJGDbJenNkX6iqYCS2duaVj43x5n0/nRHqth00eSQRz2
         jqPg==
X-Forwarded-Encrypted: i=1; AJvYcCUwIjUZv96/1VpuQSMqaSQ/csv/zAFQkuQsRA8zY1xrwOMzm8PGvB7y1LTj5eJjnCwyczwMVBwXZDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSON8mdGrHuy1U2fpIKMC8EpnmKScMHyNyur2HfMuxGBiLE33
	sBoWcI78kGAEledi0GJGNL4xL+Vjx9SN8glGh2F4auxU3t7YJ3YLZOtVe/jhAu8QMgGkgv2Jx5s
	n64hFnIw3Fyc/t6qPo4TRVXPPSDPnJfNYkDBoUjxJUZ1TS9JmyYhDS8L3tMBsLfs=
X-Gm-Gg: ATEYQzxsfdkSDOSBnxT4JXdCBCDMgk6ceVYbMKIeThkvrTysRUqRWN4EFn7kD3Rqha5
	lWmFvY5pOGSRxEzPaH4bGoPhTQlpO/6Swuosh/nrnd70Ql4S5npA3cUuAxswKFecL8WvaiRl0f3
	Z6jgudRv/+ArJxxpmln/q1KQjANWLkeNV3MmVYPgmWveaPow+jNwe8Bm9HizIKpPPOsXEnDKRrr
	+RMLwUfD8G8uu9emi5toFeiEmDy75yHHwJKV2jY1TBY2nren7kFOuRR2ypQZAoLdZSCyPR8veCr
	uqIAvNQ2tDtC8aa9MkjK0PwSMQjP+txrI5dKxRgBzqYMlG7ACwGq4/AS4os0zlXJRBK6IJjV8Mi
	1I9GdLjq+QregDzwDIRIUh52MyHepTu1PJDVSgHy1eizh2WNd4+nYAhsQE+pW250agV6LFBqk2w
	Oc4J0=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr187475921cf.3.1774357212367;
        Tue, 24 Mar 2026 06:00:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr187473241cf.3.1774357209941;
        Tue, 24 Mar 2026 06:00:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d22914ecsm4726697a12.21.2026.03.24.06.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:00:09 -0700 (PDT)
Message-ID: <bcce61b6-3fe4-43e5-9e1d-a4cba0bec0ac@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:00:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
 <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
 <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
 <CAH2e8h6PB43h08aZsHmN68Cp5HHuEEmhD3WhF7KOaQGyqvHjsw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6PB43h08aZsHmN68Cp5HHuEEmhD3WhF7KOaQGyqvHjsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c28add cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=0E1OWuO-EJLwnSaZFvwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: i27o6fJI7qWj7fdcBBlZoFRlJIIbz5UC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMiBTYWx0ZWRfX8bN2KNqQJ3fF
 Oyl6SCGhFPomKefxLcHdj5GIrf7+2Qw6Y/DsomnpQI3uOoSfup0aaw+3THH/JLFMHcG14lfBV+a
 zc8WXWB63vN967aWAGdJZtkNBDSE+HhGcWzV+sMW8eqi56FvTvJ02lmrhwFJnNDbRlehUpk+3B0
 ioCB10cLqcEgzHDvm0qSfQR8QCMaZkVKZ+WAMyJnDb9nXPsQ5aOuqiZhcj4lnLfHcJ2UaRPOvay
 lpxvpN9BzOZTy9wwRe7TcWbk8o5bWLu5FNCT6sy5fXJUt0PGNY2kFg+KLrQJkfK0Xc66fjl9A6J
 6WokmSeEu5E+WsVmVb2MNY41Daam1DXz9znpB/JjuUXcK0AZee+PbG7363DVZlyl3hpHRCno8Yj
 mONwKRm8sCVB5i7wHjbOwEmMhKkVQ299NX9EmLD3y2rw8S5gSuE8Dgqg/MsmChYcryK78Kwthps
 D+q6YaDNjdiy1ha90UA==
X-Proofpoint-GUID: i27o6fJI7qWj7fdcBBlZoFRlJIIbz5UC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240102

On 3/24/26 1:56 PM, Pengyu Luo wrote:
> On Tue, Mar 24, 2026 at 5:22 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 8:23 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
>>>> On 3/21/26 10:50 AM, Pengyu Luo wrote:
>>>>> Recently, when testing 10-bit dsi C-PHY panel, clks are different
>>>>> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
>>>>> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
>>>>>
>>>>> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
>>>>>
>>>>> byteclk was set first to 108120000, so the vco rate was set to
>>>>> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
>>>>> 172992000 on mdss_pixel_clk_src later.
>>>>>
>>>>> Since there was no matched ratio, we failed to set it. And dsiclk
>>>>> divider ratio was set to 15:1 (wrong cached register value 0xf and
>>>>> didn't update), we finally got 50455997, apparently wrong.
>>>>>
>>>>>   dsi0vco_clk                1       1        0        756839941
>>>>>      dsi0_pll_out_div_clk    1       1        0        756839941
>>>>>         dsi0_pll_post_out_div_clk 0       0        0        216239983
>>>>>         dsi0_pll_bit_clk     2       2        0        756839941
>>>>>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
>>>>>               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
>>>>>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
>>>>>            dsi0_phy_pll_out_byteclk 2       2        0        108119991
>>>>>               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
>>>>>
>>>>> Downstream clk_summary shows the mdss_pixel_clk_src support the
>>>>> ratio(35:16)
>>>>>
>>>>>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>>>>>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>>>>>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>>>>>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
>>>>>
>>>>> After checking downstream source, 15:4 also seems to be supported,
>>>>> add them two.
>>>>
>>>> I don't see that, not even in the newest releases.. Is there even a reason
>>>> we have to list these divider pairs in the first place?
>>>
>>> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c8a8d21ad8e8733d61f6b69ab
>>
>> Ahh branching..
>>
>>> We need those dividers to correctly program pclk RCG2 clocks.
>>
>> I would assume that's the case, but perhaps the real answer is "because we
>> don't want to try all possible combinations"
>>
> 
> So you meant the pixel clk can support any ratio actually, and just
> common ratio pairs are listed? That is interesting.

I don't know about pixel specifically, but generally RCG2 clocks can
do any rate, only limited by the register width, see:

drivers/clk/qcom/clk-rcg2.c : calc_rate()

Konrad
