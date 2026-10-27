Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098782;
	b=FiBJuVOzI2ikoi2JIWIKRHmLnygUqgEFgJDnkyc4NsgEQd/ZRC8GWycYYj583I7vI+an
	 +BEfwF3GvoFrUAeYvP4icFWFF0Xcjb7TqxCsu+/lAx7/UTsuY7kwQyba48lL6Juql0qNX
	 WrDQbel05JXLR/ZmXPlykHm30iSyKUsBV8VuP+qHfGM2AIDucc1he6zK+f/VxZCEVDWO0
	 yk8pCkUyCyEDfl5tZJ29LVsnxGYohVqijurAkc2dWgljGhe+DA8FuPJJubKQiAq+lc4xv
	 D2uxwBGYZHXKwyhfNghK/XEzNpJrLzy2nrZRjXdl/XSb/FaMGfE3ARnOEVVf+iOGQCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
	b=kF6a8HB1HoxNg45oHH4ecPKO5+oVQ5zxSHKipzpsc5rwM5ia+ut2JWPM7/EIf2kYb4cZ
	 LNavbllGo5gcEjhAZ/qE0JPckydkaFvOSjqnv/sa0HM9lkHXFXvcVZWNFo26pxNI5H7He
	 qs+vNFJSsVhs35EEQ/HQz1XtEIS9hxDXccw9/SzDkxmEpbox6YAxxXR4oLByvffzdkzo5
	 JsFN6DhhkgdyopdnjRCjfHWM8l/5f0N4CHvSQdosvcfBCzR+LIyIHj4lubM6OoaoOhOkk
	 NQyZI5KuLb2UNFuDjS7mbXm1+MSe/4vuPpWTvMG69cZOg8y6MaLhUtZGyL4Md+xg3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F1E606A31A
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFt4gceT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmh8jTAN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2D31614732
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=; b=CFt4gceTanHmuKRI
	CHJVPXo7/JyqGvGJucuZv7Nuj9okw3JQMmlQv/8OKLlGWBn9uwqU0SIIsmCggkDu
	R+dvqXwLCGyGCwAw5EaW5RupWnusaBADigjAxrkdys2eGMu9tKDdAtNbyfBnnZgt
	b42StvxTf6j45kaztebp+T8nqvTS4jQX1+9GiBNnV1KbG86UhGcozOWMT4fIA5MC
	zXMpXPrMS2ufCP4LED81iCfgDNNmjzUzs3OhbgVz0yNyYb+9qLx8ldJuUEKsuQ97
	n1ciZN+0r0ABGx5B6/k0YjJFsc/v+GhTYc/a/yEj0U/oYRdMckwDunqf7E8SkqhM
	R7pqtg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rter-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 10:59:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso12901231cf.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 03:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098780; x=1793703580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=hmh8jTANgqk+4t/Y+c30HwqXAmDGrjspn49L2oJndDazaSHNAhQ/1icKsxiK7ksFWM
         6prUMeM++Tux+RP37NyRJ9z2JSfscXivpQxwIiFIzLXCy2456sQdaWUYB2Kfs04hcvEk
         qly6LbGT5GF4IMYgnQytzXbP4eedfu8HxHqChatmkJLaztzvnuCFJLM1u+qzqHEUP/bo
         IOKLWcSIg3LljsrkEkxoUGBCv98kR0InDCqNp+a+WaXD8JK5Lh9DTabneWityZLn/cwy
         neC+MAQeTMFQtkxKTnNhxkVOGnY4FXoeSPdBgq4Mz7B2JKJYEEywclnyDsyk5VAaHnhJ
         iCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098780; x=1793703580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AEE/6Ci0mD9oU3mtIfyaJBRDI9DZXaeum/XwnEUhRI=;
        b=UWipcx0YJ3K4qs5DHtg7xK29tukiZ9Ab6gN5sBZ6iqmYh/Alw73oHBRK1RP4Zleu7c
         /Qron490J84dr7PU/k65HWksy6+E6Z8CqzOwYvyDNZM5Tv7mO9FpIL5ANOz7lLaWcQla
         kUpb0A2nRpYwDjQw1wxF87Llfhgy6jNp3RmFyVHYkzFJWwt4LNUnyTscyPKrX3D6v8lJ
         MI2pL9Apuw6dsXqEnrAO+uHgclQFpe9StIdTbsrV21bzYQ5dN8RbbXSbbo0mLKeJB0+u
         AvSFQTPSuDsocvRkYze7eFNcIrmCQAo0O+No2qivqBCkjBex7qJZpTBtybsrbDknNyi6
         F5YA==
