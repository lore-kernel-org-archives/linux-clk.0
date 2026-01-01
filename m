Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD521FF2A
	for <linux-clk@vger.kernel.org>; Thu,  1 Jan 2026 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767293745; cv=none; b=BPk1pJPQlaqemz99mgwqOKCcVax48VaKXj3mU06Rdu93ssMfYYFHVORVs4e8Yps+wtH71pTzADnEsxqHdueWWgPjmytxjUGLRVdUQjw746nTVOt2wvzc/vyIfzO11ZCAU11Viwd195/RryVkY7Mh9OEoeVxKE5dmsKicE1FDS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767293745; c=relaxed/simple;
	bh=BsHbCL31zaCsSjy+gR/aV0LOVFxYgDWTaTyqMVziIck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBXjffV2HgS9PfNf9Gz65VqGXVUxUcx9T2hmSvNESjFw+bPt3c95esDrtoE+Ui5GJuhz9gguDDaRZcO8iRiaChBHyro4eu5vjl5yohyzd6hsxPW+xsS0Z0N9EDB16fXCZVQVdnvxn1yR3l6hVEHS5c9e8H3YqFKatHmxPooZiOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6XRqEBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkDp6+gB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6XRqEBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkDp6+gB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601IXdTs1745026
	for <linux-clk@vger.kernel.org>; Thu, 1 Jan 2026 18:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mJDBD6C6FOpNftcz8V52aQRx
	AwwFr6Nbn/iLAulEz4c=; b=D6XRqEBycoPfywrFAJMOwk0Td+BVQj6fDUJfxnGS
	R3ROIporwU3L5GF5iDHGxOWrZIN1qZTLysreBXAyBp2BX43nWUDLwGRQmeIlYdqH
	5Z6a28TE2AqARWhtHoib6vRkDZVkKY/XzaEcGaOLaZmiNcPTWx76ZUrs1TP42REV
	TPCKEHQLq47czWMkWNWIulVH3P9APWdVdYlL1k3iJZ/WEULiw9a7bU9DwFN1BGoA
	SQ+DsGDQNEzOBlne2OzWiWOUOF1Ww4EI08YNPLAAgXGk5ohX7C/zizexcL2Ktttl
	1i95KkjLxPt2XxZV1iK1VFNsxm/QUJYqeHPcgxLrIUuEcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v1wcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 18:55:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb6a7fea4dso2667048285a.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jan 2026 10:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767293742; x=1767898542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDBD6C6FOpNftcz8V52aQRxAwwFr6Nbn/iLAulEz4c=;
        b=BkDp6+gBegPOL8jynqa+AcKYjYMif9bEtspAEuP9Tc/idGOuTPOT9hQ/A67wFHcE/d
         wNhmAVQkSJA1+e+QVlrG849ciCWY/KZ6Y60naEMYDhgw3trbEg5brol7dHNJU0KwJMmZ
         WXyALzytQkzWEbGQM2ZOVgUA5oZd9+TgDRz0bLjMBgmpebs5dVDcKzfYkn7WU9O/52PH
         JPBCPKJQsKNiIJ5rIaSQnhOX+VuOo+SCQXhYwtD8JLtEiVMb8QnHONbPXKj+lUr1YBg5
         5zzSI5UAq7J5d1sKkqjuOwb4W+6KOIqMfkATRNtpcwYgYDuri1VF1Ui3my9cm7orEtoD
         KVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767293742; x=1767898542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJDBD6C6FOpNftcz8V52aQRxAwwFr6Nbn/iLAulEz4c=;
        b=cU8MUc747XkzKeGyo9242cVKkgTMDlnbK3hUtSJRFZaTZO9pvyGmFigdDf6tfO7zE0
         CAmUDJbrY2C3kbTmNfDXacIewpDOClmcyHIrIFsGaVkfKX4Lw9GHKsMbwRi4s9Bu8GF9
         PV4SLTIvdCfDyZwNZ7qIUs4mz9iEJsV1SYRRuUANu16UnF0GMrvFj3C2hCX9A3cax4cp
         Lwsd2IlIKxODAPc7lq6NaFrQAu1eaQJZCqIZqRqjk/iyShLNF52E4SJWEon+uabAs18e
         q8Vail+o3BXgoS96H19OpHPMHPpE33GlkQKFhiV0diA4U8RxbDgte6DAV+PsiSobvfky
         4Azw==
