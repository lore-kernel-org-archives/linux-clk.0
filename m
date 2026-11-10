Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303390;
	b=elUW2+zSq+lndovQZ7URm4D9BMAID8ZFbBD8+0+58ZgL9hm3ejV7kIO2YMY2UT6kM1ty
	 y8sDCQjqM/h/EO0W60rHt3qdz7XE2WhRylF38hpTijTyhyhFi3CZMcvaouSMaFZmh9GQa
	 D1XT9j/NvSkzBBkr5bc1ALxjCxdbEGVg0zqmplncDDmqqefnK6wxs43pz+cjJYTAWpZpD
	 M9pIdliIkcpDEZHWMzL6O/a8BHjKSS4OY65lKm6xSp7jI4HRwAAD4UXMOWPmPn2ovKisP
	 GVnDDrDHwtu93oGYBXrDXgWk9tPTIaC1FUeaq46AUdFmXmGwyngykjYPKecsYgmRkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
	b=BCwke2si/7E/dU7aVuXVYpmKKpQljH68bK6CLwRKzSVqDSorrhEcSi1SGobLju0fZw7e
	 X7CGJwrOhaZi2aah7VpFPnLLf4PwnyyfrrhaAWaqkInLcv1Wlym2K0YJvs6Ya6SY/4rh7
	 LExm8FS8GofRSTWkjsc9cl0MRPFgPlApFkov5bg9EU1XXecTp9IPfgvLMB04PeVcYEYGz
	 XIriVn1LaF3UWAO/MV6tAtDz3d+WTCxILhgVNA4Cp8uLG4F82mQfATGXQV5f5efYhhSlF
	 eDbuB8gbzy6X32ujJfz2PQRBxltsTuPcz6aNG0k+Vgnsa4F/zKhF6j+nZgdLKuqIDjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doosE3TY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8J0i9ck;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D8606A31C
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doosE3TY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8J0i9ck
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4gw1155019
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eovy0BMi0junUVcwtyGGPLU4
	5jC9y/t8YDWM7YGB4LU=; b=doosE3TYxAyIQpsjTzL4mo+qHKyPi0Jd6wYbWSJK
	Bp1Aob0pINYE6OPdB27ZaXG/QMfyVmOSsEpl5Y7au3ockepFUxAZ2uYU1KdU0S4F
	OBshFpKa7VelJ/JCp0aAuSxDdp/O5klgI1qzOBmPnV/rLPu86o4QI8pT1Ld6aY7B
	atICjMUZAUOfKCUPf9hQnySzKJWbAvsE4BowU15SkST8EsSFlhR14NDgBlO/2TaT
	2o7dzZZ2EHImcB7TzMn0k5yRhGL5/+BaMrNAbqLx36bqVvWEuDMenASo6LP8Xums
	QmdRc4+R47fuNuahIS3yxTeX5XJCC/xxRdqTPBFAUt7RbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49g7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:36:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so341240985a.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303388; x=1794908188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
        b=X8J0i9ckrqGqkMPjT1FJYbjXpBPvIbmZ9XTDCi8VS1Hu42B3zVQS5AC9GDn2/5OE+K
         rBtg64rXT34KWiJGbQ/mbYRfpFQHkrRgRJ51XBRiDM7W4T7YW2bKZmzw1IKj0M7uS3LK
         YRcCcZF3OeVpTb+CZWK3aLh4vqhJkbwfgHUWBLcJfBSK3L0CkeFvxJNZJJWWZAUKq+xE
         UtlPt/xa/Bz5bAssHMSur5QIOloqtPKO/qpb8qzUrUM5vfUSVYaqPgSSrkDp+zLp/u+i
         z6WBlnUVDJlVq1Bn+OB4YGFenQxgd/0CaU81N/5tIY6XlOqJUEpNC0R3bJg5gSUHgVWu
         EOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303388; x=1794908188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
        b=Gf0Wx4e8XDQCwX3BAe61Mc21h6AQxkmEhJQc17l/j7ES2cGkWl+RkXtKcEwMN6VgKz
         NL9NB1r0duRoSKQycbHi+0Twt3nxFKWpEpEy3q3L/bMSRaBNNc72voPK5Uf7pzHx4mKq
         4WErGrquzvFvjtGcIYJCowkLJDvx3TRmrhV6KN72LzAXyv4eKGcCiEJLdpESYWnq8aum
         ZwOq4aSGU/1AjPt2dLVRiGA1izAzJi2A2d34AewVjpf95d32nPGdEFKqI9ydUJr9sPyf
         t2zr+++bnSD6JiDV4Xes4fZJsIksJAwK0AiRAdhhQKycnyta8hJTkuR1YKKmfLC5lFbQ
         GQwA==
