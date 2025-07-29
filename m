Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8960228B3EE
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786178; cv=none; b=dAZ6I9gruf9USfQd5+jU7dDEGFp1jLRbas3L9AYAAf6pVs33u3HuUJgpUNJAecgaQGJ7H99gIecTedU+cKFcUHGoz54R3m+k2YWsUkRyBzzjoMRk9iYIPLmsJvhurkbt8c0/jdyG2NnNZA3c6BFJIp0Peo/cbgJ8c92v6Uh65c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786178; c=relaxed/simple;
	bh=3NjEr949klcb1iGBUHCvKsBaHUyDI+r7RHxECamMvxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWXaBNKcu3Cmq+wdSGab7CQFFH9H4uAdkWGlXbWOQacJyVKVtMdlNxoJoEqS6T+Ga8Y9U2ftli6qNLQTIVHbYj3HDPXK+s5fO7bOZl8Fm/iJqmkb0p8L4yWl7Q2alrOCwi78ZT/cgtlCw+/ghAw3C+KC7YU3YvINWdCvf1jhBQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etLanObY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etLanObY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8W71o031307
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkaxQrVa3W0fxICjBisBL0T34FtsYWW4gH/vbW0r5IY=; b=etLanObYoN0FHF8M
	tCb6Wi/II1hgH+MP0T91I2lskdN7C3WRuvs8y4I/j/0XOzKB4At76gt93SjLtmpA
	VsN32ukeBKHu31t3XOcnj0YlEtB2PUlAnY/pK0hksYvYnMvs5OS+EBuQPyDOdI/C
	crN7ftqP1PM2DsvE5dmNNjQgz3hxyYhq3Ro9XvtdKQ0ltl5cx2+qEIRSufrKqKLK
	uPHtRkxjUq/ki36QlFF7tyKEZ9N5Yseqq5WYGcmHysgvZaOqp/N+G3x4nE4FuOVj
	pdiDPEvAshnNX+GHUpt5m/UmNt7w1c7lbYVH7TEqJVB+U0S90fSc4KnEd02LsWo0
	vOI/+A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xd65x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7070423f741so3660206d6.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786175; x=1754390975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkaxQrVa3W0fxICjBisBL0T34FtsYWW4gH/vbW0r5IY=;
        b=aW+Rv/hZHGSn68CiaKXEALS/oyvh4KJ8c7I05WDTDyUfguzabMK7fAoFCzCrpJHwU4
         7D+KDBpp2WEo/qk6VSug8lh1lHY+iawL1z2l3rwuPJxY38AywUMloUJS9sSBOlPlb3JD
         FE/VqRYb8jeB+6QKbJgNB09dG2PWNYo3oh6n0i9IC6SZm+7JLfbKiCE9Ff+43n+k2zVG
         HtZfoS9V00Ch1Nx7C0c/3r3BM9u0pZHk41/4bjtlo5oExFlogIlDfKgddJRccyY77aJW
         0n1Onir+627qUcfClSe13Iqxnpr2SOJvZ0GQXbJfBphrOjeLQt7rt83PBC6VUlEOvtk7
         /16g==
X-Forwarded-Encrypted: i=1; AJvYcCU5Iny1dtHbYXkkiDKCdcXvXrd3klwjNfWPqAdPvsTtKBtGlFBMw+5IPDD8PqYL4dY7VHR3KzXki3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlD2FmpEIckduh4HFmor+bu5TkqsM/22zcdiwI17NK93FEQqk
	ZLdIkHTjZEvhvJ3CP6w/spKfqZRSXIwqc2kJ08UETlkf/G39HK5n7+3p4oYB/YItDY1b1aUn3eT
	2CE8VWC/Hw/6OmjCnzVSO3sjrheLVIHZhAr3elTd0wphys46cdt9kUJ4+LJOJIig=
