Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDC313E0C
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588984; cv=none; b=BRu2TpgXWqQ4c2RXEgqofUoGFL5La+P4PaH3jxrMnR82nQhIRGqLYjSk5CsM1hc0M7A97D/oE6MFF2Mnlr8KEaSxwZj0yLHkWh0hChPNwyfygeoo3vAokbamVRWSbTaHsMDGLSgerza/pmIk9qYTKLzKi3FOUNm9vQjIWjwfX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588984; c=relaxed/simple;
	bh=Uo9MRC2uhRSlB445pvUfFKuzstkfIB8Hv3SSvMmY2mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYyGTJaPl3n2muRXvtCi4LvatoHlmDVL6/0ojNg6b/OOMeDhvYsRULHqpb93OVXbOZ+jZ0sQeG+VLLOFE4j0cE6IK5kNmqRy9I8mYfdL8COOrYCZOxr0aYvQl5sfHzF3QJ5Ep3lGHxQ8LX7Ru2qtxpWceG72P/KG8k4ijdAtls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoBeEhRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoBeEhRP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAGgOl002518
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qKSLFOaPD6IekNwgo5GkneMo5MC94YTBjYm9amO9S0=; b=WoBeEhRPJ7mVa2QE
	9EZbbIb8hlV9Uev33LHWbzRttDKoLTZQD0/wiGGZv3lIlTUxomMBOSRye1AeJSnj
	w6mut+J6w7ofDpYvOFatg62moz9p0b489fTFiYVeYRhmt7I9yGA7ffTJpQ5oWee7
	eOrCXb43hZyUFGJnFWgVWT9BnRCtbV31HIIxNUT87BlWdePyGSgd08oX88JSHOwy
	hiLVTyUTbyli38VXvrqv56gX5rk5/lJUTYeYAifW995EQOtlGE8/Y0MS5/AoI/5t
	ZPMlVFzQBPwh6VgHVST0/4Cdw1C3KSQzDXP0C0nxrrRrLgISQBWJP0M41vlGMruf
	ES1jMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8qdr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24e04a4f706so7212645ad.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588980; x=1758193780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qKSLFOaPD6IekNwgo5GkneMo5MC94YTBjYm9amO9S0=;
        b=q8c9y7nwIW08lOwUAMhNhC4RwMzO9jONVrrUd5cN2liTKgCDxkE8sELVB+azVNU7nA
         ZvLSTo9cBHpCssbAx31gXlhA6wFoW0tfkR3RMxfiqkP/RDN5fLah1iQtkJnQa40C1vxG
         RIUDKZKTYlKi3mQXsL5ENydCBvQ24EICfGpAz/ZvRwqXbeDFqqwW1FTBurdLXYNEoyRm
         N6f/zS2JdmrZaEqHnptXhU6dx3x2mvsiKwW6NzJWe8Bc+lRYfeh4JHAkyaeYgsPn5gGw
         kRSi6T1oaH2vgjXMilb05ZJezBsR6MF5PnUlT745AyzgB435cRchB2xbh0VCqBSMPF90
         rYvw==
X-Forwarded-Encrypted: i=1; AJvYcCVboq1qAC00chGFFJlulQHjrh8+XDaLMy26BWQoRtjgIo8sfXemsj7BHrrgsJEtNiuaxJpTLwSwonA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyncYCgVMoRbG8DmtfLzbmCm3GDkVKBK4wsjdn/8T5BoA60y3Qg
	V+iAOBUl7FSE5z56hkbK+siRDZm85yVPAPXZf6NOPUMIYcED9IBEdbsBQa1VVGqksi2z2oYM6tu
	TlsCoQyCeTpAmcDXfRPCoGAEMk4DJoSlrrPP7R4ObWb14/MY1ha2MYxpagIvWTkfdvNPlWA4=
X-Gm-Gg: ASbGncuCgMgHtQ5XZgefthot/G+VCfTwVu7tJUhp/AAKMukpqOx0/gnIvw3wmvBj/iu
	y5oKrLSAi83XASwa2tQltaU4ZoQ6lZYUWgyqjqCBziRSeevYF5DK9jvRxBznNgDDpq+uB7O9G8d
	2cKC9AdsoVCnwSUwa3+mwaMH8XjgUs89HY+yEKk0KLt7FKcZeyeFkl/bEqIZkPlqldgeXJSu+ME
	0YMe6khgIBOsfhaHXO1H0O3AXZSLPVx9YF+fV8CvU2Fjv8TWygWCiwCbiGNv+3KtFdB7Q4A9i6/
	YHfWeWXWZmvBMU3oSs5s1OAwEG/S/RFY/tl5B8czoe+j8r8n0VauSyzJHmLhe9flyW2ob98=
X-Received: by 2002:a17:902:e5c2:b0:246:a56e:b155 with SMTP id d9443c01a7336-2516dce95e5mr225335115ad.22.1757588979898;
        Thu, 11 Sep 2025 04:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9eJ3yITwO8C0hGw9odVhehhJ4oqiaBxhaGW2Kn+yhcHGb4FwyIllb4YhuRN3w5QjAMjLOeg==
X-Received: by 2002:a17:902:e5c2:b0:246:a56e:b155 with SMTP id d9443c01a7336-2516dce95e5mr225334875ad.22.1757588979412;
        Thu, 11 Sep 2025 04:09:39 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6d14sm16305935ad.9.2025.09.11.04.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:39 -0700 (PDT)
Message-ID: <c672f085-2e7f-4012-8090-6d360f68a7cc@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power
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
 <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXwrCBuXS+uZdn
 m/684bhggiRzF7Z3AyV7C0Cr7jq6uSyfOjRoHbuRTPtg4mqM0yZCTqRr2ActAOWAaEJe6bq2tOf
 O7fM64RDXWieC0hNXCH/xpDCWhr3CKs5TMncaJSfhriuNsAEjeVCkMAccMGVHmPJWoERtmwi6Dg
 jCrBfXIjFXU9zRJRpgYVt9EHmRxsATzvE8qIQZCgNXvjUu1Ho3FramXPYq3cE+aUJUzEQ8PzUeb
 8OH+diQOefhrQ7387sD2D+zVVJYmcSLw+RqfyXc5Isy6CAG3MC1WcEL2WBRf/GM1QCc/vzEBqra
 8jezOOQulDfo8mRoIKQ/dy2kzl9LM2iKkMgt6WtjFMs7EynHvFocClapG1jcTHQU/9KxbxqQsWU
 w3ikAstq
X-Proofpoint-ORIG-GUID: 5PTlV-XpleQFQV8Z3qsgTjXyZ9KiDTJO
X-Proofpoint-GUID: 5PTlV-XpleQFQV8Z3qsgTjXyZ9KiDTJO
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2adf5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8250 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8250.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
