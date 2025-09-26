Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B511A26B
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870066; cv=none; b=rVmLTVc8QvGXsmcC0u3hnmwi0aTKrrli8zmkyOnq3RLFZWuFOaCgz8gL5NU6wAJT6IVAoWk5+6K3txxatmM3DKDojOTcBpdUNqOFNEXjOAKwQ53MZ/B4pOZYuUjlUtMly5kmshGFkaeHFPWZfOosJGj6Bq1TMQlDFw03f5hYaKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870066; c=relaxed/simple;
	bh=zsJxTlGg0VsEk089WKJG1Xw2vubU3qkBIxZbfdEBIzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmbJAUDoQIA8xr/Zp+98L45j4elFpFvBSnJAiDZ9c9KJ3f889F3LDNZHGXO6OW7PV8Xv0M1DLCSnmMMzobiWYZ6DdnvmKcjRqtTlWyKcnz2BOpA0jyzauuleGOxXabBUVx7rqYHtckyKzNsTg1ybp4Fkk+Ey3/boafTX2QYit0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k01Eqm0A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k01Eqm0A"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPXbm027505
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twtmZmjdwxx4BdHpzYanIR/C135T5cqJSpQWsUGZmOM=; b=k01Eqm0AiGl13L1i
	wR2ZJoA2DrOM270U76AKYPoGYgS133g83QovHr7PO3cw2OVz0lePaALQZD3fwOuw
	yOFIaQ6RGmDnWjNm7Bup38ZqQr7sd1TQmTUSoOjydAzCrpktsMF40WiuDcUf+MZQ
	Ipnipgvtj9uU16lOQFJJEmqSalOGEM9RaiDC+zWxpywKhOG3186xdmDF+S5N6jd8
	fFvCr8SXwMNbqAyrSPZ0na+Fbam3T39AdnUMj2lgIWLEdFvVnzd2ioHX4cTXc+Vz
	CVTRtQhzvN/8IaEWjwL4ATANBhuXtrvguZ/dygqO7GKuEvtnL0WjZwC2V1d1QtlZ
	qe8Ghw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1rbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:01:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b56ae0c8226so1342849a12.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 00:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870061; x=1759474861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twtmZmjdwxx4BdHpzYanIR/C135T5cqJSpQWsUGZmOM=;
        b=uLYD/SJU06VX5pRIiEJgdr6BpKMyNqDZx5FkDHpPpuEtYbhNCcVQA9IKd646JgVpo5
         SrHy3DEEnAJU/FM+GvwAXUzfuyD2+TuCSEcQ3wq6FaPbGjkQ0vFkXvOIfu4L+i08h1j+
         665pQVtOwLptGcJ53v5mMP+P+lwIbRnhZRtxW6dhbSca6Z0xRRN4uc1HdTWldAMXxXy4
         eOeBDhZsWNg/vQ+9vcke5wug+pzy40zFVZsHk80xX8uL3J8Iv4Eeal8qUFfQGr1chXcW
         PGfNKptjG69SAs97ZmqxCrCOss/F7nGPxDs9CfoVzJo6eI5xLGDcEE2EB5AT0yeGUOH5
         s3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnFOUd9CJRSVzrxGclqbOTTp57R18o8zPoHzj/uW8EFBV4w1USE6y9eruWHzhm9QjwaOs4fN0NYJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJZvdh+HxHOP0uP8RdeSA/Dzu7CureEiFzhov1Q6sDJLYkgdx
	beI5DBHk5tJ8RTDzQETRnM7KLiqpGLOiQhZoEjZFzIHxB18YgARxD63LHImStqHmExe2z4+iOgU
	B5R4IeqQ2oXHnUazf1MqP62fxHERpSLcILdRJG8+1bQCyJoIN0Nbp0q8mLk49lOw=
