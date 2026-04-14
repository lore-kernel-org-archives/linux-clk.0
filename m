Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17C1A9F83
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178093; cv=none; b=uxj2c5I3EHWIkoocgWTGXu51UjNcHrJOYNyHqEkOCl/vsFUaZh+tfnwKVTKLSzkm0qCcu/TnsyaSOWupdNXgu7WHtXw3n9/0oseiSN+nBQqRhZ8Nff+NyLGjeyNRNXN2UGmdJZNIlGb9/9ts0/v90JUK6tQfYoqXWKpqzgOPP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178093; c=relaxed/simple;
	bh=F4KrN7AxWl1zxvFjsxoDq7IgNFLpL0NQ0qQaV4v5U2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZPUBX3szg/PG6BYU8PdOxRJtLtfQx7/MkTuKRCh42DpGF66V3n1UGWE55RElAcEl8gTyxaqDcCunUkECtNe5RjifYq5q1EoQcULF2fnw9h+DI4b03PIa6haTK5JIuu0Aat9iD9H41L2J4B48McSfWxVOdECt0JKpjhVmm5e5NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMMyTpJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tgon4keH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMMyTpJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tgon4keH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBXkPb3425969
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asIz/goXM85jx8Mtx/IA42gOXbEjTcLDg3RNbVf0uDI=; b=TMMyTpJ0SSjVBYqU
	btGRqb3op5XUXdbZUaFI/uSd8zvCXcYPVd3/mmffHe8p8C8r0FtY217bMo9vQJPP
	QL2lW7JB+JtX85N4SMFL/iKURvd74y4ej7KLOW8Dt+3GebWPKY9h3PhR8gXYcuqA
	VWMivjyVlPeIQuBuffqCVQXtppfc3P95pEpjoH8EpsSrZLcQj+G8MaU4+75y+QqQ
	7GRfhzEIOGEE6azrOnT0QHtTO2nZ/WTRfGkZJSzSKGwTfkEhHsEa3mf6TGd49yIF
	/wSiS6wyNGOxNsnAwJ8Y/NW1RKa7TPFg1Ro7s8xekkqgFYBKr8O00eli3xYTdaa6
	opMQQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fb66h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:48:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d840206c3so9617201cf.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178091; x=1776782891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asIz/goXM85jx8Mtx/IA42gOXbEjTcLDg3RNbVf0uDI=;
        b=Tgon4keHXZeVc2JWzzxRcOBXbLaK49C7Fodtr/VGQITwdYfG77vJH/rsi/2x7+xYAm
         G/WTFRBVizAJ9C8ljNEEGW/85Qp1acpmy7NeTOom9MOOjkD0EGIBkMNDhp4bBIxxH2An
         wW07J0RbHM4rJuEU2Z+FP3PvJTOfKFDWM1verNvMG4G8ZLdtsyvVRPzmI0XcPhRr2oZm
         iARQEEftHh2hltXtA2Q2u+aCmCMtEvO3e76C2BqfvJhClHNMwpCcc8KPGAfFphvWDYVS
         0kl2iiwU5qyKDsF8+gPGzfT909RWp6jBKUZTMyVsn6EFUvNiWGVUkZnzSTqdbgWGAMdh
         sonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178091; x=1776782891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asIz/goXM85jx8Mtx/IA42gOXbEjTcLDg3RNbVf0uDI=;
        b=Vsxj/8vLy383nSyzDTwSY2d1E9ewo4Ry7NyNYkmcXyuvkfX9MvLMTcUzobKEfyf/hN
         On7Kk7ROwXEODxk1KBd+LXksX6ZKuBWYvo3WvGb23SheSoCc9yxDtbl+faHDv3VjqqDA
         Tx5qGQxxhdhElBYcFokTPq/MRoqv4o2d8C1b7vuyId9iNXDFTPsaAVP2zaSI/SVj2Zkj
         5odjGXTWzaJgVws9zycpYBd3LbGHRtYaiMuQmpUtRUAUh8kIRBzrRFSw9ypaztIROGvb
         xt1cvL2ttY9bT0fty284WgIwj8RP0UJOVSNA1fR7Jg2fzuVqu6Ywc56oRIMEt0qyfQCF
         kb3g==
X-Forwarded-Encrypted: i=1; AFNElJ8dGVcG1ksZfTlhuR6rwAtEYTOyfj+gqwUDxYyI4msylRns396eMddUxoyHgR0hbzBc1RMctblvqj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5SYtmNoAvR4PGtFLxFxne/7mlqL9RNTDsq+FL4gaJCglnqiu
	clpMQWdmVYWXXTzd8Cd8YnCiKUp/ivo2ZGs355GUP0A0Kh1Bl9tW190zJXnqLXWnsNSmsEWKknI
	nBdCJgLvgcX4TZZyzbi0IsYKDr6eShwJ0/r4uFJLcpmXdkhYkeqvgJaRZyhJpcSI=
