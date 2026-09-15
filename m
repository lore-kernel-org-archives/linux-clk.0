Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5284496D4F
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476593; cv=none; b=JpC4uG3oMLzs2Afse16N9t4ogbCLCCDHLcZXDaUoyGAJKqHCx7vqHS6m+ulxMxsIaLdViYIfBbC+ZCbKrQG7NxumLZIq66FqhLeuLzBWa4fdQrDJJCPpQjKy13IYkUVgf16HRi1sXbbXV+64242ca4HrvyuCQFWA9QBDYn+bO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476593; c=relaxed/simple;
	bh=g1AzAZkdPDHguXpNufhDaBNRT4BPES3gacsBP8AdF+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRYGk5s4rFIXhJiOJNRXcZOlIRzfGayZ4OZ83NtnzCub6SQnSWcByWTbLnvStvA9aZCmhhDRKNaDvypXnYwozWtWcM0JoWqQTOaFoNX41JCHpphyn2Gi7TBsq5xC+FwhdXrBgZ+oBsPg+gQLFTTFpB6zW1ZlUzuM2+VidP1sHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PF0Vhe9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcmGQjv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PF0Vhe9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcmGQjv/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h5Ub3217466
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ZiviBOWkE44Z/tDslnfzRoB
	pPcgt0qgNQY/77lDuyY=; b=PF0Vhe9B7CcCSegaFI0zub0e6Zim6M8zHBdQ50s7
	+LBWG9FIqN0STxGdr2QyiRfiZvdojh1vYRP8Df1SVpXuIlPGTffvivhuWqaL5w79
	BnatGRwi3hUaIjvm+8ru1hmXiXq253TTeab0P3e0dkuLCdafYPJjjvAQC51SMfIa
	bElGvMJf7Vz12tsh2v4VPUcaTQYJrwo1s8y2GHHFMj1kf+upc0tMryCCMEj1bIx0
	HO6xjOFvRto6b4HClx1icpwOaoegx4VOhgFeemxlFqXyNZyuJqkzy/0fPdMQc6MR
	6zN9hhZ6cUown0ZQu8Yge620j/hLzmc2/GK18bHd3ABsBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2gxxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:49:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so920627985a.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476590; x=1790081390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=XcmGQjv/7aK1cPlvN6CmrCOQiBPla6vJde7C/80mXCX4CN/P8N+OTxYBfUIGUoHNLi
         1kM8peJZTHmYnvlZInlzU0GB8DabQtFo0XJSpvd5ld9wzE4j50ui1IFUWm3d3+hk+hEp
         PWCTDmJjUu9v56mj0hWQr4iAaGSf3/yGc8LP1OAhWhtrCuBhw57Km9gFC00T+pgb7YL4
         tkd56d3bToAFC6HnrWc/DtbjzfUC3Z/rWMEgnZvUWrnUEDRgPIqs7k8nn6rFq0xqXhTJ
         38cwx9Twdao442yP1kw2CSUuCQVRZ2bbbCJ36TvJFgjWEspJ7N2jC31Pw3l0SSYjKK43
         dn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476590; x=1790081390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=WstT9pTxffUPIMN0U7S1uRhxUzUmYhRumB4aaEd0EJCG7kErWLNMtlMVcfGC980ghD
         Rm8pXAKTb9qVh9fGk3qC23TyDglhw2M57JPIVD/wbbMXMAAgLMc/NpFvRnoC2DEWqKKW
         rQsaHTc9ZKv0JQK7N6jH8M+297C5/dSkP1pi8RwdT0ENpCOUWWEnGtO95YrlacmqUljz
         FC2ocHNukwjURjDZVxH9TTJK58Ij+/zljYFgCtPOrqsrNmmouKTzShCmPlDty77zqNWk
         42L5WLeKdGu38i0I294bas7a/AtfoiIeKL0SFbIj832stMZJJZyePigfSLH9kZGggtai
         5D6g==
