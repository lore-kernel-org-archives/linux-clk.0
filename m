Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0E225403
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124454; cv=none; b=L0Q821Bi6VMRrq7kI23dTNjexs+Z1AAZkjssk8aZN375eJcLvjh2yaPVgN8PF1iBcl9Z3+LNE8fYMpbD5F/JSL6UFGFNVJqvJf+m8heLBKkATzBiIcuVOlMfBpjtFm8H8CqIi/oTBAHZnrF42AEeHBjxIPyzy5f+Qp/vWZzKgGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124454; c=relaxed/simple;
	bh=/3S+Sc0qUdx04iSana84C+LKlwW7PylviyD3NbYx6GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhL+ns4UM3Eh8kbDP8W1PymeaNn072XjLpjZJieVeyrDmXIJiLjDZ6otK8FMuteczabFmZeavNnSGZKSn3is1ssVn15haCOTuPshtLiM15atsFS2Nqo1/1rzeaLkkKuo9cjHF/Tl5PLz19jOercAPf++3RLuYkJzkUIRLbrkM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwoE7EXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cviJ88uK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwoE7EXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cviJ88uK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPTXc1019188
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LpRkSJiIILmsxhLK0DIvM97s
	GwfxmQw0i+mZQB/ozg8=; b=jwoE7EXPgIU3VYQYBRaatIdmDV5wzTJ7CwWOr8T3
	I2qHaoEttiXBVw5nL1qF4MlcAToVN7RNUhEf0lD0C03KOWE1T3MfyNOhuTNWkhm+
	Rip+MyNxPDwMM+iB12yj/wwpnx9/NNoqSEompjxF6NO2Fn/Ah2FnH5JRxj7TxOip
	RhP1xTPYp6l5hOG74aOMJ95wC/TwRCL61YbuJvVxGQsh8/XWUA4GL7wAiLJ1c8BT
	pcpuTIrA3936pHTZdccewA9ZGMGY6qzQmMpxqJGWcS2DEslqY/+/e5qm8KPiEGYP
	GV7hkJpb3VaFjTRc5Grv34FHvh+5zEYHPTU2QfShUDulrw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj24u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:20:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso13162736d6.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124447; x=1783729247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpRkSJiIILmsxhLK0DIvM97sGwfxmQw0i+mZQB/ozg8=;
        b=cviJ88uK0FnLH4C3cR8WHlJCUlfw+FiUpk9e8E31R8Vvhq7eUTYIAj1uR8FoRn1FTh
         z0BZlORsfSzfIt5BD31AbE04QSyRE0zANr2ESFLBSaQEqN+1rjrjlh7XBfL1oS1Zj5kw
         NLXYT89wVNilLu0Tq0XmHBO19RW3cmHB4Cr/Ur+2dZfd+s4Edvi5Fu+ROucfYLjhqZQu
         3maajeE9Gkf9ZjRIJyCvyQchfzkTuDXNPWUt4DGOMMSXuzT9V3/7EdJRHDCY56My6dWC
         nFpQ+jeE3EBol6cmtVdENwUU1HDIwG0LKsUeED3/S3kSkdlY6iqmTs1dUHY/NVm5uhS0
         To2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124447; x=1783729247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpRkSJiIILmsxhLK0DIvM97sGwfxmQw0i+mZQB/ozg8=;
        b=Dl3hR1htwMl7D7usMmO6zbX1gE5oxFitjMf9PrWehU+1WO/vIkRmJnX6JYyW322WNd
         z1GQ7zu5H05KJhkDkKA5zC0hiepawX913mT7C0csCYwNBrHlEzxK91G4rq6jfvr28Buv
         8pkVoI7wHo96wUb+OZ3KCW3Ts90k1QaRUS5bLXbwPYXsNRpm7e8fhQ3/wTNRNLXf425T
         f3JFe0FzPQxNQvzu/ntRbzNr1+WJ1Rd6Wi+3HKyTZEWKWfY0Np/plJgJRu1KqDbOq/TR
         Y6e7NqHbhJybb+ZfvzMFgzVs2fmV9OtjvVlGsnjZMQxCsnz3nyDZ7fJjyEtimNJrLdrf
         BvMg==