X-Gm-Gg: ASbGncsJppVnWrhrb2VL21fkGEifZ4sZtXjNpTT0cGsK8lv2S6VbenQ3UwrvTvaIsVi
	sBVYJPt3b1AUQR4tf2etmLa/wQxCEycrpXA0voxYGbd49YjLx/t25ffwnM8J14baNaL0VawwaoV
	NrrQSu1RueEC3/2fpa7y9DrNiXEmlM1L/rW9TOyz4ZrDX8aSsgX7D2Y0IoF6JZlDAvY4TYuu2Go
	+ZLiKDYfSueCectzdKS5lD8khs+DapdjSslWKghU97lT8KpjeGU2puAuWgbHtgEflsqBYymwIWv
	L+vpSR/bOSi/kOECRU9qQyyNFUx3A0zelhn6+dCyscUzLjiYO44wu4XUtl4iagkhBUTQ
X-Received: by 2002:a05:6a21:32a0:b0:24a:c995:e145 with SMTP id adf61e73a8af0-2e7c1bc5581mr7549218637.19.1758870061251;
        Fri, 26 Sep 2025 00:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyGIYWGRSEBYWR6xeL2JzwaVPSoeKg7XU8yQih9Mk5p8UafMojYVIFSGDBg9nHJ2JRg49gZg==
X-Received: by 2002:a05:6a21:32a0:b0:24a:c995:e145 with SMTP id adf61e73a8af0-2e7c1bc5581mr7549175637.19.1758870060728;
        Fri, 26 Sep 2025 00:01:00 -0700 (PDT)
Received: from [10.92.172.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8e3sm3891514a12.23.2025.09.26.00.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:01:00 -0700 (PDT)
Message-ID: <44c224d3-d5d3-4a88-bf88-34b9ab5239b3@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:30:47 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags for
 pipe clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
 <9066c8b1-bf25-4ce1-a0ee-16e9ab44dcad@oss.qualcomm.com>
 <gprk7uhwqnj37cyl5iae64qrevkts3z266y2e5k6z72bcujhml@n5yaik3jtm2a>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <gprk7uhwqnj37cyl5iae64qrevkts3z266y2e5k6z72bcujhml@n5yaik3jtm2a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4FMbb8CrEquM
 l47joR3fuLqCOknj7osJp5LDm/wOs6/Rxz1LoHMrrO/TkXArHR8zhKq93i/z5KqmMg98e1E3hvj
 m7uKLjDc8wVIKTpejc8eAyV8KpS3ncysGJaZOZnMt/IcEb+GVr14ojsyeTNptDopcOT2Q4vy40v
 nIklV2g6RSZ49j3OZVBiLbdPnfH4Q6RSd2ngaDYIa8MRQQNsCGV1xxEuy4lsblfAxEa5MZ2UPUJ
 9VxVwXEfMg+eVCTL5JIN/5K+1aK4x4b5oSF9tw9cmqk++XD5ttbmA08qyOWXoV/9gXrfGitzYNo
 OVOZJckp5p1Gnhm6EFehqlX9aponkDO6PdSd3ISYI70Oly02pzjhlEmp690AV2DzVtZpwdmB1s7
 m401zQgyK4UFGeLzz4/pRZZdifBB/Q==
X-Proofpoint-GUID: g1IREUe-xdMAVI4ul9GNlTXI951IYsH4
X-Proofpoint-ORIG-GUID: g1IREUe-xdMAVI4ul9GNlTXI951IYsH4
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d63a2e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eUHWfAKrTrtQ6IGICcAA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/26/2025 2:48 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 07:10:47PM +0530, Imran Shaik wrote:
>>
>>
>> On 9/25/2025 3:49 PM, Taniya Das wrote:
>>> The pipe clocks for PCIE and USB are externally sourced and they should
>>> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
>>> to disable polling for these clocks.
>>>
>>> This helps avoid the clock status stuck at 'off' warnings, which are
>>> benign, since all consumers of the PHYs must initialize a given instance
>>> before performing any operations.
>>>
>>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Update the commit text to add the SoC name "glymur" [Konrad]
>>> - Update the commit subject to add more details [Konrad]
>>> - Add RB [Konrad]
>>> - Fix a typo [Markus Elfring]
>>> - Link to v1: https://lore.kernel.org/r/20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com
>>> ---
>>>  drivers/clk/qcom/gcc-glymur.c | 24 ++++++++++++------------
>>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>> Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> Note how you've responded. It will be ignored by all the tools. Please
> send it correctly.
> 

My bad. Thanks for pointing it.

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

> Anyway:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 
>>
>> Thanks,
>> Imran
> 

