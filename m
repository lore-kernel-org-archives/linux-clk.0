Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816B2E3B0D
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367140; cv=none; b=LuCBVXpLiUCNGy4B6dHXITsdVQYTAdrimTEl8FyxLfpy98Zg8BmJFBLs1aHNH/haX+6L5eZ9VgqMgCrEUhPDD8IJMevg/C2s0ySuZWQqsf8gb8HqblMbjUKbOQEM/1npKupu9MJ55Rt0AT788h5uuQGm7IkEM7jMaK5xRCctid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367140; c=relaxed/simple;
	bh=9TwUxYBs7bG8dOsoIWLmLiq180yfoOqGlaYJu6O6QU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9xi8wiIilycA7vxIt9Q7ba5p6sI19uYrpws0HFKyeYPy+9Fjy/jSUL0ocIBq/P0/7vlYDyf384BvVXHGdpPjXzcxkWEOYDuKtKtSP7UieaFBXiRVvt14mJYaAzsHsClYW1Fq/ac1DSaNfiJ5fKu94JPVlgi1rJNWChjKjEc7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6NU8bc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6NU8bc4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OA8kSn010594
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPRPisJgrmo0ouxlrT4g25KV/CYo870iI6npsu0bSu0=; b=d6NU8bc42r2sWaK2
	kA/tOXeNoiGkbiv9nIYRNRRDyeCSSFBc35bKBjfrs0Q/qUL/uf4WW6xdypnO6lY8
	0s0s569UZMo+xbhw5Gz8M3UyJ35k1wWjiHI/fHgp3HFybJF7XYR4lgcJjpissq11
	5f5ITkyhPMB1QNPRhIgZczHxpidbWqoYFP+Loj8TXK7aPiNTwKwnfxUoaREDiG/n
	MYnytMqXPKqq+IbXGjO6sg5XdFiRNnBYSod3cS2g8mmt66hKMGjUdLYViF39te9m
	bcvrauP+kZQg3bQRPk4heQR0e6nJpFBpQwLE2ZjfeyY4PHtxdTBuJ76KzS02KH1y
	arNWaA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6wa6rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:25:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4e9067842ebso257193137.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 07:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367136; x=1753971936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPRPisJgrmo0ouxlrT4g25KV/CYo870iI6npsu0bSu0=;
        b=J5HQVQR4jjpUTNO3oBgvWlQ6ffPcS/R3mxqnpdswGBn0XGdLQI1ty3xndqpqq2GTvJ
         6Kvp6Lw0vT+0UGJHJf7CESPX9piCFs5C0gpuWc1T66QoGI5AWtUxgzONwSsTLpQZ41br
         Z4j9/DIyE1hadiDwSfu8AESpLBK81NmzoyKedACMK+d3xz8p9nz1ejrDSikM/+HuqD6p
         aa83av8kuAe4CiTyuQ6Jewzq3o5J9FjqPfllQQCUa87xYRM2FwIJHqmiLQoDsSI1ISgS
         kaTmKCGRtjSTP1XJdOTf/GhZgKC3wtcnoPhy5HHFK32CgQr9ALgciTMQWFkCKhO759c1
         3ujA==
X-Forwarded-Encrypted: i=1; AJvYcCVQNJKS9Vag+fVcbwORfpDk87ufZg5CsA7lWqvf5sZJMmkECQux3JQoc24/gn/sdw+mhKDcRCVUb4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIf2gmcslVeNXEbLpqSxRLG/Xhrnz1infQDHPXDOM+n7vb82pF
	4ma190jkD8GhukVodpY43q+XHrAqYNY9w6pwhW6IyJq2Q4ocAsUjpNQsQ4zOd+aTXP4f5ZJtf5V
	G2qxEroiFOd3ckFPZXkF5WtxMAU4gi7YkoZti3i85cJCaSiI4kjVbpRhXJIsTtZltP78BYEY=
X-Gm-Gg: ASbGncsdS87W9dUNAzYc6/YTP0LAFgeCkRcEPW0huzMLHdlglgJLy+oDma8aB7Z4Vr6
	2TEfQbo2sUi+/ifsLLl/Kmm5YDQkN+2WnoPOXuNJvnLj5qU+eaoCXkUpv2UdhokgJinIXNPVETq
	omkoT0RIXQqCnkzU9R4sjz8ytcb/Fun6Y2oChe4h3OIINupm0EmMC6nSffNr0lqCrN1AKNtnb4f
	9OS1+O/42hkkzWyF6xXfFLfYGx46u6UAE+0DDt2y9vvgP9WGmz104iay4ZIe8StHTZWx4D+bNUK
	UvJkk889sU4GjQrd/PNU84moXqcpPyCu6lQ8HgvyPp5lslcl7SiAjySlKmUalhlH54o=
X-Received: by 2002:a05:6102:6c5:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-4fa15190ab4mr3295853137.17.1753367135892;
        Thu, 24 Jul 2025 07:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM+il14E2osq/m06SZGdVqsUY0imeh5XZ9qO0BRDLCTsWVEfMc4K/24znXseOfaB3Lj87ixQ==
X-Received: by 2002:a05:6102:6c5:b0:4e7:dbd2:4604 with SMTP id ada2fe7eead31-4fa15190ab4mr3295805137.17.1753367135334;
        Thu, 24 Jul 2025 07:25:35 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fcb8aa6sm2378331f8f.67.2025.07.24.07.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:25:34 -0700 (PDT)
Message-ID: <e2d7d66e-bebd-48da-b61c-52fe2b74232b@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:25:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
 <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=68824261 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=A88rw-UrIt9Wtq4Cu4sA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfXzKH2j2qEQH1r
 PERE+3HE7/Jz+jvTS/QhsAybJJoV4yxrjul4RuGFglrq7H0GU7IPKeQF3fXjAoxWL21RGTv/uFQ
 OvBeG0QApsJxcu3hDF7Q9pG+zd+w7IpPO85fOPPJw1YHR3em8lnBPY1ZfsGLrEksh4kjFosJjgB
 SICBFCYbCTLMf9upjEjrkUZpsofnkVPWNy87WDRsDXNkZEevhRek3DlVx3JKwfKDmaNDJZrLq8u
 VtIIlETLAA3CvcniAmlQjVHlfCBCP7dfVs62hxXsFzBUbBtAZMOArHJAayFm8TqOyuKCFgpOOFj
 hBH8cKhMM3q38RrY1LWs6u1T716Q1eXCjf1zLeJkxTiS6tnAR+t8raRcu64DHlplCDVjw0HH0wR
 26SLiq34EM8sVrEzdOwMLXv5RJdksBte68MyGpmvRz7O0ASCS02Lz3eXikiY0JVH8kIfQnjz
X-Proofpoint-ORIG-GUID: qbEIcllsvyU57BAfLV1mY9SVbUDwSRS9
X-Proofpoint-GUID: qbEIcllsvyU57BAfLV1mY9SVbUDwSRS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=888 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109



On 7/24/25 3:23 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 02:42:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> I think this should still be @linaro.org, especially looking at your SoB
> chain.
thanks for spotting this, I think so, let me resend this one!
--srini
> 

>>
>> GFM mux driver for sm8250 is totally dead and unused, there is no point
>> in keeping this driver without any users. This patch removes the driver
>> and the dt-bindings and headers associated with this driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>>  drivers/clk/qcom/Kconfig                      |   7 -
>>  drivers/clk/qcom/Makefile                     |   1 -
>>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>>  7 files changed, 472 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
>>
> 

