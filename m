Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445232;
	b=gSHzaxuxdoiS3rKJu3AqEeYStqpy7o4TzN5KCxv2aFiy3APTLG6PbH1kM1x1LjhP2woR
	 KAG0BQlq+pJbj5X0qdmc9AlanPH8m+qyj9zPFE4UBbQMXv7C+pKuDmd8e2/GJGtYgwjtN
	 lPVergcgUNNAuGzjdad/J52S55GlM4iRna1KFHkAMZSvZ+6TqE84EWq+4BVP6er3ukhe6
	 2uVbGaG4pWVotEToWj3y9wkqyQT9uPamMVVKRA+MJZkyfY4zPydijzAJam3XP80HLWNhy
	 3tYvJjcmLB+Yv5p+Tw+HnuvCLL6QqU3CvDxol+DzBEikn4530RJD2DMVXo2DV2/zBIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=;
	b=Pqk0dTi0e7v5wJle15NKy+6aK1lT6IrGZIXudUDXbZjmkXmpnDeGIUP6GcaETF+9J7hw
	 COhZ1a0X/xnLFhe2WcNn1yERd5/rK9OSdU7PdqrAyZ3mNCEoE4vNndhnFLgKcdhW9KJkK
	 LaPgot19WwLK9/ivbw93W8NOavyHN/GEiRHVsUBuDgOdpu3FuDX1DmLAMJmKGOtYY3wKo
	 pg9EUIIMkpOywxhMn18JcLcqEuTIlA3Yz+ERDmGzLuK06QFzFWMqx8Id5+eLIJtHm495N
	 eLWwb5KGcMaWLiZnmMixxhNrMJudtVagQhdz4spHU3p22uUAWnnDpaIYpolmgb+qArw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Xvb/MKoo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFSDIjNX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6328F606A31F
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6328F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xvb/MKoo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EFSDIjNX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0MI2086015
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=; b=Xvb/MKooYNv1VC3p
	k+KgrsFeqG6Xv6K4GvXIYSmfG1G6cCz/MJH6TiZddFnBpJnqkRSGczsC0nj/rQEa
	ci7nHZNwqff6i+UUOkT5U5mvwlbtqcK9qdFozkrsjQ+ECQVQJGkw7E3DPH6uaUEm
	Ti7GyA0fJsFFkO5b6reDx6U7chD5Qk+dvS6W5izS/9DImADS1PDYYIdUjGDpOIhM
	nDxiHQOBWMrw++gJEnxXfjxZdbsVWWxKd2FfXD31IznQIy9AUizj2HPoGelh2A7F
	u6ib6jM7zQrXrJqDlDeKJePbucYZ3O3EmMSsYiTJi2mlZG3lMnKOenGN3Yh90FE2
	ZCqkvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01vme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384b6a33735so334665eec.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 06:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445229; x=1796050029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=;
        b=EFSDIjNXkzU8AGYSFgVgWpOVI3LFh7nnQEi8G6ZgdjajzDZWTaBwTGIwOyrigK57MC
         yJjPDUjshHmmih2NTTF3ROMWHwUjZQigx7T6TTUYvSPX2kTw6GnMhOTkvwveUZgMlQl6
         udTMU5dMZ+hnM40hbcWvS8lJ9ivZ//DLy14425u8sq7lpbDiDGws9ir/8JGPwP+u5xwE
         DUmEP0QOgUt40v37aFNLgvXgcy9OBSBP3fI0xmysMOZ1F7/fWzxG5DwCbDdqpabIN5Ik
         EVAofaxBMB+48lL2Ou9eMbiLhp6nbwdVW0YbYrHWDVLtQUiHAhZzyG3QS2PkoHN4WL6Z
         ck5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445229; x=1796050029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qASV5EJcsFYkTEgTYVe1aYx7dwh4PJgvJpGMmFQjtQM=;
        b=0ZlnWojBKHcwAPtNOsxW4uGEHM/lsijK97uEA2jNHk0lQO1R69rgdoTRpawO/0jgZq
         5LREaRvaNuMUPBpXiYi/mLwzqhtD7oGf36BpEpzMEkp7LSgDxxWcR7D9UdFRyQLehuKo
         X60YJiGvhsElgWXMztHn2nUot13cjDDa55lkgplci8aNzsygMiYj/B6pZ+W+LT6fEg6u
         Ug+EjEkISr0caACtgAV/gMCJevEqcNZzyCHaFytlm145tbKEu2EOM5bSXtbhB2kM//40
         Jzhrw3fqBWMzTzh7I9ORYs4oNt9k3nrqivxkyop2n1PO/YTK4kGClZdl32VUCxx5k2rl
         HUIw==