X-Gm-Gg: AeBDieurTzeYyZR/SZKy2ka31//UJ74tEXekuj5SkfWo1sWzO0ici3S/DpDd9lNGh2j
	gbHFtEpjRnrW8ekCqcFouOtCyBURtJNPM7uryvLKvFRpmMz1hSpCZ8xo/kPinz/Z5L5LiOTHTI/
	/Zfj/TJA/ptJdVP7ibWzr9mvqSk9o1KcjqfhPxzeYqpmhXnOc7rmtGYAqM/YvTwYUZnY8nMeqxU
	UY4xjzrMu6vVYlLkeySNORZHfrlVZ9gO4OMd33Ii7B2/UaqN86MExb77lsdw+HPXPhp9nV8eSpG
	j1ptIE9FCun+aVw0BjGNBqag3xfsygTggipjkBn16h4ABmr4PhQItQXTWj/wG+470RgWQK510ip
	ye4oR+iKbhizmMJN/TJJGkqJ8sHg7LpIqay0NJ8F9vteX41iR4dFxn1VemCTFiKWGE7teoSuT5C
	02kdODRLKYifTLxg==
X-Received: by 2002:a05:622a:98e:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50dd82add60mr172439771cf.6.1776178090704;
        Tue, 14 Apr 2026 07:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:98e:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50dd82add60mr172439181cf.6.1776178090154;
        Tue, 14 Apr 2026 07:48:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm3291881a12.10.2026.04.14.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:48:09 -0700 (PDT)
Message-ID: <6b19880e-83b4-4811-aea1-dac6cbdce2f3@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:48:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
 <73196147-0133-4646-927d-dbe93c254286@oss.qualcomm.com>
 <a573a9cc-7426-4d80-ac9f-e084e72207b2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a573a9cc-7426-4d80-ac9f-e084e72207b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzOSBTYWx0ZWRfX+wWN2WHfkcku
 rQ/9VFs0Rc2RMKuH3W5SafWqzFFe4nrq3PP7McNXO13Cr8ysiYxC8UG7D0qVuvrB+R7k4CzKSsI
 f09G6UbVb/EQkasEgj59roy1KybkOS8CLZU+iU4Q4VARvJKMTgbcdouDYj5baA6UegqUxnFbS2y
 ElB6pDggAR0qULUXWvD4jA/POSN0llhdRj+zKJGSocyEDp5/rpBcRbKUriWUuZy2UyqyGqXMezw
 s8vlvgnPzgmGLIFgg6FfvaKDa32jaT1pz52YISUvLyyETL8GyXtth7fqXkJ023Lorfp60KeAFVq
 Ix6WsiY61i5mANsDkg1ddPj2hkGdD0OKGLeybKjfCrQ66/pDig39ICSpsw0JswO3IXSMqXe4fIM
 A/uFuUunRMYoKSbZF8qA2PRBPGlseTBwoxsr5/3mk8mO+ZttQ1M1YHRw41Y4PaGK+g/wgJpf9Ho
 XLuRxU7caDi18jMR5Ew==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de53ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Kn1p6E0Hg4E-9EtVOsMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NOLwyqhOdHAHzGpmk2kupjqeBSAqEjSG
X-Proofpoint-ORIG-GUID: NOLwyqhOdHAHzGpmk2kupjqeBSAqEjSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140139

On 4/8/26 9:25 AM, Taniya Das wrote:
> 
> 
> On 4/7/2026 4:59 PM, Konrad Dybcio wrote:
>>>
>>> #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h> @@ -61,7
>>> +62,15 @@ MODULE_DEVICE_TABLE(of,
>>> gx_clkctl_kaanapali_match_table);
>>>
>>> static int gx_clkctl_kaanapali_probe(struct platform_device *pdev) 
>>> { -	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +	int
>>> ret; + +	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +
>>> if (ret) +		return ret; + +	pm_runtime_disable(&pdev->dev);
>> My understanding is that this works because we have more than one
>> domain associated with the nod (so the generic code that would
>> otherwise enable a single one so long as the device is resumed
>> doesn't apply) and your previous patch ensures that after probe, the
>> clock controller is being put to sleep, right before
>> pm_runtime_disable() executes.
> 
> Konrad, by disabling runtime_pm will ensure that when GMU is moved to
> runtime active the clock controller is not runtime resumed, which would
> prevent the votes on the rails as per IFPC expectations.

Right, so the burden of only accessing the gxclkctl when it's got
power gets moved to the driver (which patch 6 assures), got it.

Konrad
