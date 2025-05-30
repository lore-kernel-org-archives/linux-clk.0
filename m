Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A228B4E1
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748645840; cv=none; b=oTGezJMCMdBTsJ4YKEWrt6b+CedXKtzlr+3MVKKe3rkATkfJ3Lvb3YNZyJmmRXle00Qwx2We4Lvkqeoz3ECKbXNMYkJaTc949XuN7f8R8wKfK/1/zcIHvr4AeYay2RRnBj1rSr9MdcHDflrCn/Xp0o4SjhEkrbQVq+xee/EbQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748645840; c=relaxed/simple;
	bh=0rYnwnIKvNm0c3HgIujOwnxEWY1I8+r9DMa/HukZvuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPZdZlhZeUqGv10un+m/CA9PhP3D8K1FnA76/lbqe7kHNIwOoYku8qQdZ46wj79mf27HG3kIWSQ9otmFEwU6QsjPz7bDPfrMKdTbkJ2M92EGDg2dXmsnSX6pVxhoBidPUXVatxT0nURMDlzWOuUt7W2z1/P80sOpzflD6Ha3i7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHbDGDom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHbDGDom"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UMHN27013722
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 22:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQUQLSp8pLnLo2JOeAyxkurF8Gs60uAE9AElODkHawU=; b=JHbDGDomMYOz+9lc
	bGe5DVKWwuvuvrOOC8avb3SGZRkQUWmFdfNrwEFZdOh8vhKClpdMcpxjynr3+mf1
	VSfYNtrRzvWPrmbSwYhy3muGYTHuZQx2Sq29BkD9gylJ8lMADAUjQjsCMpzPdq5l
	492bVILA5MYZGS8pEVFjvdmmNWOTzKvNdIMcK4TqiowBNP5cWq3hJukh8Z1jpUNJ
	FULiI+Ww8tLKWlM38i6hCBJSwJDNA8u2WNTJgpiVTDAtWnoZzz8aTUWJdP57IozJ
	rCCo3Iddw9ZWOi2RqC/5P7aUKvGPGUnpJPIbLd2l35NZyqEPWReZs81PD8d8+joP
	d4hnaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm4m2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 22:57:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a43924a1bcso4013571cf.2
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 15:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748645835; x=1749250635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQUQLSp8pLnLo2JOeAyxkurF8Gs60uAE9AElODkHawU=;
        b=kP263sSrN8lEOypEarsbOpYArD3PQj0HzjhiDOSoaeFGXg0iFyTt2XgFQuf+kl7Lyh
         l6ll+kPmx5QI7m/f8fc71EmympEkKIAr0g1pbJYiEYivdksZdLNQ6UOEPZsRy1eKOyR9
         1EqKLCw36pSFBAxT1lDpXzhYxJHCmj4rVP/Ldaw5vRNP8wnvuQBfjudDSebOnyNq1dxj
         CBACd9EayzFGu9Y0pspNwcGumtdPycBQ3vdJTT1FxrtRxnMVyVyRGPS3r/Y4nbJb8js2
         bH3vQapsaaCLmXSuUPDcFk6q9YfEcOkbxJEQFRVaPGHW9XI26gigwRu77E2BCOQ8XN8Z
         ikAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQyF/bSms8sma0xox9xGk9FImTR/nLce5dOPltiZ/dKUzCqtTtHUTdwY7LxH4aoNUvHAqsKkA/O3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YybqaAzMjZR/3fRO5k3dImZSzGRSIrV/vQbgMbnrGsutNQeS0K7
	+laz6u4HItl+RnYn8cMyPwQzGlLGupvo8L3fAOqZ59kwkgrg9GiFccEc8EtBLF0fCI+AcTJ1GWO
	1Dqc/Tkm1nbCeK31rR6YjkkECjmZS59gHAMcyEaeR/Kwe6R+LJEGiEYqbqPRfRNo=
X-Gm-Gg: ASbGncuoE8KKzu8Q78JB9E5JheBhtNq8RLn4sRFjps0fzS1Qo6GV9tH0CiwjL8laVbz
	G41GXR6vyTcO2PUj8nV93jAcxJ9VxWYLWq5oFGXIIKOKFBa9kzF5ReHgIu9E07eSWKhOXx2uPiO
	Zsz04Woojb9OcaTPj6ruUwSB0SsCcxYc1Rem8OScTZnsswXhHgUphwvpk/msuBOiEnfFVof+xVr
	oKniXsFu8VQ5b68Ykn09lUGfoJ6DP6RraVVFogPTnE+YlLmHCEtkAtlyMy54vWQ6LMCPA8w6b/S
	SDWpr5BHXgyGPN8lKbe+2PDdIBdNlmpLrtJ9HsisTi81ORNTtegh94rCSyfKtyxE4T7LwONghSb
	E
X-Received: by 2002:ac8:5803:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a4431a0532mr24759811cf.12.1748645835423;
        Fri, 30 May 2025 15:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyHH/AeRi9HZArP4FkQ3X90OwCb53n/Q6G45zWYMJCs/FB6Sg2hE3vZ4Id8Zqhiwv9MGAlMg==
X-Received: by 2002:ac8:5803:0:b0:4a4:369e:6e54 with SMTP id d75a77b69052e-4a4431a0532mr24759651cf.12.1748645834917;
        Fri, 30 May 2025 15:57:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e74csm403329766b.51.2025.05.30.15.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 15:57:14 -0700 (PDT)
Message-ID: <a297d9b3-a82c-45c3-aa14-a20125af0a3f@oss.qualcomm.com>
Date: Sat, 31 May 2025 00:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-8-02303b3a582d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F2StJemoJH5zINNqgASW1spzSir00lJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNSBTYWx0ZWRfX63myHUCO3EkP
 CxCSmzwfzqqHn6a0NOAYIIcH+jiWerjoWrK0w5GEtz6rIjPmKjebKPZ2ddByzt9OFtWcAl6MYYC
 z605iWPG8iWYPE6I3w2rkv1DcNbKgOjGqHjWP/MSWc0KClhZV9h5HpCD8nGmBJ78uFRLjn2rZni
 r4QTLzdI9o6zXalM26sB9yFT36y0LuWTEUV9xoU5l1dOQ2R3arNJX96kib0aHVQrwOFd/o4vdbz
 WarHWB7TNJH+GxBaEmli2VoTyU9kBQQzM9Mtw9ldb4Jv4erOnQoMsB7SlN/N7xi+0y/WsAEl5u3
 ++h8VeEOBrBL/i/KvevqwMoV/CntY6idNjcPojlrK9AEsdWY5fSCE5ELTtvOMFI0cAEqLTGXoLB
 faISmXVirjjcj4cOgYb8pmmCMlwX0iAkyUL7/9T6ZqTCw0/SHBei+ckDUpVe1RH7slQeTOfx
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683a37cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=k8BryfKUEck1Tcg5KdkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: F2StJemoJH5zINNqgASW1spzSir00lJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300205

On 5/30/25 3:20 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
