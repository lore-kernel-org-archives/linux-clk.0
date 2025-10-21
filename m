Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4742ED86E
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045160; cv=none; b=Rfbo8IV7NfWA43q9QOy1h9pwUxpvr3SrVfcmhvEMuv4cpmf2Qmu7WvT6SKXh1iWL+g4rcmYtaOGgqWamyCqRAaryF+g1KJ5Xa0ciJzsk11dIiMeO2KwLm54pnfCvM//v9dvuVg75OpGti69CV449hyiHzICscfxZS8g+RiJmUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045160; c=relaxed/simple;
	bh=n9q0McISN0xADdXG1hSwSPQJGCo+g4xzhg4ndlV5iwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DchslnRd3dsHEzm1nuBKtDiBbsTsiLD2Nb941yJErEYKjcsWmq+0cr/dUlga6Jr3fXHZUqbT9fqnMCSu+CM7MsklXMPgmMg3WAWuSk7gMF3jMCxaE3BxMUYB3bfmxRjwFuetC7GBHblQUfyzO4DG2b/dbzh7H+v9yZWsQfJhzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn/RiCrx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn/RiCrx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L85Xlp027302
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 11:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuqZq2WiXRu2EPl06OgObOqPz4wqzbYylk4WoFwyL7I=; b=bn/RiCrxzTBIVf6V
	ZuEMUnpnxjOCMh03iaT+mOpzGeSSvLv2rwI6J8fzDebZjVL/QjIrVM2uQRrtF1gm
	HZ0XWOmZVWE3gI/aabLK0MAUNBwCQjTyye5BuOjakuIMmzQLGiWm9gh7Dargniz8
	03qnpuSTqUV1BcPyu88W1hKxGvmSwb8EgJdd0frzWK8syycReZXfgfx669WoS2XT
	OxIx4EqdHsvkhy28DeqPHi0uffx17AHYnxo2KWxE6DaVWuYJH/qFMP3NlRs8/MiQ
	I/9YmGzCNBw4LtJ76f/Cd13CnzQ5N4AK4OLpIouEtT/bNYRdf6L4eZNceDKNN7UZ
	nylq6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j0g1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 11:12:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2909a67aed4so47592915ad.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 04:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761045156; x=1761649956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuqZq2WiXRu2EPl06OgObOqPz4wqzbYylk4WoFwyL7I=;
        b=JXerlueVdHk5dSoFiNy6BDHVT8+nK1YyrTQRJVk8FskNpfCLT4lr80dYeFVHqvpfVP
         MFxepLbwuVfNZ79OsnQenPgSwf3IvlJsbsdp3sA60IYiwcxuyo+gnEKDu1yxTTVGsTSt
         ekb3I8+3bsrbVxpsFm/hbYTq+n0m1nTyHtOgzwD/Vx6RoRMTxb5jfSx5rLVe8QzZynu+
         ZKbh2ZwKQ+K5W6CxtTjaC6hJi3RclJQ/6YKJUKFU4Kh0AguoZ7rjPN0Z4d0xha66YTaA
         HYaiVGsEFe4z+XfhNG4d8sOhxRmleI6zsWKXxeNNI//rKO6NpUYvoK8dfIe6CYxXLlcl
         b5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWA5xu9dAWss7f8LXH6lNURd8cCyOhe72Te0zJdNk/8iC4j9zYDRw9nT2UyZzhKfWnx+af/plnf1mc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6pGG70jn15bxweUJyrM9ZaJply49kyS+dEXfnvA/Ha9I/gp9
	LJloLUJQfePbRYRYYLKqv1aXNMBH3o/4KGLgmzxXDRqgB18/zYVw7cSs9PpH5pFtkmRyyrHGQac
	TpDklQtFjvYHrmUVwGS0x3lLb4Tf2bGaFKRvWwB/DyaCGf8TNfMRVvF5p0u3RyS4=
X-Gm-Gg: ASbGncvIT2ezxzis2Ik4uhUMEMsqs4AWOzihv7mRgSlQLm3xdXxDczRyjN+YB4AIyOf
	dlzXWViRwymPAUOYtUtXfCGTBmDuHSsSQyFMfMZioJBRUrM9bWOGTVTOUnqutsY3WXgU3xqw3Ws
	zofvlaWf4TR7jBkwOvisZh4k4Voeb+1w0PJT4G/CWeGJRzeCbgkckWjHVhFMH3AmQJ11vdf/QuU
	umvYH4w9O5qSM5vkg/TqvWHzQGlRiL2He/N489qIP2CJpRP/uC7HPCIPWlg1nCDzJNkP2D7Z09E
	kq8muJ+inTKwIXit7Od/VtMD2oJpNoQbAED62pI3bftdJ9v1WwgdH+g1B1/LVnogoZq1hA7xU2E
	+apOpOG6D+E5PS00gMSg6lh3YqA==
X-Received: by 2002:a17:902:f78b:b0:269:a6b2:2463 with SMTP id d9443c01a7336-290c72e635emr200972305ad.16.1761045156399;
        Tue, 21 Oct 2025 04:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+PgLVmPDKx0lxdL3uoEJJ7FiKNnXlD7MYjyKAWRUh+5GgUYU2AkoDEecKbbjDz9zAJiP5hw==
X-Received: by 2002:a17:902:f78b:b0:269:a6b2:2463 with SMTP id d9443c01a7336-290c72e635emr200971915ad.16.1761045155877;
        Tue, 21 Oct 2025 04:12:35 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebf40dsm106375525ad.13.2025.10.21.04.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 04:12:35 -0700 (PDT)
