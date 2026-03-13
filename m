Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF5367F40
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399011; cv=none; b=B6tPEwZwOvTb5KLb2wmfDzXYbS+yb0tjI/08nc//75yapv3AkbVIO0ehD8RA78mCSnAV80mX/x66y58a5+bXYK9g2yM4BrhR7T4AADgQ4D35x+fYazbtCtMlvjDKbSIk3Nyc84t1ZfFM9onKbZ1a7v1JbB7vAiNYWt/iPx8sFT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399011; c=relaxed/simple;
	bh=aps8mFovGZlF1yvFqIvQlDxUebp7B5Obn1q2i7KjfFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7u3niltlVjixfyJhKvD1SHUKYcC+7x4TVIDpFRxk8Xm+UxwbxBaZPZfVNoYJpnTTreOGXyYpkmEhLf7WgkzGxQgLAYIcxXVBy1CT5UOJ+MzQmb2RdwY7pOb1imIaJZjHp4rmrM7VOy6oc1jkl/xItKmIFsOS6VNBx/gfW+1NN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eedGq58q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjVGYn6O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eedGq58q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjVGYn6O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tY2s3229734
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBkgUQGXepS8VOkWnzpVhui4Op9wXcFLhgxSgyRZRj4=; b=eedGq58qab40pewS
	Vbu5u08TeDatsqm61BVjokT+CTJjW+LMc/WuJL7cGFQbW8+ZGRLfgUov9SX6Njqa
	X20xEW17MnfOiUHvGU0Km2VRJ4wNNf/75NihYX39Hk0BEOQnw3w5bJz/cFALFJKu
	M64zUBuyoeeAQOFMXmZCvAkHbw/vJ8pjHnb0CODY5dihZUmO8LnSj/EoKanngZ+T
	uRyVysEvXpeBPB2p0vX8Rr8BEl3fHAh+q3RmAezfqpbPJb8Zq6H5Hmx4vq7gNLmd
	i3SXpAt5yaNWWuj+09dWuFmcrEsx7p+HCAI0eWDb3ZxX/RAOBk4RBCJebC4HeBMt
	KOvQmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7ht54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:50:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so110210685a.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 03:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773399008; x=1774003808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBkgUQGXepS8VOkWnzpVhui4Op9wXcFLhgxSgyRZRj4=;
        b=AjVGYn6O2Z78blGxSBE+tdX4U3lqMfxYYSmm3FieWsZUz3SlGWpOrJKFsKsZ4XYi0p
         mXEZISyUhIytnLH0dgVV66bPtdiXkuD2r2blpCrg+zMwMp3Wwi3/OFK/X37Zka386NSp
         qVbiQHNVcCgmzBZBYp4HBmebyN/Dc+45dU19E21EA1XWvPDD+5wneEmUwuQzqIlYGyfR
         t8Ud/AtI1EMN+xwESRlP9VBuuMfzhNlgSIHp2JN+0g/ULdz094tTqAwbuLYR0vgPjtp8
         BLgpI9GZtuoohUI+VQJfDc64GZ86RNMsMhnwDDAZV9mnujfPV44MsVQ0FBA/UGsJIH1B
         j0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399008; x=1774003808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBkgUQGXepS8VOkWnzpVhui4Op9wXcFLhgxSgyRZRj4=;
        b=DCKN+IQQPzyrOaGR65jnka2yjgNjxBRb0CTpZUBQfvGbB6+aDZ7fhuKVl+iQRpKrjo
         um1sUeWG7g49fFui1NTQyQirMxeclsBkJeVxP+PS/qv4m1tTNO+LwcsJlfZrUoH63Xdo
         HVTjiMRmFOF6PL2gW41IoUzRqXVnhnH7PnWLeu8IwlikUbjzy28OiRMrclPEvmnIK51x
         rBNx11KWiaHN8NQcLXmi7zs19msSiDvSYnG5isH658eBNp7KwCnj/koMu23uzi2cQQ/i
         Xt3/s8hAyY2Xsza5v+5oAo4Xe3dYL3kS4OJmufMYxNtgxev1SBnDU2lcxVA61PJZ7RjH
         wn0A==
X-Forwarded-Encrypted: i=1; AJvYcCV+a5Wuk8cc+WksSODoUH//TfB07sQ8z7HfOfgTSJlwbmnuiYrhyGoCeAJYODj3mgj6qAJr7afIRAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlo8KPyleZOcDwLid6BmZkVfHPhmZWx7yQy2EZl60+fg2T+7mi
	vncnY5P/inD5myZMfjzNiVWDQhR2TiKqtv8IhWqhvxISDhKyEWeLAboKJ6FlMJe0q5G2/k+uftF
	bxhrblWty/HzPlPuTTDSw92gRGd+v86GlCVTvPD5vWFymv+lLb0AaBfrLAFDn2CI=
