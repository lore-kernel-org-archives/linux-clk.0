Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ABC3451D6
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170912; cv=none; b=NEJLRfIS1dKd0EPm7xfPNwGJtuFfmVpbDVJfCaU/dIofVLNjqYv4WEJb3WIXyEpzsuZM137QkRaV8c0FYsUkTv5eEB9Pi2rA/b5z29YS8yCWQAd2QPCVp1RIS5iY8k4VTQpDzGFMJ9GbdN9YZk4/CI+gvq/dHDjixzRwQZbF+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170912; c=relaxed/simple;
	bh=gs29JVYoqBRbD7XbXz5ZIYaa4W+R/0h/qmCJb0z6MrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dkm+4YBSS8JKTKZ67BOBImGeEDR1X4YPZS1v0GHQWb1g/51gRauPTqNj0U9RBAnqN8jdY6db+4N9kJgxJaiThkY3m2BSumVPCbwBhhVnWmLW5TFegFXzBmWo4KqqWITDaIqyvzMoEYW27T5kK6B24ZXVvB9B3Cpcoq/csW6ogx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOaoIKz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxaiEtaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOaoIKz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxaiEtaz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GLad2248044
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=; b=XOaoIKz/3st0iNra
	CAl6ARWxELScvVnNTVf5BCFPIFxcxQ1CLTnDtmQ5kZpmAwJwfDiXhxVm7lmsbucS
	mCNLt0k23ZHwO0NSu5BCP+oqiq9m0t9LoeG8+qHza7uM3//b0SOrCthY9MueQ7gE
	RQaBkcSBkOxUfS3NhAapEABDPg3rXI8nhIQUJ0r+H2owIz4gVNchQZrEA/C3XDQE
	nnaSkzqzfyP8JakXlRW3apcwKENMtuaD0ViwNKi8BarOec0IB6v+vYfwRTb8nrpG
	9jQy2UvZ8MGnQEYuLtox+aBmnii6+cZj0IgLuDRnY961DANiE0bLbjsC7r0KPy4j
	OfXGTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79jq33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:41:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91550f68e7cso183877485a.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170908; x=1781775708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=YxaiEtazFLmLpCLLdWi7+T2ZQcsN7hOE8zlN1swv+rkzM8FB5txMpo3wW1C7bQli1L
         NNjV9ww47sM2YxLkKUbki/D78ZRx2+MA1a6GUQzm8Lg+6Ip7E+jnmGo77vJJ1ZGfQqj+
         5B1z97tg9KCNkFjGAuX54FkRjbyoAul/alu4vBvwcpQyOfuLiQnzuQ2wIiUGqMIwAI21
         LfqiF31J6cVFJs+m3VCakjGVKNEn4tgNIHCmrjB9cPKb0hOR5KaDwW7be3jzHzfj3QdE
         E+sqk8tKk6mnSd3FLdzop3Nw3/iPDDIMFnJSqj2SBGlFYUeqnbSs/H6NO1ReujLn8YWJ
         byEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170908; x=1781775708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=gnkwf0KgosNoOx7dxHReSqoyhYHzUwIrChr13C09ktnmoonjva+VdUkO8SLaZl1DlB
         JpB67xvcjhqa8AHsGqRo3ZodwuBZqFWPEFcPx07v2Legn1k5GckzAjyIt0u24vLgOVFP
         VBKo8/a9KqDqEh+KeZ1net8PMU0NeLkGEdvoOVghVc5T1NVAj2KNC+uQJUBLZ078rqij
         n0D5sIw3jlGu/RW/gdA7pPofgKdGCnZp0vgeHyOEVQKHtg5KKaF0TyaPQ79PHWx0syd3
         wCLURibDkzWlRxc2kHKKWx6nWjrQf+/kWEI7F78qv3yNBARxLrprYPJxjdMRZBeDFMt7
         8Q5Q==
X-Gm-Message-State: AOJu0YylaJgGyJhXwYZEPO0fvU/fT2DYjCCvCGRiZveayN91YVvflcl5
	kK/2IyVGZH1JmLv5yLRK+ypIhRzMd8erLcbw/MmqarzhPV9EtmgqwKx8h5l/tfx9SruSfgfmaUt
	0dgbeLOdDBkeIsO7lThgwvqph0kH0pmjSyiq48x69+OnN1qpiFbOWjnBgJUgls1I=
X-Gm-Gg: Acq92OGZVePwRTzkOVTeIaNiYtQoe1E1pC+Qd3RGXPD/wZ9ySfIo6Gy3G7XBzfVEbzL
	GRK9Ftg3PhhKH6LjAS4+2+nQeWdDJFSg4LZUkfyn3jJh4tYaM7enNrDsMAq1opc9doDt2AP8uEl
	wzkgG7YDv/rr+/LO1XnMmdSKftCHw+Qq2Z4kemQZO3EUpVbpI1TWnOOfJPrYNQ/RtkFkxYodTqj
	jbg0H1XMRYIO67BeKRic8vX7hML1KzWd17n6eYlouryYEnt6XBpVZdV+m++s832X8hOb/lavleW
	GPlkYpoCkmmLSz26vUGmdI9aHIJanOH4Ncgag/S/uxF7nKEvH4LIg2Ud8QwnLFCxLH8W7mV2QPG
	pdL2j9tzYQWvj4bAQfkuQhTDRLh8BFoQsuC0crljl/mNAcCKXdH3ZkgIU
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr168816585a.7.1781170907992;
        Thu, 11 Jun 2026 02:41:47 -0700 (PDT)
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr168811885a.7.1781170907097;
        Thu, 11 Jun 2026 02:41:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cf947sm40282866b.43.2026.06.11.02.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:41:46 -0700 (PDT)
Message-ID: <b3d7da21-41bf-438b-a305-555730cd8144@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:41:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] clk: qcom: rpmh: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-6-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-6-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BqrTm4B-bb9cirma42j4x9IxQqcZpZF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfXyewTULxLNLZR
 RH4lbiiyE1QcbIdID4qxP8dUhR1z30cdjZj50uTybn67bskNHBmbnnJyYJpTE5zuW/GmXWiR954
 r8xZsUTkc0YQtU4hsLCMkCO9H+CA/oO/HzpcRm+DaeogTjtAJJ2+FNSOd57nZ+AM//cnSUKx1Ip
 QC3lQ2ZTiTo8RXiEQyoaPh0gLiYsD22rGAQdNC46+0/M/jJhFMmAE5BaOvtCpIYLEesmCqA23Ub
 93JcnffjhO8ygQT5SaETdc/S3/Y7W0Slx+/RyVt5yWoeDEACoXiXtLEZ9CTeVQfO7SQIrf6fEna
 LC4mi5Cv6AmOJ+SlNt0XJErbWJkitETHZIaXSXfdLnto7znq2zAmhFZE5ebdbzVbir7g5Hzw7KW
 dK7CyQ3u4ite8FitOD3cu0EFtb1f5+zWPbvOaylVLsXkRmeXa8FBfVv6B81YT8HZSvH6FYnkzfW
 te0VMREfxc2tdBiYSCw==
X-Proofpoint-GUID: BqrTm4B-bb9cirma42j4x9IxQqcZpZF7
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a82dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX9N5pEoCnBCcI
 eWF7iKwwY9TtIpSocgYiHQfNqFuxbRCjBTZ0egamZvPaz+4y6DoqFnr1xdgn1SjR/hS3DWlSrZV
 WUI6b6qJpsbR1/dptRa4XRehJgeRI5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110096

On 5/6/26 2:49 AM, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