Message-ID: <dca13de5-b027-4938-a854-2538fce52b7c@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 16:42:30 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <3854e3a0-744c-4317-a6ed-e28edbabc4a3@linaro.org>
 <DDNWU7DVDGJJ.2K19P7FFZU272@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DDNWU7DVDGJJ.2K19P7FFZU272@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX+lqM2s8/66qf
 Lu0FcvL6OSyR+9TQtsYcmnCTpRKyEgFc42IQ7gxCv6tG3rb58ASZMEpDEn3/pi5A5hlGZvipoXA
 Dh8t4cIXCEoSho0xVGqBhNbKEP+5Uy4RiLPHnFYGIiYmzcn6eEmfGbxHChjlQmW2RpAmiXb6wbN
 lM/zvYIlN4CXyXgMllknN2AnpcGlxwDKNRcvg7X2bVZ2eQEHZ+FeVlZfU0UpIxrX5Dwakb3GMqe
 eYRXMAniZHtLFZSzFaKZfDzFkuC6YLZxyi1g6rjFiU03AiS6+pjLpjJAzVigFFdNMbivyQuz1nh
 jo41PQQEYQh7vUHvQL6PKF1RRK1pu8ZzvFETJRUogm/0MKNTjUaeJfY3AJIJnwb50J/88dMu0Kd
 4WpW26JdJpYK+4r0r7LEHpKbPjXwvw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f76aa5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ViRRArT13J1GJOVJkQsX9Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=IwZ_CSZzpzfRW61KRVcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zYO6sXEbYVQ2VJEte3-lLP4h0HS-uKdL
X-Proofpoint-ORIG-GUID: zYO6sXEbYVQ2VJEte3-lLP4h0HS-uKdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/21/2025 3:28 PM, Luca Weiss wrote:
> Hi Vladimir,
> 
> On Tue Oct 21, 2025 at 11:48 AM CEST, Vladimir Zapolskiy wrote:
>> Hi Luca.
>>
>> On 10/17/25 17:05, Luca Weiss wrote:
>>> Hi Taniya,
>>>
>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>
>>>>
>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>> Hi Taniya,
>>>>>
>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>>>>> domains.
>>>>>>>>>
>>>>>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>
>>>>>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>>>>>> not exclude an option that the problem has to be fixed for other clock
>>>>>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>>>>>
>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>
>>>>>>
>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>
>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>>>> need multiple power domains, or in general which clock controller uses
>>>>> which power domain.
>>>>>
>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>
>>>>> That'd be highly appreciated since I've been hitting weird issues there
>>>>> that could be explained by some missing power domains.
>>>>>
>>>>
>>>> Hi Luca,
>>>>
>>>> The targets you mentioned does not have any have multiple rail
>>>> dependency, but could you share the weird issues with respect to clock
>>>> controller I can take a look.
>>>
>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
>>> again, but again hitting some clock issues.
>>>
>>> For reference, I am testing with following change:
>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapolskiy@linaro.org/
>>>
>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>>> on this phone - results in following error.
>>>
>>> [    3.140232] ------------[ cut here ]------------
>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>
>>> Checking the driver against downstream driver, it looks like the RCGs
>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>> downstream, but changing that doesn't really improve the situation, but
>>> it does change the error message to this:
>>>
>>> [    2.933254] ------------[ cut here ]------------
>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe4
>>>
>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>>> iface clk, could something like this be missing on sm6350?
>>>
>>> I'd appreciate any help or tips for resolving this.
>>>
>>
>> Recently one particular problem related to MCLK was identified by me on
>> QRB5165/RB5, and it was reported to Bjorn over IRC, namely it's not possible
>> to toggle MCLK clock enable/disable state, when TITAN GDSC power domain is
>> set off. I'm working on fixing the issue (a change under clk/qcom), since
>> it's of an importance for a customer as well.
>>
>> I can't be totally sure that it's right the same problem as the one reported
>> by you above, but it looks very similar, as a fast workaround please consider
>> to set an ALWAYS_ON flag of TITAN GDSC, and at least a report from you that
>> this actually helps would be nice to get.
> 
> Unfortunately that doesn't seem to help on sm6350.
> 
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> index 12a469ce7e2f..cf87ad55d318 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1767,6 +1767,7 @@ static struct gdsc titan_top_gdsc = {
>  		.name = "titan_top_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = ALWAYS_ON,
>  };
>  
>  static struct clk_hw *camcc_sm6350_hws[] = {
> 
> 
> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> [...]
> titan_top_gdsc                  on                              0
>                                                 bps_gdsc, ipe_0_gdsc, ife_0_gdsc, ife_1_gdsc, ife_2_gdsc
>     ac4a000.cci                     suspended                   0           SW
>     ac4b000.cci                     suspended                   0           SW
>     genpd:3:acb3000.camss           suspended                   0           SW
> [...]
> 
> but still the same clock stuck warning...
> 
> [    3.093431] ------------[ cut here ]------------
> [    3.094614] camcc_mclk1_clk status stuck at 'off'
> [    3.094629] WARNING: CPU: 6 PID: 65 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
> 
> Thanks for the suggestion though.
> 

Hi Luca,

Seems like the CAMCC_PLL2_OUT_EARLY output could be OFF here, which is
sourcing the mclk RCG's.

The user_ctl is not properly configured to enable the PLL early output.
Can you please try below change and check if it helps?

diff --git a/drivers/clk/qcom/camcc-sm6350.c
b/drivers/clk/qcom/camcc-sm6350.c
index 8aac97d29ce3..d33db530b7c9 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -154,6 +154,7 @@ static const struct alpha_pll_config
camcc_pll2_config = {
        .config_ctl_hi_val = 0x400003d2,
        .test_ctl_val = 0x04000400,
        .test_ctl_hi_val = 0x00004000,
+       .user_ctl_val = 0x0000030F,
};

-- 
Thanks,
Taniya Das

