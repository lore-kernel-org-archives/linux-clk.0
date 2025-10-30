Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE0313E22
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815828; cv=none; b=O8eYHmero9+Lg1vfh6I1LLR8KAcAcXKTNgsky5SxY2AixJKQcfaImX4exWTPnN+PdWKKvP4m6FJmnaTXgTyGzarCG/n3jiQAGBUQRvP9Zs6ryQtQJrYmt583+D1eLYLAkJTVxNt0eXnB4kqC6jk3/Q9qMVW/GtOZTTqndycVCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815828; c=relaxed/simple;
	bh=B6ER36m7Iv0Bd6NkigQuIXl1EBA+qHiW6lMI6ZMVbVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvEnm8hEOEnM/X6bLx8QqPa18gcXBclMbYrVe2PMd0MVSE/8net21yIPFkWxAhns2gmXfd8uPzWhv9FWTJMGfntGPjWe612ozDwy7LxRu9q2I8Y6N/1WCIaYiskstOmoj9QeS8c0emcVvioJkLIcfQEvgVBrZ4Ta2wbTcct7lDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOc7cwYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdvJOZR8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOc7cwYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdvJOZR8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7bYds1655009
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 09:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wjg1/j1eaIn0ChUOMAcpTE5peaMAgfC7A+tzK3TiVOA=; b=fOc7cwYGWbchEP3+
	dc9j6A4aqjC1n1Ltx36/UxLjloB2Je05qikLFspDdVpszGTXlpBGQ1DavO/AxVUu
	Rz6aOTcgDR7YSspOPDoWNpqWL2UZ5NjsO+e1+ASdVrDhKOGvEtsKonL9PxDPdAMf
	zVYR8LUwqCOTl0MXQGw3Mky9glOrqiIRL32S1uQ1zZh1EP5Vw0oUr96mrYU+4hbo
	hyeNn8aO218zHDT1AFLfYVRwPdmOUY1K8Xg+rBDCD5gmibLrqoPMm5nza4ZQM6tE
	Ky0MFAvPuzHlebpExdtdOStMMNarHdwKvYEjf4xjYsmqWco/mT7w7E4pYrsdSNZa
	GTwH5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptsrdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 09:17:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8b86d977fso2486811cf.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761815825; x=1762420625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wjg1/j1eaIn0ChUOMAcpTE5peaMAgfC7A+tzK3TiVOA=;
        b=ZdvJOZR8glrYYaf8sb6c5+9FnSEEfp6lfH8x1LXmktmaDlYS84Ac1NLHs6pa0kXNuH
         5O4c7nM2FRFRjHtYW4g30lLPs7ykmp0q5qyE9urAZDvQHvXUYw0GAxr8QPypePrD+oSN
         CkLrFUJT7B/mZDO8K/kuw4pN+09kUz3nMD62J8MUJe/rwWejv20KOOIQfqgvOXwfC5xC
         Xtk1tB3GXdNmkieosNWwk0KeG3NDr8tlv4P5/LQXfJBxueXVvEhqOjpLPTOsvqffr0oA
         7+zNaBu4DIKurULlO8XGUaWisbJI3vIyoJYGhZn++RlsAoOPwFrGot1ySqI/0FTCOokh
         p1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815825; x=1762420625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wjg1/j1eaIn0ChUOMAcpTE5peaMAgfC7A+tzK3TiVOA=;
        b=FSJyLXFCHlhm1wNWTZ71zmp3sAqi+Tam4jwyTbA/kQP2UoHUnRtBqlvWXuJ9GbQ4ia
         SmHshACfI64ifkoRU9CQ0KD7qcvxWptotspespOhA7U2euRyZoC3jAsp5o8w9vQednSe
         lnW+A0JOwCnKvSQiFvwQsyzly7CEh71tBrbl1EW3uG9i5AZWXrEUXBB3EczAvMsVSCAb
         cyNAFhQ0dRUaBXuGtpXvShK9OWk48kpeTnAtq9sRfoFNJKdDz9hsosFLAar6e93zEK+J
         BWoelU/cjmwJE4sscFdYZvbLcX+fIHxoyz+UDbWXqhX0Yu8zQrIRVa/v9BzdhxylX86I
         tfYA==