X-Forwarded-Encrypted: i=1; AJvYcCUWsNYR7JsHJ0zVsUy6cUZmdovQH8omeNxULJZEz9vh2KhzvPFAQ3q7Zc0TXEzFrL/ypN+mo5rpL2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykffqe9D8m4CQDzn6IGnJUFFEJLeOdMNjmgmQwoGA2ac1XuUNj
	h3BIh6VW8YGBexkX+fUUf8BgvmPHY7F+A3MqwkIkuMA5Cs70gsXFv8Yeqmsc9nMEWeLpbbuee++
	MiF+5jiNa4wBKZf8im/FUoVSW4biR8JApeZ3CmDBtaQuR7jL+y4z3nwiJsWNnkpc=
X-Gm-Gg: AY/fxX5AqS0e3DNz3lG19bTcyL+2p6PP9Kgv3amELFPaLL+zkYZdpkNrl4N+HO6J+Wu
	mWDW5lwhApKUeHkSCUocKv7MLIJBWm7tAiqhK1ISEv1c0IFRR/mwKB0sNswv5shIE4C2UmyCNLk
	opiNGBjN+KyMsIuat3gJ7Iv6Ahzm2u/tkPMipfL4oDEF0bnGQ7ns8cYJRPzcXh4PYkKxApWMATG
	797HKh+yuExrUUT9RGzFWASAHL1ejwPysDjFnuPZRKgA9VnNW0nehQRPIdIxp4hFvX4XEJYJkJ2
	wMEpUMTNiS4oRT7f4+ygIZz3AHHDt6D7udD2sDQDg+mVn++wNO9Y6jm/bSEn59+iGB04WC7Z50H
	yyOsji5IMjz8fZx424WDt
X-Received: by 2002:a05:622a:198b:b0:4ee:2074:4b6e with SMTP id d75a77b69052e-4f4abd8cc2amr520843891cf.45.1767293741749;
        Thu, 01 Jan 2026 10:55:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMAbbN36NDUCpPhQ3JWoVexrYcy5eDxCWj72SmBlpn3w+//Rky11IVt9UffX5P4zBC9TQvFQ==
X-Received: by 2002:a05:622a:198b:b0:4ee:2074:4b6e with SMTP id d75a77b69052e-4f4abd8cc2amr520843631cf.45.1767293741267;
        Thu, 01 Jan 2026 10:55:41 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm82585080f8f.27.2026.01.01.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:55:40 -0800 (PST)
Date: Thu, 1 Jan 2026 20:55:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock
 list
Message-ID: <xoehtndy4et4axedhpeeqhpfph5jom4jqvl4mrt6obnv7azz73@53kxqndkysae>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
 <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
X-Proofpoint-GUID: WB4_BelxKwqeiEUdKgNRZFSDJfk2FkW0
X-Proofpoint-ORIG-GUID: WB4_BelxKwqeiEUdKgNRZFSDJfk2FkW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MiBTYWx0ZWRfX0QlPj+Hu6AIN
 Nw8yZrKTeEK6TUuIZr9jxfdJ4KYvu9RZ84s1SvPznH/FEIalWl+j9i2zuuHOLRI+bZmSIYT8WYV
 tmF1IcB1AaxIRsgUGiIodBixpPxXW0yKnn1ZWmFQW0q/ksL3mbPRb153eg90dT/55D2KvwYGZnb
 97qYk+NrZbMSKfbhQgcdTtNZ+OZ2kOWUSwG4+i5mGYSNSTh0/CrAUVUbWl9P9lkcd18dEzcOijZ
 xsLVX0HnU2jvtenIDGub/ND7bWf1hUZWSxCVnMlpjUbrc1xaFBADlsGBTIaArG1rQNbsQG5RwHP
 nGYVgfVjxzIbp1s/mtwJD4ElhmdEpzpWbo6L/Cof1T4S0uO7TDcQMP2+mxAXvgWfyCfkmzPg6D5
 RfMp4Uai+mmngv0IdWhy8d1R4jMt9FYbV3ccsb/+hc4TSnnZVk5dtEyBgKbDZqmzySY3lSY8b1S
 QEgBhNcoqYWfYo5EdbA==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6956c32e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=q0JkR4NhiA7wQx93E64A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1011 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010172

On 25-12-30 23:08:36, Taniya Das wrote:
> The recent dt-bindings were updated for the missing RX/TX symbol clocks
> for UFS.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
