Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBE390601
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 02:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415123; cv=none; b=bcYkihxBr+v9Icp7OtSqgMtluCNpGfzEHG0O8EreZb3R6KtEaYdgJ/Ozngd5brZ1hBjzuWEPMKh/maNIhvC2WiZtmURk8H/bnkWUsSFAyvL91Q+I/r8tGYTAHhZgXhd8rzfoQ2QBagXTinJJkglQIGsDeCrFm0LcQuiXcLbp/eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415123; c=relaxed/simple;
	bh=SRU/RfpB+1fZ79mr+7JyftulpvMbC/mM4H+kH5o3agY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZBAL5/+nub1+++PBIVf5uxDmrOQJduseeW2vyn+LZjVRNYdtLKxGE2CAtf7KhHA9bkWZ5dmJ6lOv9VDghKBrPYVedR3g/e13rk7OBufBudZVIbEaHeo90QAFFvqPMh7xKLokNNqGNOxAag4ftcmsGBkCYiHb+IfzQO6lEohXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX1NWLjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIG8nern; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX1NWLjJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIG8nern"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqS0K3308178
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZlAmx41l+Z0wevtJKQosZFy
	ZSbNZXhxswy5WZuDcYY=; b=RX1NWLjJqnX3HjpwVh2RPKKh7pOHj8Pz3FKkg8eb
	s8vncGVpuNIm+LJbzF6iEubxZNcg4G9XvQ86DNWHREIIZswybwxSuh7ju/m5ueXd
	Jdfa6LmI/SIbBy9aS35uD3BedyLEo/2yHYbHwlitt/g0tsWNhj9SARZ5v2aYaKkx
	Kj1ZIlXc2KExvqKkc67G14TkMZXwbJ6doV8lRSfv1nC4bPyH8N6RIEmUCqaOUqU3
	Cuc0nlqBAXEa9ZW39MAMy74Ni+beEHfQ7ZWc0SoILiJGN5xAGI2yKYqLEDLOaqhj
	zyVxTXSl9hHZ2+bNxlEmBhlzYI4HYX6yixZDodLYb7yk/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfsv0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 02:25:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso23128321cf.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 19:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786415120; x=1787019920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZlAmx41l+Z0wevtJKQosZFyZSbNZXhxswy5WZuDcYY=;
        b=SIG8nernmrUhn4w8hOfsqE2ba44yio+1maU3eknp0UaqopHMbChAo+xJpdExLOTP1w
         zlAud8TJ1ypspYe6dGs2vRrCp+CrO/ntbn5zyvT+P6Hd+FyjhE35aRoyV+JcFjaRafWD
         VC6W09HQOErJApEG+UaQnTrx+b0OaBauQoVN0h/AzTv6bBx/2Mza0rmS385RgowasqK1
         u+f3vq0Tkj1QZekhkb5aiIwHmWOCHehLIw9Rbw/4qbOsZ3Zf8/0PkCJRln+ZcEefhCYj
         kG6JhtHcgp7zFHGHLMkW+86cvSIaQM0i5rZs5uwrrQzLJB5wBcaQC3Fp+D94goQylU2n
         k89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415120; x=1787019920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZlAmx41l+Z0wevtJKQosZFyZSbNZXhxswy5WZuDcYY=;
        b=QvYLh6J8vMYYnKgoYpyoL0JQVRw6hEISlgEyYUkOHHo0eJmZBfdVdj9z3F+dE+MZlY
         /d4XxiJOsV1sUQmu4p9XsZVLQJ5UkQ1hzGW+Z9ei2ZtNdG5Lw4g0xWkGI2FkaTHIvJY1
         k3319S48cu3dAamNoWAt/VMROtgNK235/qVCNj0gEllaS7uGTc9UZJob/NvhyN7b1BUa
         zUNDrxy/Q6aRlL/dPK2pfoj14rUUKaRbRMPLGekX08NMMrB7Fv0CSiZ9LMOew6FPDKJ/
         hQZrsyShxh75vln0f3J3KmP53ve5rkiEOL2GGxav9WNexb3+OKn7UMo/D6GGjlM7Pqb+
         WB9g==