X-Forwarded-Encrypted: i=1; AL+hErHbd8lQ//jPpFbV1bRGpszn61xkSHiSh405FnXxnANKyvcxMTTpq43v/hdYCt4AQj/qljMMWVe5wmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xUaSe5/wf/Jd7kmisv6gWPAuDgjJ0gPUSOK8KRPKESuJo7M8+
	mDaHwONuquR0fItdE1DGE+SNzChUGLpANrnaL7ImZqvgry1f4jAqngZm++IW4uBEOl5RhOEaub2
	AN71hhQ4lQIGoYVzV3+jEvw+f7DYFmQm+U0eJKuCtm1jE5hcGfOBZmJBdPDrrajk=
X-Gm-Gg: AZFdTZc8T40eiAfBYyVqsrnlAXp2z/ISdyVgY6Rh2mwH2X6lsGwbuX9QnZ+tnjBMV+e
	JOVeopO3ale6HE9XSjXOJJy9Hb0laFoKVy7VW4IRNAAysHTf7pPa6TVZ/t/01dyitBi5dMo6MxF
	kY8iXySAy/E6mZ5KiRRoJcDKqHUMF8uUSFoEYXcgiwFNq3675Jx5jmObuJ1unyC12fWvED4P+Tr
	UhfNH9Ds6SMJjGbrUH+VqjnVduHNbepLLaCvXrEVvMU9fMR0Uawvhrqt2FAtOaFwk5/UuFxZLH/
	QfzHjQe44UrSFQFSDCtnQiXZNGycKPwSY/ZWDZJH+ljnoTsRib7adAaPbXe72ozk9Im4GWo0A8v
	voY0y0xBAde1noGGCdVk2TSxNBUZxDJ3x58upEcBSR+sIkhsYOBbvUlaHnaBd23CFo5UnTno=
X-Received: by 2002:a05:701b:450b:20b0:1b5:5a76:dfea with SMTP id a92af1059eb24-1b55a76e18emr15596894c88.0.1795445229149;
        Mon, 23 Nov 2026 06:47:09 -0800 (PST)
X-Received: by 2002:a05:701b:450b:20b0:1b5:5a76:dfea with SMTP id a92af1059eb24-1b55a76e18emr15596859c88.0.1795445228618;
        Mon, 23 Nov 2026 06:47:08 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5470868a12.9.2026.11.23.06.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:47:07 -0800 (PST)
Message-ID: <36450445-4ea2-4044-ba5e-09e894701fe6@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:47:05 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: Enable MSM8917 GCC by default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX4gzHt/d3Fdvs
 jUlcVl/bC5FzrvOsA19reDEGXvuX4cjlUgboqT8NFeZ1pDLJsaZK7egMppqp7GXIYhCdEqlebDp
 CFSEkotxdLDANA/RpTKvP1CRuxmaDl9ifoNsNBLXXzQzyXXs6zIRW23ioa9LHIMq2hiEVcCDDwG
 cP/1yEtdZP7u+qkPtGBdyV2d3eKAGuibxxWUwn1r1KM6v3aTbKb/Hz3sAf1rjwqr7Y2/wGK3CHY
 hwy70vtsLEO0ScvzurRj3AQXuxT10PHEuI6qdWW/P7eYh7kEZa8/CGrTXWpqrZoiaMhq0A0CVFP
 uwMdjHLHT2+9NK89ZnzBZV/PetIt5xJuT4rdpxKddtgiAiKRc3rEounxgaN5Ii49j8/Mc7WuqRj
 GSX3pWJhs7urSW982vB7i4H0QgYnlyfyYQYFoTvjQtdj8d3Ag+1Gt/fE3WW0ENmxQApn0PO3U73
 M57fksKqVaeH9gyTK+A==
X-Proofpoint-ORIG-GUID: _lezlYPAKPTlISRHpkk0OHmOB8OGEtVb
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0451ee cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Hix9-P7N-KviaBUsSn4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: _lezlYPAKPTlISRHpkk0OHmOB8OGEtVb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX/it2m5X525Ts
 yKZd14t73XvJ5Sjck3Nx+DZq00ifVQmCdY/MKcsliSeio3vH2cexdRb5AFrUg+KjMWBmpdmAabx
 PhD3pjD1+COUAFxyMyZe9b/7paK8wjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> MSM8917 is an in-tree supported SoC, so its critical clock controller
> driver should be enabled by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
