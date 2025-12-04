Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04630AABE
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840906; cv=none; b=CpIVp8F7lEB14B1Z39mAU62oSCqhcKtTcX8YW5eDw1faLo4sMgTqsEdA05AyZW8UDFScfw4sAyu62XKiFQAr7GVUG9m9yotAkqSW9uO2BTVtD1g3pALqBb9UNPjiKVyUKac9HI5frTAagntdnAJStSwDHzbVr0hRsI2o/DGLjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840906; c=relaxed/simple;
	bh=/xThXGvVTKpTEcd2n/nLsU2R+J5IVEQ2yxWAitgFA+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bl5V44ImRuXi9j9apwnnVhO00nwf8KBFRpSS1iSw8N1VyJS/M5U/lGmVaLS0V1d4Pxmdz+Az4z3UXvfSsKkJPKddZxL9DieiWtjzzz6Cjb8zIYL2Z8fptitBwkAbCJdpfa76JEvdOC4EaUUCOQMdIDlYPKhjizB6JHoROJC5XCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+24TaRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZA7VrKhf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+24TaRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZA7VrKhf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4692Sm4174322
	for <linux-clk@vger.kernel.org>; Thu, 4 Dec 2025 09:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=; b=n+24TaRmKX91GwTx
	tzgu+YT/FCb6pGv4/4Bnj6ysfFZXuyLJDsum2/sgeHJFjIKdWlXHnKgaMQsVZwZt
	gK5PO4imN5cPGCBPNCXVV6R0a7VLUDwkeTEuQZWWqfMh+rCv7mJAxHMamHPGMw+j
	mSJr5p0KiXW2eBhf0Fp3hPZV20J3v+IoZ8wka1QynMKAaahXFdHO0hGWYAjgNiea
	rarZhkEld6EAeOgC7BhOm47cxjAiSgZk74qRMyp4ZlhYBXICoUWvBd7BSngAJCgS
	CaUmghqP8+j0dwNQdlwhOLiNcd6PsLfR017TBIyGf/h/jzGGjF9WIcK032Wuv4qy
	k7Jyqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0bbnmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 09:35:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so1159521cf.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Dec 2025 01:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764840903; x=1765445703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
        b=ZA7VrKhfRj1mYvE/j13bmyonrx1Zxs4PY971mW2CQTIdkJ6uE2Hos6VoFxnVm3DyCW
         bVKnkcVXmVXQSWNGgHGBatMs0E45kK8gGUsyIhrXcrxS3Zlyr5/ekxg5IypFJKNCel87
         miUF/RTwrKIFBkc3NHwahQww+/vf4LrehUWSy5AsGRSfvwmNh3Yf28pEthdpYmpBQxTG
         BYhdKjn/9a4ur6FOsSDyKwRhFXlva29Hs55aEV16nH4MzCJ3U6jFwD1bwLerjPoviLIS
         WmDHVeYXvuEt6+I96zpoK5z55BYap2QrLqE6mI2InIDDUtDN2jBZvDVl5suU68KuxXfW
         09zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764840903; x=1765445703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8frjVnxWUnblyyxLFPIXGUvDDmYFQSMSgpjtFN9Ly8M=;
        b=CHo91U1mELY/KapDMD5hitNyBlN0uJEZ1+j+1QQleP2dRagKlrM04QVmyeEqOe7Vik
         bKW51L7RbMzn1KSyW+JET/F9SsWbSbHlccUkvgwarkFJUDLfLLvTG9jsehaEyeAqo+0h
         oLhYje+jtNkqPfSdAA7dKN3thjiNgya21Jk7ox+KT20iRbivac0rqelSXxMOwvlMl5kr
         pe71xEdkxlno9Hd7XxJDG1lmfT80RwwSj/6MlOTnKZdCHjlhUMBQ4bLTxz6Az2da3Ud+
         DikgiqpPbtsjLk0yaTTaOadve9ZGBf/TcLnHi2H3zKr3OIrSAgPtCmF1NydCQuRlpnid
         vYSA==
X-Forwarded-Encrypted: i=1; AJvYcCW3DoJpXYtRl9NG6FfWVp2WXpGoYkl8l9xC69aTra1nj2+4+t6naH1ELp6eOaEOtIc4j9rc4XUdq1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVkyqs4N+YaLjrG5jWDTUrhOufoSUxAqFkCzkrxYLwbBQzh2vp
	dRvCvNTMs7gTMSowBy8ZAAyk5nQ7Etcd+EovfbpTEH7V96buABYma2gC37n8HqG3BO7CKI0XdWa
	2cy84q5ChRYz33jr4hTKcHFjj5eJpGNDG5jEAaceqWI8zdRWLH3mHENlL3jKICy8=