X-Gm-Gg: ATEYQzxQXly3MBEyTccfx1dGqQcKqMNCLESScNwDeDvXs3bc57C7tlUGOn8RfnjuGc7
	JOts9RtTzx3pStIK+GVaO8udFufQ9aLgATVR6ru/FwGi80GSVbKPDu9dElylvHzoBKo0y4XY8Au
	X9PR2MbEQSufWTgKlIQNRHq/uxn3WthnH0wILyCVKSOoBSjNxObOz8hOkRustOTamkCjVdecjE/
	vMIT4t4VX9GkyOSnh6L2Yk06Kbb1YAJdbIhL6gGL634KNLqpb2KumKguxUAw2rPFH2HYH9hl7HK
	gYHo/Cov4YiLzmvn8JnOrNHuT4X1CctsoIpABstHKOWk5uckg3YIb6p7EUJWkNsepr7RiOZX9q/
	orX3KWOn+0zmeXBb6as3IIyn1VJmtqNyV9VpPjeezFbeqW4XrwU5vNujhHxA+QJF0A05mCjHAvV
	v+SFY=
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr303373985a.7.1773399008234;
        Fri, 13 Mar 2026 03:50:08 -0700 (PDT)
X-Received: by 2002:a05:620a:290e:b0:8cd:8736:9fc3 with SMTP id af79cd13be357-8cdb5b8a614mr303370385a.7.1773399007766;
        Fri, 13 Mar 2026 03:50:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1204251a12.4.2026.03.13.03.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:50:05 -0700 (PDT)
Message-ID: <ac0fc154-b41c-4273-ac5f-408428c360ad@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:50:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] clk: qcom: camcc-sc8180x: Remove wait_val for
 Titan GDSC
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-10-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-10-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jt3eXKjFLp5Jul5xmer5RlLCk4PWxjAb
X-Proofpoint-GUID: jt3eXKjFLp5Jul5xmer5RlLCk4PWxjAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfXwPH4GvsXvCoW
 dO/28XN7jb1ty7aARYBUE2S2Gt+Nwvi0ifVvuQhomH0re3LY7CYvOVAwv37nw6Hy3uHevhH6Tkw
 xb50hu/nkvL4NHsxyB22UKyQYZ+i/MZcZ3n0oWdjRvx48Ryn+pTAfTLEv+Rkx+MCeYNvb1KSb5h
 0Nk8a8XEJGWOiGsIwIjv3s1pfsZdB5fCZ5fgjLeeERU5tONTr93cNnxlXqRDEqfevbfIwDjR4sS
 +abu6xO6nm42Oa4xEo0EqqwUK9vrYerIFHTRzQUXxgAqAYq0og6DDBAlwCe5PidlJZpn5jk4MUw
 sz4j3YHYBfNnHv/ZHzTIllt0Zvq8dKfHu+D9cq0t2xGnFwYV6wU+f8HMLgsvWM9aCboWyBTtWnO
 tC1I38xAwVfxvJaTHl6TW1U0kcx7iwFBQLYGgN6NfUTTeC+Ig6hu/YoAUL6d2ip/D+ezi/eiyiI
 x7tsRa7qb+m6mFV+Gxg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3ebe1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QN4KUsGz3BfPxM-IDMAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084

On 3/12/26 12:12 PM, Val Packett wrote:
> These values seem to have been copied from newer SoCs, but e.g. SC7180
> and SDM845 do not use them. They seem to play a role in causing the
> "titan_top_gdsc stuck at off" errors on boot on the Surface Pro X.
> 
> Remove to fix.
> 
> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
> index 388fedf1dc81..cd4c40a81c28 100644
> --- a/drivers/clk/qcom/camcc-sc8180x.c
> +++ b/drivers/clk/qcom/camcc-sc8180x.c
> @@ -2538,9 +2538,6 @@ static struct clk_branch cam_cc_mclk7_clk = {
>  
>  static struct gdsc titan_top_gdsc = {
>  	.gdscr = 0xc1bc,
> -	.en_rest_wait_val = 0x2,
> -	.en_few_wait_val = 0x2,
> -	.clk_dis_wait_val = 0xf,

Those are the 'correct' / on-reset values which if absent, are going to
be overriden by the driver, with values destined for MSM8974, so please
drop this one

Konrad
