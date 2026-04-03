Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AEC26CE11
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246555; cv=none; b=gg9oPQjGzYSZZSbKG6/eLG5vrBs7lYNYuNfdyHoR2NRmYAqE4S3F9wkV/NdZK/88NQ7c9fGvsutmnsQQNm0QSbhrOUMqwnRLVzfbiA/tG2OrIs5xY8hTAP8evCWzyLijkwL1Up1TyKOoalijxmDdCFFwrDNCtk0saCR9d93QuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246555; c=relaxed/simple;
	bh=crMzeAvRDKSc+oYzWKMBeU0u1eHcNkl52DqLw8sUBNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB4k5F7/MoJ6YApEVFM2dPiNJrd3tHK9WUeLcSfto48VEcuJmYjaTOcHU8/JighYdtD2HecCVI/It7+rIfiHvR/mFDu21nu8m4OLXQ2iv+vf5s3SB8p5qNs5nzLT6i3O9OCLMuPQycQ00I5ZxZt2eMjsU7kWCW3v4ulCCslQXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX62KU0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jETuYKUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX62KU0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jETuYKUc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Et7Pi947872
	for <linux-clk@vger.kernel.org>; Fri, 3 Apr 2026 20:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SBF5UL6FbQfto/4s8YknHPL
	hSX/uFdWPyfp8iHTzv0=; b=AX62KU0Sn6FDkeYtRGyaADed8cM90clzxYajwt99
	Hi6N7yFfwhWio5vGDSBjlfMMzMok1Kj6XFjezvhQb4VmWQTJY+3FMn230Noj92Ux
	M9DZkRh2cjWidCGlJzxwz0D/WqV1Qjiis/0czp/gxyH8mEV3SVux2hqLbNnFzjjf
	X4cV9S2ZD4ZQOiiphdbKfTNaL0YWzmahnmyYPCMfddobDqUac1jiWUeJQ+5A/maN
	OIKqP5CN40x2O0jwMIVJRd6KZQnNwrfUbwDCOSMs9stDfNeA4oNr7YvOq8TfiIOJ
	QfMCrbH++etGq91UlUynhfsU7hpnsWrVr2Hq+r3gxZ2Y7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfksx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 20:02:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-951ac31c44aso838527241.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246553; x=1775851353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=jETuYKUcx8YPZf2kpeevCrbpZ2X7WZu27r9PKyhV93FCkqFUqERh6mejjYhFKSgrvT
         TrQRjx5sjr8QWI0GAo2NsjBjA8AKZr7PaZih6LK5O3HEP4w17qeoH/5Joz+/VsoHS59Z
         uV2i7OAlcRVbr0pV+KJ2t4b9wr5JrZp+nwoMx/h2lpOFHG9Hww5F9fN9o3j5t02UaDEK
         uNOvG0xJgicPW0ryVTv39W3N20t625Ic6d5gQYLU4G3UBaun0tYeVS4LiCactDAS1MTb
         rQrdZ4BUewIIawSFX2PEuK3Vt3GmQpLYiw8R6/Zuk3lQg0CZkyHWiXjDlLDQmmHTuZRi
         MD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246553; x=1775851353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=hie6BVrjoQ3eBEu+hz8sCu/A/Xa/Xd9J3/jjDzekB2KGbT6UhJDprAJHOBQyfNv3sM
         bqGUMPBC4PSG4zhF1zxBavhQL9WXLSFsDKT/mpfyx5BdWpfqju9a9Ox3JAJrAq0FXnrT
         5hCtKfrLxSIhfJ7srmzGk+bVD3newu6dQocmVOXI+W5VQTVqI4sDGlyLkJOmfVwNHjs5
         IYpIi0l3qI/D1wohEGetIYX43WwB/4eF6WNUBupPdKSmbAsoKQ9wSj8ibPaRpfYEGh9k
         bEMGmwtnY0O4rtU22zzpgpkJirqahd4CoilnX+wHofGBa0bKgBkvzDNlJTD3+01kFKvL
         m75w==
