Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D83A7F48
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559111; cv=none; b=QLabz5R2MZt5wTZmPSwceCb1ghvY00mzXIcJjQ/KyV6O11ggP9vrtfn3VBwZfgG99bey0+WzODmZKwNIE9NEjgJv5Sm/hxtNuy+5k6YGHfGZA9DYeLMQ1SzwF5Mpmd+Bv48UuipXJZ7BPpDbvc8829CnXl7pB440y7KeYkP4T1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559111; c=relaxed/simple;
	bh=+e3Xgxb3LMzHFlTmYDiN7cTxW7223i6Wfo0ZsK7TIiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a57pWawcb4XxjduGrg3MUW33pjnf+1eEsP/+MP7dKTrUsrbxEi4lNKKaurAeoS0jrCcpuNtBrsrnBeUXayR8U6Ui5Fxk4sCQ+xcIHOaStCIjYQdD5ECQa8l0XsLetryMKCYY9xvS6iI1EO9XwXS3XwLk/KyfShpa8ptGecZN3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlyvvyH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XO1PLuPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlyvvyH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XO1PLuPz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RHoE3067025
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yJFNTI2OWzi1gI7SQwWtogP9
	F97USQ9uOEOKburO9Bo=; b=mlyvvyH/Bua/Oy2/uU+5nW7r3O26o0/IRCUIAQV5
	/ySJwr74ILXExQoa+yAPVHbWMGp4WaEkYch9C6yCT+cpHOpQOPZoD0hJWDvqic8w
	qSE2huX+unzSoUm3Zxf/FMusK1uz42i/v69V+KANxq/eAF0CFi1sGsov4+0BC9cw
	NDeSLvQpTEnmuj1qw3xk6MavsA5YJOai5/vDIkr0kmZ45ChOIZcvDhDb+fqwRXW+
	L7zY6p52W8KVSNyKbmFMrik9tXraS8eayzGlDdwrqatcJwRBqSdxwxabrAlaARTE
	HCh7TdRJpYZVuRA/YoTZx3NNACRyrUtCVBgSqOsEj0N7BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphkyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:11:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so41241611cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559108; x=1788163908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJFNTI2OWzi1gI7SQwWtogP9F97USQ9uOEOKburO9Bo=;
        b=XO1PLuPzTR13mt2+sgA5o/YA3O9pYab1tWxN1V3a9f1R7QRf6gVcWzSj4n13jSUaAw
         Wsjw/THgm+XLjCQ3nSVx6YwcpvSDTeQVbPnXzL73qzv6wtwBH9wDxXtr2xQfb9QKoyeU
         kwgEZy0wMSXIHV9j6G8p/0Zbg2w3DTV08UPIsKvVCRwkF1pMQePe/2AWhGwwYcFCv9xg
         LDFoM69T2K8pU6vppJl3ivRoYjZKlYuSHZnd5S0V+voIt8W8YNT+QIl9APXG5Rl0JLlx
         n2o3K0QmNKGaq73MsfJjcIVIL2nXkin4A+FOg9qW14aSaciZ4PsV5Iu7gITpx8wotO7c
         RX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559108; x=1788163908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJFNTI2OWzi1gI7SQwWtogP9F97USQ9uOEOKburO9Bo=;
        b=jXc5W9jsrXHEbizaWkE0+liMt9XT3bTJ4tPZ9tvcNLs8tY2zGpSz8ff9wf9CQ/7lXk
         WStP/v8q/F3XccT2bHxm13PIqzuzBoD0fmTaxnXS1F6DsAFwSCu5ba/Vo7uqRlwFDldc
         Ha5vTsW5FvmjHCmeWKuVT/72dltJsUCgx47/S9ACCYgZ1/0adv9ttIS/mK5+AbRD/u2P
         nPS/AeUZeLf3I75lRBx0LMOC9r1zzHXSykbaBBtrPg6qH0SZ+qAFBe43vkLsoDyryoI8
         oL9wvtC7bkETA0kGAyYtYuY8ZWJPLEJ6cIxFjP371jbfvpC5wvCGbS37wAyOEgYR9Ey6
         Rt9w==