X-Forwarded-Encrypted: i=1; AL+hErG7B+lFcVylcg5hYdvE7nOtlETVUylcT5e/s4azuaWEFddnYT88tFfNinTKbxkPWuDBj5F4IubECsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MjeHPZ/xy0+zwxE33M3qwXKH9K7FgVgebZ7VkAk7PUP6UxNe0
	SVUKmY4iweIGB9Mtksfi9PqFxEiMfJtYQm/b7LF0vzppPYpVzWrCe8yfwkn5xOPaTgGQ5ggjEPu
	7gaBwS/jNGYySq8A0pLUUuBMTPFs/e1wKAGbnKrmpH/fnoqvFR7XpZxez7b68e1A=
X-Gm-Gg: AYBFou38rM2yuG3oL59pIexwQNkWyUjXiXsxbuRjRPR0tcMAaswBAl5kIoWWW3ezZKs
	WC8n2v0gGgH/8jW4XEM2QWpX2D+iI4pGg3314nxoS78U5UaARxBwDDEJuaOZJwUIVwtjbvqiPEZ
	wmHqe+N8PwM4A5pZUTqmDMD2puDUvNNxVZX17JhllrWyALFvmiZktVC5cHMmJAHlhtSt5oIJheg
	LiQYqRGTeZkjeftBU1icgWCDBWw2iPDEGKA0gYyDQr6uV/7ntCj8ApsJiZwPCvqzD+Y75i1NJeV
	h4caGwsRpTIaU6eqrfj1FkxNrKHH7wGAvg5KWkcgNx+SqaUzxZM9CPbowmk3gKZc8DvN4K+C6t1
	rAJktltPHlCqrEQ/O8PfGYWQ5jV98ltFchiYvJ8psahfspLlQHnEzAPWweELNCZTi
X-Received: by 2002:a05:620a:4623:b0:93f:1936:b206 with SMTP id af79cd13be357-9479f4296a6mr325187785a.83.1794303387795;
        Tue, 10 Nov 2026 01:36:27 -0800 (PST)
X-Received: by 2002:a05:620a:4623:b0:93f:1936:b206 with SMTP id af79cd13be357-9479f4296a6mr325183985a.83.1794303387252;
        Tue, 10 Nov 2026 01:36:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm4021245f8f.24.2026.11.10.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:36:26 -0800 (PST)
Date: Tue, 10 Nov 2026 11:36:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
Message-ID: <tvjdoqymeccvy7feynvozftobofvj3mficycrbgp63cicuabwk@q5va5dpwzvvm>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-3-vz@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107173621.3538964-3-vz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX2AzkIt2MNI3t
 SV7hpfh0eAph1fUcnbgAmkPRSgq6d98qvRzaM4pX9wPvmMVZ2tYKaVySI6+PGb5oDfxaL1Q0AiJ
 kxJXCWr/aNKAvYNByACwraBvF+bhpbI=
X-Proofpoint-ORIG-GUID: POXEL12UCNM_mN8CL327_1IlG2muW3AA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX0MY78ROsg8rh
 0qvfIaZ0pPy1TSjkxLyxD1BtUnAcJY56PJp4M+CmOawMimB7oFaNZUHLD1tdoGunuftJWhRjNoK
 2+AkRvm1JpQ1VIL7lCnRkMu7ReoDyoI31DqbnVBCbY61GcRkmTC6nZj4ETZ9Mwoe42Yd7cBQp/T
 ZooB+qSqU6y07iDIHAignU4KroUONT9JHkn8Uh1TItSUjNUoXPPuEraJgB6y+l3hQbCiW3S1+5f
 Tad0DL/Nt9PCdxi3gwQMXlc3th7udKa0m6e7CFL6hCMcr5OrWroIQg8SMCCeLuWYHUwTy+2gUij
 0bgTa52vv+zZBj0d6+BdT02JQoxAZIUyddSFmgKheynj0/KiaZEZcA35Eurm73YU3kyjP6wyrAP
 RktK7SNXk6uoxv1tQud8H2zVLfevlwv0coaO2qVzS1zD5YSspP+IxJ94v7BEUevx1zlBvnGenEa
 gZ7KeXhnaRZMHJoXpfA==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2e59c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aMfW9y36GBVf8kygzwUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: POXEL12UCNM_mN8CL327_1IlG2muW3AA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038

On 26-11-07 19:36:19, Vladimir Zapolskiy wrote:
> Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
> but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
> is not present, and the PLL configuration should be done by calling its
> own separate clk_lucid_5lpe_pll_configure() function.
> 
> Add a separate Lucid 5LPE PLL type to select the proper PLL configuration
> function in qcom_clk_alpha_pll_configure().
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