X-Forwarded-Encrypted: i=1; AJvYcCWKHs1bogu2B1qgnq1y462+zhI358eumq5lUjB7W7UE+eXmP8YGYlfo2212Wg6AUyOyBRiGS6poED4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM9YwGXHEMRhj1+8DJaka2fLVkATFi/11vbVfH8mz4ZbwMMtz7
	/blX2hTCnOUf2r+o5+S4/Pj9qQAhGuY/R6ET6TvmzE6NSO5GZTe6NSMMcySdILdV3Ntow3cki2i
	RJfc6GVanXSchvrv1GVbRpa8I2tt5Dy3X4xdokEJTryows7L9iZz63tFYkqgLS9I=
X-Gm-Gg: AeBDieu3CriDfoC5r53HOOTf23B0CfZy9CfaaqgESyi4SyNfzqG+i39/NdpNiQxdnrT
	cFESyt8NkzYyi2HI5sn5sEFJcWm7G26zVI9NImEZyC5NBfiAN+18UZPyah3JEgamX/nB9KvpktV
	XBIH4X562K0OWKAFxXQT2q9F07+Rrozp7tZMHXZqF63hzUyynlxrrO7/jivrAlDWe9duomXkOPw
	vOZyO8epQQYhuiosTNL0Z900sJbVFJrvdAObpxCAYv8w4WJgUYQD61S59ExlE+dCRfVWG+0NFNr
	R0EbDX9OCvOqy4R9BOWT+O+u5P643bNVI/B6KJ3JJVEdG3NLu4c7CAB1AuUZt0Ii+g0TDmZp+ls
	6qbkBSQIo18AUyjxajE6xXpziuJc22zsHYaMSal7soqqeY9rbP/T0RZdu5fTveHLVf68s1bYLTE
	o06FEruMSqjzXzWqWPk9RoACbinfU/f9+KmwE=
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1470010e0c.16.1775246553107;
        Fri, 03 Apr 2026 13:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1469977e0c.16.1775246552613;
        Fri, 03 Apr 2026 13:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6033sm1700350e87.48.2026.04.03.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:02:30 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:02:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Message-ID: <nxeer7565nk7mcyqucak7cetdgzsueqpvvy7hj52al6743qcox@yvyb5ixtnzpx>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
 <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
X-Proofpoint-GUID: lufjFQgqqrnfeO1_PhjC550MuFF2ZdVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3OSBTYWx0ZWRfX2e6bQPsLCeqZ
 j3Ja2kSO6cMtUQ1GfduWv0pCsHF0S0eX3qtjwe1rv0YQELVUrSDZSsgMRBUq+DGBYbprC+UWub7
 1sndHMrDJ00VdJhDeCqWhjwnpRS39YxOfzwh1cEGy59zIJJX8Wv2pBvAmky1kIyIQbcm7/ph15E
 8oncSfmLzfASfLUgDx1J6aQvykQjVkZHO8VHD7lFMJtQJI7EM0gYn01IbNsE067c6HMcHO6v3Xn
 x01TD4bcBpdYftrwewbHRRB7M9/Bv8y8MVrSFtWCs3E4UxR5FWA243046HR3pROF8uf8SX4SuVx
 5J0U3oOVVyQkWFdEerrIso0K8Hf3aFgfwkN/8qKMFcblGZJ+FOi3TlEJ7L1EGVxuZgZBcLn1BO2
 3PN6yQSxMClXTyTzcPz68gQSFAL4TQiyxdIpnqpJyDClOBIf69ZKrcZLfF/HNHE4wCE88+dcDWH
 ZkfvbRoACwmyf3kFj1Q==
X-Proofpoint-ORIG-GUID: lufjFQgqqrnfeO1_PhjC550MuFF2ZdVN
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d01cda cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030179

On Fri, Apr 03, 2026 at 02:03:47PM +0200, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