X-Forwarded-Encrypted: i=1; AHgh+RpwJlOiFPRzi9BbZCnAgtQB0RCDSbQqhNett+5zbthlfkBtgMTbdM/LNdM6e5cTB+sDsavUF4CT7k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZF8Ez3qcwdocOh/vZnqxzIOO7+1712sOeHzlfAMzkfbFS0le
	a4eeAScJK7AERzRffUVWAx6bpmMTf+f6DMDUdGBlbHl0eNbIIYTlgV+GjjoWyU59q5eXprcTWat
	T+8ouQtmKCZ3QjkpUHUQYCsceneWlP9Rn2c8Kp8SqDy7VdkTGmAbDA/I7E8TjAXk=
X-Gm-Gg: AR+sD138azSFbbTcXfwM8Fb7vBdXU9cJYgj/ciyVYqQVR4gA4LK72P3bHHSKL6wNuwK
	WmMq3HZpMrw4ZAkw7Z3X+T3gGOOf1cbHMv0PtuPohg5IYA7aHL2UDOLdpNJCF2LZrwzmI88z77d
	lYGoWb/tgh+J4KwjIiO/fPcszLlqvLOKvkOSoZJeRswwml7Jz+xgyc3knsjNsKxzeG/GMTlndSQ
	G5r0dEEbMY5Tl6ihjefNenjdAgWE955Krdx5SeDB2kfHZLgBCcLWg7XcehyW4yI9a0+wpjUGsrl
	tU/3ANnD5ZxINfiDwPoslzsODDJWOywsVOZPN4E+U/44X/ceQ60GskA4LhqP/hpj/0kUoVDLuss
	RIkPhbr+TqHcmuPe13dWlu/JYM6PELOu/lIZ30N4aLJ2vl1Zm89CxJN9zeTLbZgejjduds7hh1F
	F1/JnkvcS+OQWB9Q==
X-Received: by 2002:a05:622a:17cd:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d58620b0cmr1248581cf.31.1786415120390;
        Mon, 10 Aug 2026 19:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:17cd:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d58620b0cmr1248211cf.31.1786415119968;
        Mon, 10 Aug 2026 19:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm27145951fa.9.2026.08.10.19.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:25:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 05:25:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: qcom: nwgcc-nord: Add video axi clock resets
 for Nord
Message-ID: <5xlwfx2n2tembxkynxeoyphvaxqnctwmg22x372y2rvgcvo3n7@ihmxokmircjg>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uMODXcT44-m7KFuuN7Ufs8Ya3F11-zXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX7gs0hNhrxY3i
 rxpIyzBPH2Y4N6bCBeF33dq/zka2Cu6mZQtH6WGgysMc4sT68hvBWHj59IQx6b3ltQH9pItrvuJ
 AgVpEIpgWaJlaDmVUzuDuemqjRD+YLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX+rlhUARjLPAl
 NTvGgZIJ7cVtC46F6SNHSZmpCj7hwM6VDQUvpSfTHl568EPSin07F2rzgjvjW2baz3BNocKJoAh
 Utd7U6dpcqwBnT24qxlpqXV2XuD0Lakvu3Ai+la8YJzMZE2VfWzmt1/4JOvp1WViZhT9lhn7rUw
 OVDHcK3CQ9A6au6GXsqNU5CJLM0S9zbR3n2GEFO74YK/4P7AGGa+k3m2vJDMjFbctwd55zA413N
 s3y/fhR79QzrkxNsK9h35RksPAcKAWQwSE5BB0Wn4b9n/wd+/cqFbeitdiqjaN83KfxgXsboSdw
 cM0NyyuNdabaevCllXYcah7iyxP8yNpWxg2EYKSxaRhLXv4GxijcPITAzTgQPwSBkd4a+BRmhDN
 th7wKFMwWEOgNO1h+iS4XC0LDydsiht1JL+lEoNK8UTOB3SueMNNZPEooqTgvvTlZ7dlli38Hb0
 UMrac6j7VQ0PkbeRIkw==
X-Proofpoint-GUID: uMODXcT44-m7KFuuN7Ufs8Ya3F11-zXz
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a8811 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-zE5Bsz_LXmV53O_SacA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110017

On Sat, Aug 01, 2026 at 07:43:53PM +0530, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/nwgcc-nord.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
