Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA5223708
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647130; cv=none; b=I9b0LxI+X1w8XbcKm6OPaBDgJdGyq2DoDB56ORaTfyf7kj9N4rvKF48KsZ5KJD0yD43Zk/Z6aWEm/1GwDCR9xm8sRls3CID8nmST/SAG+UAyswVQxYO/hMOtx7CcqyDszrKs0d8OwanjVt00jYvAjtcPvsbh8HuFuGP2KhpCMFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647130; c=relaxed/simple;
	bh=tFGohcXNB1VrbcpvhBb1VEtLIE/4EsHR7WJmt5fou08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5a1+YUwLg2SaQX24XADrUunUPnXNRpgKM0vUdUTGTCGNQt6CcxGzZdRTyY3YMY9i0RasK31Jabf7gOWuef67sxvi8uoAXRcLYwi+iFRDs9/B2MeGWOAOy3X2zDWvJRj3xLrs/nmC6iOYdf3GC1z0IhcUncLnRVP11yqWKfjKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQtZnnRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCSmU3aT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQtZnnRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCSmU3aT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SN2O8X1084589
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TbSqA207/UiHc7fl7C8EPRZ8
	omtomNhZDirOcZgI6nI=; b=TQtZnnRa0rbOy9IOQF8gnN4Re+tT6AiYzGdRxFQt
	FOyO35aHOD3CJUieKbIu+7uwRpe6tyB4ob1SaN+1FO5VjyBQl8sXrdch2SSFcHiq
	w2ExKy8sUF7psjPK205C/LwPkDzq+QitgtY5PC8TJDvivLnMjksPcbPSzTVrF3bl
	CIhUB6sC5bpUqIn4eUQXnsaeJ5KMRJYF0U91J+3JxxR6SYoBUv606SIzGQ5djznd
	JyUrJpHZnb6jQY2loWJXeuZ8m8RZC25dgfcua9ZWyz9DUarvr/k4QH3D0eMoPR72
	cdcKxRziVrRfcq8J+VoLL00nRVfRw3Th29Z8kw5GpjVTUg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfg6qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:38:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5eea68151f3so497108137.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647127; x=1770251927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TbSqA207/UiHc7fl7C8EPRZ8omtomNhZDirOcZgI6nI=;
        b=jCSmU3aTcZGlMSEzWFljvAEwTaP1Rk6RXvLhyo5z0TrwY8kHiB+9Npt/gPQo3Iui7t
         J+RGPxO+hCAVDGTdh8w9eYakPz8gKrZ7c/IlzRnmBg5EwosW9OCCBeF1iNh4OD2fMo2l
         CL1O8gWbH8J9HmboGAe4ZS1/ip0gt3o2n+2ddZp/lv8G0qpDU5TVs4hw8r7iYEl+Paut
         w+iQfaVUmFewjy+k5/vr3KEwMiUrFa3eG+ZpYqT+BWvwpb2Uz29EAQ06C4cUxjYmzBQU
         01LE7DRDC2O+XBAF200K9MsP+Qge39IlVDpwE0HYLdpWAinIHR4LRJJs6APh4yA2oE/Q
         Ml8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647127; x=1770251927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbSqA207/UiHc7fl7C8EPRZ8omtomNhZDirOcZgI6nI=;
        b=NeibdFhcvYLF4/LajtaoHjOsUvRQCA2AhX/jc5IdQ8T9sfBc3IGTwaXL2SefALC6mz
         0UZrnMIsnAaxSAPO5AGUDbz0HVxNCQAu7FvoTmfd9uav/EhB/kBKEDjFjrZWLsRVMmen
         DGoOxpQjyMAVbajbh3Bw2nt1IqChDp/U4ppIXFP5tKGYfzFYzhefMdTsjqbRXsRspued
         qTcXIF+LcGcETp0NUl8GVrrbWa8WovhB6mPI143qReTcvBDUWhEAVibO7aYw4gU3Ecqh
         3qX1cmWcmnBvuoiCwdYk1B0ZiSptzf72OX6pDbjW8Kf0nNgqNSLraJZiMG4l6GaXuVId
         2CQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7zyT3fyg0yh9zwVbeFZuhlzTUKfkx0Lk5hHwxOaAjrvVyTggY3DjcmMCffgbjmBxp+0tKHzwIX/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pF6Jo+AsNozwQk5WB/W0fIQaCmZcZNU4z4eOJBpWuSn64SWa
	T4aYWV/wIg3scVig8n8sTc7Om07lBjJDsTPcUbIj2ibPIRicCf8TmB1ToOM6hzNGXBeC3KaCGeB
	XYMQ9c/qEsqRA13QM9k0901y/gcDmKhFKN7/nP6316f5W76yOCs4QTgzJOO0leTQ=