X-Forwarded-Encrypted: i=1; AJvYcCVSg4bgWBQmb9/npImbPS/pdzagOZ4t1NI7AlHU3HrZMHrFgyRIlI6gRR2xGWbeF4nDksp6pSDYL18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH7O8fOCPwPVNCMf6HX/lWR5aDUx0bOQeYXn2ZsyDmPTD0/zhS
	JVXHA5kdPYqHvcUGAT9vp9KgHfdtSLeRWsIYnw1aqHMBbv97+a1Hmxc7EDH8hnGsVNbjktIgb9b
	pfKkWsbNdFJ2PNU+9Lh76LQ3vSWFkRy8sDO4AvYAkS/QXruigo/DJQR4e7IU5JgQ=
X-Gm-Gg: ASbGncvwJtnOKqVr/eypM+t5eGMbXDcAKB9aN2+qjYPcQTqZDv1x2qRaRoUo2WIn97h
	WpKHl5GK8C9upsK9nWaHFNPWKiyy64WNbVuiLP0nwuKP52S2aGOxCoy1bDRJs/dsAdfUUiacKkn
	FSrrdS/62U098H3zjxBIC8R/D8Te9XTKhs0MZQA9FcqjHm3nyjhSK8Ze0lX0Mcqzc5EFT+Nv7Z0
	OJSp+svF9ontdIluFeHQCykqrDXdzeO9O0MBuygm+esoBcA2kccaNiy5+y5LpEcHMXiSM6l210c
	2N8PMVlNYxMIHyawY+8K830rZgrWpnavb8aux6IVertNykNYWN4KX6AZ+k7WXC2TkPm6re5Yfim
	hUSbOU8L3QBhTDmayg2PD8qZfUhoOf1ErrUsWfQUp8k1T0vwbmaHmwaI4
X-Received: by 2002:a05:622a:1911:b0:4ec:9b98:7dca with SMTP id d75a77b69052e-4ed15c3228cmr53519951cf.12.1761815824868;
        Thu, 30 Oct 2025 02:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBY5bJcBdjoLKiu4VhBE0Nq2T68hoCiUIh6ldHo/x4Js0PebzZ+30OGsg7Lfh1G10OjaHw5Q==
X-Received: by 2002:a05:622a:1911:b0:4ec:9b98:7dca with SMTP id d75a77b69052e-4ed15c3228cmr53519851cf.12.1761815824355;
        Thu, 30 Oct 2025 02:17:04 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm1722207166b.45.2025.10.30.02.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:17:03 -0700 (PDT)
Message-ID: <8a725785-2eec-4acf-bcc1-427c0e88726a@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: gcc-qcs615: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
 <c361ea17-7480-4a10-b446-5072e8edd76d@oss.qualcomm.com>
 <557ff048-7e5d-409e-bf21-98328a834bc8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <557ff048-7e5d-409e-bf21-98328a834bc8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3NSBTYWx0ZWRfX6ZMrhBswdFbd
 O/qyRaJyoFl7OKxwd/UdA1EgHcIKOyZDOBrR6avTRI3/0jz7xgp2mKyTPvlJ4/cXgavBuHRUyKF
 sxc5bpHEM2RwCoROUPothk8phl8aJLkZKX8uA2xcCNVKQZF2zuJ4+u8hEHS9WJZbarwr9HUA3jV
 UvrzKfoE+J0Bw6hO1zFXX81PYSEF3opmams9Ij+wbavms4sVW3mRTu99jtEcyMBGtIpnAIb9Ask
 kaJMCXdsa2YALNCF1w1WX9hY5DsCDDGvRPKC2kAhPoUOksPDlJzwonW4Fq1vQPCV7j5faZBVqgR
 Lju1N+subkWbtk8CE9VoFQfl0DSJe6ZH9H896RL/TJtOMkPSvFAsuyrrQPrqeo5gMVN2hNnNAYv
 GedvAsXzDLngOloOWhDKob+noKA3RA==
X-Proofpoint-GUID: Qi-bbuDiMtXdE8M6GcuJ8_clpDt9dqTL
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69032d11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jRDqj1xAgmH_Y79Tyd0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Qi-bbuDiMtXdE8M6GcuJ8_clpDt9dqTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300075

On 10/29/25 11:31 AM, Taniya Das wrote:
> 
> 
> On 10/29/2025 3:17 PM, Konrad Dybcio wrote:
>> I noticed none of SM8[1234567]50 / hamoa / glymur uses _shared_ here.. 
>>
>> I see that e.g. SM8250's downstream sets it though - should some of
>> these be fixed up too?
> 
> I wanted to fix them as well, just trying to check the downstream
> history of these clocks and then update them.

Nice, thanks 

Konrad

