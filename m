Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E342CAF6
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777845; cv=none; b=kwiO59PkvVu/Go0YV3+3KIuRnFReGOQl7yGvbNrqycEsZzTfRn6VXt0V/j3Kv/t7UrgPxQJIH++zWWCk4xc5VYpW9gusvHrq8MEc3UvwyzpmhCjXJ3zkHcUfrGDiLw/8b+aGnB93lEnGu7YOfJxP+7m97nwJ7rh4YCiGZmvADL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777845; c=relaxed/simple;
	bh=aHyQT7885+Ubcx9vuZlaQP4s+nOfTsfJSjKYZBHLk0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJOpjHN3O5CbUa/bD6c7Ytg56XbWer7uL+/whQ0liVrL4MEAEEgTZ9fPrkbWM18mf76VKrFecNQNYWvth6j7NTtDgdA0gtdTONMWJgIRKl1UdBNOwMM1+oSb5S1LsWo02Ks+QZOw5eSahg+tbs6JfPQSlu8YLiauT+yrFJbkRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyEDiM2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDu3KivE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyEDiM2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDu3KivE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXD5057365
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r66zeNZE0qmZ3omHwDj+6n3Q
	SfEmIbTPv0IAPejLvkU=; b=jyEDiM2nm3hXYBcePtO4wBjfgDVYCwLLGmjJMP8U
	NK4BYcuNVfYoNtEdPlRAWVf4nGhDS/KzUHsvb49XlhnbkBtCPQLghkWzT3LhdV0T
	RM3nfwUJOKR2HsmguvQ4YgqsDnDiUMVBNUj6JHIMyKVARCOfLEUn5k3S+QM5EnyR
	HGij/cMCPYSRC+Tohauo7xPZgM8LIw3lHtp1H8nT5qzpqJ0+jZL/9cw6O7BxA7H0
	+mXNCkcb8PRqNburm5UucGpETqiTAub/71wzIWy5/Qzx24Y60B1zCsbjRDGeAN9p
	CGUCxv7xNSlqgFBb6fz5a1glOPR34Zeu7qm9EY2bp0xcNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgdv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 10:44:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939281526e1so232780385a.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777843; x=1789382643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r66zeNZE0qmZ3omHwDj+6n3QSfEmIbTPv0IAPejLvkU=;
        b=BDu3KivEZ3AcasDXQ8WNjo2CMbd/x8GUfklszTYyoegDpK1z5fLzouR9YoD8xuxsHM
         mvOAUHTcV+sETbi5YL+73nIVxja7yf0PF52pZWbIJDu7dJM0a/TF9E5X+fkaK4UAdLdd
         R4k550fiitj3pJdZNBQg/NQJAn2mldL0tpculkW9jWVleegfuZEmyWCUasaUigw28PJU
         c6b3bM8zcRNrIvZIKHgGMbajCHmBc7RNyh9nj6+8wxH9eFmGqTs/n0MlGzqeRnTGcQMF
         DS9SS3Vd13FVS0o10DBW2kZgJzsk8YUkCqNiScxDM4S4AYShVaymO1HfEJdUmVZBzJDM
         JO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777843; x=1789382643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r66zeNZE0qmZ3omHwDj+6n3QSfEmIbTPv0IAPejLvkU=;
        b=lL12/h3ghew+HV124QQWwGh9MT+maUmzKJjKAnf4kVJUzAdoiU2PHziqplNbU7IVrd
         xIt9YO2aeVU2dwDD7/KXXu16J4dBhcRYHm8xc1EF8wi2i0pIkSvncdMRlxR8mneb9otT
         5r8G8fh7nwO+4/RkFQnxi6s5j6M62Wp1kIxZh3l/5uETvtBkrFPSySRsJcTdeTTYUDLq
         f9V0ZJpcpIzNzuWjA9lapJQ85ZQWuKM8xBeJfKxLdLBTvqni+AruL8EprOwzckLtxqWs
         SY/ikUbrVhqgc2+JuiaE8fvcBUxJeM/evHZ/x34N/mns/Em+0lpM7k5XCe5B1CN/1Xgc
         nEyQ==
