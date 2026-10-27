Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100332;
	b=4ngsmih4h8Ud80vG1jHVGg5XFspZlDZLT0fI9HxYtKWVHgtw4E847+o8tTYqr0NIDYId
	 v6HkFJLTmxOBvy8RjDfXN7XD0bgDdGZH6clbjiDMDicBqgExZlOCxbjR7SxM9kj2XBsYj
	 rA1DAXFTxYNw/wG4/Nzg6n0rTQi5bYSICF11njwN6pVnCQO9NM/F71ngqK8EiZ1CDBU5t
	 41HXsvgc5zioVaKSH8T+8lLtbQVDV1OKmocY4/eLchO7JSUHppYayi6txzItES/CVxTOw
	 zjsv9E1xj2qOJe2D2UnXBZOAm7HdZnLY2KOXNeGcONnGYx3rINfpYqaNMPk7HejGAjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
	b=42CgRBVBLmchGx+RAcOVYCrv4+EA9oAGWxiKOjDUvGPI+vhr4gx+79lMTgb4QP7Y2B4p
	 fp/wHk3i1BtwKsze1X6oJ9NAWklwhau3j20UbPesqFfCr+7wZWrUPI23+PpzWZjP6Qa5z
	 nirOkVw0YWhR1DqapjVa6RF4ga5ablB3BZiRn8LEUfeAGiBI1iRBwd5F6i3CJ4AB0Hcr8
	 cnQnVVURsAJDjbv0JbMOnup1ZAqnMHcQR3EajHI7THLlOodpyLyximaEfptXLK82ncYi4
	 m2vvg1gYy0UV9D7gCAe0TiDLEi2dYxHY7b43PnXic7poJvVIMbbYPKSPFlhjRYCBjeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzZBjmTF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64934606A326
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64934606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzZBjmTF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBXw3011968
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jyhYkL/qDxUg3dans9Xl+flW
	G3nvJ4Kl35GuTAw54hE=; b=otucpBEdRZceIEHPz4JfQB8zfOptPJkPcuZRoK/8
	c3i5llXy4av1vUCXEy9RCr0Yh/BUtimx9gZOBSsSRsDosf93BZTdUK5Vr+/+0HmH
	t1uFkwc87jdXxMXwZFw36q/nc8uZjWcTltwDEQH+60a7lmRYdiSegbkn9S8nWyh3
	mjN2QM6FSy5+L3OFwKZMQ2wSm5vLORhOGUdXKVacv9so93xjI4qYgrjdR+et47Ga
	GK2DKgqhnj3/95kaR71G9OB+mh9anESWyF+a4EccMa9+1Ae1+eO2A6C9cyeDFvT3
	P9fHOnq7k9FxEyHmKgI65xiuBLVzL9AAKVTakrXW17N8mQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3darua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so189477585a.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100329; x=1793705129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=jzZBjmTFDTSSM/aY6yrAGRZCeNTM8/6lUk85TxZ821ZgR+S+g4HXdU4mQQpIwPiXCi
         b7sfrpSGHyx7bOjIKDVVkf5EYC6/XStjhrG/4bKw10k4RsDzNjgviA5Jq2Cy6LdCCIPE
         IDV6jkMSqAMeNuC5z4R+XV6SWoTZVfdeC45svHEXW6bao08knMRDZYxSY90mkXLuYtYX
         IRhY5WAu+w2qx9ULM9XvJJcU42y/LEPgVmNad+0/6ro5hvibTIHFg18dU19eRb2BXqOJ
         NRpTvheBoT/Rz37SWluJ7pezNgnWk8q5gl/cCZYUjCoNNW3fFEy39SjuJAHqbxrWnnrY
         3tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100329; x=1793705129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=PmV/N/hGOM9c9t4fNGT60mD4S0K9tKWBBzFmo+PUfYIMZbtYh+Sqt1VU9k1bzgyzdC
         P/FlAJhSZeMEbjGUtptUn+OchvisPbCtnTpynTCj5X/qlhzXgAyiZXuyTpo6FzoOikc8
         THOdfXnmXgZuYXvOs6jOqgTTKdS/Vq4aHKUiOGHk+luDnZPczHqEGM4rVwpjVDxRQgdL
         GX64epQngEW7GHLdTFNf/DX2qqj33I9rDuuVMuzPXen/pSzOSs5bbc/yLHseGAoJD9/N
         PAUhRUo9YnEkSniFipCsleMuTW/BiHe2Vqwhgax9q5xg+hrGb80VY81PLgOQP0YKiBBp
         0b6A==