X-Forwarded-Encrypted: i=1; AHgh+RqMmZ9W8ScvPl9arVcNMKHmiqqIPN6Ga8wspGNWWW1K6gTDrzojl7qFuj+TAT3GkXbhYJtHDHnWiTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydfBB++UJB+7GwxDREn51oj7Wq8zcBnBYGvHnJM6CkpGwoGvQR
	g+SkMdtBD9x+5wdclfKcgtwPHgbtE/QUxYf3tztnd+kQLlTJg9DluSS2D7KaomqcYnpYlBuNweC
	S8M/s82ta035qHEQZP1bAKpxAGPYMndykJEhNxjJY1pXEyO1aRNBwgouHfV3rWH8=
X-Gm-Gg: AfdE7cnQDK4AMj2j80fqdxHtnjyWDm+ZqglZnLimhynmy3nFU1vi59cKeCsU09/uYIp
	it2xmJmg5OfJNfBV3DRdtyQ6dY7okhl+403LabM7ia6oTWy5C2ugXvsL2YX8sjSd7sq15pE2UYB
	fhpEFCrjEn3g0e6sZfdU/UhKeJr3KR9lRfiLMXyvrKFMCL62LEhwOGOGOap4LRp7qzb4x4Pml+S
	gS2RURcYYVSmRgfMnkXK/N85nge9Of4HnXCBd4ikXN3Wd2X6tyIxn5wXG5H2rEH3LYaN8/84Iri
	mlm31lbYVW2q/+ikOYk/jv89wHpFJ3ZFItGnT5HdMXGzc4vqPsykozYfW/6xj1sO3tspMJIlai7
	lzFxABfrchPErHXzM5mlU2CSM1p0MvSsgjihNn6CfvFPELCRA/NGaEgn+DtgCE1t9d9PUDqk0FX
	3CM6JTy6zqOTdNdBJEfJbz8Fqb
X-Received: by 2002:a05:6214:27ca:b0:8f2:1d46:a882 with SMTP id 6a1803df08f44-8f74ca9fa5cmr20352836d6.0.1783124446680;
        Fri, 03 Jul 2026 17:20:46 -0700 (PDT)
X-Received: by 2002:a05:6214:27ca:b0:8f2:1d46:a882 with SMTP id 6a1803df08f44-8f74ca9fa5cmr20352496d6.0.1783124446281;
        Fri, 03 Jul 2026 17:20:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm865446e87.12.2026.07.03.17.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:20:44 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:20:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <kpg4pwmhu3liigfu5mim6wzshp5swmz4wsamapw2kswvpxlp4z@mgh6rlkkfog6>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXxSXQGIS4iq64
 GndWLYzaycBf7j53gZWeFxNxt8YAVssDArAb+xK6vXG1BFyXdeB7tjpI11JOPj1vKl67zcFWmCL
 CV3+M28t+BgDWmoqpibEF/maOuz5ztw=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4851df cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=244XV8jIjgl5S067L6QA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: AezdpB6jB3Bqm1UDVm32JpclG4WC0I4V
X-Proofpoint-GUID: AezdpB6jB3Bqm1UDVm32JpclG4WC0I4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXzWSzYWpfI/Ux
 jbQNcFywyd3/6Aq31Iv3y0qm7u4q9eYSMlXv+MMavYt+PYGt4FwtLKDRBnIUsGfLew79JFUDG8w
 jCTwS5uPbhHFWMnkcgxT2sVbHnK5XfI+7iiyoxXw/Xk9XxgwtbvYjoQGEFk1W+RMcswPlF6cCbc
 0TrEtq8WFHiIUI49l6fb5QqJpoNzBrJqbT1aPjdcUrFcyZIiZsQHQ3HBmPNzSaJoBGtd0e1tLuC
 LKGyKWByy/MJQ8lQSoKdwhwzwXgJe/ybT9zbiAhyxrj939eVKrcMMpydYwyT56DheorqP139dQK
 QoQglFD91u275DFN4tTd+2N/UAqsHXYAVY/Mn5xHG9PnUDBj70573p5Zhl7oPS58+FWLMnsi0js
 WQ3GzDrJ9ccTq9kvS7RW8xZwQwTCI2TH6212bu41gdeJhimw47pcfZBmywI2AKV/Mm/TUchsXdf
 rtYst6cif1MVX2IfL/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:35AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 50 ++++++++++++++++------------------------
>  1 file changed, 20 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
