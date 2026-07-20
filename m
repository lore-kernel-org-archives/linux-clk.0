Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030A3D25A2
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538805; cv=none; b=dZyfFptBrDcVQ55ds5QFs8rAhE42JP/46DBiep7vrKt8Np3Q/OiF1ZI9Ll2rQEwvUznJsiur9VjtFj8jmhzfPIgAm1fxtZiT+PwpkKKETL9WjqPsX/WVzOzOLQLG5b8s6N9AZJatPxQf7bQ266z826NTAy8m3Au3Rj3cWgDs/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538805; c=relaxed/simple;
	bh=20nn5wJeDlF+hmHrrk4IsFjcAIFgDZlGRKYPV5ojj1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNqx+vkbKt5FO4dnvlnlWAt0siSUe3Cy/Q5myH63PcUe/QNqzKrDyXElh68Bmd+QOFSejT+TuZwT5LIhY3PwCKzTBS/NtJGDJOw88fYBluYfzAlysiCt7pa89N5w1aQuRg7JoGRcR4dUYVYYqGQpSqdNcPOggrPprdneyY1lWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVn8AAFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTHvwv5N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVn8AAFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTHvwv5N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76Qt91712947
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 09:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=; b=AVn8AAFk5KepBkvN
	hv7VUz3hvMpyv2FMSVC3Kcl1RGnz/QEj8S8CnZMcAEW+tC+LWd9/S3RVrkztadvK
	C4w8TOsafvKS5flgx1YKMAXogbqc7YCSIBozMDLHpRe7Ky76ORhdgeFOFpVLDJqM
	HGmUoJGNL6UHzpRrhe9+BCjveFrmEbd95KpNr+T5adNov4wZ4tecQRfBAjiljiM8
	61FkqUkidXiY/yQFg0OiLppTkw0sUx4nf8iB8fTUzuIHRjBVGvXPGcEIucPIftJM
	TmTr57xxlNz5nfFWajOLQCtd/+xVjqeawxYxj1IiLBPFww0IONa+qGChWNRfpqYN
	ec5b/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c0jkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 09:13:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so13527801cf.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784538802; x=1785143602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=;
        b=dTHvwv5Nj1k1HrNCvgocS9gJbN0ps4YFrBcqb3/wgrjMJKixO1gpZJhg3sVWFDEaXR
         XemynN++g6OsZKGRp2utHy+JugLi+20GhQBfa0JQWq+zE8WTtKeUiNDvN9yfi2zONvTb
         d1xu1XkQGiR4jLBz1w7+sNrCTygz1WPAeZcA+nKkaxeoUXYCH9c7XDhadU6MJxooxbJx
         9aKQO31dg4h6wusaiJiip2ojcWBZbbRDbGg6/2sB26Xm3ui9GA57UibWEOmzWhZ76y7K
         H1bRpKHX5k+zVrSgX4NAmrhuZezJ1v2ko+Jai2x1BFdi4NDENaK9Xs4IwQORG0yw+IqK
         +/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784538802; x=1785143602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=;
        b=SDqwpgLqfWb+2PFe5al0tBNHbXhMlaNMWbRDW5tpegRWznjeIEv8u/zNiSbvXROPD5
         zNg7aZSUf9yftOVHgZS3dv1Z2gejERCGuXRXOIthkb7AgZ5xShXqBDTFwios/k/xUPqe
         /UQHOOOj/xeopgCps3AZ7jJEpOm2u1DegI/j+O7oZydZCffC5lBod+PBECGcpDxX1YCh
         alLABOmsozcYzI9h/63gihc1D+RH57YvsKwFzpphfu8eA2IxZwWwbUpK0gxralHZ2xoZ
         YHwqO7lXVcJRcKUqQl63wqYGB62PsXV3LxihT9yyIJ9cbjwIlp/Ys2ukZEGg9dJGxEJy
         mdbA==