X-Forwarded-Encrypted: i=1; AKwUvBxpOF2l5CZAdM/gGWtdch+mZT5vnkgyC3957rofjn+weErHAx4/fZptgrK4aq5utREJvkqQ1ltQMao=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4bkR4IeSViBn7+wt0Oi+KDN4PvRElBIQc/oG/8HIzzlHdkYg+
	9bLxIlyTT/PujUqbYUyErQwVlXojRY5xzFK3AQBv8PDmHuYWSzzrzHlsSewNMNJruINIuUwZC8h
	xQolQ/2OTWi9KK43f6pPnAMxtbHzbkwRceDIzDMUsS+qtLnf68dvAdnm2hhx+PQ0=
X-Gm-Gg: AYBFou1LPUkFK1n2LVQZul30+6Up4wmWpsR5OTEhayexhHqD1Q7xSzLiQVdWBPeEfsb
	VvCE+MlgNK4PwjXa5FrL3G0UxZBt9SqciBWpBhOBTe94g+HoUkDB7CAL0E2H2k1lLHy6pJ2SRFn
	1Sso5r5QLFqJ+eYTKXCaH+ipl1ZDrQpRZUkGe09BCBA6Kc+DLdCyYM2fTT+qE1nbdPQIBw0h77o
	L6w358kzNyE695RS6upw6EUJEC2bE2eVKcKxQtsifWEZbqlk4ZdFf5LYYn8yP4pShEoEC0JMxS3
	ROu5sWahQbWCPccmVrzYEBQmnHbk6J/Qr+IjWCn2OE+ys2o5lXrksckStKGelEhMGNrkfvPnwpe
	5ORJKbQy5pgwJCohV
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405176685a.10.1793100329300;
        Tue, 27 Oct 2026 04:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405173085a.10.1793100328785;
        Tue, 27 Oct 2026 04:25:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm20012629f8f.41.2026.10.27.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:25:27 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:25:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
Message-ID: <7fa3yfrvz3neingw47vkunxh7ft7u3udofeunuel5m4f2ocqtd@lyvt3a7hozni>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX3GCb6kOWd9WZ
 uVSGrquui8mPZ0a4kzwx3WsEhjNL91eveI4MF0mGI5kmvqRnnlIkGJDeC0PW5GY+FmVQGsQMkrJ
 SwHhm65JA2U+0Jgolgoi7wDBwP9IBxM=
X-Proofpoint-GUID: iu8GnrmiWORHAW421wIvCs_e4U2dZ4iB
X-Proofpoint-ORIG-GUID: iu8GnrmiWORHAW421wIvCs_e4U2dZ4iB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX2EYHg97B5lAW
 LhTdweP6oKsJ4xfNY8x7VyBU5GBOZgX397Q8nV1Olcae/5385tcpXa3fmk89gRGjnNI/QNGp2jI
 CxiPu6NjrdPqIENPBc4YN3/G9u2WMbAYc6sdjaeNQV6Hev+sp4cLGrSPLuGwYaCRjXwp6w1KfAU
 jtQDaHujfCs/C/DX46kc9BgLFJhhkyc1kWXY5BTJ5F375dwPCjMKxhrawJfcj1enFs8/sMqob+m
 PF19hKJuAHRVPnINChAQ5h4bDYNeC9A95iqQKymmJ+RpuY3pEa56C7xYpv3+h5WP54x1JMNU2Lf
 YnVyzY83OwkNyycMax8FwuzJ9AQ/5swX8hvYstQW0H8kBhnydIxGD+mjx20lsdtKlLjCsbxsGGY
 nlb2chWbEPiPNE5SbbNsw/xlBHl6fB2/neDrUaiGysov1msHYB3TEQuQ8ebpde2mFnMSH5a2xYp
 2boFk11zPUAFlEjM+qw==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08a2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fVLzsXKNZF2toPeuA2YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:14, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
