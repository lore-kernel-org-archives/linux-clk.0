Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C02ED848
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892779; cv=none; b=QCILm5VXqk0V0vkT2xMDpGxDb4K25WaL6Nt0yh87tYxpy5xrWekpKXesY3pn8cdUk0e4ETMk6GjTta9Oip9Tt5XgaZtpfzckTdvFJNfGr3Au8+FKtzXefoWDZDzEyJnA5mbSZMGVQ15U8Skrg6Ufu//XAccHvxmnezsGbL6OSrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892779; c=relaxed/simple;
	bh=7LOkl42MOZQ0quhglrqHfwok4kY3GYiR6zb7RMj3UpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZVs21elHTEEWMG4i0uqhZNnx7M/qjdiPWsDgkCpEym8gfq4yHsnQDqqlv5sQzakPiqSob/TdJSuUbqbdUArjLkXiQtJFaoEm3V6iRorI2oHUweDlQn6FBjsM6+Zn+h/C3y3hv95JVJEfGWPzLwNX7JPWt3WsVHoVyGIPH2blSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWERFoRA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHRUxye3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWERFoRA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHRUxye3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAFmdj008904
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZGvX4oyk2EBMQUN/9Ti7n0R+ck/vVDWYJLmdabfyuQ=; b=DWERFoRAksaGi0a4
	OA0wMuzTeHMZkgDE8JXP/dsB4uq3GF8wMYW7mdlsDq5agy7/B1emRvVD+nXey8C0
	d7Mb3e1M7+Piwp+LyQK+CQ9lEgdwI6SM6FDgXabsw4wxFnUweIi9b56tgf6PeR1U
	4DGovUKPw/LZMAO73pRZPX1u3ShkCSfM72hR+jBkq/9sadh6N5DzRgz9asudsJ6V
	o8nGf9wz85Gw2NernP6wt+w2khu4Zgocjk0qHGXm1qDzRSMU+m13hwG88IT4Vav4
	/EGUVFWZtXi7Q+P9QLMI0S17HmsDNmLvKeq965iYST519AMqdQFJF7Kenjz++vVI
	wxNJzA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cy4829c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 10:39:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f5c90f07so30907506d6.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892776; x=1771497576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZGvX4oyk2EBMQUN/9Ti7n0R+ck/vVDWYJLmdabfyuQ=;
        b=XHRUxye3/j9SJ80A98ccs3EFFB0Xt4RYOyu+4wDB8+fbpJXs0hynOKd9AivJB/30Js
         TflfzQcO75HtwFlyoWgWAq8TmH3MDuyGQ95l7P5s2DcW0rvZC0vukI0LglZsDHSkL9Tz
         Uq2i0njXq1RwA+CtiELUvCvuJRl1fsc34Npc7PQEqLjOeu1xkJXDrPgtfybkqbt50o49
         Gy9h0hpPvWLEDPTFxTccbRSrdkzJZxUsKKZyOZkt5rtGzhtXodNgszt6Fye3ej/OZvMf
         9UYfPOMc1Cu8i63ugjBd8fIHxNFbnaDvE1FjW4tIVVjXoPY++ikB7vNC3dB4a1KUzWTo
         h//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892776; x=1771497576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZGvX4oyk2EBMQUN/9Ti7n0R+ck/vVDWYJLmdabfyuQ=;
        b=wCRQjWpPr5mI7pA/DQaszTaOJdo1TMs2QrVwh6841Uwnca2zHxIMN6LXddh11YUADJ
         0wniOTAuJGUR3f/hfJ+cIl0GS7UeybIp7EWHMQs+pu8LOEs4zwTI0UPMtrvr2S5gUylU
         0JvuFG3KetAETsTDQc8f1Dg1s3gm0+HjMDMQLdxunJ3otKxmw5797vRmqYPWY5j7l5Za
         oMvWRAwnyrOlQwoe+Y9mUMGGAWQxr+851m56rvVNUvVic+KUWRxN2zUdbBZsKMDwNbhd
         pcaYSAHkJTlI0RAIzPzIjbX3SQp8RlVj8lSblklndZs3BqOroI2oOK20+1dFuW8uX+d5
         SnRg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5tMCvm201SSKsp8rLVzulzqQJiGviBJIMAOA+aAfxcT1mjKfqYoMuyg2bWgRz+edBRT8ab5a5l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQkyrUwxWGlK7CBQlcGi7uqqHp13bHjwU7E8CoUWlf0k/koLr
	zOcNa8DvmBoCFU+XDbmdedEKjdMRXxsVwyPcKYH1JTnetDRK89KSt+HnkSbbMIlGaF6H+JhfW2R
	ZmaGl4nZSHPyiL1juE8V/zoaqHVefQmbVaHCy71+lW7rv7eY/0+j4rF4QV4b/DO8=
