Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6B218AD1
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323737; cv=none; b=NCid27TF7jwpz6En0Pbi84FeD6LuzvK4FPe/aixWkIJdIjTFReJ4b26xjVN9HEK0UaM4Myx+k8tfpQaf/mw078C916mIWA0OmIYUCXBYWyM5kiMCOw4TtQtkVpXkk7oom7wXLOL0CC9nRppzPn7c179j5mRBrtcOIvaWx9Ms6HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323737; c=relaxed/simple;
	bh=HuDMhaU0RATL/TD57a38UuSJoa/rxM9NgiPso9Ov6Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8YqF9fx2ox8UAiXqRL3kNYj1ABThK9Bn/KGicJJFm0M7nwxAA/onxe+0Fs4Nmmiu+QC5jt1S0aAvGOkDevf2GRk9TdarY0nKewiuY5virw52234/e2mk7GwZaKwpEBan/u7jpFkAmScRoNd0jpkTTpDn81O7nbXgdqjOHEoH+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWa4vlyv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWa4vlyv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBr0016659
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhRouZS0uvAg73VXrnNZeOxAr2zt9QiKx0m+FD9Zv8w=; b=lWa4vlyvnSPQQmqa
	7j46ZEv/0SyU1wEOkQQiNsDI4q9s+OiavzmxmsyMvL2eDdvAGc43N4JC55229SRe
	47117yV5PyO7xGUtWIyseVTVXCFo5FWruiZA3Qm9ZZBvp2Kf/yKqnGdgDV5ZFsed
	8gkkodiRVqBwcJhLHfH1JW/ldydFhRyYFDQF5PlYrNJojQQDNhm0S4RHi90HVF7+
	qEOtG/+8jXxc2FMAmp5FiUQzIURlKn/+gpHOWM5IfMMoFOmTLIbsVl2Hqdcw3SQ+
	mxf0p3dgVJnsCqOpZ9yhqeZHUdmXb/Hv2N1OInQMRatyuBChYvrileBjq0WqMBHz
	pvzj2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmptaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f899c646afso3526376d6.2
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323734; x=1747928534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhRouZS0uvAg73VXrnNZeOxAr2zt9QiKx0m+FD9Zv8w=;
        b=LWXov6uw5btPWE6vV4wqVwEgIhRt3fBNrKmhnJTwRFbeg/btzhM8TXBQtUQOjSLKEc
         eYigTc4uIiQdYxnywhhT6xDBZY4bT2Qw8rx3aL5g1jG6kK2L2NftflzjGE3UUYBG0LiQ
         TBpmNw4WuMz7xhsUM2F2b9g8ehheFY6XmUF9eadB4TznwDhfjHGymRnk4YXlfwYRL0a5
         8QnLj+6aQcMsS7KTCGp4oAaPrGt82wrtj9EvlWdUM0oob/78Rt0yfUfZCudbA3hDu2Sf
         z0VjbIuaez6wEjUOpcK2qQK+Irod7M8twm5p3PVSwuDzHIhyr2aXWxzPOCjpCy3KmGsq
         w0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2m5KhEDZN3BnQNP16AnefYk8r4pVSX17MCRl09ko0SZqw4ppgVVEmIPLv4vO4AQzLe1wUnsxBnM4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bOsh+0f7cxbseaBOvR6w1bSXQVC26duKWSR6lUu2I8pzJR0Y
	4rD7QT6J2Ssucrg7oBmoGwB8v64KntNu0Q28bBzabIRrqqfYMBSk9RrWWltRepsoiRy8aPvK6Fp
	RXT4DOnmNbbj4wV7T8p0N8c4Qt4dqSTqWCtjmLekHCUsVwwAHzDfef2KBH+g/AXQ=
X-Gm-Gg: ASbGncvcKBQP2dAyoD7n+HZQ/P3QEY82ICXJDriD5MlGuA1gjRWCl+EzW7LXu4tE7xC
	nYSdTNMcmth+mgGEkaslJJJK4BL/tiUVIiLsVMaUTzcPUgN7zrgFzmqij+u1taxA2vX7w/lttUi
	UcJT6wfDxYkMbIPLbUvKMGz+h8QnLSOLHG/jH02vyvUzJ8mD31SSvG4NW7MmmyM+Sfna7OLjaz3
	KMqnu1KFEB4El6YogAutOTKDllYg+rj7O96Ax4vQPk8r3bPAiz/jBpglXZOUW9PkETvjoR2Smv+
	r0PnZH188zRet/X5lIzXAuyPLkhLdE+DWN3h6D/lpMhg3/ou6iO/odYjY3c55mOOLQ==
X-Received: by 2002:ad4:5c6b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f8b06f0c57mr1592216d6.0.1747323733806;
        Thu, 15 May 2025 08:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfvUSwb5Jv+bvNmLGRlaYTg/YTUTg0whxG7ImoPz57t5jBTuwWR5hdCmSnWAgzP4lkq4fbRg==
X-Received: by 2002:ad4:5c6b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f8b06f0c57mr1591996d6.0.1747323733310;
        Thu, 15 May 2025 08:42:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d442069sm5528366b.103.2025.05.15.08.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:12 -0700 (PDT)
Message-ID: <62964e6f-3b09-427c-a71e-58aab3e22e42@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX4j/k1yiZ38t7
 xuQdiS3n55X8xfUUEDlBW10VR4j1uEgsPpbesZ0rpLY80eTt1lk5ixDsZOUsGLOX3pIplUeWZcu
 ZRlqcJe/nsgdwZdJUsr3tmNMqlDv/3o9TFO+pkEYnU02BxC0Q0ie3p7UHa897EzQjLtMsCfrflR
 Q3qqWamXC0DTk0OIZVoxZZu4aiwDZmFqZ4f+8uWLqSe79kgnRkeHrO6w8L6W4HqHhn1+3u7QQap
 RE0N7kVpm2NPNBRSvdWBtkQP0mMRfr0GuVRpewCT38ffkC4P5h8pFrhwJdFL7SDHx+hzMcef3W1
 1oeAg2k/uix+Cpk9wm8mqkuCIdEXMTx+/5Tvt7fav+Pc47W540y+xRW3PM98Ttkyxn2NPhBSo7K
 gip8jmTlw+VID0hOYc7j70OpqpA/kONnwiG0VRKQ82KFL9efm5zoPmk62KO/WV92PFxo5qry
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68260b57 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=R-MJ-YjwOO2PQHfhffwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: K3M9s3qiCRo0w0fR9I44fzP5kbKwbUEL
X-Proofpoint-ORIG-GUID: K3M9s3qiCRo0w0fR9I44fzP5kbKwbUEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