X-Gm-Gg: AZuq6aID1rWjkmlMl5JO1NievMJBDzZmlbsdm1wYp9XsrfVAH+WbVlJjSD71t7j7lBG
	eXPpDuREfVsotItlM/P7tqNf4iWa0hzhbp0HrJLuG3UTPABbSEitHejVmzzz2HUWiW/2jkkc/po
	eBiyBGHPyR52ZBcTi/48VpLqHbqi6vKSKmNtMRZbCyWc1/mj3sM7yU+5L41XD7JOqEUA3Wi1WRb
	kgKZFmNGX7XZ7Sm6zexDsDy4hSXQaPLfsdrFsUeDeYo6RhI1K/X1YId2Day8B8R/AP0tTurZmzj
	L4XIaZTAj9nTrOuZ19GuIHvGpmkSwWvmFHbzDaPLBEjvFI+XaCIDWNuwuSfvSfHVpd962reTJCc
	xcIKFoDl65I3SIjYB4eAQKPpV+enVXuKQN3oBJiysBloti0Ve4p+D8zPmhV7x/5gAvCH8+52COU
	wf3AL6N7OZ4d4y2qUHjhDswTo=
X-Received: by 2002:a05:6102:50a7:b0:5dd:89af:459b with SMTP id ada2fe7eead31-5f7235d7477mr1930056137.7.1769647126618;
        Wed, 28 Jan 2026 16:38:46 -0800 (PST)
X-Received: by 2002:a05:6102:50a7:b0:5dd:89af:459b with SMTP id ada2fe7eead31-5f7235d7477mr1930042137.7.1769647126178;
        Wed, 28 Jan 2026 16:38:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0748993esm836048e87.37.2026.01.28.16.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:38:45 -0800 (PST)
Date: Thu, 29 Jan 2026 02:38:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Message-ID: <jzg34rsfxoqsrwrkls5dd5l4zereziws2hdtkvotpogwmmbicw@ludqwpxbfp6n>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wSDJjJQOW7mqXy3CFae_-vcBS2g4JgDa
X-Proofpoint-GUID: wSDJjJQOW7mqXy3CFae_-vcBS2g4JgDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMiBTYWx0ZWRfXyLum7FKoA0o3
 HJ8mPTegGAgEBv/D+UjZu9fSmaxv/mrL/5qnTPRhM4C8bMdBWWWx96bfr6mMwBQFgurFTxTNkGv
 Hc1BqVXRGDj8cZa07pyTcG8wz+4oSjoF03DXoD+w51wtAhZtXdGX9TawI6bmUJbCQsH0xEmjdv9
 H/de90bFukw+/dUPMSx2PLmWBNYqh4EhydWmoORu3kewany7lSU+AP13/5ip+HCFwDC0Ic30AGM
 j5Mx6xD66sn13djF0VJ1ccozVIrHlGi2BWOkm+960/wVf84BBsDlpTbbsKrmdWCZIgMEFRerwOR
 3PEQEI4vWwsLhNZhJV9PcybAoWyshKNgX76T8C3exVBA76VVkcj193u1jhOXDO7IPFwyBlk5hqn
 4AxAczmNIa1c9YeBFkZemnES6S05tCQo7c80Ta91nb6Lqidnrb/SD0h96mEnZWYVtVliaIxr9gj
 hcUs292H0zO07Nyklsg==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697aac18 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=80PgSMyzE0h40E604UEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290002

On Wed, Jan 28, 2026 at 12:56:35AM +0530, Jagadeesh Kona wrote:
> Add support for camera QDSS debug clocks on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)

My memory might be wrong, but wasn't there an issue with those clocks
being not available by default?

-- 
With best wishes
Dmitry