X-Gm-Gg: ASbGncunebOzToXrtEOF0MKscphOVTCwqUqXyEOxaedZ43fwIVXeIMvzOcllF0EDimO
	yVYLl9ez8qRf/Zerz1U+OZMSnSpULu1z3zvkS4wwOLggeLTXKyQjWxyGqkpQwpXaEH2O2zy/RP9
	QqJTbJKOZ6LXGllybMnp9im4v/koccYHVc2qSRaNXFuvAZfBPXJ/6x0WJXsW+gFBienk4ZVM4Df
	ep27kJ7FQsyrJVOk4xXXzcCa6/Mhi0NIfos1CC6LbmnqqLftFIwnfk0+uOmRWSsr1IMIXVXa99G
	F5GCMbt06ckNPdPfuTm/JlHuPcupDOEkMesI3Fq5MO4bkKLkC/Zj8bjZRfhyLzD34gs1Uuqb72G
	Xx3CNIKoWS5eiMefBPQ==
X-Received: by 2002:a05:6214:4a51:b0:707:4020:8631 with SMTP id 6a1803df08f44-7074020c508mr39353656d6.5.1753786175196;
        Tue, 29 Jul 2025 03:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET3lprW3Hl+UblfFO22E57srKZN9s6YGNunKASndnP8ZoduMXNySxnL5z0zpm6nnnqWds75w==
X-Received: by 2002:a05:6214:4a51:b0:707:4020:8631 with SMTP id 6a1803df08f44-7074020c508mr39353486d6.5.1753786174855;
        Tue, 29 Jul 2025 03:49:34 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635accc38sm560388766b.114.2025.07.29.03.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:49:33 -0700 (PDT)
Message-ID: <8b30c83f-5f35-49d5-9c37-4002addf519a@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 12:49:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
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
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
 <25uelsjuw4xxfopvfn4wvlj2zgivwbjprm74if5ddwvht4ibfz@yctc2kvfmxyw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <25uelsjuw4xxfopvfn4wvlj2zgivwbjprm74if5ddwvht4ibfz@yctc2kvfmxyw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4MiBTYWx0ZWRfX277JBkED8eko
 afJtJpVPI9GeXAjCmLM3GWFcXRpZ1Rh+qTSLkP2IkPM9CSIj1WCn6c+MJOVzQev/selSBkOI6Uo
 DTKUM2Y0TiTgBNWGXnEI+3gJiLe6DyhD3hnnFEKC1G1Ye/MQtA8Fq/V13lnc/UIU2E/MifRdrif
 RaTHF2zfJ+OdB7lC8+rxbo//nKS8ivKADM9nc5FJxY3JlZz3oU8NgWwUh1EuPV3w/o7rV/fjtp/
 RfBaAZRUbIffMCvmVblFyoj8vLS1LFefKkUZB8ZvKr5VjFRNzUNlk+DOUi/MRPiVUaROqWVgMn1
 1/3m3PxkYxyq+t0yRbxxykZkVEwI38Fu7SQRe8oMMV9hy3+NKFWnLYz9/Ta1aaid87ap6tqeDoT
 CaicaDqhwcLLp2dLlTVuAGMy68kgTN2sQi0pdMOXjtdjFT0Lsgjgk5GbrMkhKskNB2uFDAcK
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6888a740 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=N_I0jeO3kqKEb7emQd8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: o9v0SxZqLhcOqOMTCZufzPcil5pbeq_z
X-Proofpoint-GUID: o9v0SxZqLhcOqOMTCZufzPcil5pbeq_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290082

On 7/29/25 12:48 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 11:12:41AM +0530, Taniya Das wrote:
>> Add support for Global clock controller for Glymur platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig      |    9 +
>>  drivers/clk/qcom/Makefile     |    1 +
>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 8633 insertions(+)
>>
>> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	int ret;
>> +
>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +				       ARRAY_SIZE(gcc_dfs_clocks));
> 
> Why are you doing this manually instead of using
> qcom_cc_driver_data.dfs_rcgs ?

I guess that has been merged last week or so, so yeah, please rebase

Konrad