X-Forwarded-Encrypted: i=1; AHgh+RoFoR+QlHTmkpXneTI4O0ZzM5pNPBiXCXeP6DJEmLpbk8Jg++3H0T4HqiTL6eh9JDdw9XlnKinQBT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mEyUq6Xo8rZEYVAnXPEkml0CtkeAud4fP7GdORMVQBJWgnTk
	VT0AJ+pkbEZSlJ+aGZU9kANeDJDl3zena4bzMbOckgb93R/PyOBq4tlMsCtm4rovbbFlTSxlmxR
	BQ91MEYuk5A1VUgM6SJjC7UgoXrtKRWQXZ1vgb1MGvkMLdJ4ZYTJ+IBtjbCNuKRQ=
X-Gm-Gg: AfdE7cnhxKWNN01KcQroZtEnj5S48oeC6GdjBunOuj0XdGnQQOw1wNy1DcB48lVaut9
	oTlPLB8K11U4pcnRYKoZBLz1SFqiC/EKWAH3rTgGsMbtcURUvdR2EYqAlqhXAJPzX2/39OAFxHX
	P61PDPHJm7PLx84K+P4ShOa70YyZGIakMelcaBSyzt6Q73rhpV1GGY0MfPE8kjZNHn3EyjDoLyN
	4t7TMC/4R2UNLYib6eNhufeYhDMCI4mn3pnFqhNmyoEAVHm0P1DoDQk77VWqQ4jquUh6e6GLz/q
	k84IvAJZTep6v4XCqlH01V2p7q7LO8ryRl+g1GeTWmfEO3yqfuwRLmf40N181QGu0gqlDXGQ11A
	KhYvrj44WeSrobvn9jm3/d+B4
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74484601cf.3.1784538802198;
        Mon, 20 Jul 2026 02:13:22 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74484401cf.3.1784538801789;
        Mon, 20 Jul 2026 02:13:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a44sm430117066b.19.2026.07.20.02.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:13:20 -0700 (PDT)
Message-ID: <3e7ecbf7-20ca-4871-ac66-bf52f3a5012a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM
 support
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
 <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5de6b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jzfokHZFP97BDSaoeOQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: y6bVCcpXrV-2nw8XLqjL_a5y9fb3XMTx
X-Proofpoint-ORIG-GUID: y6bVCcpXrV-2nw8XLqjL_a5y9fb3XMTx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX15R2xVKxpqb1
 v7BuW0HiOQSnM3HIy071BYA/wekFoxpmlP7nOHnObSCci6RFpQXqv5c/RvPZFBULmzZXIxe0VLi
 /2iSCP0JjepnmCdCJ+lfmgpGJ+4Bq9Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX3GUI0ztUl8u/
 wHE5HGvfLC/NrDTYoHMZR5TB2RaLphrp8UPv9uaJmC+yLlsJpEPQfib9kCGCYmszfOzjHL8ietc
 1Svwv3Zk6nnZB4arZBmUzlM8KP1pd5+eFBjPMs7CGC7AYP8yzsCgLNtcNlSz+RLsjKYzF8josF5
 DgXB2JzgCY0SJ04f3gojszuL3B3qeuZK016ELRGG6O4AaQAE7YAIPuoNXKfOKjc10gZEOj8PVBk
 32U8h4cDeHajZ+hfJSr2DS1FshqgoX9WH3qoUK4hzlNgLJeBqsGLiF+3IVuwMaVx6Yi9A08LV6q
 puLl4nlq15UF8skitBuqFtGdnyAePofZ4wE5+FmztKbEXwKdYFj+jXn9KPHyv+Q65RLMpAgJorC
 bEpgRQGfY9zj8DpNHbAFI9wyqmfrDoyIn5p25ZIBMLaSnksVOupdPIzW7+4RNylyteyuO9ZCffC
 pvYyztyy8YWtPgvoK7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200102

On 7/18/26 2:56 PM, Imran Shaik wrote:
> The QCM2290 DISPCC is now associated with a power domain (RPMPD_CX) to
> propagate genpd performance state votes to the CX rail. Set use_rpm to
> true so that a runtime PM reference is acquired and released around probe,
> instead of leaving a permanent 'enable' vote on the power domain.
> 
> Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
