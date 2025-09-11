Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33603164A0
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588990; cv=none; b=mAY4NBI9oTZzQazRij8IMsQUVD74FK2HZfBrpgClm28Wgw1s31y0f1RyZV1FA9xL3b3ETTPwxwFUFbFp3dgch+alyzx0qML+AdNhcl9bpNa4txTa+rzVEI+JtzGiAw+3XmPdMFTNBXW6Sc/OV2P3PLsbrl29LPdZjaoigcx2ALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588990; c=relaxed/simple;
	bh=0/1J8knevAynRtTLzFueZcZTN2x87PcDFIMCgIOQIoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C59uVArUGIDiMQPE58eltoZRN/KOjcL4MXMnKXC1YO4SSlfKB+uaP53u77PAZDkUyf9xa868JFyXhYHfWbw2np3rCodUj1cYZUn6WQJX7VQzWyW14ww4kzkagoeeQrN43B4lHlSUri58z4t7/znvlghNsl5z5ytLc/v4agODZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULTWsvUe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULTWsvUe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB3Yeb006943
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/eOV4Q3LLMIbj52JEQS5sHO3Ll4Cp1wH3qVKllN8Hc=; b=ULTWsvUeklBPcv1Z
	6sFM58wjhrVNU7Ta32QSjgahkwxI+PAsPXDRRt/FyOl9PC8RcX9dkfiR3B0le7r5
	PwMCxkLjjdNDgjL0PA7B+97hbbmb/qoSHds49FNDooOMNd9HXTPgonsOiXA92fS8
	9ONakanS+D381JIW+1rZ3HYNNw9ZDG0WzV4HEcWAt/of53wSIa/w9IzVDWUX3Vda
	8gUcccnTKl5FTQ/4my8M1Bqge2sTrHkn0DjNqHLkQcQUgM63MduksP4p5Dea87Np
	0hi/GzJQCNkP2mq42KZZSKn8YxIA2Tw7VjxH5lLnP57QIv1YYd7MkqV/n+87GW4L
	mX7Z1A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8afb1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4dfb96c99dso467325a12.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588987; x=1758193787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/eOV4Q3LLMIbj52JEQS5sHO3Ll4Cp1wH3qVKllN8Hc=;
        b=Egc2JhZBj4kQ+SGDX5+6NZVyc6Tu58I0xwj9ulp6VhxxXACh4KVVl5qM9clpA/WJzC
         9iefwV3hhxL8VScgQ9bAA9qJVHEyOhCtKlHhI3+Jix/pirDo09zUA+v1aZ9cmPD7dXJ3
         w4as6KLrh/QD3/tOrfgAg+xoZuR6qSGxzCntMETr2k9mIS+HUbQ5oy7dxrb8GXnuj1Os
         QFCHTdOaFqxNy5MUEMZF4JNP4A1sIfhzoE4BOQxHOg+P+pWqNxdrbyMwJarjlzl4vTHt
         RZGk1oYE7+HU6pE+jI7Cr+VSwpdGaDtgAOrtz5IZuoiVLF5GKhehTnJgk5QV5kDv+rr9
         aXzA==
X-Forwarded-Encrypted: i=1; AJvYcCUxGkkdZeByphEtZno57ZWIGze23f5J1d0RrYDPTTmW81tsuIesj+FHND/NHHb7P4J+it5V7IKVHq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYHRW7ZcIlB1GU1hviFC7wz2bahwYcuudbgmxQvN+OhsA/aLi6
	6GkgyQwgOgHE94dKF5SmQETW4hBJlDZJF3HlVPhM7EfGoNkyi9k9ySCTSCWpx9XtteLLiIlC2sp
	eGlIOenq0IryJI0sbuNX3nI2NOOPsJKocJCvVzjcN8DSx6zR/bkmxMzxys4BRZkw=
X-Gm-Gg: ASbGncsNIKTC1/heA9/KOctE2WImAHjsiQ1D1+joEntiHFM/clGCFe7yiY/8Ryc8U82
	Nhg9nw7thK6fcH4IQQPb/YGZ6+1Xz7rxKM8uG10uZqJqzKFuHwkuh7MrMYl6r2YfvGqad8qsl1v
	aHo6NSb1k3Vx8mGRevU8o3qeKkTazQ/gKoYxUyrZh0TaCO1WUQfC7917FN03jJvB/FVCE1zbCrA
	3HZjtgkhlHD1s2KSB8PeP36ztd9Mikvq1yrG9HG/LEl3yTZ4jmyw28oYGxYR5EpvUwSwagtyeCD
	69Skk+IMGAzpTEYfNPbbplsyRsv7UPMHc7N/gvMSrbT7WvutkYabLq+98qypu+F20jZ963Q=
X-Received: by 2002:a17:903:32ca:b0:24e:6362:8ca5 with SMTP id d9443c01a7336-2516e88795fmr234910975ad.17.1757588987307;
        Thu, 11 Sep 2025 04:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUux29/wn3H5Xn2R8UB4E8/j+m8F1DaJ2P1mVSFqddPWnghx8YC7nsKPAyBp5WbsvJpoo4XQ==
X-Received: by 2002:a17:903:32ca:b0:24e:6362:8ca5 with SMTP id d9443c01a7336-2516e88795fmr234910735ad.17.1757588986872;
        Thu, 11 Sep 2025 04:09:46 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6d14sm16305935ad.9.2025.09.11.04.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:46 -0700 (PDT)
Message-ID: <e2cbf433-f2d8-4eb8-a4a5-d065e4bcacd9@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2adfc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WxAQuOTNPmDzV2JyvVtNJTXKK4qEdnF1
X-Proofpoint-ORIG-GUID: WxAQuOTNPmDzV2JyvVtNJTXKK4qEdnF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX6trHQPtaoyeZ
 QAM3ePxjck131ADZcHcw45aDf8yXZMVmvv+6pq8Oogj1KfmFvqA7GeWQXLmYd2tF+Lphusb5zAf
 YVAvmLybFB0TwLt2D8jrJX58YZvEMlltK0Sy++7MQrVVYQ2pzXCGbgimpIZ3yxifYneccO6eeCp
 Qdnl6Qai35TYnjJuqB6ruKrDXtVHU+6YRiDvRiTwmr0SjRWj+EXVwqQXBeFTfKgSPHFSyyRpEgB
 9R580BLVgrUIf8p9AZtMCWJEPMQxjRT+lwJXBr4xtGY+TaqI5cebPhs+uuoMbaqaHDXlRFfJEMG
 WIvpvrSGTmBTIdHH2X/MAa89cGxff4RPC/O5xrFUfBKdEpm0KYWmBynlKzkpXxBh//8q18BUOSq
 lSo4N5dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SD8450 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8450.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