X-Gm-Gg: AZuq6aIG9QfyCcUC+x5E7QgWpQ88rNZCxzOTBd1HVYIFpgGc5vip3zZhRykTR5E+/yP
	07tNh9n50XwB1evmol00gLA1L9zveNkUlRwpqdeJ9tq214n1Vvgqdgx9AuidxTNVm6oWmbYerEL
	HqQs/XKFKvBeTw7Iu2MCYyIP8L/sdciJPlQl4RFn/PduAY+9F757RtE+1eNGqcCIVjcmtVbltWy
	1oOOIFsU3i4XriaqzjAvrPZ4Cw4zqFmK4tfaUgcQk6lORQnI7q2Z1qPzz78xnQIp9fhRvJZC85q
	034tZRn/FbcO9scZork/0Gd6RMp0IUn5jKOHtLg+VHM80Tq38/S2JnFTQ+Q7hs1rxUJ753Yx6a2
	LW758OBbEIoH5Juqk16ypC2Ich3OXfTMVMJntMpuvJ3njfGD4Zw+X9hibjkiVZIvUI2BjZxI0Lh
	HunLU=
X-Received: by 2002:a05:6214:6105:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-89727999b22mr24108436d6.5.1770892776423;
        Thu, 12 Feb 2026 02:39:36 -0800 (PST)
X-Received: by 2002:a05:6214:6105:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-89727999b22mr24108266d6.5.1770892775976;
        Thu, 12 Feb 2026 02:39:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf45bc8sm1618165a12.26.2026.02.12.02.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:39:34 -0800 (PST)
Message-ID: <ee24a8c5-c659-46d3-a043-1c681a2245fd@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MXoG3D1H_H-uvqL0rx3GCFIHC_qKSFtY
X-Proofpoint-GUID: MXoG3D1H_H-uvqL0rx3GCFIHC_qKSFtY
X-Authority-Analysis: v=2.4 cv=XvX3+FF9 c=1 sm=1 tr=0 ts=698dade8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ly4eFjZ7uZWBmfg-hx0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OSBTYWx0ZWRfX3zEYIh6rAs3S
 DuMkPwLh+R07g1oWi9msUvojU0VEaXM2br9HrsRTBEx+GDzi6/dFDhUrFjQW3qzfouRXd1cR4z9
 Y1d+Ld5hN1og/rOrCvePhO85DT41gAJ/sz1acyoWr4XDSm9Gj6WRYskQOoXHHiZeKOJHykoXtgt
 n1dnjKYH5dmdSJERi+qlSxkelvqvfyOYhkUoRE6oDOnmsYyVlDJ63nyUrVjF7atBZkOQEZfBh4N
 NFAyUmLdnCe8GmH6HwXsl719GGu5LtqO138/fIR4BWkYR2vnMexoKyIR0B4X/DZHdZOSlIDj8+2
 OXptBDWe7ww/ecKEfVAqDRzr7zXTWFFeYBw1uROT3HWss5fVrWpN6xkISHTbh3FFzdfJPPSldyk
 E9AUy/agM7qSU0ZjjSkzNWEPKRY0gaou6kZfCfrPbrAPM/3Us5eYJs00G/C3XVTeN9reOozfcA5
 njsYonATsamhlK7xoNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120079

On 2/11/26 7:22 PM, Taniya Das wrote:
> The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
> Update the divider value to generate the correct output frequency.
> 
> Fixes: 874bc7be1e08 ("clk: qcom: rpmh: Add support for X1E80100 rpmh clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