X-Forwarded-Encrypted: i=1; AKwUvByiDWRZDbStG1PskUcu6Ljegaz5Ag0YXxg7lqOx0JWPiKPxFJuipUKz+jeHNuJVGr0zkR8Vz6Brsog=@vger.kernel.org
X-Gm-Message-State: AFuF++nYy8lDFjWDivnFS03wGEpaFP8R+rFBwNhDcrOY8cJpPohq4Zo0
	qiI5FATMInwOyxw5N4ml/xDhNqcK8hSHpBcwcZE0qR+yEDpfPnruxTDeC7aoBb6fRN89F7RZc63
	QronfM2uNDeaC5T5mTQGSJYfiwrx+m2S62vwy4z88zmaxD+72EWPdrXOrFoFRk/Y=
X-Gm-Gg: AYBFou0bwL0z53H+xYiYO1JmUcs0qZydnsJiDaTkAQxBc1hVCW96KadB366fguEuQIm
	qEf3fqCaVdKtuNE+1fCO8OiC8QUGjymK1J+d+ExVhMb8V1CGKQA9MVgpfTvnVf2W2ARnpZ+TyJ5
	RKjzhuqa37vlYZrKN12X3BvKV4bqeigJiA4q9P6QTAdwVKiSQg/gZ1bJRj9qFA3q+sYZDcyWBM7
	sEiscRu0mslpsXmc4OElIm3pEGNK2i0qWtqJZHNDXIqblzX4BilFDug0PfWhY42OqDZ9zy4XL3S
	jrO63OoLo6YET524HbACIYig9sfr1PD2HdPSHumfnifs/ZN9DemHKOxfesnHH3dILJH4UD9eg7M
	elM9EfKa2bslvbQ==
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208810185a.20.1789476590000;
        Tue, 15 Sep 2026 05:49:50 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208747885a.20.1789476584805;
        Tue, 15 Sep 2026 05:49:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487072a93f6sm4893480f8f.15.2026.09.15.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:49:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Message-ID: <kmfzk4n6xm6bat2clr2ahka557d67vqqgkdvhbcj3lx64bfsyh@isumhqdfhwnj>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bECY5lMXQhVrcdtJ0Eq_mvJOBPOyfgss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX2nq/GpELJDe3
 UGg+qG5Jx+IArq2szrtVBJDU6DNTY3Hl1KUtsSnbWfobHwNp/Xh5UazZiXca9fO2OP0jNqEwhIK
 Rie/o/2A6e6RDxqrTZZmtECh0C99pL3rMvHXF/4h0cd5+aTfbtFuAZRch+eN7RIf/zK/2NsqEEI
 EfpUQznoWQFgI2BoCpSnmz2pWCRYQW3Lr9ddW2TQgXUMGHxfPUNyvmuj/8qfF+pyPEYwnekD0Nq
 BalgCZA6vGlQe/nD4rDLhkJuMe/MODt6hao4vHIhBOm9oxJG8PjsG3/2THSGQ9HsZhs/yErILoS
 trHr+45steFNi8rXcAH+idhlTSBi7S1Z5pEtrqcX2cE2r2x9owQGQdQMbvQ6naGE/yVVQrxxivL
 LPjRFMc4cs9ffzSQKMeePCvS8QueTaSwTtpQDGSd2yYTf57QbG/doiV62f+IbkAVjgwRtNUVyz6
 6zm/OjrhNMU5wFKaMnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfXysaDR1znU8Wb
 +2ts9ULSm8GP5oYWlQF3qU7bAaorTTG//uJoVlnMcR9ZMWp+n9TLXY/mzaRm33kua1T/M5yPpbl
 iyr2GRim0yitpcZB4/KOo7EgD0GqMGM=
X-Proofpoint-GUID: bECY5lMXQhVrcdtJ0Eq_mvJOBPOyfgss
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa93eee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150186

On 26-09-15 17:37:31, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
