Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B021146C
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489927; cv=none; b=maNkWhMMhUMY8ZoT7hIQXTBJCB5RdFyhRK//aGTkXFYyzfbrcDuBduAz+mURTPbB5DoP9nWfFKeoEhNEqQBnGr0UlIC1UcyuBEFMC68RgBoSiDDx0JWcCt83DPHUhnEEGtV0kflGRGitnrJBZimo/2HK61aimKFXmj03sVQY3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489927; c=relaxed/simple;
	bh=VwIF9MZwN8skAcnpaYsKQGj6HgJVPjIpATiFvE46JIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxg+jZXU1foizm/UDuh+jKNK6NY5+1uojIEdsRfy66R5EI4AOkGnu9LLHuvyIn9mb9WGorzzH9JkuXi2R29gfVlEUgcIrs/qDYXR4KBufVaTgxoJ110UsR31fxdC5NuFzUyEf7jnpGPrw7CN8ybKZ04rmHFwYyfqSz0a/xOolBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXWNQZKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXWNQZKA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9vZrT031151
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+CZ5yvanwkNwsrX8wbr0v7b
	U5gRB/4DWTNm7EwR2xs=; b=fXWNQZKA5tt55ydMaRlEOxI8rt25vsq1M699s9O/
	WjAuarD1DKKd/nTTiQg+ZWmsp6YdMHuDoY1nIznIYRQAZ1fNRQvsM4QKTF+Sndvg
	qhAAMFrcLtQRbVD261Qae/tRoQk+oJsYcg/ja0VbIvdRjFriWLU4a5ltySvZM5sG
	wq7xdqsPuiHYVA1F2VLk90hltCiiWf/MADWXYbhM3kOW5TeXA2hqB8+M+NPcEjR4
	Ab9MBQWGe3HJFKcCEav7V5ksv9JmNneYYkqCTBKvRxjIjC8ITyI9YGGbfd2uEEpa
	O1mRIo/TcenQcgSu6mjx/yu8Ug8uKDxmv7CuPBU0SWJigw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d51j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 10:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so241168285a.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 03:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489922; x=1746094722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+CZ5yvanwkNwsrX8wbr0v7bU5gRB/4DWTNm7EwR2xs=;
        b=pyO64cUabGE1+Lj6HqiqF6IPVqOlYNGbZ0RmJkliLAiuBDo+AtGY0lRVY58SfPdQ+g
         CiP6Uhxq2xSulzIDHIq0JZPTb+Ta6ssBbLRF0xhXebz+56u52gMU6n12GxS6e8oklr9O
         z6hnpoaHu8RzRzA34a0H0uJXZRMOFDUqELtCiZ1ghb6HZXJOcMwl+/jAxgfV9bONHXD5
         SYiRAaLixNWf44P/fNwxs47qtvXmwnoyb0lRQCCg0T+wErPwpsbC1TCwbJS/WaVP48W6
         JNsJCbYDN+Xc7/dUqjAhI0Khbfu3FFNJ9lHc21n0fwFzNg4fVZ0HLfJ1kKpjTf24qFgx
         G0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVDr9bFLOwI4+jZ6V0poei3vFvWTVmVtZHAFqOihewD3alVwV+q2YL6AhbsUQr2xzfIGXbSjkb4NNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YySUKglQU1yuRF86Dq74yqBkYbHZmbhctAyVxckac51El1XkMVJ
	WEkqYwrd7dLFXhsHNCfEcsa/T1RYD4uRT/JRwwJ0IVWzlqRVoRv27hKVltWxgCPV9+NTPiMaMpU
	m8AhYFuum9XWq9FBMWQNxFJX3GakjE2qeOH9QuH5AyIDvSF9lcFQuHjeO2N4=
X-Gm-Gg: ASbGnctjYfByPHzZ5IyLC47I339c6nQwLRIRYk6Iv033Yb2oF/Sewj7XMp4f0eAQGFq
	1GWsDmfy50PUGrZxvVDx9xoh8F9hHBpZEyn0/kxkCisLwEJmqFSMftFYG9ZbTk16THg8LqWw3yg
	Dwte/xQWl/yTLaI2SZuBiP9lyzyZiWtxXqOxGyEwiU/k2hYixW4S5zQ3ELsuXBF1Idz44pRmHzn
	lqy2vood8mAx8AFd+bD9LBaG7N1x7oNOt1c4rMF9hqdzFu5YpJxRbAniWR4381YmUc50Xjve9pl
	47HvkO3DKS23cYLn5hOUR+TJoEOsgLCMA5dhLekfYjE2kQRxWv6quGdCGauycX3I6sdgzDl4JvY
	=
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334008585a.49.1745489922711;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUyasljwk71lheOvieQO8GWyGCHy47iFL98wqeOfteeZQyBP2cQ9ZJ7ujqmqOzXQolEaEspg==
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334004385a.49.1745489922351;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26242sm181296e87.21.2025.04.24.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:18:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:18:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
Message-ID: <2gqcoofsvftuvvo7fl7ktkevrhjcsmei423qjdownslucqezib@xpcrhcwnwn3m>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfX/vGfrBBfXZFm CaT4E4sfjBXh2oS5NsiiNDdCqiJq0Bqm1xBTUEMH+1VCayae0IzCSKnm8MCUyvP5k3v94Wuns8s /E6iVdGXNtLDKuep3WeCUBUCinV2JUDEnbbn0tD269WDmVWnDG4kAVKlEFeKBm5/CcuhrTTIu44
 Dmbfn+znqC6vgK7ok+ccBGX3nOCoNwHGBa7VLQvF93qKebqkj7d5hv7zIQhBKkR401XpUYhA5N0 wz5RWzlKDZ1kPGAJxJnn9U4mAQmuIqrWXN/MjdfGqFKtoHPLFsKeOH9OZ8NxWU/pLFHZ4vfGFyH sBsmsIrqO9rn4OFbKam+OgcAgksdhvEvzb+kkBKixz/YXacnXYsHsw+3N0hDS5QTQrSYAV9CjNB
 pqVC6VbQhq0XfhOCrm+Cgs8psr/QG6Yo756kP9uY4Tlo0gatukbuaNk3TOpp3uqWnxEuBRGt
X-Proofpoint-GUID: ztbiEzpR8JVbfDPuXRoWo9VTrJjzmKvE
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a1003 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mLCiClLL8ZwIBs7X0_kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ztbiEzpR8JVbfDPuXRoWo9VTrJjzmKvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=620
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068

On Thu, Apr 24, 2025 at 03:03:05PM +0530, Taniya Das wrote:
> Enable the QCS615 display, video, camera and graphics clock controller
> for their respective functionalities on the Qualcomm QCS615 ride
> platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
