Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41FE2DCF41
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366977; cv=none; b=j8fPQNE826w+cGXVojGPUNjXvAIz63y2WWANBtoKA5hqing07HOf2tXdR0heIC+SSV0LoOsEEzCGolINDpLSgs9IWGYreTPPJ3PO7v4WAg1ZFeYuES2ZzWq2LbzMQxycnC5N+bqe7hK2f+fPe2+fHsCtPHwQZUQwYRKm1OqKQOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366977; c=relaxed/simple;
	bh=1x33KPEWr8P0rzqhURp9ysVQkhvrTi4Fminesw/AZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4YoJE7z2vrbe7sGSQA/5+4GBuEnPmpyhRRVSaKwSkREIrC7n34Gkanm6G1lTUCO6JJ52tSX8ZLVxBwweQm60l+ANMk1vKLlqYcjoNFGqgwe6MrD5tAqnHrKyrvoUlb7QC1Wr8d7n8Vp0gS8xrY3eLqsNLxi3ymihGtE4mzp3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTQlTXti; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTQlTXti"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9OpEt022161
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FrqC3/J/0jX5Djcxj6BpkANa
	qeAZVYVDIG1wzxTG5QQ=; b=BTQlTXtiws+5aEIPPgDYv+c7XG42ityBA64UI/cD
	XEn87j8pSrLhoYu3p6TkfPR9VKA31zpjiPoigJmIm7K7mN15PC5mpQQy8EzaZk5p
	qYdm3jiGKFtqur0tgYzDJzul9yfxuD0PleSeUy8crSJ+2OtVaCmj/J+m1tlBwnnX
	YLbvEF/Td/GWIWWTMkWNRpsYAwqR43+wx+t7jfx352gZiUMT6GX3kZAKjKtuU8w3
	V07b0VtF6TISk0VlhhhocfvDnRbuO6ohXRflnlRtleBZSS873KdugljOdYNsUS0m
	HqelNn7PGtyWac5TJl/ineNc2eP+1pB/mDKBPsVd/kwkJQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044drstf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:22:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-87ee2573c92so890812241.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 07:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753366973; x=1753971773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrqC3/J/0jX5Djcxj6BpkANaqeAZVYVDIG1wzxTG5QQ=;
        b=XkWOmL+dmD8tY6sq4KvQzyfi2bqls4SCCbPzkbo49MO8HCK74+0qoo8HFpmy0QLwiu
         rzMzYbc1bT12KWqPUXQsN5Dkrw862UyXIldZO8Ngile+wxNsi9bSCDWLtp9F+exec0h9
         /r0pujBzRBC1E1AD6rBjlgNT3UB4i+qmlE5dy8pa/Eq5QqUPkwA12DPG35XwM6c//GMk
         /F7OZuPCQWr/57v05wjW2P2XWzjGKcOSS8SS89iPBVg1dvA6h+p6iUutyHTABWYqxhhg
         FwwdOWBUb6zETcLRJcXUscNgZ4nyxdPXOIRVxtRYBwIpHZqn7Lcabgr9mNss8Lr7Rt5r
         nLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnQ8PxG/jIBmZSmkuigAoxl8EQbg8LwuDdUqAD1ORkRKI+76p/aozdi/Var7Le+KKlpQdx5F3/fS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPeVhYN6G3D6Dg6Ph1xmzqqGeGLHsxyltlmp2MjGocZzuYkOK
	WcA3yr/Jt0HYmq+ArTKmB1y3YbcTFdj5SKR7osWNSI6hGOeKZDp1QcOOuFUj7aYAAbmzLbOo5iw
	2Hs9z1g3Uo1pgg2RW2dIVNOoOVt4QyF/W2nVUFcauFj+xSc2muodj9UwQnlIbG8k=
X-Gm-Gg: ASbGncvkyWk+aspgejEh1GthIvT84zTBFqyMhsvsoG/+eXOC9P3xMDeCCCAZAy0Cpuq
	Mvi5EEjEAq9sZfrkE548tSCIPnYMo9ctGs5au3VJIWIrx5YrFddJLKyiCU7br7fVqKaIJr6hzAw
	qvCQfQ0y4s1FP4x19btotGbBFjqbmmT9NoXjMdOHUplo9i0+x9Mmq9vZWaCiMLbjJ6KD3NxXxa9
	ss1FaMDZS5L29C+gl1WUa7dFyhaxdoovE9RFo4wTRbK1dX7gtGSnN0Zf3YD+Whe/RMxUMWl4FTO
	7q+bQ9esPPBYkbqhgmgfHXuLWJBV49UE3Z0ORuI1fronrmmqDeUPjEZyI1zXTbyvP/hzOWZcOK3
	1SkJQP2Plvy+GRDM71hgaYQV6UzuTzlCe1n9iwHVj0W+F6hohImKH
X-Received: by 2002:a05:6102:32cd:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fa1505cf0emr3376535137.9.1753366972671;
        Thu, 24 Jul 2025 07:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJRpdPWtOGNZPazY3KH9hmRCknrLNOq5//Alq4jYTQJIKkqY+VBmq1ZeiOKV8obh1Keq8aFQ==
X-Received: by 2002:a05:6102:32cd:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fa1505cf0emr3376473137.9.1753366972140;
        Thu, 24 Jul 2025 07:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e0913b38sm3202801fa.79.2025.07.24.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:22:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used
 include
Message-ID: <crqc4pklbvykswdza7favsjszl5zqhfw5obee3pnfakwzzqot6@iuxugh6illx7>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=688241bd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ShgW1BdH4RjToGz97RkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: sBBph3wbv786gUiG8DZjHc53pNepopxd
X-Proofpoint-ORIG-GUID: sBBph3wbv786gUiG8DZjHc53pNepopxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX/hSU+ng30q25
 9gbMh8PAakNqit3rJsw6dVksBxM0g/Ti4W+by9ZS1uQyX+mynf9222N7wAz30revfrrmChtH+F+
 JOZ1O7Z9r8H+v1XYlImDshYTObH35siEWuPBIQHqYROma97Tw1yCRqjg1uTtu8545qb1l+Ct6yp
 1dHQlqZb7xGlSUFBGNJK7+eXU2ZQjVXXoy9uO7wSPZ1qYn/yp3BV8aXvQMkkwGWb+S9hKMcmXPH
 AE0pgcGSbNGJk0UojGpDf6Bom3EKPWmOcdAGwO6nu+18jG/r1mF48T3yBt0SD3EZh8aTB9zHXFQ
 rgt4LHpzjjjh6Q2Cxh58aq4PwN2jN8cXxR0CJDuYnGwR9B02SuLjyOPm5/Xw6UMHvePX32zjIU8
 KYTcC0PxKoJg0f0NNaFlL6oi7bmTKhN3VMABnjPGuhi2c4N0VTjNV+eC7gtAiJFEemBZEBq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=802 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:42:28PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
> removes it, this also enables us to cleanup some of the dead code in
> kernel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