X-Forwarded-Encrypted: i=1; AKwUvByGKTXUnrEc91TUBdTgitnDZSLwXvj0Pk46GHdrLWC/7e1xM1Wc2zPQECcfnjga9GA4hIXQHiGoci4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCarUhLiyysDIiKpAGUf6zDlGKojpzrc6DiqbSC8v3UenwdNcn
	JOUp+5icUie451pZIziVdgL350odDrcgmZxrj5Cs/GHfKbahUCWZSJdSTCdhXX2bzF4wRKgY8m3
	7DYyvR9/kggY6xeVcZCv5UC2ZvuuCL15fWVLApiZU/MejV8HhL037cfzg6mKEPXc=
X-Gm-Gg: AYBFou2T2BT5BLqGt6GqYPYmxEpCA9KiHcLY/EPeCzWtRP2H7UWACc8nC1lesa6UCp7
	YC+qfovnymcEFufWuXmpO3kNtpRou+Em4BGJBaSQIaZfDGTmjy34f5PKQjPRV2+gZCJ5YZH0CKZ
	tOqrhwUiXnnRE4XMu0C0T2fVNJ46761X4bA+7s/ACZemYznfhAWlqwO5O/e7eq/gYI//vc3gG4A
	tOVyGVCt+5jV4ToAH9HzWrS6fmxBBayfc/P8ClRY7NWE7aI7ZURyg+ifAMKz10cqHX+T8WIvSQz
	9lZ2Q6JJLyNS5Y3CsavE0mddQn33dxtxEXrR/UKBUcUZqEP/vw9pUIaEaX53ivzMXVWZbFiyWQW
	Ckm3vlzxYQwnfnSiWMjmKXBRIZ+k/g2Qzh8kUxegyIfavHEjfLumPUFoRdJl3CJ7qeCz3YgE=
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438987285a.3.1793098780249;
        Tue, 27 Oct 2026 03:59:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1438982785a.3.1793098779662;
        Tue, 27 Oct 2026 03:59:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm4704987a12.3.2026.10.27.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:38 -0700 (PDT)
Message-ID: <fd27ac24-e96e-49d8-90c9-019275c1b541@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:34 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXyQ7XQhUMNk6r
 D1ik5I6NLgg0KBhVxB39x+ORRfYT12hIBHP/ftrnvgxQ8NrlkgUsCiyRkvf5hUbobi49qAVVB5u
 23e133dJ0CpBWW7KndGM3CH33W3o+KY=
X-Proofpoint-ORIG-GUID: 2wp1CmN2TxBsjcijwbxGu2Rt7BjE-qWg
X-Proofpoint-GUID: 2wp1CmN2TxBsjcijwbxGu2Rt7BjE-qWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX23qrausc9jd5
 0yzC1HscQX0CkO4WyomkR7ZZMUIlFFIOLFce0DljBKoknuytSJ9GejJG9vsjxRHxjEbcaQY8uEU
 3tL+PuoXd9yHKzNWmne9IhrX3r8lICnxee8117uqc5onLcUm8TLegAe5u7r/nWbdPkPfIhz+cN3
 24oJG/CdmordmLKghwLji0IlW8782vjBk0OzteEQ67h28H1kpmAqa1S7zX9tsq/5TpF/VBWNtnu
 EK3UT1MM3eCUsXIAZFkPvpY+U88mLjobOIJmAhedLZ43BuCvRRZlt15LPw/Vl8QMtTnmMSLxZ38
 eR4WwL4EGGs0twZvazhdKJppxCOWTpbNSxDu/1VowX0ajGhNlw69azGwO1y9F1z8yh5tFfz0oj7
 SuYGAB2rmUAwbRmedqVaCXbdFxVx/mO/+KxHv3BRQXuqkBI6/8q1KAwZsqio78m1YqVphqklDW9
 FzX5VvPS8s26qSwUHYQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0841c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RnYB8WQ3oujroR9yDwEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