X-Gm-Gg: ASbGncuTVuiSqxG3ggBkSHJxRx2Em06HkXhrsHfIkjjlUA6EibX/0tqME4VcItuLME1
	EyhtaVapree6T9ca8EmPWz6EPfKfRQAofwNiRlBew3b71TCf0NRPzcCGnC5WLdw8eZ6H7cDcdbt
	mHwQaUo9V6+ndk8c9XiI8uFGxsBrjmGpTlxj2Bi7/2pjnNxKie1Aa3ooIy8BDsaq7qe7fO3cv5y
	ncwY1jZEUiUrYkLk61HtkIggL6KTQo81mu+m9QPILnXVJUJqV6DHpe1k640wlB/MyAqi0AOIDhq
	dbmmpMBAUvlKHMOHM7AWR5I5yr7NxBo8CJCFlnE8ZLieofZc+65zIiJIueG7QWVB2Dbvdn+AGjy
	MxAThiEMQVzU6JOh5ztO3eUz2cDju3XqWUwgs3e4jY6y8nk/hZSi/LI+vIk6/ofYm1Q==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4f01b0eb165mr45162401cf.3.1764840902676;
        Thu, 04 Dec 2025 01:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX+v1eNNwOOMBrWUNa6eWsNBTYHiNNTwNLR0pcIGD5JXevK1bZUv6tKavTcr9qRZQ7sGDnFA==
X-Received: by 2002:a05:622a:1819:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4f01b0eb165mr45162071cf.3.1764840902230;
        Thu, 04 Dec 2025 01:35:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412dec1sm758405a12.30.2025.12.04.01.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:35:01 -0800 (PST)
Message-ID: <69f7f357-d328-4559-be8a-81a9df790f0a@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:34:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
 <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
 <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75e53a37-0fd2-41d6-92bc-fb4ad5856829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=693155c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gmcpGffKwdJZmXMFCqgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tO55tCEAwIVqL1xbh0VFSo4cJl9SG1ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX8xknIs63Gtb2
 WCPcLfnRmmEgOtK+VdQQjy6MZbzVzp2cSZTUMWHinqtPWvxhQNvgn06jLOIdFJuvmADSpVwaQGm
 nahY1+11Vel83TfSZlZvRAy4X5N4OI87/UMIi+vvAdn6upqCMEL8/ju1GQZMl5ZdAmEy+nNjoue
 gTwlrle/URShthtUzKt3XW1fVAaufEkovAhiGVCImcyPrDeVPeTdq3tXFckZvxa/gcVvG4g6yei
 p/4NTN3w+hhMrX0senSDtmBDdpEo62jpSOqD/JaCxS+emO53nE3f5DGtHz5cyBfcUn5ypIwCr5O
 3BDRH6z4DDRvXj0mbdB+Zeg7tqG7eE4JQmUC3MRJKlSBbfj3yjDF71Ct47Y66EILv9J1rTcfPNk
 IZQYhPpIerP4Wq02ATFs1MbFeu9V6Q==
X-Proofpoint-GUID: tO55tCEAwIVqL1xbh0VFSo4cJl9SG1ED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040077

On 12/4/25 8:14 AM, Taniya Das wrote:
> 
> 
> On 12/1/2025 6:50 PM, Konrad Dybcio wrote:
>> On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>>>> Support the clock controller driver for Kaanapali to enable display SW to
>>>> be able to control the clocks.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +/* 257.142858 MHz Configuration */
>>>
>>> This is a bit strange frequency for the boot config.
> 
> The lowest PLL configuration is used as boot config based on the
> MDP_CLK_SRC clock requirement. The PLLs on Kaanapali can support these
> lower frequencies as well.
> 
> 
>> The frequency map lists this odd cookie as the lowest predefined config,
>> perhaps it was pulled from there.
>>
> 
> Correct Konrad.
> 
>> More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
>> effort to use the m/n/d registers, instead relying on the PLL to re-clock
>> for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).
>>
> 
> The m/n is not preferred in the cases where the PLL needs to slew to
> derive a new VCO frequency. That is the reason to keep the divider
> constant as much as possible to derive a particular frequency.

OK this is roughly what I expected, thanks for the explanation.

> 
>> 257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.
>>
> 
> The lowest frequency requirement is 85.7MHz and the frequency is derived
> using
> 257.142858 (PLL VCO) / 3 (RCG Div) = 85.714286 MHz
> 
> there is no over-drive at RCG of MDP.

Sorry, you're obviously right, I don't know how I got it backwards..

>> Taniya, we've seen something like this in camera too. Is there a reason
>> the frequency is being set this way?
>>
> 
> We start with the lowest frequency to configure the PLL and frequency
> requirements are decided based on usecases.

I meant the rate-change-through-PLL-reclocking, but you've answered
that above

Konrad