X-Forwarded-Encrypted: i=1; AHgh+RpDywq/Ur1Tp3qN3Lw1rOxPXZQMocXFw1wkphYmO7FNBbOmUiaQXSM6rwGaL0YVQpiuOMgAr/HsZgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kW4jp2LAluk+96oK4uVdAZZaKalqDThcxDkfo3rNcPFRJDbW5J
	QCV1FEKKq+ZtyiCLDSIKdWP/xFooCv8xYL7rWtDZyXyrssyskuTmXYNiDFgxveJLCHD5hlvQlxr
	KLXbtLvIsbNjIURJDmZ7zxRNMePKYADsa4j2X/yQu6fQDZcnB4OgiAIDDyA443aw=
X-Gm-Gg: AR+sD12LPjxH/xWovVf1hyO0lPnzlvPe57G2K94F7D9cz231vM0MIENOOtnBVQJ8/4M
	jYpylHQXOFGAl+jiu4OLfNCFoA1laTeAcPKQbSmM9ekJdBUKzLLUmuqt0d6gb8Vs34mRw6YM4St
	urW9Euhnk0LagoOmEjsnZSFDH6Yl+NS353jVNMgit+fZ4umu3uRAj/LF7GyMtTVyc2JTX7RrAbK
	ZMCQRkUVtA6krJEu83I+R0yKQJiCdu13l9Vecn170gZAiFqsj6ios/FaIE1A5+NMH+PgvSC3lAQ
	nTdjT7/P8DnCdLCjmsyc315YSctrCAwDay83zp6lO9f9sAYDD/1g4fQs5nofBBTHI0tryO/IFuu
	LSRNS+QXM7U+YeSk=
X-Received: by 2002:a05:622a:5810:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52de307be8dmr327017541cf.13.1787559108281;
        Mon, 24 Aug 2026 01:11:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52de307be8dmr327017171cf.13.1787559107817;
        Mon, 24 Aug 2026 01:11:47 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a905sm1281575766b.13.2026.08.24.01.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:11:46 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:11:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add EMAC CNOC APB clocks
 for Nord
Message-ID: <atahvswxprmw7bggfihchccl5pvmkta6d2fpsadmnldhw3wjuk@chsmbftw4olp>
References: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
 <20260824-nords_emac_apb_clk-v1-1-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-nords_emac_apb_clk-v1-1-290767386bf5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX047DTOJHrxId
 SQUXf8PbVCToKYgpEBoPQGrk7edw1m+vYzXXSgOTESCTks0R2X7XmxdjzeKFxk/tCxqxomJn4Yq
 2XuHQJMWP/oS27xkbNi6sWR8d4QF/XNxKt6J7R6Er4Z/DdLiWxck35MsoCZP1O3ygPJkJwk3I+7
 tERqbk36JLJS/PFfZcd6vsWGc4YgqOpJB0E9gfw0yx3lrc7UKJMihKck6P+DlaWB7ET89D75NR3
 4zgXY62CXAYtEOMNTlvJoG/LQj8dwC74HwG5XKX9gXwbWoHbf2UnfJ4ZA9xsc/aNyaBUA2hXL3A
 29LJtSIc5mY1FI2kq7dj5Yyr/VDcezFWlEwQ1+Yqt6TQsvxwIKIqyna0zqCya6mUkIj2l8ILyN4
 Rve2AOSfM3gbwY3PYovloVBZcfzjLomPyV68nBIgcpKHJzRRoc+YZllDQ12x5KFyvArh/m43S3G
 6Ik629fkbG7QxMXLg5w==
X-Proofpoint-GUID: G-a5h61puBbbbwfNKVjcWGK7euy9Gylf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX7KnvzjPwmsyT
 //mbtXFRQ80FheXfYTRxAU9kHkZLNaSQiOxzE5BL1H9ARDtx36ygv1pJt4D1a7yvvITTjHFBMtR
 sNRthIKXpDzQPpRbzsrYuPO30Y24s1s=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bfcc5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j4fkHkYekRfnvDGNaiIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: G-a5h61puBbbbwfNKVjcWGK7euy9Gylf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240071

On 26-08-24 12:23:29, Taniya Das wrote:
> Add the EMAC0 and EMAC1 CNOC APB clock IDs to the SE_GCC clock
> controller bindings for the Qualcomm Nord SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Fixes tag, maybe ?
