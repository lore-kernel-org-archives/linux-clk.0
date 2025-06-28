Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB11D63F0
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075739; cv=none; b=SKqtemyToIhUDTj0J2Adn8ZsWC3vB9lnSlQQn4aS1fl0m0INnHYIzdgTqaSxid3Rzrwd+qqFHdWh29tiYnKae62itTqCinnMouwYfyzU135Scmhcs0ZP2q0+m97/tIXi4su0ihQru8R3j7hhRpX+sImfbdDRj3v93EO7Ta9NrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075739; c=relaxed/simple;
	bh=Yj4HqbTO+hsJVkoO5tBN3KU0UwRywL0zRbgyWn3HDWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqWDDgWNw1rsAySFsfBDV9D2jE8uZ/P/Yd1nqaz66QZOUoDB7m4Uu9f5N6An8rBW8djjPPSSFaMSUgLGntK2tFnObZNAnODQTgUhrhL2K/orR1g/zREbE0agvuErwKYRSr9hQOvEIhtKg2hWcKj26+bP3EMnEeage0dInhBIdvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BixOOQ14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BixOOQ14"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DSYo024282
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=It1FpRXOceRECWa3Bwdhslvh
	PP0irZBQMnIJ9MHFFPo=; b=BixOOQ14Zw1BRrBwZSFhHjchS17b3drzrnaKuJh+
	jL+74BS+dkHcuuZ4i7GvJ0oIGav0dCPs4gqEE9tlYHuKCn/gCEO05GqGdUFpMM05
	OyELt0kTpE4DUa2FKGpaX2UxD7OnLKT8RbkPpXEA4zFfdjxmjiuGbK0ETQwbQLKU
	JYUBbXJCSU9DRUgoFaxxZnEB/eMk0F1TvlX7PGyW2+bKMfJz5vsgRzzFt+5RMh7z
	KdlezfBon0JeFO31AR55GFDm0y6FAr/ai4d1JI67WQ4k2Jzgv1ihxmpNgIZDOseL
	6gbHTebLZ4067njGpjd69rM0iu+WvhHlnHWNGbft0jIZsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa51pg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:55:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d40185a630so82699685a.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 18:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075736; x=1751680536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It1FpRXOceRECWa3BwdhslvhPP0irZBQMnIJ9MHFFPo=;
        b=XYwN3ZpO+QUvW/TqosQbwKgeRDqU4EFv0PDBvsiRgCEFeFoyOUis+0a28UyErggspi
         LrpGuXJWyIMBoHu/l9AuzsWdx0i5/4PK9UV43A62/vOLOWobZricbNqztb+b6bIw/OGp
         Vj0cis3fTcFOt6C4UzmuSVpdEXhWcL4FT+cWFcNmAjNybcrGl4xdHO/pYiQhr/fYp4S/
         J0asf3s3btITXnNelRW9ES9r9mdmzT6qSpUwRa/TWvn84+6JXl4RJrsvstpbQFAWSaYC
         GVRTVhcJBCC085nMUG7FbmPNJ8rYtlVsltAKITQR8lQ8dYuGhr/guv7xVzG3QXKgxWuC
         5QPw==
X-Forwarded-Encrypted: i=1; AJvYcCXAs7q/uI24om7CWL2EuLdzKVx0CffLZycmg7Ys3vQOTX/jAxkiofEZlFPIjyRHo/Cpjta+V0eOWoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytI7sdAdJKBbXdFQJHBTdIaC6dxZS6wqKSZYsQI1RhjFbvg8uQ
	sspwebMbygPLQRhvqxmmc6cmBKVnU4mQ4bg3I0tGbpCIhhgSjZ2gTrPQ+ZCEofJeuPQ6KRH5NoG
	jraGqtRJTnNNIL1FObX4KejDlaKOVSq2l+tsOQbFZ/C+p8kyYbGz7QUWduNwR7cU=
X-Gm-Gg: ASbGncvaA/JJ4E03Tb5YeylgRpQHNxZgI4ZwBEonpRPqzFMMvTGRDImehmV4ap3MUDQ
	vInw4m8oPZIlh+fWS8VObZqvJk4J7YW+kqxDgBbZHkMuCTSYTer1kFBXWbw303OldUAjQjbhyxX
	kwuPbppMKBOMsqPGjNuBSd1hqEJCm6aB3Ydoj5FuwTC8DXHpVg8OqCKj8cBl/Swx4ClVT+yn7Dr
	ThpH1Mvpy3CQ+U9+kiaXPx2uNo2z/J175N0DqeSwJyJ3OFOF/urL0rzzKLOv13hdGtvAHzQHFzE
	hkvvUTePWIcs042pKyIwfq9TlUm1YRxM+y3PR4sKU93DhMr1XxapwogtOEOX7pOCpsKh/pB40XH
	rQprWY0yltYnWBwaUpPw8GD/Ff6C8ylt5t3s=
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr871097585a.43.1751075735695;
        Fri, 27 Jun 2025 18:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtab+OtC4EBlk9U3wu7wzT8L0Rv1HTjySotQtNdoIMLlCUeXq6oWJfdAb/GbiKRGr/Dg4hNQ==
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr871095685a.43.1751075735347;
        Fri, 27 Jun 2025 18:55:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f007f7sm6835311fa.94.2025.06.27.18.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:55:33 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:55:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: qcs615: Drop IPA interconnects
Message-ID: <b2fpasn6ki63yxgtjuxpalpmdlqjaym4fjmzw5mupeifmxzrnk@bdfdnxfaqj5g>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685f4b99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=phXncWpSF8SbJm8Som4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: --ssAoOrWIiYrUSG5UsNOs-zNMDjYJRY
X-Proofpoint-ORIG-GUID: --ssAoOrWIiYrUSG5UsNOs-zNMDjYJRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX/bqLt1bA0fHy
 BTW0WVSelTaZIRsgpvg0onxNZOHwZ+AKj+JANtQA3Vp3aPkURQFwiT16nCxDIsKDkTiYKaYV1UE
 O5UcM2F7wcnQ4y8umFyhE5zz/A/aoNtq7DfZeAkU4JnRzbOU6Mcy81F4wPhdgdLNfJFGkjGYJMO
 lTggmJE1rre1u1fwsccom0mj0kqzTYZQKwaqTtO4UKaeq93175F19Jkd9u6dZVk1jjmmUc6aDwl
 tiS3cXQOUNTWDjVQbj3CIvV+MvfzuXjKrlQ4+QfdNqajzdE2to1Ktn/usTszFEsXz77bUxNB3Aa
 J6j67XWiQ1nz+4HyczehcWvhuqrp0dM9+rApqwPGQA/HQi8PWAjaffciCGXKHlfVjmP4rYhTzbl
 RQ4DBtOTTVBGSVIIdx6rmGH1hgeLHd+as6TGmB+CRCJQLsmPe8Kub9I0HB+qFMrTognRZ9eL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=732
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:55PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In the same spirit as e.g. Commit 6314184be391 ("arm64: dts: qcom:
> sc8180x: Drop ipa-virt interconnect") drop the resources that should
> be taken care of through the clk-rpmh driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
