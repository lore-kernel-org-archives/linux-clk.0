Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391223B632
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908430; cv=none; b=Sggmprnd1j4wLyN2mCwmL5ypR51O7twazfTXzSfzKMHimAT/FcFNE0ZPPQc2+jYky3IDPDv5SgN4pKpogTEjCB9PY3qvT6P822GeXXRVd47qcpXh6Owysar9Cco9hSXSzHvSRD25JJ8qMIkMOSeEkFXkVDKSLTyoqm540YhK9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908430; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUJRGXKYccj2HXMjMOzbeHcZJdcDX3tDkQA/jpDfjUZq+gx9UuUrU1lfynOPIfgy1v0OzkOtaC/OGG4zqPQoErJ2nRsW1Y3+dKtbSJSnSaB+kIM3uTAP+w1CRZdJHNmYskz+no4SVHC6gaqAS2UX9wcdZJPwFycsSoCcQhCI790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMyw98jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMyw98jp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dHuQ025777
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=WMyw98jpN7dFuV9+
	Yu15OlRj+5Qv7PUFwt0BSU+6s6tZycYVWK/ruJYvkkNgbufHn3KH8UK/yMdoMt/F
	YQLO6mOKbEqbCWadvtBiTKhka5XR0Ad6e1evnoPxHSInZd/l/gb/TUroqcK0T8lt
	vuZn5C7x+86jxq+biDBWIlpqjHsgoKlEwbA8hRSDwnlrOt5XKc764sYiXru2E6BH
	OGzNVvMvQlxPQnYbD8jedvQDZgiwrEri2wLw8Qx8u3XXteytA3tFBgN2F7tosxQq
	CJ+4SnwmZM32zOuMBzpllDQWfMExHL1HZ32Fwcv8fwwOp8t3RFq+NpPwyMCguUp0
	UurXzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb7428w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0adca3d85so5925621cf.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908427; x=1755513227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=Q1kkGl1NL1hi95hYl3lcQPS5oT6MzpbZU4rz9SzpwCmuWJnSQjsQdAkRL+X/8O9O3b
         GmKQpHCT2HEiDrXnjlOo1GwyvC8ucYKHDURUu/evKoZOluEXESZIaaq1gxQYnwxVKUk7
         xnjtg5molx+yAo8l/d3b2TV1kW+b3ibjDICaHL/4f5QF3i4oQ+nSIKdOaZf5ry5rKRPv
         Jd9THPMGJb5oT6lRgmHSWYfQDtR3flMQYj7k4ypHBKyp4OeTkFNGnkquNSDtO1IWEmMm
         aIU0oN9AMU1oGfnLioN0eZ53qbYY7pBjkRpRwuEiPj3pA7H47vTQXYsJ7+5rmOCo3Sgy
         c0EQ==
X-Gm-Message-State: AOJu0YzhxT3cabZzBBOLEWKbBuwgq0UFVtvq8pQcTPajgzLqHFGr3Cx5
	vf9VY5NuyJkFT5UQzl/5x7p8JGExA72dM9kxNJuWjQfGUSjB0Mp21/a7wD+cxvbVwsAsTr3haPW
	NaKRzoQQxfjC94lKta0ipRQfFp0Nm8pF7b0ZiIGM+OnqleWtDhM33sBr/xFjkGXg=
X-Gm-Gg: ASbGncvBxQsmx/iY9FQMIFJ7UQkI+DJWqA6muzC4Hz8VPL7c7cuVb8TOCwoUO1sqOtQ
	3VvIf6mDtioL+FJRtGD0FPzISx/nY9hFuwlIBJtO7hhVzGpEk/b28XJcPMrqrWTzEhrsA0jfL71
	MwX5J87T4bu58rbJp4t/WUP70m2TtfzkmPlzHcjruBjHUeapw+kmFNDwFFGiycWVliZUfl0wynL
	jvvG2RNImXbqlYwbXApJWdqQbH0JejFZirmQRrCXM25UzLggqZ633//a/gF5Q0PfbFIR7wL1E8R
	DWOTuXA1IJYRfROhERRBKIYaV08T5n3c43ylFMwBP6qK2tpKlpdB76MbteCEgeGmMmfjhN3Nl30
	ZTys+aKpoEWh2P9NTdQ==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b0bec78c73mr59284251cf.6.1754908426865;
        Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7IhssFNIcGhOq/EGToUOu4T70RVm2dw0NQGyrObWdTLIgVbBy5n+ITh6LfbnZCeVTNL5pEw==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b0bec78c73mr59284121cf.6.1754908426385;
        Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:45 -0700 (PDT)
Message-ID: <727350ad-720f-4751-8348-15914072ddfa@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899c70c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5gHwRrxB2pHWH9p1dR9FJhy9S6NaJ5pS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX3Vv9CepXJssY
 gY7L0vLuGtmwHBhQBBK2wqidg9JQ++7+k841YjS7TQsIk7EjRPPT8zeoTeDVKCPm+WUDcI3JVcY
 PuSzdX8xo38H+OAFaEWiEZ2JAngXyE7qlX3YphY6ZR/g+2NzZ5zvYfTtW/WD8pKKBAyYw9iEigK
 TBv0YCHNWSiIrh0U3iGYkD+tLwsX1Uh4sbLAG4H3yRHZe4GPgZKfm0zkRbVfLCNW0h0w6mH5hHN
 NpG3oaN5sfRt88Q3K3X9ABbp16BtJio9YwwyC6FsgswdhP5LpO5LjEBY1J+RfHTf1h0ZSALVCW/
 FSCmaOLI5FcAp2gj6d9QbMyptpmvN//zySWxTCOTmsLOHBifOoG83J5uLnjkUMw9pgbsRn13azl
 DVdjtn81
X-Proofpoint-ORIG-GUID: 5gHwRrxB2pHWH9p1dR9FJhy9S6NaJ5pS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