X-Forwarded-Encrypted: i=1; AKwUvByDtyNiFzNLe/RIwTNeAZg67M15d3HJnkKf2EjUcm9u7arYBSIiLM68zbNZf1Amw2LSufZLGlFCzdI=@vger.kernel.org
X-Gm-Message-State: AFuF++kCVhPRZD0qzOA8Z5AaVRlox+maB1F1zSuSatACwQBFtKZR6mHe
	FZyNBaoMHzBz23YE8urRu44t2v1k7fTEqzMdoHOeigkky04leJmSmifmTIB8EPiT39ogpFe9umy
	1g/s1mcAWeAmciYXLVw3YTg1UX3x8ICp75YLZPy/K5/NGxVPPfO/XNaskGjVHjLc=
X-Gm-Gg: AYBFou349zM6xmL8MUEPUkR51Bb2fs6bC8BHDxZw4ClVlX5af5F9Ioy08ao68WxLQ1k
	DTrQves5KTziAK0dbG4ZQwPlsXBGc5owlPE/tYwpnKSnjwUlRpgQO18vOFP3eVQJW6R2PVeQikY
	ghajcXzSOliO/58OKHsKuajALkNfAHgiBDt5kiSV4dtEGh1xvnuN1Od8spvbPxV9uvKsUvQ+vL3
	OTTpqhCxlMfWMz2r2pAfYiA2TXD6Cj3CvdhUq1MPhAVEewGElDA9hJaL4GNwlm4lgAPR6hfU8cP
	O34bEkpxKp0k6BYJuUaf8GRLpry3hu6pYsSZ7FlXvU5HPimXdcwSJ/1g+KwkTpobYqS40HbFEjZ
	XTdB1Q3xdnHrrhg==
X-Received: by 2002:a05:620a:370a:b0:939:15e:1a5 with SMTP id af79cd13be357-93980528e01mr2383690085a.35.1788777842623;
        Mon, 07 Sep 2026 03:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:15e:1a5 with SMTP id af79cd13be357-93980528e01mr2383685485a.35.1788777842080;
        Mon, 07 Sep 2026 03:44:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm199282865e9.10.2026.09.07.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:44:01 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:43:59 +0300
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <kg7vrzt5ucpooujgovl7je2riiry64u3hfl4l3y5qs5rw4ggoa@nwagyecpv7ca>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfXzBSgx+if4Q0I
 iR432VXp3U3aGu3U0rhWjoMVcdQiM4nNl16VwGVEksKYEzP3drwgZ3bHEgmykDyAruZNsHpTOYv
 AmcE+dpP+XRev6xcgGDZjs6GL/qq8c/+Q5zi2LpWlCOeIP2Wv13UlEJfxOR9PLJqfAQo++gOIm6
 A7EpqTDbtQ2pwzYfcaraSankV4pLQDxB2DybH9XKQVR+f99bA5pnh11XPiZFHeMomnD+WIiho17
 OjCxh5NtO373WILu3zHQVcV5bZpdCX157XmDfSdJkm0eEB1ipOnUxJACWBInHQo7XoXHQSgJpAa
 ICPR3uRyehICvhwc5pa/AoxuhqI9ytqBWN157HfH5utI2REPFUrAEOm/2D0ZLoqtJ2JCQVltAJ6
 pW88Nmdj3JjQkBGqLUt2Ku6bB/ayt7wMDxMaUGiHfcn6wV+zWZeHYZCeBZVYE3kngkhAHLZQBt2
 KDanPDEKprg6BF7mvvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX3arf3utNVHHQ
 DbBFjt/GA57HsCGHgztY2jkXUFKjRx/V9bCIJXkIq6ShFF30RDVlBwrJYi3lOlt/TX5UxdU14Zc
 4DFZSdMTwIKwJcnGz/L3bcc2+M8uvAo=
X-Proofpoint-ORIG-GUID: hb9J1x22yPTaq0thD9DzWCO-_NaYtkM3
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e9573 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2d2XUzBh9Lae0zXQoI4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: hb9J1x22yPTaq0thD9DzWCO-_NaYtkM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070117

On 26-09-07 13:56:15, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
